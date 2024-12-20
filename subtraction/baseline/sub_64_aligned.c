/* This is the baseline version, without explicit SIMD */
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
#include <zlib.h>
#include <sys/stat.h>

#define MAX_EVENTS 6      // Number of events to monitor
#define LIMB_SIZE 19      // Number of digits in each limb
#define ITERATIONS 100000 // Number of iterations for each test
#define CHUNK 16384       // Chunk size for reading the file

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
void logical_left_shift_by_one(uint64_t *borrow_array, int n)
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
    logical_left_shift_by_one(borrow_array, n);

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

void write_perf(gzFile file, long long values[])
{
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        gzprintf(file, "%llu,", values[j]);
    }
    gzprintf(file, "\n");
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

// Function to check if the result of the subtraction is correct
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

uint64_t *convert_string_to_digits(char *str, int *n)
{
    int len = strlen(str);
    *n = len;
    uint64_t *digits = (uint64_t *)_mm_malloc(len * sizeof(uint64_t), 64);
    if (digits == NULL)
    {
        perror("Memory allocation failed for digits\n");
        exit(0);
    }
    for (int i = 0; i < len; i++)
    {
        digits[i] = str[i] - '0';
    }
    return digits;
}

// Function to create a directory
void create_directory(const char *path)
{
    if (mkdir(path, 0777) && errno != EEXIST)
    {
        fprintf(stderr, "Error creating directory %s: %s\n", path, strerror(errno));
        exit(EXIT_FAILURE);
    }
}

// Function to open a gzip file and handle errors
gzFile open_gzfile(const char *filename, const char *mode)
{
    gzFile file = gzopen(filename, mode);
    if (file == NULL)
    {
        fprintf(stderr, "Error opening file %s: %s\n", filename, strerror(errno));
        exit(EXIT_FAILURE);
    }
    return file;
}

void skip_first_line(gzFile file)
{
    char buffer[CHUNK];
    if (gzgets(file, buffer, sizeof(buffer)) == NULL)
    {
        perror("Error reading header line");
        gzclose(file);
        exit(EXIT_FAILURE);
    }
}

void write_rdtsc(gzFile file, unsigned long long rdtsc)
{
    gzprintf(file, "%llu\n", rdtsc);
}

void run_tests()
{
    // read the test cases from the file
    // path: ../test/cases/<num_bits>/<test_case>.csv.gz
    // there are four test cases: random.csv.gz, equal.csv.gz, greater.csv.gz, smaller.csv.gz
    // first line contains a header: a, b, result
    // next line onwards contains the test cases, 1000000 test cases
    // verify the results of the subtraction of a and b with the result

    // Create directories for the results
    create_directory("experiments/results");
    create_directory("experiments/perf_data");
    create_directory("experiments/rdtsc_data");

    unsigned long long start_rdtsc, end_rdtsc;
    unsigned long long total_rdtsc = 0;
    unsigned cycles_low, cycles_high, cycles_low1, cycles_high1;
    long long values[MAX_EVENTS];

    memset(sub_space, 0, (1 << 30));
    sub_space_ptr = 0;

    memset(borrow_space, 0, (1 << 30));
    borrow_space_ptr = 0;

    // open the perf events
    initialize_perf();

    // testcase: random.txt
    // Open the file for writing the perf experiment data
    char perf_filename_random[100];
    snprintf(perf_filename_random, sizeof(perf_filename_random), "experiments/perf_data/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
    gzFile perf_file_random = open_gzfile(perf_filename_random, "wb");

    // open file to write the rdtsc values
    char rdtsc_filename_random[100];
    snprintf(rdtsc_filename_random, sizeof(rdtsc_filename_random), "experiments/rdtsc_data/random_%d_%d.csv", NUM_BITS, CORE_NO);
    gzFile rdtsc_file_random = open_gzfile(rdtsc_filename_random, "wb");

    char test_case[100];
    snprintf(test_case, sizeof(test_case), "../test/cases/%d/random.csv.gz", NUM_BITS);
    gzFile random_file = open_gzfile(test_case, "rb");

    // skip the first line, header
    skip_first_line(random_file);

    // Read ITERATIONS test cases
    char buffer[CHUNK];
    for (int i = 0; i < ITERATIONS; i++)
    {
        // Read the next line
        if (gzgets(random_file, buffer, sizeof(buffer)) == NULL)
        {
            if (gzeof(random_file))
            {
                break; // End of file reached
            }
            else
            {
                perror("Error reading line");
                gzclose(random_file);
                exit(EXIT_FAILURE);
            }
        }

        // Extract a, b, result from the line
        char *a_str = strtok(buffer, ",");
        char *b_str = strtok(NULL, ",");
        char *result_str = strtok(NULL, ",");
        if (a_str == NULL || b_str == NULL || result_str == NULL)
        {
            fprintf(stderr, "Error parsing line: %s\n", buffer);
            gzclose(random_file);
            exit(EXIT_FAILURE);
        }

        int n_1 = strlen(a_str);
        int n_2 = strlen(b_str);

        // convert a and b into digits
        uint64_t *a = convert_string_to_digits(a_str, &n_1);
        uint64_t *b = convert_string_to_digits(b_str, &n_2);

        // convert a and b into limbs using returnLimbs
        aligned_uint64_ptr a_limbs = returnLimbs(a, &n_1);
        aligned_uint64_ptr b_limbs = returnLimbs(b, &n_2);
        // make a and b equidistant

        make_equidistant(&a_limbs, &b_limbs, &n_1, &n_2);

        int n_limb = n_1;

        __builtin_assume_aligned(a_limbs, 64);
        __builtin_assume_aligned(b_limbs, 64);

        // allocate from scratch space
        aligned_uint64_ptr sub = sub_space + sub_space_ptr;
        int sub_size = n_limb;
        sub_space_ptr += (n_limb + 31) & ~31;
        borrow_space_ptr += (n_limb + 31) & ~31;

        __builtin_assume_aligned(a_limbs, 64);
        __builtin_assume_aligned(b_limbs, 64);
        aligned_uint64_ptr result;

        // start the perf events
        start_perf();

        // warm up the rdtsc
        warmup_rdtsc();

        // measure the start rdtsc
        start_rdtsc = measure_rdtsc_start();

        sub_n(a_limbs, b_limbs, &sub, n_limb, &sub_size);

        // measure the end rdtsc
        end_rdtsc = measure_rdtscp_end();

        // stop the perf events
        stop_perf();

        // read the values of the perf events
        read_perf(values);

        if (end_rdtsc < start_rdtsc)
        {
            perror("Error: RDTSC end time is less than start time\n");
            exit(EXIT_FAILURE);
        }
        // write the rdtsc values to the file
        write_rdtsc(rdtsc_file_random, end_rdtsc - start_rdtsc);

        total_rdtsc += (end_rdtsc - start_rdtsc);

        // write the perf events to the file
        write_perf(perf_file_random, values);

        // convert the result into a string
        char *sub_str = formatResult(sub, &sub_size);

        // verify the converted string with result
        if (!check_result(sub_str, result_str, sub_size))
        {
            printf("Test case failed\n");
            printf("a = %s, b = %s, result = %s\n", a_str, b_str, result_str);
            printf("Subtraction result = %s\n", sub_str);
            exit(EXIT_FAILURE);
        }
    }
    printf("Random test cases passed\n");
    printf("Total RDTSC cycles: %llu\n", total_rdtsc);
    gzclose(perf_file_random);
    gzclose(rdtsc_file_random);
    gzclose(random_file);
    _mm_free(sub_space);
    _mm_free(borrow_space);
}
