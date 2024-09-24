/* This is the version with explicit SIMD (AVX512) */
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
#include <libgen.h>
#include <ctype.h>
#include <cpuid.h>
#include <sys/resource.h>

#define MAX_EVENTS 6      // Number of events to monitor
#define LIMB_SIZE 18      // Number of digits in each limb
#define ITERATIONS 100000 // Number of iterations for each test
#define CHUNK 65536       // Chunk size for reading the file

#define unlikely(expr) __builtin_expect(!!(expr), 0) // unlikely branch
#define likely(expr) __builtin_expect(!!(expr), 1)   // likely branch

typedef uint64_t aligned_uint64 __attribute__((aligned(64)));      // Define an aligned uint64_t
typedef uint64_t *aligned_uint64_ptr __attribute__((aligned(64))); // Define an aligned pointer to uint64_t

// Declare 64-byte aligned global pointers
aligned_uint64_ptr sub_space;
aligned_uint64_ptr borrow_space;
uint8_t *borrow_masks; // Array to store the borrow masks

__m512i zeros;             // 0 as chunk of 8 64-bit integers
__m512i ones;              // 1 as chunk of 8 64-bit integers
__m512i limb_digits;       // 10^18 as chunk of 8 64-bit integers
__m512i minus_limb_digits; // -10^18 as chunk of 8 64-bit integers

int sub_space_ptr = 0;    // pointer to the next available space in sub_space
int borrow_space_ptr = 0; // pointer to the next available space in borrow_space

aligned_uint64 LIMB_DIGITS = 1000000000000000000ULL; // 10^18, used for borrow-propagation, as we're using 64-bit integers

int CORE_NO; // Core number to run the tests on

int NUM_BITS; // Number of bits for the numbers

// Function prototypes
uint64_t *returnLimbs(uint64_t *number, int *length);                                  // Function to group digits into limbs
char *formatResult(uint64_t *result, size_t *result_length, bool sign);                // Function to format the result as a string
void make_equidistant(uint64_t **num1_base, uint64_t **num2_base, int *n_1, int *n_2); // Function to make the two numbers equidistant, by adding leading zeros
void run_benchmarking_test(int, int);                                                  // Function to run the benchmarking tests
void run_correctness_test(int);                                                        // Function to run the correctness tests
void initialize_perf();                                                                // Function to initialize the perf events
inline bool sub_n(uint64_t *a, uint64_t *b, uint64_t **result_ptr, size_t n) __attribute__((always_inline));
inline bool is_less_than(uint64_t *a, uint64_t *b, uint64_t n) __attribute__((always_inline));
inline void warmup_rdtsc() __attribute__((always_inline));
inline unsigned long long measure_rdtsc_start() __attribute__((always_inline));
inline unsigned long long measure_rdtscp_end() __attribute__((always_inline));
inline bool check_result(char *result, char *result_gmp, int result_size) __attribute__((always_inline));
inline void write_time(gzFile file, double time) __attribute__((always_inline));

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

// function to get the timespec stamp
inline struct timespec get_timespec()
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
    return ts;
}

// function to compute the difference between two timespec stamps
inline long diff_timespec_ns(struct timespec start, struct timespec end)
{
    struct timespec temp;
    if ((end.tv_nsec - start.tv_nsec) < 0)
    {
        temp.tv_sec = end.tv_sec - start.tv_sec - 1;
        temp.tv_nsec = 1000000000 + end.tv_nsec - start.tv_nsec;
    }
    else
    {
        temp.tv_sec = end.tv_sec - start.tv_sec;
        temp.tv_nsec = end.tv_nsec - start.tv_nsec;
    }
    // return in ns
    return temp.tv_sec * 1000000000 + temp.tv_nsec;
}

// Function to measure CPU time
int cputime()
{
    struct rusage rus;
    getrusage(RUSAGE_SELF, &rus);
    return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
}

inline void write_time(gzFile file, double time)
{
    if (gzprintf(file, "%f\n", time) < 0)
    {
        perror("Error writing to file\n");
        exit(EXIT_FAILURE);
    }
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

// function to left shift the borrow_mask array by one bit
void left_shift(__mmask8 *borrow_mask, size_t n)
{
    uint8_t carry = 0;
    for (int i = n - 1; i >= 0; i--)
    {
        uint8_t temp = borrow_mask[i];
        borrow_mask[i] = (temp << 1) | carry;
        carry = temp >> 7;
    }
}

inline bool sub_n(uint64_t *a, uint64_t *b, uint64_t **result_ptr, size_t n)
{
    aligned_uint64_ptr result = sub_space + sub_space_ptr;
    size_t j = 0;
    bool is_less = false;
    do
    {
        if (likely(a[j] > b[j]))
        {
            break;
        }
        if (unlikely(a[j] < b[j]))
        {
            is_less = true;
            // swap a and b
            aligned_uint64_ptr temp = a;
            a = b;
            b = temp;
            break;
        }
        j++;
        if (unlikely(j == n))
        {
            // a and b are equal
            // *result = 0;
            return is_less;
        }
    } while (j < n);

    aligned_uint64_ptr borrow_array = borrow_space + borrow_space_ptr;
    size_t i = 0;
    do
    {
        // load 8 64-bit integers from a and b
        __m512i a_vec = _mm512_load_si512(a + i);
        __m512i b_vec = _mm512_load_si512(b + i);

        // subtract a and b
        __m512i result_vec = _mm512_sub_epi64(a_vec, b_vec);

        // if result_vec[j] < 0, set borrow mask to 1
        __mmask8 borrow_mask = _mm512_cmplt_epi64_mask(result_vec, zeros);

        // based on borrow mask, result_vec[j] =  result_vec[j] + limb_digits
        result_vec = _mm512_mask_add_epi64(result_vec, borrow_mask, result_vec, limb_digits);

        // store the borrow directly using the mask
        _mm512_mask_store_epi64(borrow_array + i, borrow_mask, ones);

        // store the result
        _mm512_store_si512(result + i, result_vec);
        i += 8;
    } while (likely(i < n));
    // zero out
    _mm512_storeu_si512(result + n, zeros);
    _mm512_storeu_si512(borrow_array + n, zeros);

    // left shift the borrow array by 1
    borrow_array = borrow_array + 1;

    int last_borrow_block = -1;
    i = 0;
    do
    {
        __m512i borrow_vec = _mm512_loadu_epi64(borrow_array + i);
        __m512i result_vec = _mm512_load_si512(result + i);
        result_vec = _mm512_sub_epi64(result_vec, borrow_vec);
        // check if result_vec[j] < 0
        __mmask8 borrow_mask = _mm512_cmplt_epi64_mask(result_vec, zeros);
        _mm512_store_si512(result + i, result_vec);
        if (unlikely(borrow_mask))
        {
            last_borrow_block = i;
            // update the borrow array
            _mm512_mask_storeu_epi64(borrow_array + i, borrow_mask, ones);
        }
        i += 8;
    } while (likely(i < n));

    if (unlikely(last_borrow_block != -1))
    {
        size_t i = (last_borrow_block + 15);
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
    *result_ptr = result;
    return is_less;
}

// main function with cmd arguments
int main(int argc, char *argv[])
{
    if (argc != 5)
    {
        printf("Usage: %s <number of bits> <core number> <test-case number> <measure_type>\n", argv[0]);
        return 1;
    }

    assert(atoi(argv[1]) > 0);
    NUM_BITS = atoi(argv[1]);

    assert(atoi(argv[2]) >= 0 && atoi(argv[2]) < sysconf(_SC_NPROCESSORS_ONLN));
    CORE_NO = atoi(argv[2]);

    assert(atoi(argv[3]) >= 0 && atoi(argv[3]) < 4);
    int test_case = atoi(argv[3]);

    assert(atoi(argv[4]) >= 0 && atoi(argv[4]) < 3);
    int measure_type = atoi(argv[4]);

    // Use _mm_malloc to allocate memory aligned to 64 bytes
    sub_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
    borrow_space = (aligned_uint64_ptr)_mm_malloc(1 << 30, 64);
    borrow_masks = (uint8_t *)malloc(1 << 30);

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

    zeros = _mm512_set1_epi64(0);
    ones = _mm512_set1_epi64(1);
    limb_digits = _mm512_set1_epi64(LIMB_DIGITS);
    minus_limb_digits = _mm512_set1_epi64(-LIMB_DIGITS);

    // run_correctness_test(test_case);
    run_benchmarking_test(test_case, measure_type);

    // free the allocated memory
    _mm_free(sub_space);
    _mm_free(borrow_space);
    free(borrow_masks);

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

char *formatResult(uint64_t *result, size_t *result_length, bool sign)
{
    // remove leading zeroes
    // while (*result_length > 0 && result[*result_length - 1] == 0)
    // {
    //     (*result_length)--;
    // }
    int i = 0;
    while (result[i] == 0 && i < *result_length)
    {
        i++;
    }
    *result_length = *result_length - i;
    result = result + i;
    if (sign)
    {
        result[0] = -result[0];
    }

    if (*result_length == 0)
    {
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
    i = 0;
    // Handle the first element separately (without leading zeros)
    if (result[0] > LIMB_DIGITS)
    {
        sprintf(result_str, "%" PRId64, (int64_t)result[0]); // Print as signed
    }
    else
    {
        sprintf(result_str, "%" PRIu64, result[0]); // Print as unsigned
    }
    // check if the first element is negative and it has sucessive zeros after the sign
    if (result[0] > LIMB_DIGITS)
    {
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
        snprintf(temp, sizeof(temp), "%018" PRIu64, result[i]); // Print with leading zeros
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
            // Close previously opened file descriptors
            for (int j = 0; j < i; j++)
            {
                close(fd[j]);
            }
            exit(EXIT_FAILURE);
        }
    }
}

void read_perf(uint64_t values[])
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

void write_perf(gzFile file, uint64_t values[])
{
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        if (gzprintf(file, "%" PRIu64 ",", values[j]) <= 0)
        {
            int errnum;
            const char *errmsg = gzerror(file, &errnum);
            fprintf(stderr, "Error writing to gzFile: %s\n", errmsg);
            exit(EXIT_FAILURE);
        }
    }
    if (gzprintf(file, "\n") <= 0)
    {
        int errnum;
        const char *errmsg = gzerror(file, &errnum);
        fprintf(stderr, "Error writing newline to gzFile: %s\n", errmsg);
        exit(EXIT_FAILURE);
    }
}

void start_perf()
{
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        if (ioctl(fd[j], PERF_EVENT_IOC_RESET, 0) == -1)
        {
            perror("Error resetting perf event");
            exit(EXIT_FAILURE);
        }
        if (ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0) == -1)
        {
            perror("Error enabling perf event");
            exit(EXIT_FAILURE);
        }
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

// Function to trim leading zeros and whitespace characters
char *trim_leading_zeros_and_whitespace(char *str)
{
    while (*str == '0' || isspace(*str))
    {
        str++;
    }
    return str;
}

// Function to trim trailing newline characters
void trim_trailing_newline(char *str)
{
    size_t len = strlen(str);
    if (len > 0 && str[len - 1] == '\n')
    {
        str[len - 1] = '\0';
    }
}

// Function to check if the result of the subtraction is correct
bool check_result(char *result, char *result_gmp, int result_size)
{

    // Check if both results start with a negative symbol
    bool result_negative = (result[0] == '-');
    bool result_gmp_negative = (result_gmp[0] == '-');

    // Adjust pointers to skip the negative symbol for comparison
    if (result_negative)
        result++;
    if (result_gmp_negative)
        result_gmp++;

    // Trim leading zeros and whitespace characters from both strings
    result = trim_leading_zeros_and_whitespace(result);
    result_gmp = trim_leading_zeros_and_whitespace(result_gmp);

    // Trim trailing newline characters from both strings
    trim_trailing_newline(result);
    trim_trailing_newline(result_gmp);

    // Check if the lengths of the adjusted strings are equal
    if (strlen(result) != strlen(result_gmp))
    {
        // printf("The two subs are not equal, lengths are different\n");
        // printf("Length of result = %ld, length of result_gmp = %ld\n", strlen(result), strlen(result_gmp));
        // printf("result = %s\n result_gmp = %s\n", result, result_gmp);
        return false;
    }

    // Compare the adjusted strings character by character
    for (size_t i = 0; i < strlen(result); i++)
    {
        if (result[i] != result_gmp[i])
        {
            // printf("The two subs are not equal\n");
            // printf("Mismatch at index %ld\n", i);
            // printf("result[%ld] = %c, result_gmp[%ld] = %c\n", i, result[i], i, result_gmp[i]);
            // printf("result = %s\nresult_gmp = %s\n", result, result_gmp);
            return false;
        }
    }

    // If both results were negative, ensure the negative symbol is accounted for
    if (result_negative != result_gmp_negative)
    {
        printf("The two subs are not equal, one is negative and the other is not\n");
        return false;
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
    char *path_copy = strdup(path);
    char *parent_dir = dirname(path_copy);

    // Recursively create parent directories
    if (strcmp(parent_dir, ".") != 0 && strcmp(parent_dir, "/") != 0)
    {
        create_directory(parent_dir);
    }

    free(path_copy);

    // Create the final directory
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

// Function to measure the time taken by a function using the rusage system call
#define TIME_RUSAGE(t, func)                    \
    do                                          \
    {                                           \
        long int __t0, __times, __t, __tmp;     \
        __times = 1;                            \
        {                                       \
            func;                               \
        }                                       \
        do                                      \
        {                                       \
            __times <<= 1;                      \
            __t0 = cputime();                   \
            for (__t = 0; __t < __times; __t++) \
            {                                   \
                func;                           \
            }                                   \
            __tmp = cputime() - __t0;           \
        } while (__tmp < 250);                  \
        __tmp = __tmp * 1000000;                \
        (t) = (double)__tmp / __times;          \
    } while (0)

// Function to measure the time taken by a function using the timespec clock_gettime system call
#define TIME_TIMESPEC(t, func)                      \
    do                                              \
    {                                               \
        long int __tmp, __times;                    \
        struct timespec __t0, __t1;                 \
        __times = 1;                                \
        {                                           \
            func;                                   \
        }                                           \
        do                                          \
        {                                           \
            __times <<= 1;                          \
            __t0 = get_timespec();                  \
            for (int __t = 0; __t < __times; __t++) \
            {                                       \
                func;                               \
            }                                       \
            __t1 = get_timespec();                  \
            __tmp = diff_timespec_ns(__t0, __t1);   \
        } while (__tmp < 250000000);                \
        (t) = (double)__tmp / __times;              \
    } while (0)

// Function to measure the time taken by a function using the rdtsc instruction
#define TIME_RDTSC(t, func)                            \
    do                                                 \
    {                                                  \
        unsigned long long __t0, __t1, __times, __tmp; \
        __times = 1;                                   \
        {                                              \
            func;                                      \
        }                                              \
        warmup_rdtsc();                                \
        do                                             \
        {                                              \
            __times <<= 1;                             \
            __t0 = measure_rdtsc_start();              \
            for (int __t = 0; __t < __times; __t++)    \
            {                                          \
                func;                                  \
            }                                          \
            __t1 = measure_rdtscp_end();               \
            __tmp = __t1 - __t0;                       \
        } while (__tmp < 625000000);                   \
        __tmp = __tmp * 0.4;                           \
        (t) = (double)(__tmp) / __times;               \
    } while (0)

/*
 Does the following for testing correctness:
    1. read the test cases from the file
    2. path: ../test/cases/<num_bits>/<test_case>.csv.gz
    3. there are four test cases: random.csv.gz, equal.csv.gz, greater.csv.gz, smaller.csv.gz
    4. first line contains a header: a, b, result
    5. next line onwards contains the test cases, 100000 test cases
    6. verify the results of the subtraction of a and b with the result
*/
void run_correctness_test(int test_case)
{
    printf("Running correctness test\n");
    // Create directories for the results
    create_directory("experiments/results");
    // open the perf file
    gzFile timespec_file, rdtsc_file, cputime_file;

    uint64_t values[MAX_EVENTS];

    memset(sub_space, 0, (1 << 30));
    sub_space_ptr = 0;

    memset(borrow_space, 0, (1 << 30));
    borrow_space_ptr = 0;

    memset(borrow_masks, 0, (1 << 30));

    char test_filename[100];

    switch (test_case)
    {
    case 0:
        printf("Running random test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/random.csv.gz", NUM_BITS);
        break;
    case 1:
        printf("Running equal test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/equal.csv.gz", NUM_BITS);
        break;
    case 2:
        printf("Running greater test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/greater.csv.gz", NUM_BITS);
        break;
    case 3:
        printf("Running smaller test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/smaller.csv.gz", NUM_BITS);
        break;
    default:
        printf("Invalid test case\n");
        exit(EXIT_FAILURE);
    }

    // open the test file
    gzFile test_file = open_gzfile(test_filename, "rb");

    // skip the first line, header
    skip_first_line(test_file);

    // Read ITERATIONS test cases
    for (int i = 0; i < ITERATIONS; i++)
    {
        // Read the next line
        char buffer[CHUNK];
        // Read the next line
        if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
        {
            if (gzeof(test_file))
            {
                break; // EOF
            }
            else
            {
                perror("Error reading line");
                gzclose(test_file);
                exit(EXIT_FAILURE);
            }
        }

        // Parse the test case
        char *a_str = strtok(buffer, ",");
        char *b_str = strtok(NULL, ",");
        char *result_str = strtok(NULL, ",");

        if (a_str == NULL || b_str == NULL || result_str == NULL)
        {
            fprintf(stderr, "Error parsing line: %s\n", buffer);
            gzclose(test_file);
            exit(EXIT_FAILURE);
        }

        // Convert the strings to digits
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
        size_t sub_size = n_limb;
        sub_space_ptr += (n_limb + 31) & ~31;
        borrow_space_ptr += (n_limb + 31) & ~31;

        __builtin_assume_aligned(a_limbs, 64);
        __builtin_assume_aligned(b_limbs, 64);
        aligned_uint64_ptr result;

        memset(sub, 0, n_limb * sizeof(uint64_t));
        memset(borrow_space, 0, n_limb * sizeof(uint64_t));

        /***** Start of subtraction *****/

        bool sign = sub_n(a_limbs, b_limbs, &sub, n_limb);

        /***** End of subtraction *****/

        // convert the result into a string
        char *sub_str = formatResult(sub, &sub_size, sign);

        // verify the converted string with result
        if (!check_result(sub_str, result_str, sub_size))
        {
            printf("Test case failed, at iteration %d\n", i);
            printf("a = %s, b = %s\n Expected result = %s\n", a_str, b_str, result_str);
            printf("Experimental result = %s\n", sub_str);
            exit(EXIT_FAILURE);
            gzclose(test_file);
        }
    }

    switch (test_case)
    {
    case 0:
        printf("Random test cases completed\n");
        break;
    case 1:
        printf("Equal test cases completed\n");
        break;
    case 2:
        printf("Greater test cases completed\n");
        break;
    case 3:
        printf("Smaller test cases completed\n");
        break;
    }
    // close the test file
    gzclose(test_file);
}

/*
  Does the following for measuring the time taken for subtraction:
    1. read the test cases from the file
    2. path: ../test/cases/<num_bits>/<test_case>.csv.gz
    3. starts measuring the time wtih one of the three methods: RDTSC, timespec, rusage
       a. measure_type = 0: RDTSC
       b. measure_type = 1: timespec
       c. measure_type = 2: rusage
    4. writes the time taken to the file: experiments/results/<measure_type>/<test_case>_<num_bits>_<core_no>.csv.gz
*/
void run_benchmarking_test(int test_case, int measure_type)
{
    // Create directories for the results
    create_directory("experiments/results");
    // open the perf file
    gzFile timespec_file, rdtsc_file, cputime_file;
    switch (measure_type)
    {
    case 0: // RDTSC
        printf("Running the tests with RDTSC measurements\n");
        create_directory("experiments/results/rdtsc_measurements");
        break;
    case 1: // Timespec gettime()
        printf("Running the tests with timespec measurements\n");
        create_directory("experiments/results/timespec_measurements");
        break;
    case 2: // CPU time, rusage
        printf("Running the tests with rusage measurements\n");
        create_directory("experiments/results/cputime_measurements");
        break;
    default:
        printf("Invalid measure type\n");
        exit(EXIT_FAILURE);
    }

    memset(sub_space, 0, (1 << 30));
    sub_space_ptr = 0;

    memset(borrow_space, 0, (1 << 30));
    borrow_space_ptr = 0;

    char rdtsc_filename[100];
    char test_filename[100];
    char timespec_filename[100];
    char cputime_filename[100];

    switch (test_case)
    {
    case 0: // Random test cases
        printf("Running random test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/random.csv.gz", NUM_BITS);
        if (measure_type == 0) // RDTSC
        {
            snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            rdtsc_file = open_gzfile(rdtsc_filename, "wb");
            if (rdtsc_file == NULL)
            {
                perror("Error opening rdtsc file");
                exit(EXIT_FAILURE);
            }
            break;
        }
        else if (measure_type == 1) // Timespec
        {
            snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            timespec_file = open_gzfile(timespec_filename, "wb");
            if (timespec_file == NULL)
            {
                perror("Error opening timespec file");
                exit(EXIT_FAILURE);
            }
            break;
        }
        else if (measure_type == 2) // rusage
        {
            snprintf(cputime_filename, sizeof(cputime_filename), "experiments/results/cputime_measurements/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            cputime_file = open_gzfile(cputime_filename, "wb");
            if (cputime_file == NULL)
            {
                perror("Error opening cputime file");
                exit(EXIT_FAILURE);
            }
            break;
        }
        break;
    case 1: // Equal test cases
        printf("Running equal test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/equal.csv.gz", NUM_BITS);
        if (measure_type == 0) // RDTSC
        {
            snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            rdtsc_file = open_gzfile(rdtsc_filename, "wb");
            if (rdtsc_file == NULL)
            {
                perror("Error opening rdtsc file");
                exit(EXIT_FAILURE);
            }
            break;
        }
        else if (measure_type == 1) // Timespec
        {
            snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            timespec_file = open_gzfile(timespec_filename, "wb");
            if (timespec_file == NULL)
            {
                perror("Error opening timespec file");
                exit(EXIT_FAILURE);
            }
            break;
        }
        else if (measure_type == 2) // rusage
        {
            snprintf(cputime_filename, sizeof(cputime_filename), "experiments/results/cputime_measurements/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            cputime_file = open_gzfile(cputime_filename, "wb");
            if (cputime_file == NULL)
            {
                perror("Error opening cputime file");
                exit(EXIT_FAILURE);
            }
            break;
        }
        break;
    case 2: // Greater test cases
        printf("Running greater test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/greater.csv.gz", NUM_BITS);
        if (measure_type == 0) // RDTSC
        {
            snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            rdtsc_file = open_gzfile(rdtsc_filename, "wb");
            if (rdtsc_file == NULL)
            {
                perror("Error opening rdtsc file");
                exit(EXIT_FAILURE);
            }
            break;
        }
        else if (measure_type == 1) // Timespec
        {
            snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            timespec_file = open_gzfile(timespec_filename, "wb");
            if (timespec_file == NULL)
            {
                perror("Error opening timespec file");
                exit(EXIT_FAILURE);
            }
            break;
        }
        else if (measure_type == 2) // rusage
        {
            snprintf(cputime_filename, sizeof(cputime_filename), "experiments/results/cputime_measurements/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            cputime_file = open_gzfile(cputime_filename, "wb");
            if (cputime_file == NULL)
            {
                perror("Error opening cputime file");
                exit(EXIT_FAILURE);
            }
            break;
        }
        break;
    case 3: // Smaller test cases
        printf("Running smaller test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/smaller.csv.gz", NUM_BITS);
        if (measure_type == 0) // RDTSC
        {
            snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            rdtsc_file = open_gzfile(rdtsc_filename, "wb");
            if (rdtsc_file == NULL)
            {
                perror("Error opening rdtsc file");
                exit(EXIT_FAILURE);
            }
        }
        else if (measure_type == 1) // Timespec
        {
            snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            timespec_file = open_gzfile(timespec_filename, "wb");
            if (timespec_file == NULL)
            {
                perror("Error opening timespec file");
                exit(EXIT_FAILURE);
            }
        }
        else if (measure_type == 2) // rusage
        {
            snprintf(cputime_filename, sizeof(cputime_filename), "experiments/results/cputime_measurements/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            cputime_file = open_gzfile(cputime_filename, "wb");
            if (cputime_file == NULL)
            {
                perror("Error opening cputime file");
                exit(EXIT_FAILURE);
            }
        }

        break;
    default:
        printf("Invalid test case\n");
        exit(EXIT_FAILURE);
    }

    // open the test file
    gzFile test_file = open_gzfile(test_filename, "rb");

    // skip the first line, header
    skip_first_line(test_file);

    // pick a random i from 0 to ITERATIONS-1; keep it as random as possible
    unsigned long seed = generate_seed();
    srand(seed);
    int iter_count = 0;
    printf("Running %d iterations...\n", ITERATIONS / 1000);
    for (int iter_count = 0; iter_count < (ITERATIONS / 1000); ++iter_count)
    {
        int i = rand() % ITERATIONS;
        printf("Iteration %d, reading test case %d\n", iter_count, i);
        // buffer to read the test case
        char buffer[CHUNK];
        // reset the file pointer to the beginning of the file
        gzrewind(test_file);
        // skip the first line, header
        skip_first_line(test_file);
        // read ith line from the test_file
        for (int j = 0; j < i; j++)
        {
            // flush the buffer
            memset(buffer, 0, CHUNK);
            if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
            {
                if (gzeof(test_file))
                {
                    return; // End of file reached
                }
                else
                {
                    perror("Error reading line");
                    gzclose(test_file);
                    exit(EXIT_FAILURE);
                }
            }
        }

        // Parse the test case
        char *a_str = strtok(buffer, ",");
        char *b_str = strtok(NULL, ",");
        char *result_str = strtok(NULL, ",");

        if (a_str == NULL || b_str == NULL || result_str == NULL)
        {
            fprintf(stderr, "Error parsing line: %s\n", buffer);
            gzclose(test_file);
            exit(EXIT_FAILURE);
        }

        // Convert the strings to digits
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
        sub_space_ptr += (n_limb + 31) & ~31;
        borrow_space_ptr += (n_limb + 31) & ~31;

        size_t sub_size = n_limb;

        __builtin_assume_aligned(a_limbs, 64);
        __builtin_assume_aligned(b_limbs, 64);
        aligned_uint64_ptr result;

        memset(sub, 0, n_limb * sizeof(uint64_t));
        memset(borrow_space, 0, n_limb * sizeof(uint64_t));

        double time_taken;

        // clear cache content for a_limbs, b_limbs
        for (int i = 0; i < n_limb; i += 64)
        {
            _mm_clflush((char *)a_limbs + i);
            _mm_clflush((char *)b_limbs + i);
        }

        // Ensure that the cache flush operations are completed
        _mm_mfence();
        // Ensure the flush is completed
        int cpu_info[4];

        // perform the measurement
        switch (measure_type)
        {
        case 0:             // RDTSC
            time_taken = 0; // initialize time taken
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
            TIME_RDTSC(time_taken, sub_n(a_limbs, b_limbs, &sub, n_limb));
            write_time(rdtsc_file, time_taken);
            break;
        case 1:             // Timespec
            time_taken = 0; // initialize time taken
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
            TIME_TIMESPEC(time_taken, sub_n(a_limbs, b_limbs, &sub, n_limb));
            write_time(timespec_file, time_taken);
            break;
        case 2:             // Rusage
            time_taken = 0; // initialize time taken
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
            TIME_RUSAGE(time_taken, sub_n(a_limbs, b_limbs, &sub, n_limb));
            write_time(cputime_file, time_taken);
            break;
        default:
            printf("Invalid measure type\n");
            exit(EXIT_FAILURE);
        }
    }
    // close the test file
    gzclose(test_file);

    // close the benchmarking file
    if (measure_type == 0)
    {
        gzclose(rdtsc_file);
    }
    else if (measure_type == 1)
    {
        gzclose(timespec_file);
    }
    else if (measure_type == 2)
    {
        gzclose(cputime_file);
    }
}

// void run_profiling_test(int test_case)
// {
//     // read the test cases from the file
// }
