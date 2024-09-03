/*
This code subs two numbers, represented as array of digits.
a --> array of digits of first number, of length n
b --> array of digits of second number, of length m
#Pre-processing:
1. Equalize the length of both arrays by subing leading zeros to the smaller array.
Note: For pre-processing, we can use the realloc function to sub leading zeros to the smaller array.
*/

/****  All the data, stored in arrays and used for computation are aligned to 64 Bytes ****/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>
#include <time.h>
#include <math.h>
#include <errno.h>
#include <unistd.h>
#include <linux/perf_event.h>
#include <asm/unistd.h>
#include <sys/ioctl.h>
#include <inttypes.h>
#include <immintrin.h>
#include <assert.h>
#include <stdbool.h>
#include <fcntl.h>
#include <sys/syscall.h>
#include <stdint.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <x86intrin.h>
#include <linux/sched.h>

#define MAX_EVENTS 6    // Number of events to monitor
#define LIMB_SIZE 19    // Number of digits in each limb
#define ITERATIONS 1000 // Number of iterations for each test

#define unlikely(expr) __builtin_expect(!!(expr), 0) // unlikely branch
#define likely(expr) __builtin_expect(!!(expr), 1)   // likely branch

typedef uint64_t aligned_uint64 __attribute__((aligned(64)));      // Define an aligned uint64_t
typedef uint64_t *aligned_uint64_ptr __attribute__((aligned(64))); // Define an aligned pointer to uint64_t

// Declare 64-byte aligned global pointers
aligned_uint64_ptr sub_space;
aligned_uint64_ptr borrow_space;

int sub_space_ptr = 0;    // pointer to the next available space in sub_space
int borrow_space_ptr = 0; // pointer to the next available space in borrow_space

aligned_uint64 LIMB_DIGITS = 10000000000000000000ULL; // 10^19, used for borrow-propagation, as we're using 64-bit integers

int CORE_NO; // Core number to run the tests on

int NUM_BITS; // Number of bits for the numbers

// Function prototypes
uint64_t *returnLimbs(uint64_t *number, int *length);                                  // Function to group digits into limbs
char *formatResult(uint64_t *result, int *result_length);                              // Function to format the result as a string
void make_equidistant(uint64_t **num1_base, uint64_t **num2_base, int *n_1, int *n_2); // Function to make the two numbers equidistant, by adding leading zeros
void run_tests();                                                                      // Function to run the tests
void initialize_perf();                                                                // Function to initialize the perf events
inline void sub_n(uint64_t *restrict a, uint64_t *restrict b, uint64_t **restrict result_ptr, int n, int *result_size) __attribute__((always_inline));
inline bool is_less_than(uint64_t *a, uint64_t *b, uint64_t n) __attribute__((always_inline));
inline void warmup_rdtsc() __attribute__((always_inline));
inline unsigned long long measure_rdtsc_start() __attribute__((always_inline));
inline unsigned long long measure_rdtscp_end() __attribute__((always_inline));
inline bool check_result(char *result, char *result_gmp, int result_size) __attribute__((always_inline));

// inline function for warming up rdstcp ticks
inline void warmup_rdtsc()
{
    unsigned cycles_low, cycles_high, cycles_low1, cycles_high1;
    asm volatile("CPUID\n\t"
                 "RDTSC\n\t"
                 "mov %%edx, %0\n\t"
                 "mov %%eax, %1\n\t" : "=r"(cycles_high), "=r"(cycles_low)::"%rax", "%rbx", "%rcx", "%rdx");
    asm volatile("RDTSCP\n\t"
                 "mov %%edx, %0\n\t"
                 "mov %%eax, %1\n\t"
                 "CPUID\n\t" : "=r"(cycles_high1), "=r"(cycles_low1)::"%rax",
                               "%rbx", "%rcx", "%rdx");
}

// inline function for measuring rdstc ticks
inline unsigned long long measure_rdtsc_start()
{
    unsigned cycles_low, cycles_high;
    unsigned long long ticks;
    asm volatile("CPUID\n\t"
                 "RDTSC\n\t"
                 "mov %%edx, %0\n\t"
                 "mov %%eax, %1\n\t" : "=r"(cycles_high), "=r"(cycles_low)::"%rax", "%rbx", "%rcx", "%rdx");
    ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
    return ticks;
}

// inline function for measuring rdstcp ticks
inline unsigned long long measure_rdtscp_end()
{
    unsigned cycles_low, cycles_high;
    unsigned long long ticks;
    asm volatile("RDTSCP\n\t"
                 "mov %%edx, %0\n\t"
                 "mov %%eax, %1\n\t"
                 "CPUID\n\t" : "=r"(cycles_high), "=r"(cycles_low)::"%rax",
                               "%rbx", "%rcx", "%rdx");
    ticks = (((unsigned long long)cycles_high << 32) | cycles_low);
    return ticks;
}

// perf_event_open system call
long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags)
{
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}

// Function to generate a seed for random number generation
unsigned long generate_seed()
{
    struct timespec ts1, ts2;
    clock_gettime(CLOCK_MONOTONIC, &ts1);
    clock_gettime(CLOCK_REALTIME, &ts2);

    int urandom_fd = open("/dev/urandom", O_RDONLY);
    if (urandom_fd == -1)
    {
        perror("Error opening /dev/urandom");
        exit(EXIT_FAILURE);
    }

    uint64_t urandom_value;
    ssize_t result = read(urandom_fd, &urandom_value, sizeof(urandom_value));
    if (result != sizeof(urandom_value))
    {
        perror("Error reading from /dev/urandom");
        close(urandom_fd);
        exit(EXIT_FAILURE);
    }
    close(urandom_fd);

    pid_t pid = getpid();
    pid_t tid = syscall(SYS_gettid);

    return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
}

inline bool is_less_than(uint64_t *a, uint64_t *b, uint64_t n)
{
    int i = 0;
    __builtin_assume_aligned(a, 64);
    __builtin_assume_aligned(b, 64);
    do
    {
        if (*(a + i) < *(b + i))
        {
            return true;
        }
        else if (*(a + i) > *(b + i))
        {
            return false;
        }
        i++;
    } while (unlikely(i < n));
}

// Function to left shift the borrow array by 1
void left_shift(uint64_t *borrow_array, int n)
{
    // Check if the array is not empty
    if (n <= 1)
    {
        memset(borrow_array, 0, n * sizeof(uint64_t)); // Clear the array if it's empty or has only one element
        return;
    }

    // Shift elements left
    memmove(borrow_array, borrow_array + 1, (n - 1) * sizeof(uint64_t));

    // Set the last element to zero
    borrow_array[n - 1] = 0;
}

/* To be modified for 64 Bytes Alignment */
inline void sub_n(uint64_t *restrict a, uint64_t *restrict b, uint64_t **restrict result_ptr, int n, int *result_size)
{
    __builtin_assume_aligned(a, 64);
    __builtin_assume_aligned(b, 64);

    aligned_uint64_ptr result = sub_space + sub_space_ptr;

    bool is_less = is_less_than(a, b, n);
    if (is_less)
    {
        // swap a and b
        aligned_uint64_ptr temp = a;
        a = b;
        b = temp;
    }

    // uint32_t *borrow_array = borrow_space + borrow_space_ptr;
    aligned_uint64_ptr borrow_array = borrow_space + borrow_space_ptr;
    int i;
    __builtin_assume_aligned(a, 64);
    __builtin_assume_aligned(b, 64);
    __builtin_assume_aligned(result, 64);

    for (i = 0; i < n; i++)
    {
        result[i] = a[i] - b[i];

        if ((int64_t)result[i] < 0)
        {
            result[i] = result[i] + LIMB_DIGITS;
            borrow_array[i] = 1;
        }
        else
        {
            borrow_array[i] = 0;
        }
    }

    // left shift the borrow array by 1
    left_shift(borrow_array, n);

    int last_borrow_block = -1;
    __builtin_assume_aligned(borrow_array, 64);

    for (i = 0; i < n; i++)
    {
        result[i] = result[i] - borrow_array[i];
        if ((int64_t)result[i] < 0)
        {
            last_borrow_block = i;
            borrow_array[i] = 1;
        }
        else
        {
            borrow_array[i] = 0;
        }
    }

    if (unlikely(last_borrow_block != -1))
    {

        i = (last_borrow_block + 15);
        i = (i > n - 1) ? (n - 1) : i;

        for (; i >= 1; i--)
        {
            if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
            {
                result[i] = result[i] + LIMB_DIGITS;
                result[i - 1] = result[i - 1] - 1;

                if (unlikely(result[i - 1] > LIMB_DIGITS))
                {
                    borrow_array[i - 1] = 1;
                }
                borrow_array[i] = 0;
            }
        }
    }
    i = 0;
    while ((int64_t)result[i] == 0 && i < n)
    {
        i++;
    }

    result[i] = (is_less) ? -result[i] : result[i];
    // update to result_ptr
    *result_ptr = result + i;
    *result_size = *result_size - i;
}

// main function with cmd arguments
int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        printf("Usage: %s <number of bits> <core number>\n", argv[0]);
        return 1;
    }

    assert(atoi(argv[1]) > 0);
    NUM_BITS = atoi(argv[1]);
    CORE_NO = atoi(argv[2]);

    // sub_space = (uint32_t *)malloc(1 << 30);
    // borrow_space = (uint32_t *)malloc(1 << 30);

    // Use _mm_malloc to allocate memory aligned to 64 bytes
    sub_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
    borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);

    if (sub_space == NULL || borrow_space == NULL)
    {
        perror("Memory allocation failed for sub_space or borrow_space\n");
        exit(EXIT_FAILURE);
    }

    // set sub_space_ptr and borrow_space_ptr to 0
    sub_space_ptr = 0;
    borrow_space_ptr = 0;

    // set sub_space and borrow_space to 0
    memset(sub_space, 0, 1 << 30);
    memset(borrow_space, 0, 1 << 30);

    run_tests();

    return 0;
}

// This function, given a number represented as an array of digits, groups 18 digits together and returns the number of groups
// Starts grouping from the least significant digit, and also appends zeros to the number if the number of digits is not a multiple of 18
uint64_t *returnLimbs(uint64_t *number, int *length)
{
    aligned_uint64_ptr limbs;
    int n = *length;
    int num_limbs = (n + LIMB_SIZE - 1) / LIMB_SIZE; // Calculate the number of limbs needed
    limbs = (aligned_uint64_ptr)_mm_malloc(num_limbs * sizeof(uint64_t), 64);
    if (limbs == NULL)
    {
        printf("Memory could not be allocated for limbs\n");
        exit(1);
    }
    memset(limbs, 0, num_limbs * sizeof(uint64_t));
    int i = n - 1;
    int k = num_limbs - 1;
    while (i >= 0)
    {
        aligned_uint64 limb = 0;
        uint64_t power = 1;
        for (int j = 0; j < LIMB_SIZE && i >= 0; j++, i--)
        {
            limb += number[i] * power;
            power *= 10;
        }
        limbs[k] = limb;
        k--;
    }
    *length = num_limbs;
    return limbs;
}

char *formatResult(uint64_t *result, int *result_length)
{
    if (*result_length == 0)
    {
        printf("Result length is 0\n");
        char *temp = (char *)calloc(2, sizeof(char));
        temp[0] = '0';
        temp[1] = '\0';
        *result_length = 1;
        return temp;
    }
    char *result_str = (char *)calloc(*result_length * 25 + 1, sizeof(char)); // 25 digits + null terminator per number
    if (result_str == NULL)
    {
        perror("Memory allocation failed for result_str\n");
        exit(0);
    }
    int i = 0;
    // Handle the first element separately (without leading zeros)
    sprintf(result_str, "%" PRIu64, result[0]);
    // check if the first element is negative and it has sucessive zeros after the sign
    if (result[0] < 0)
    {
        printf("Result[0]: %" PRIu64 "\n", result[0]);
        i = 1;
        while (result_str[i] == '0')
        {
            i++;
        }
        if (i == strlen(result_str))
        {
            char *temp = (char *)calloc(2, sizeof(char));
            temp[0] = '0';
            temp[1] = '\0';
            return temp;
        }
    }

    // Handle the rest of the elements (with leading zeros)
    for (int i = 1; i < *result_length; i++)
    {
        char temp[25];
        snprintf(temp, sizeof(temp), "%019" PRIu64, result[i]); // Print with leading zeros
        strcat(result_str, temp);
    }
    // remove leading zeroes
    i = 0;
    while (result_str[i] == '0')
    {
        i++;
    }
    if (i == strlen(result_str))
    {
        char *temp = (char *)calloc(2, sizeof(char));
        temp[0] = '0';
        temp[1] = '\0';
        return temp;
    }
    char *final_result = (char *)calloc(strlen(result_str) - i + 1, sizeof(char));
    if (final_result == NULL)
    {
        perror("Memory allocation failed for final_result\n");
        exit(0);
    }
    int j = 0;
    while (result_str[i] != '\0')
    {
        final_result[j] = result_str[i];
        i++;
        j++;
    }
    final_result[j] = '\0';
    free(result_str);
    *result_length = strlen(final_result);
    return final_result;
}
// Function to make the two number strings equidistant by subing zeroes in front of the smaller number, and reallocate space for the smaller number
void make_equidistant(uint64_t **num1_base, uint64_t **num2_base, int *n_1, int *n_2)
{
    if (*n_1 == *n_2)
        return;

    int n1 = *n_1;
    int n2 = *n_2;

    __builtin_assume_aligned(*num1_base, 64);
    __builtin_assume_aligned(*num2_base, 64);

    aligned_uint64_ptr num1 = *num1_base;
    aligned_uint64_ptr num2 = *num2_base;

    if (n1 > n2)
    {
        // printf("Num1 is greater\n");
        // uint32_t *temp = (uint32_t *)calloc(n1, sizeof(uint32_t));
        aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n1 * sizeof(uint64_t), 64);
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }
        // copy from the LSB to MSB of num2 into temp
        // hint the compiler to assume the alignment of the pointers
        __builtin_assume_aligned(temp, 64);
        __builtin_assume_aligned(num2, 64);
        for (int i = n2 - 1; i >= 0; i--)
        {
            // printf("Copying %d into temp index of %d\n", num2[i], i + n1 - n2);
            temp[i + n1 - n2] = num2[i];
        }
        // fill the remaining MSB with zeroes in temp
        // hint the compiler to assume the alignment of the pointers
        __builtin_assume_aligned(temp, 64);
        for (int i = 0; i < n1 - n2; i++)
        {
            temp[i] = 0;
        }

        // reallocate space for num2 using realloc
        // num2 = (uint32_t *)realloc(num2, n1 * sizeof(uint32_t));
        num2 = (aligned_uint64_ptr)_mm_malloc(n1 * sizeof(uint64_t), 64);
        if (num2 == NULL)
        {
            perror("Memory reallocation failed for num2\n");
            exit(0);
        }
        // copy the temp into num2
        // hint the compiler to assume the alignment of the pointers
        __builtin_assume_aligned(num2, 64);
        __builtin_assume_aligned(temp, 64);
        for (int i = 0; i < n1; i++)
        {
            num2[i] = temp[i];
        }
        // copy the temp into num2
        *n_2 = n1;
        *num2_base = num2;
        // free(temp);
        _mm_free(temp);
    }
    else if (n2 > n1)
    {
        // printf("Num2 is greater\n");
        // uint32_t *temp = (uint32_t *)calloc(n2, sizeof(uint32_t));
        aligned_uint64_ptr temp = (aligned_uint64_ptr)_mm_malloc(n2 * sizeof(uint64_t), 64);
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }

        // copy from the LSB to MSB of num1 into temp
        // hint the compiler to assume the alignment of the pointers
        __builtin_assume_aligned(temp, 64);
        __builtin_assume_aligned(num1, 64);
        for (int i = n1 - 1; i >= 0; i--)
        {
            // printf("Copying %d into temp index of %d\n", num1[i], i + n2 - n1);
            temp[i + n2 - n1] = num1[i];
        }

        // fill the remaining MSB with zeroes in temp
        // hint the compiler to assume the alignment of the pointers
        __builtin_assume_aligned(temp, 64);
        for (int i = 0; i < n2 - n1; i++)
        {
            temp[i] = 0;
        }
        // reallocate space for num1 using realloc
        // num1 = (uint32_t *)realloc(num1, n2 * sizeof(uint32_t));
        num1 = (aligned_uint64_ptr)_mm_malloc(n2 * sizeof(uint64_t), 64);
        if (num1 == NULL)
        {
            perror("Memory reallocation failed for num1\n");
            exit(0);
        }
        // copy the temp into num1
        // hint the compiler to assume the alignment of the pointers
        __builtin_assume_aligned(num1, 64);
        __builtin_assume_aligned(temp, 64);
        for (int i = 0; i < n2; i++)
        {
            num1[i] = temp[i];
        }
        *n_1 = n2;
        *num1_base = num1;
        // free(temp);
        _mm_free(temp);
    }
}

struct perf_event_attr pe[MAX_EVENTS];
int fd[MAX_EVENTS];
long long count;
// event names
const char *event_names[MAX_EVENTS] = {
    "PERF_COUNT_HW_CPU_CYCLES",          // CPU Cycles
    "PERF_COUNT_HW_USER_INSTRUCTIONS",   // User Instructions
    "PERF_COUNT_HW_KERNEL_INSTRUCTIONS", // Kernel Instructions
    "PERF_COUNT_SW_PAGE_FAULTS",         // Page Faults
    "PERF_COUNT_L1D_CACHE_READS",        // L1D Cache Reads
    "PERF_COUNT_L1D_CACHE_READ_MISSES"   // L1D Cache Read Misses
};

void initialize_perf()
{
    // Define the events to monitor
    memset(pe, 0, sizeof(struct perf_event_attr) * MAX_EVENTS);
    for (int i = 0; i < MAX_EVENTS; i++)
    {
        pe[i].size = sizeof(struct perf_event_attr);
        pe[i].disabled = 1;
        pe[i].exclude_kernel = 0;
        pe[i].exclude_hv = 1;
        pe[i].exclude_idle = 1;
        pe[i].exclude_user = 0; // Initialize exclude_user explicitly
        pe[i].pinned = 1;       // Ensure counter stays on the specific CPU
    }

    // CPU cycles
    pe[0].type = PERF_TYPE_HARDWARE;
    pe[0].config = PERF_COUNT_HW_CPU_CYCLES;

    // User-level instructions
    pe[1].type = PERF_TYPE_HARDWARE;
    pe[1].config = PERF_COUNT_HW_INSTRUCTIONS;
    pe[1].exclude_kernel = 1;
    pe[1].exclude_user = 0;

    // Kernel-level instructions
    pe[2].type = PERF_TYPE_HARDWARE;
    pe[2].config = PERF_COUNT_HW_INSTRUCTIONS;
    pe[2].exclude_kernel = 0;
    pe[2].exclude_user = 1;

    // Page faults
    pe[3].type = PERF_TYPE_SOFTWARE;
    pe[3].config = PERF_COUNT_SW_PAGE_FAULTS;

    // L1D Cache Reads
    pe[4].type = PERF_TYPE_HW_CACHE;
    pe[4].config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_ACCESS << 16);

    // L1D Cache Read Misses
    pe[5].type = PERF_TYPE_HW_CACHE;
    pe[5].config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16);

    // Open the events
    for (int i = 0; i < MAX_EVENTS; i++)
    {
        fd[i] = perf_event_open(&pe[i], 0, CORE_NO, -1, 0);
        if (fd[i] == -1)
        {
            fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
            exit(EXIT_FAILURE);
        }
    }
}

FILE *open_file(char *filename)
{
    FILE *file = fopen(filename, "w");

    if (file == NULL)
    {
        perror("Error opening file for writing \n");
        exit(EXIT_FAILURE);
    }

    // Write the header to the CSV file
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        fprintf(file, "%s,", event_names[j]);
    }
    fprintf(file, "\n");
    return file;
}

void read_perf(long long values[])
{
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        if (read(fd[j], &values[j], sizeof(uint64_t)) == -1)
        {
            perror("Error reading counter value");
            exit(EXIT_FAILURE);
        }
    }
}

void write_perf(FILE *file, long long values[])
{
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        fprintf(file, "%llu,", values[j]);
    }
    fprintf(file, "\n");
    // close the file
    // fclose(file);
}

void start_perf()
{
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
        ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
    }
}

void stop_perf()
{
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
        {
            perror("Error disabling counter");
            exit(EXIT_FAILURE);
        }
    }
}

void start_timespec(struct timespec *start)
{
    start->tv_sec = 0;
    start->tv_nsec = 0;
    if (clock_gettime(CLOCK_MONOTONIC_RAW, start) == -1)
    {
        perror("Error getting start time");
        exit(EXIT_FAILURE);
    }
}

// // function to get time of the day
// void get_time(struct timeval *start)
// {
//     if (gettimeofday(start, NULL) == -1)
//     {
//         perror("Error getting start time");
//         exit(EXIT_FAILURE);
//     }
// }

void stop_timespec(struct timespec *end)
{
    // initialize the end time
    end->tv_sec = 0;
    end->tv_nsec = 0;
    if (clock_gettime(CLOCK_MONOTONIC_RAW, end) == -1)
    {
        perror("Error getting end time");
        exit(EXIT_FAILURE);
    }
}

double calculate_time(struct timespec start, struct timespec end)
{
    // Calculate the difference in seconds and nanoseconds
    long long seconds = end.tv_sec - start.tv_sec;
    long long nanoseconds = end.tv_nsec - start.tv_nsec;

    // Adjust seconds and nanoseconds if nanoseconds is negative
    if (nanoseconds < 0)
    {
        seconds--;
        nanoseconds += 1000000000; // 1 second in nanoseconds
    }

    // Convert to nanoseconds
    return (seconds * 1000000000LL) + nanoseconds;
}

bool check_result(char *result, char *result_gmp, int result_size)
{
    // check if the two subs lengths are equal
    if (strlen(result) != strlen(result_gmp))
    {
        // printf("The two subs are not equal, lengths are different\n");
        // printf("Length of result = %d, length of result_gmp = %ld\n", result_size, strlen(result_gmp));
        // printf("result = %s\n result_gmp = %s\n", result, result_gmp);
        return false;
    }
    for (int i = 0; i < result_size; i++)
    {
        if (result[i] != result_gmp[i])
        {
            // printf("The two subs are not equal\n");
            // printf("Mismatch at index %d\n", i);
            // printf("result[%d] = %c, result_gmp[%d] = %c\n", i, result[i], i, result_gmp[i]);
            // printf("result = %s\nresult_gmp = %s\n", result, result_gmp);
            return false;
        }
    }
    return true;
}

// each 9 group of digits of a1_test1 will have the below property for no borrow-propagation
// each group of digits of a1_test1 will start with higher digit, then slowly decrease to lower digit, non-increasing order
// each group of digits of b1_test1 will just be the reverse of a1_test1 for no borrow-propagation

// void generate_no_borrow_propagation(uint32_t **a, uint32_t **b, int n)
void generate_no_borrow_propagation(uint64_t **a, uint64_t **b, int n)
{
    // Allocate memory for arrays a and b
    *a = (uint64_t *)_mm_malloc(n * sizeof(uint64_t), 64);
    *b = (uint64_t *)_mm_malloc(n * sizeof(uint64_t), 64);

    if (*a == NULL || *b == NULL)
    {
        perror("Memory allocation failed for a or b\n");
        exit(EXIT_FAILURE);
    }

    // Seed the random number generator
    int seed = generate_seed();
    srand(seed);

    // Fill the arrays from the least significant end
    // assume the alignment of the pointers
    __builtin_assume_aligned(*a, 64);
    __builtin_assume_aligned(*b, 64);
    for (int i = n - 1; i >= 0;)
    {
        // Determine the size of the current group
        int group_size = (i >= 8) ? 9 : (i + 1);
        int start_index = i - group_size + 1;

        // Generate the group for array a in non-increasing order
        // uint32_t start_value = rand() % 10;
        uint64_t start_value = rand() % 10;
        for (int j = 0; j < group_size; j++)
        {
            (*a)[start_index + j] = start_value;
            // Randomly decide if the next digit should be the same or smaller
            if (rand() % 2 == 0 && start_value > 0)
            {
                start_value--;
            }
        }

        // Generate the group for array b as the reverse of array a
        for (int j = 0; j < group_size; j++)
        {
            (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
        }

        i -= group_size;
    }
}

void open_time_file(char *filename, FILE **file)
{
    *file = fopen(filename, "w");

    if (*file == NULL)
    {
        perror("Error opening file for writing \n");
        exit(EXIT_FAILURE);
    }

    // Write the header to the CSV file
    // Time, RDTSC
    fprintf(*file, "Time, RDTSC\n");
}

void write_time(FILE *file, double time, unsigned long long rdtsc)
{
    fprintf(file, "%lf, %llu\n", time, rdtsc);
}

// This function will convert single digits array into a string
char *convert_digits_to_string(uint64_t *digits, int n)
{
    char *str = (char *)calloc(n + 1, sizeof(char));
    if (str == NULL)
    {
        perror("Memory allocation failed for str\n");
        exit(0);
    }
    for (int i = 0; i < n; i++)
    {
        str[i] = digits[i] + '0';
    }
    str[n] = '\0';
    return str;
}

/*
 * Function to run tests
 * Tests the sub function with different inputs
 * Basically, there are 4 types of tests:
 * 1. No Borrow-Propagation (Best-case)
 * 2. Full Borrow-Propagation (Worst-case)
 * 3. n/2 Borrow-Propagation (Average-case)
 * 4. Random Borrow-Propagation (Random-case)
 */

void run_tests()
{
    initialize_perf();
    char filename[256];
    char filename_gmp[256];
    char time_filename[256];
    char time_filename_gmp[256];

    snprintf(filename, sizeof(filename), "experiments/sub_64_aligned_mavx512f_%d_%d.csv", NUM_BITS, CORE_NO);
    snprintf(filename_gmp, sizeof(filename_gmp), "experiments/GMP_sub_64_aligned_mavx512f%d_%d.csv", NUM_BITS, CORE_NO);
    snprintf(time_filename, sizeof(time_filename), "experiments/sub_64_aligned_mavx512f_my_time_%d_%d.csv", NUM_BITS, CORE_NO);
    snprintf(time_filename_gmp, sizeof(time_filename_gmp), "experiments/sub_64_mavx512f_nonO3_gmp_time_%d_%d.csv", NUM_BITS, CORE_NO);
    FILE *file = open_file(filename);
    FILE *file_gmp = open_file(filename_gmp);
    FILE *time_file = fopen(time_filename, "w");
    FILE *time_file_gmp = fopen(time_filename_gmp, "w");

    long long values[MAX_EVENTS];

    // By using GMP, we can generate random numbers to get the length of the numbers according to the number of bits
    mpz_t sample_num;
    mpz_init(sample_num);
    gmp_randstate_t state;
    unsigned long seed = generate_seed();
    gmp_randinit_default(state);
    gmp_randseed_ui(state, seed);
    mpz_urandomb(sample_num, state, NUM_BITS);
    char *sample_num_str = mpz_get_str(NULL, 10, sample_num);
    int n = strlen(sample_num_str);

    int sub_size;
    // uint32_t *sub;
    aligned_uint64_ptr sub;

    printf("Number of bits = %d\n", NUM_BITS);
    printf("Number of digits = %d\n", n);

    printf("Running tests\n");

    memset(sub_space, 0, (1 << 30));
    sub_space_ptr = 0;

    memset(borrow_space, 0, (1 << 30));
    borrow_space_ptr = 0;

    printf("Test 1: No Borrow-Propagation\n");
    double test1_time = 0;
    double test1_gmp_time = 0;

    unsigned long long start_rdtsc, end_rdtsc;
    unsigned long long start_rdtsc_gmp, end_rdtsc_gmp;
    unsigned cycles_low, cycles_high, cycles_low1, cycles_high1;
    unsigned long flags;
    uint64_t start, end;

    unsigned long long test1_rdtsc = 0, test1_rdtsc_gmp = 0;
    printf("Running test 1, with %d iterations\n", ITERATIONS);
    for (int i = 0; i < ITERATIONS; i++)
    {
        // Test 1: No Borrow-Propagation,  remember, numbers will grouped into 9 digits
        aligned_uint64_ptr a1_test1, b1_test1;

        // intialize a1_test1 and b1_test1 with no borrow-propagation case

        // auto generate the numbers
        generate_no_borrow_propagation(&a1_test1, &b1_test1, n);

        char *a1_str_test1 = convert_digits_to_string(a1_test1, n);
        char *b1_str_test1 = convert_digits_to_string(b1_test1, n);

        // Make the two numbers equidistant
        make_equidistant(&a1_test1, &b1_test1, &n, &n);

        // format the numbers into limbs
        int n_limb = n;
        int m_limb = n;

        // uint32_t *a1_limbs = returnLimbs(a1_test1, &n_limb);
        aligned_uint64_ptr a1_limbs = returnLimbs(a1_test1, &n_limb);
        // uint32_t *b1_limbs = returnLimbs(b1_test1, &m_limb);
        aligned_uint64_ptr b1_limbs = returnLimbs(b1_test1, &m_limb);

        // allocate from scratch space
        // uint32_t *sub_test1 = sub_space + sub_space_ptr;
        aligned_uint64_ptr sub_test1 = sub_space + sub_space_ptr;
        int sub_size_test1 = n_limb;
        sub_space_ptr += (n_limb + 31) & ~31;
        borrow_space_ptr += (n_limb + 31) & ~31;

        // warmup for rdtsc
        warmup_rdtsc();

        // // Disable preemption
        // preempt_disable();

        // // Disable hardware interrupts
        // raw_local_irq_save(flags); /*we disable hard interrupts on our CPU*/
        /*at this stage we exclusively own the CPU*/

        // Start the perf events
        start_perf();

        // preempt_disable();
        // raw_local_irq_save(flags);
        start_rdtsc = measure_rdtsc_start();

        // Run the sub function
        sub_n(a1_limbs, b1_limbs, &sub_test1, n_limb, &sub_size_test1);

        end_rdtsc = measure_rdtscp_end();

        // raw_local_irq_restore(flags);
        // preempt_enable();

        // Stop the perf events
        stop_perf();

        // read the perf events
        read_perf(values);

        if (end_rdtsc < start_rdtsc)
        {
            perror("Error in rdtsc\n");
            exit(EXIT_FAILURE);
        }

        // Write the perf events to the file
        write_perf(file, values);

        test1_rdtsc += (end_rdtsc - start_rdtsc);

        // Use GMP to sub the two numbers
        mpz_t a1_test1_gmp, b1_test1_gmp, sub_gmp_test1;
        mpz_init(a1_test1_gmp);
        mpz_init(b1_test1_gmp);
        mpz_init(sub_gmp_test1);
        mpz_set_str(a1_test1_gmp, a1_str_test1, 10);
        mpz_set_str(b1_test1_gmp, b1_str_test1, 10);

        // warmup for rdtsc
        warmup_rdtsc();

        // // Disable preemption
        // preempt_disable();

        // // Disable hardware interrupts
        // raw_local_irq_save(flags); /*we disable hard interrupts on our CPU*/
        /*at this stage we exclusively own the CPU*/

        // Start the perf events
        start_perf();

        // measure rdtsc
        start_rdtsc_gmp = measure_rdtsc_start();

        // Run the sub function
        mpz_sub(sub_gmp_test1, a1_test1_gmp, b1_test1_gmp);

        end_rdtsc_gmp = measure_rdtscp_end();
        // raw_local_irq_restore(flags);
        // preempt_enable();

        // Stop the perf events
        stop_perf();

        // read the perf events
        read_perf(values);

        if (end_rdtsc_gmp < start_rdtsc_gmp)
        {
            perror("Error in rdtsc\n");
            exit(EXIT_FAILURE);
        }

        // Write the perf events to the file
        write_perf(file_gmp, values);

        test1_rdtsc_gmp += (end_rdtsc_gmp - start_rdtsc_gmp);

        // convert sub's output sub into a string
        char *sub_str_test1 = formatResult(sub_test1, &sub_size_test1);

        // convert gmp's output sub into a string
        char *sub_gmp_str_test1 = mpz_get_str(NULL, 10, sub_gmp_test1);

        // check if the two subs are equal
        if (!check_result(sub_str_test1, sub_gmp_str_test1, sub_size_test1))
        {
            printf("Test 1 failed, at iteration %d\n", i);
            printf("a1_str_test1 = %s\n", a1_str_test1);
            printf("b1_str_test1 = %s\n", b1_str_test1);
            printf("sub_str_test1 = %s\n", sub_str_test1);
            printf("sub_gmp_str_test1 = %s\n", sub_gmp_str_test1);
            return;
        }
        else
        {
            printf("Test 1 iteration %d passed\n", i);
        }
        printf("Test 1 iteration %d passed\n", i);
        sleep(0.1);
    }
    printf("Test 1 completed\n");
    printf("rdtsc for test 1 = %llu, rdtsc for test 1 gmp = %llu\n", test1_rdtsc, test1_rdtsc_gmp);
    double speedup = (double)test1_rdtsc_gmp / test1_rdtsc;
    printf("RDTSC Speedup: %f\n", speedup);
}
