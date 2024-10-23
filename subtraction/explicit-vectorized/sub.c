/* This is the version with explicit SIMD (AVX512)
 * Author: Subhrajit Das (IIT Gandhinagar)
 * This code subs two numbers, represented as array of digits, while benchmarking the performance
 * a --> array of digits of first number, of length n
 * b --> array of digits of second number, of length m
 * result --> array to store the result of subtraction
 */

/****  All the data, stored in arrays and used for computation are aligned to 64 Bytes ****/

// Include the necessary header files
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

// Define the constants
#define MAX_EVENTS 6      // Number of events to monitor
#define LIMB_SIZE 18      // Number of digits in each limb
#define ITERATIONS 100000 // Number of iterations for each test
#define CHUNK 65536       // Chunk size for reading the file

#define unlikely(expr) __builtin_expect(!!(expr), 0) // unlikely branch
#define likely(expr) __builtin_expect(!!(expr), 1)   // likely branch

// Define the aligned data types
typedef uint64_t aligned_uint64 __attribute__((aligned(64)));      // Define an aligned uint64_t
typedef uint64_t *aligned_uint64_ptr __attribute__((aligned(64))); // Define an aligned pointer to uint64_t

// Declare 64-byte aligned global pointers
aligned_uint64_ptr sub_space;
aligned_uint64_ptr borrow_space;
// uint8_t *borrow_masks; // Array to store the borrow masks

// Declare the SIMD constants
__m512i zeros;             // 0 as chunk of 8 64-bit integers
__m512i ones;              // 1 as chunk of 8 64-bit integers
__m512i limb_digits;       // 10^18 as chunk of 8 64-bit integers
__m512i minus_limb_digits; // -10^18 as chunk of 8 64-bit integers

// Declare the global variables
int sub_space_ptr = 0;    // pointer to the next available space in sub_space
int borrow_space_ptr = 0; // pointer to the next available space in borrow_space

// Declare threshold for borrow propagation and limb digits
aligned_uint64 LIMB_DIGITS = 1000000000000000000ULL; // 10^18, used for borrow-propagation, as we're using 64-bit integers; mostly saturated

int CORE_NO;  // Core number to run the tests on
int NUM_BITS; // Number of bits for the numbers

// function prototypes
void init_limbs_from_digits(uint64_t **num1_base, uint64_t **num2_base, int *n_1, int *n_2); // Function to initialize the limbs from the string
void write_time(gzFile file, double time);                                                   // Function to write the time to the file
void run_benchmarking_test(int, int);                                                        // Function to run the benchmarking tests
void run_correctness_test(int);                                                              // Function to run the correctness tests
void initialize_perf();                                                                      // Function to initialize the perf events
void limb_set_str(char *, char *, aligned_uint64_ptr *, aligned_uint64_ptr *, int *, int *); // Function to set the limbs from the string
char *limb_get_str(uint64_t *result, size_t *result_length, bool sign);                      // Function to get the string from the limbs

// inline function prototypes
inline bool limb_sub_n(uint64_t *a, uint64_t *b, uint64_t **result_ptr, size_t n) __attribute__((always_inline));
inline bool is_less_than(uint64_t *a, uint64_t *b, uint64_t n) __attribute__((always_inline));
inline void warmup_rdtsc() __attribute__((always_inline));
inline unsigned long long measure_rdtsc_start() __attribute__((always_inline));
inline unsigned long long measure_rdtscp_end() __attribute__((always_inline));
inline bool check_result(char *result, char *result_gmp, int result_size) __attribute__((always_inline));
inline int cputime() __attribute__((always_inline));
inline void left_shift(__mmask8 *borrow_mask, size_t n) __attribute__((always_inline));
inline struct timespec get_timespec() __attribute__((always_inline));
inline long diff_timespec_ns(struct timespec start, struct timespec end) __attribute__((always_inline));
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

// function to left(right) shift the borrow_mask array by one bit
void left_shift(__mmask8 *borrow_mask, size_t n)
{
    uint64_t *borrow_mask_ptr = (uint64_t *)borrow_mask;
    __mmask8 carry_prev = 0;
    for (int i = n - 1; i >= 0; i--)
    {
        __mmask8 carry_next = borrow_mask[i] & 0x1;
        borrow_mask[i] = (borrow_mask[i] >> 1) | (carry_prev << 7);
        carry_prev = carry_next;
    }
}

/* This code below tries the right shift the borrow_mask array by one bit using AVX512
 *1. Cnext = 0
 *2. for i = n-1 to 0; i-=64
 *3.   c_vec = Load 512-bit mask from borrow_mask[i]
 *4.   Cprev = LSBs of lanes of c_vec
 *5.   Ctemp = Cprev >> 63
 *6.   c_vec = Shift Right c_vec by 1-bit within each lane
 *7.   Cprev = (Cprev << 1) | Cnext
 *8.   Cnext = Ctemp
 *9.   Cm = Prepare a 512-bit vector consisting of 64 8-bit integers with value 0x80 where corresponding bit in Cprev is 1
 *10.  c_vec = c_vec | Cm
 */
void left_shift_avx512(__mmask8 *borrow_mask, size_t n)
{
    __m512i carry = zeros; // Initialize carry to zero

    for (int i = n - 1; i >= 0; i--)
    {
    }
}

inline bool limb_sub_n(uint64_t *a, uint64_t *b, uint64_t **result_ptr, size_t n)
{
    aligned_uint64_ptr result = sub_space;
    size_t j = 0;
    bool is_less = false;
    // check if a < b, if so, swap a and b; also check if a == b and return 0
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

    int bm_size;
    __mmask8 *bm = (__mmask8 *)borrow_space;

    size_t i = 0;
    j = 0;

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

        // store the result
        _mm512_store_si512(result + i, result_vec);
        bm[j] = borrow_mask;
        i += 8;
        j++;
    } while (likely(i < n));
    bm_size = j;
    // borrow_space_ptr += bm_size;

    // zero out
    _mm512_storeu_si512(result + n, zeros);

    int outdated_bits = n & 0x7;
    // zero out the outdated bits for e.g. if outdated bits = 1, then bm[bm_size - 1] = bm[bm_size - 1] & 0x1
    // if outdated bits = 2, then bm[bm_size - 1] = bm[bm_size - 1] & 0x3 and so on
    if (outdated_bits)
    {
        bm[bm_size - 1] &= (1 << outdated_bits) - 1;
    }
    // left_shift(bm, bm_size);

    left_shift_avx512(bm, bm_size);

    int last_borrow_block = -1;
    i = 0;
    j = 0;
    do
    {
        // load 8 64-bit integers from result
        __m512i result_vec = _mm512_load_si512(result + i);
        // load 8-bit mask from bm[j]
        __mmask8 borrow_mask = bm[j];

        // perform the subtraction
        result_vec = _mm512_mask_sub_epi64(result_vec, borrow_mask, result_vec, ones);
        _mm512_store_si512(result + i, result_vec);
        // check if result_vec[j] < 0
        borrow_mask = _mm512_cmplt_epi64_mask(result_vec, zeros);
        if (unlikely(borrow_mask))
        {
            // printf("Borrow mask is not zero\n");
            last_borrow_block = i;
            // update the borrow array
            bm[j] = borrow_mask;
        }
        i += 8;
        j++;
    } while (likely(i < n));

    // if (unlikely(last_borrow_block != -1))
    // {
    //     size_t i = (last_borrow_block + 15);
    //     i = (i > n - 1) ? (n - 1) : i;

    //     while (i > 0)
    //     {
    //         if (bm[i / 8] & (1 << (i % 8)))
    //         {
    //             result[i] += LIMB_DIGITS;
    //             result[i - 1] -= 1;
    //             if (unlikely(result[i - 1] > LIMB_DIGITS))
    //             {
    //                 bm[(i - 1) / 8] |= (1 << ((i - 1) % 8));
    //             }
    //             bm[i / 8] &= ~(1 << (i % 8));
    //         }
    //         i--;
    //     }
    // }
    *result_ptr = result;
    return is_less;
}

// main function with cmd arguments
int main(int argc, char *argv[])
{
    if (argc != 5)
    {
        printf("Usage: %s <number of bits> <core number> <test-case number> <measure_type>\n", argv[0]);
        printf("test-case number: 0 --> Random numbers\n");
        printf("test-case number: 1 --> Random numbers with a < b\n");
        printf("test-case number: 2 --> Random numbers with a > b\n");
        printf("test-case number: 3 --> Random numbers with a = b\n");
        printf("measure_type: 0 --> RDTSC\n");
        printf("measure_type: 1 --> Timespec\n");
        printf("measure_type: 2 --> RUSAGE\n");
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
    // borrow_masks = (uint8_t *)malloc(1 << 30);

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

    run_correctness_test(test_case);
    // run_benchmarking_test(test_case, measure_type);

    // free(borrow_masks);

    return 0;
}

aligned_uint64_ptr aligned_realloc(aligned_uint64_ptr ptr, size_t old_size, size_t new_size, size_t alignment)
{
    aligned_uint64_ptr new_ptr = (aligned_uint64_ptr)_mm_malloc(new_size, alignment);
    if (new_ptr == NULL)
    {
        return NULL;
    }
    memcpy(new_ptr, ptr, old_size);
    _mm_free(ptr);
    return new_ptr;
}

char *limb_get_str(uint64_t *result, size_t *result_length, bool sign)
{
    // Remove leading zeros
    size_t i = 0;
    while (i < *result_length && result[i] == 0)
    {
        i++;
    }

    *result_length -= i;
    result += i;

    if (*result_length == 0)
    {
        char *temp = (char *)calloc(2, sizeof(char));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }
        temp[0] = '0';
        temp[1] = '\0';
        *result_length = 1;
        return temp;
    }

    if (sign)
    {
        result[0] = -result[0];
    }

    // Calculate the required size for the result string
    size_t alloc_size = (*result_length) * 20 + 2; // 20 digits per number + sign + null terminator
    char *result_str = (char *)calloc(alloc_size, sizeof(char));
    if (result_str == NULL)
    {
        perror("Memory allocation failed for result_str\n");
        exit(0);
    }

    // Format the first element separately (without leading zeros)
    char *ptr = result_str;
    if (result[0] > LIMB_DIGITS)
    {
        ptr += sprintf(ptr, "%" PRId64, (int64_t)result[0]); // Print as signed
    }
    else
    {
        ptr += sprintf(ptr, "%" PRIu64, result[0]); // Print as unsigned
    }

    // Handle the rest of the elements (with leading zeros)
    for (size_t j = 1; j < *result_length; j++)
    {
        ptr += sprintf(ptr, "%018" PRIu64, result[j]); // Print with leading zeros
    }

    // Remove leading zeros from the final result
    ptr = result_str;
    while (*ptr == '0')
    {
        ptr++;
    }

    if (*ptr == '\0')
    {
        free(result_str);
        char *temp = (char *)calloc(2, sizeof(char));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }
        temp[0] = '0';
        temp[1] = '\0';
        *result_length = 1;
        return temp;
    }

    char *final_result = strdup(ptr);
    if (final_result == NULL)
    {
        perror("Memory allocation failed for final_result\n");
        exit(0);
    }

    free(result_str);
    *result_length = strlen(final_result);
    return final_result;
}

void limb_set_str(char *str1, char *str2, aligned_uint64_ptr *limbs1_base, aligned_uint64_ptr *limbs2_base, int *n_1, int *n_2)
{
    int len1 = strlen(str1);
    int len2 = strlen(str2);

    *n_1 = len1;
    *n_2 = len2;

    // Calculate number of limbs required for both numbers
    int num_limbs_1 = (len1 + LIMB_SIZE - 1) / LIMB_SIZE;
    int num_limbs_2 = (len2 + LIMB_SIZE - 1) / LIMB_SIZE;
    int max_limbs = num_limbs_1 > num_limbs_2 ? num_limbs_1 : num_limbs_2;

    // Allocate memory for the limbs
    aligned_uint64_ptr limbs1 = (aligned_uint64_ptr)_mm_malloc(max_limbs * sizeof(uint64_t), 64);
    aligned_uint64_ptr limbs2 = (aligned_uint64_ptr)_mm_malloc(max_limbs * sizeof(uint64_t), 64);

    if (limbs1 == NULL || limbs2 == NULL)
    {
        perror("Memory allocation failed for limbs");
        exit(1);
    }

    memset(limbs1, 0, max_limbs * sizeof(uint64_t));
    memset(limbs2, 0, max_limbs * sizeof(uint64_t));

    // Populate limbs for num1
    int i, k;
    int limbs_offset_1 = max_limbs - num_limbs_1;
    int limbs_offset_2 = max_limbs - num_limbs_2;

    // Populate limbs for num1
    for (i = len1 - 1, k = num_limbs_1 - 1; k >= 0; k--)
    {
        uint64_t limb = 0;
        uint64_t power = 1;
        int digits_in_limb = LIMB_SIZE < (i + 1) ? LIMB_SIZE : (i + 1);
        for (int j = 0; j < digits_in_limb; j++, i--)
        {
            limb += (str1[i] - '0') * power;
            power = (power << 3) + (power << 1); // power *= 10
        }
        limbs1[limbs_offset_1 + k] = limb;
    }

    // Populate limbs for num2
    for (i = len2 - 1, k = num_limbs_2 - 1; k >= 0; k--)
    {
        uint64_t limb = 0;
        uint64_t power = 1;
        int digits_in_limb = LIMB_SIZE < (i + 1) ? LIMB_SIZE : (i + 1);
        for (int j = 0; j < digits_in_limb; j++, i--)
        {
            limb += (str2[i] - '0') * power;
            power = (power << 3) + (power << 1); // power *= 10
        }
        limbs2[limbs_offset_2 + k] = limb;
    }
    // Set the updated arrays and their new lengths
    *limbs1_base = limbs1;
    *limbs2_base = limbs2;
    *n_1 = max_limbs;
    *n_2 = max_limbs;
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
        printf("The two subs are not equal, lengths are different\n");
        return false;
    }

    // Compare the adjusted strings character by character
    for (size_t i = 0; i < strlen(result); i++)
    {
        if (result[i] != result_gmp[i])
        {
            printf("The two subs are not equal\n");
            printf("Mismatch at index %ld\n", i);
            printf("result[%ld] = %c, result_gmp[%ld] = %c\n", i, result[i], i, result_gmp[i]);
            printf("result = %s\nresult_gmp = %s\n", result, result_gmp);
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

    gzFile timespec_file, rdtsc_file, cputime_file;

    memset(sub_space, 0, (1 << 30));
    sub_space_ptr = 0;

    memset(borrow_space, 0, (1 << 30));
    borrow_space_ptr = 0;

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

        // convert a and b into limbs
        aligned_uint64_ptr a, b;
        limb_set_str(a_str, b_str, &a, &b, &n_1, &n_2);
        int n = n_1;

        // allocate from scratch space
        aligned_uint64_ptr sub = sub_space + sub_space_ptr;
        size_t sub_size = n;
        sub_space_ptr += (n + 31) & ~31;
        borrow_space_ptr += (n + 31) & ~31;

        memset(sub, 0, n * sizeof(uint64_t));
        memset(borrow_space, 0, n * sizeof(uint64_t));

        /***** Start of subtraction *****/

        bool sign = limb_sub_n(a, b, &sub, n);

        /***** End of subtraction *****/

        // convert the result into a string
        char *sub_str = limb_get_str(sub, &sub_size, sign);

        // verify the converted string with result
        if (!check_result(sub_str, result_str, sub_size))
        {
            printf("Test case failed, at iteration %d\n", i);
            printf("a = %s, b = %s\n Expected result = %s\n", a_str, b_str, result_str);
            printf("Experimental result = %s\n", sub_str);
            // print in limbs: a,b, experimental result
            // print in limbs: experimental result
            printf("a :\n");
            for (int i = 0; i < n; i++)
            {
                printf("%" PRIu64 " ", a[i]);
            }
            printf("\n");
            printf("b :\n");
            for (int i = 0; i < n; i++)
            {
                printf("%" PRIu64 " ", b[i]);
            }
            printf("\n");

            exit(EXIT_FAILURE);
            gzclose(test_file);
        }
        _mm_free(a);
        _mm_free(b);
        free(sub_str);
    }

    switch (test_case)
    {
    case 0:
        printf("Passed random test cases for bit-size %d\n", NUM_BITS);
        break;
    case 1:
        printf("Passed equal test cases for bit-size %d\n", NUM_BITS);
        break;
    case 2:
        printf("Passed greater test cases for bit-size %d\n", NUM_BITS);
        break;
    case 3:
        printf("Passed smaller test cases for bit-size %d\n", NUM_BITS);
        break;
    }
    if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
    {
        printf("Memory leak detected\n");
        exit(EXIT_FAILURE);
    }
    // if (sub_space_ptr && borrow_space_ptr)
    // {
    //     _mm_free(sub_space);
    //     _mm_free(borrow_space);
    // }
    // close the test file
    if (gzclose(test_file) != Z_OK)
    {
        perror("Error closing test file");
        exit(EXIT_FAILURE);
    }
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
    int max_iter = ITERATIONS / 1000;
    printf("Running %d iterations...\n", ITERATIONS / ITERATIONS);
    for (int iter_count = 0; iter_count < (ITERATIONS / ITERATIONS); ++iter_count)
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
        for (int j = 0; j < i; ++j)
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

        // convert a and b into limbs
        aligned_uint64_ptr a, b;
        limb_set_str(a_str, b_str, &a, &b, &n_1, &n_2);
        __builtin_assume_aligned(a, 64);
        __builtin_assume_aligned(b, 64);

        int n = n_1;

        // allocate from scratch space
        aligned_uint64_ptr sub = sub_space + sub_space_ptr;
        sub_space_ptr += (n + 31) & ~31;
        borrow_space_ptr += (n + 31) & ~31;
        size_t sub_size = n;

        memset(sub, 0, n * sizeof(uint64_t));
        memset(borrow_space, 0, n * sizeof(uint64_t));

        int cpu_info[4], decimals;
        unsigned long long int t0, t1;
        int niter;

        double f, ops_per_sec, time_taken_ms, time_taken;
        // clear cache content for a_limbs, b_limbs
        for (int i = 0; i < n; i += 64)
        {
            _mm_clflush((char *)a + i);
            _mm_clflush((char *)b + i);
        }

        // Ensure that the cache flush operations are completed
        _mm_mfence();

        // perform the measurement
        // switch (measure_type)
        // {
        // case 0: // RDTSC
        //     __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
        //     TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
        //     write_time(rdtsc_file, time_taken);
        //     break;
        // case 1: // Timespec
        //     __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
        //     TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
        //     write_time(timespec_file, time_taken);
        //     break;
        // // case 2: // Rusage
        // // __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
        // // TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
        // // write_time(cputime_file, time_taken);
        // // break;
        // case 2:             // Rusage
        //     time_taken = 0; // initialize time taken
        //     printf("Calibrating CPU speed...\n");
        //     fflush(stdout);
        //     __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
        //     TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
        //     printf("done\n");
        //     printf("Calibrated time: %f\n", time_taken);
        //     int niter = 1 + (unsigned long)(1e4 / time_taken);
        //     printf("Subtracting %d times\n", niter);
        //     fflush(stdout);
        //     unsigned long int t0, t1;

        //     t0 = cputime();
        //     for (int i = 0; i < niter; i++)
        //     {
        //         limb_sub_n(a, b, &sub, n);
        //     }
        //     t1 = cputime() - t0;
        //     printf("done!\n");
        //     double f, ops_per_sec;
        //     ops_per_sec = 1000.0 * niter / t1;
        //     f = 100.0;
        //     int decimals;
        //     for (decimals = 0;; decimals++)
        //     {
        //         if (ops_per_sec > f)
        //             break;
        //         f = f * 0.1;
        //     }

        //     printf("RESULT: %.*f operations per second\n", decimals, ops_per_sec);
        //     fprintf(cputime_file, "%.*f\n", decimals, ops_per_sec);
        //     break;
        // default:
        //     printf("Invalid measure type\n");
        //     exit(EXIT_FAILURE);
        // }
        // perform the measurement
        // perform the measurement
        switch (measure_type)
        {
        case 0:             // RDTSC
            time_taken = 0; // initialize time taken
            printf("Calibrating CPU speed...\n");
            fflush(stdout);
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
            TIME_RDTSC(time_taken, limb_sub_n(a, b, &sub, n));
            time_taken_ms = time_taken / 1e6;
            // write_time(rdtsc_file, time_taken);
            printf("done\n");
            printf("Calibrated time: %f\n", time_taken_ms);
            niter = 1 + (unsigned long)(1e4 / time_taken_ms);
            printf("Subtracting %d times\n", niter);
            fflush(stdout);

            t0 = measure_rdtsc_start();
            for (int i = 0; i < niter; i++)
            {
                limb_sub_n(a, b, &sub, n);
            }
            t1 = measure_rdtscp_end();
            t1 = t1 - t0;
            t1 = t1 * 0.4; // t*f -> ns
            t1 = t1 / 1e6; // ns -> ms
            printf("done!\n");

            ops_per_sec = 1000.0 * niter / t1;
            f = 100.0;
            for (decimals = 0;; decimals++)
            {
                if (ops_per_sec > f)
                    break;
                f = f * 0.1;
            }
            printf("RESULT: %.*f operations per second\n", decimals, ops_per_sec);
            gzprintf(rdtsc_file, "%.*f\n", decimals, ops_per_sec);
            break;
        case 1:             // Timespec
            time_taken = 0; // initialize time taken
            printf("Calibrating CPU speed...\n");
            fflush(stdout);
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
            TIME_TIMESPEC(time_taken, limb_sub_n(a, b, &sub, n));
            time_taken_ms = time_taken / 1e6;
            // write_time(timespec_file, time_taken);
            printf("done\n");
            printf("Calibrated time: %f\n", time_taken_ms);
            niter = 1 + (unsigned long)(1e4 / time_taken_ms);
            printf("Subtracting %d times\n", niter);
            fflush(stdout);
            struct timespec ts_0, ts_1;
            ts_0 = get_timespec();
            for (int i = 0; i < niter; i++)
            {
                limb_sub_n(a, b, &sub, n);
            }
            ts_1 = get_timespec();
            t1 = diff_timespec_ns(ts_0, ts_1);
            t1 = t1 / 1e6; // ns -> ms

            printf("done!\n");
            ops_per_sec = 1000.0 * niter / t1;
            f = 100.0;
            for (decimals = 0;; decimals++)
            {
                if (ops_per_sec > f)
                    break;
                f = f * 0.1;
            }
            printf("RESULT: %.*f operations per second\n", decimals, ops_per_sec);
            gzprintf(timespec_file, "%.*f\n", decimals, ops_per_sec);
            break;
        case 2:             // Rusage
            time_taken = 0; // initialize time taken
            printf("Calibrating CPU speed...\n");
            fflush(stdout);
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);
            TIME_RUSAGE(time_taken, limb_sub_n(a, b, &sub, n));
            printf("done\n");
            printf("Calibrated time: %f\n", time_taken);
            niter = 1 + (unsigned long)(1e4 / time_taken);
            printf("Subtracting %d times\n", niter);
            fflush(stdout);

            t0 = cputime();
            for (int i = 0; i < niter; i++)
            {
                limb_sub_n(a, b, &sub, n);
            }
            t1 = cputime() - t0;
            printf("done!\n");

            ops_per_sec = 1000.0 * niter / t1;
            f = 100.0;

            for (decimals = 0;; decimals++)
            {
                if (ops_per_sec > f)
                    break;
                f = f * 0.1;
            }

            printf("RESULT: %.*f operations per second\n", decimals, ops_per_sec);
            // fprintf(cputime_file, "%.*f\n", decimals, ops_per_sec);
            // cputime_file is of gzFile type
            gzprintf(cputime_file, "%.*f\n", decimals, ops_per_sec);

            break;
        default:
            printf("Invalid measure type\n");
            exit(EXIT_FAILURE);
        }
        _mm_free(a);
        _mm_free(b);
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
    // free the memory
    if (sub_space_ptr > (1 << 30) || borrow_space_ptr > (1 << 30))
    {
        printf("Memory leak detected\n");
        exit(EXIT_FAILURE);
    }
    if (sub_space_ptr && borrow_space_ptr)
    {
        _mm_free(sub_space);
        _mm_free(borrow_space);
    }
}

// void run_profiling_test(int test_case)
// {
//     // read the test cases from the file
// }

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
inline int cputime()
{
    struct rusage rus;
    getrusage(RUSAGE_SELF, &rus);
    return rus.ru_utime.tv_sec * 1000 + rus.ru_utime.tv_usec / 1000;
}

// Function to write the time to the file
inline void write_time(gzFile file, double time)
{
    if (gzprintf(file, "%f\n", time) < 0)
    {
        perror("Error writing to file\n");
        exit(EXIT_FAILURE);
    }
}
