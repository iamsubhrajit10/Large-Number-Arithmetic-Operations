/*
 This program computes addition of two numbers using our optimized addition, with the test cases for the same.
 Also, it writes various data like performance counters, rdtsc values to files, for analysis.
*/

/* This is the baseline version, without explicit SIMD */
/*
This code subs two numbers, represented as array of digits.
a --> array of digits of first number, of length n
b --> array of digits of second number, of length m
#Pre-processing:
1. Equalize the length of both arrays by adding leading AVX512_ZEROS to the smaller array.
Note: For pre-processing, we can use the realloc function to sub leading AVX512_ZEROS to the smaller array.
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
#include "myutils.h"
#include "limb_utils.h"

#define ITERATIONS 100000 // Number of iterations for each test

int CORE_NO; // Core number to run the tests on

int NUM_BITS; // Number of bits for the numbers

extern __m512i AVX512_ZEROS;   // AVX512 vector of zeros
extern __m256i AVX256_ZEROS;   // AVX256 vector of zeros
extern __m128i AVX128_ZEROS;   // AVX128 vector of zeros
extern __m512i AVX512_52_MASK; // AVX512 vector of 52-bit mask
extern __m256i AVX256_52_MASK; // AVX256 vector of 52-bit mask
extern __m128i AVX128_52_MASK; // AVX128 vector of 52-bit mask

// Declare 64-byte aligned global pointers
aligned_uint64_ptr sum_space;
aligned_uint64_ptr carry_space;
// uint8_t *carry_masks; // Array to store the carry masks

// Declare the global variables
int sum_space_ptr = 0;   // pointer to the next available space in sum_space
int carry_space_ptr = 0; // pointer to the next available space in carry_space

// Function prototypes
void run_benchmarking_test(int, int); // Function to run the benchmarking tests
void run_correctness_test(int);

inline void limb_t_add_n_256(limb_t *result, limb_t *a, limb_t *b) __attribute__((always_inline));
inline void right_shift(__mmask8 *carry_mask, size_t n) __attribute__((always_inline));

// Function to right shift the carry mask by one bit
inline void right_shift(__mmask8 *carry_mask, size_t n)
{
    __mmask8 carry_prev = 0;

    for (int i = 0; i < n; i++)
    {
        __mmask8 carry_next = carry_mask[i] & 0x1;
        carry_mask[i] = (carry_mask[i] >> 1) | carry_prev;
        carry_prev = carry_next << 7;
    }
}

/**
 * @brief Adds two numbers represented as limb_t, and stores the sum in result
 *
 * @param result The result of the addition, stored as limb_t
 * @param a The first number to add, stored as limb_t
 * @param b The second number to add, stored as limb_t
 * @return none
 */
void limb_t_add_n_256(limb_t *result, limb_t *a, limb_t *b)
{
    int n = a->size;

    // handle the last limb manually
    result->limbs[4] = a->limbs[4] + b->limbs[4];
    uint carry = result->limbs[4] >> 52;
    result->limbs[4] &= 0xFFFFFFFFFFFFF;

    /* Phase1: Add the numbers without accounting for carry */
    // load 4 64-bit limb into 256-bit AVX vector
    __m256i a_vec = _mm256_load_si256((__m256i *)a->limbs);
    __m256i b_vec = _mm256_load_si256((__m256i *)b->limbs);
    // add
    __m256i result_vec = _mm256_add_epi64(a_vec, b_vec);

    /* Phase2: Carry Detection*/
    bool carry_detect = false;
    // check if result_vec[i] >= mask
    __mmask8 carry_mask = _mm256_cmpgt_epu64_mask(result_vec, AVX256_52_MASK);
    carry_mask += (carry << 4);
    carry_detect = !!carry_mask;

    // left shift the carry mask by 1 bit
    carry_mask >>= 1;

    /* Phase3: Carry Propagation */
    if (carry_detect)
    {
        __m256i carry_vec = _mm256_mask_set1_epi64(AVX256_ZEROS, carry_mask, 1);
        result_vec = _mm256_add_epi64(result_vec, carry_vec);
        result_vec = _mm256_and_si256(result_vec, AVX256_52_MASK);
    }
    // store the result
    _mm256_store_si256((__m256i *)result->limbs, result_vec);
}

void limb_t_add_n_512(limb_t *result, limb_t *a, limb_t *b)
{
    int n = a->size;
    /* handle the last two limb manually using 128-bit vector */
    __m128i a_vec_128 = _mm_load_si128((__m128i *)(a->limbs + 8));
    __m128i b_vec_128 = _mm_load_si128((__m128i *)(b->limbs + 8));
    __m128i result_vec_128 = _mm_add_epi64(a_vec_128, b_vec_128);
    __mmask8 carry_mask_128 = _mm_cmpgt_epu64_mask(result_vec_128, AVX128_52_MASK);
    uint c = carry_mask_128 & 0x01;
    carry_mask_128 >>= 1;
    bool carry_detect_128 = !!carry_mask_128;
    if (carry_detect_128)
    {
        __m128i carry_vec_128 = _mm_mask_set1_epi64(AVX128_ZEROS, carry_mask_128, 1);
        result_vec_128 = _mm_add_epi64(result_vec_128, carry_vec_128);
        __mmask8 carry_mask_128_1 = _mm_cmpgt_epu64_mask(result_vec_128, AVX128_52_MASK);
        result_vec_128 = _mm_and_si128(result_vec_128, AVX128_52_MASK);
    }
    // store the result
    _mm_store_si128((__m128i *)(result->limbs + 8), result_vec_128);

    /* Handle the first 8 elements using AVX512 */

    /* Phase1: Add the numbers without accounting for carry */
    // load 8 64-bit limb into 512-bit AVX vector
    __m512i a_vec = _mm512_load_si512((__m512i *)a->limbs);
    __m512i b_vec = _mm512_load_si512((__m512i *)b->limbs);
    __m512i result_vec = _mm512_add_epi64(a_vec, b_vec);

    /* Phase2: Carry Detection*/
    bool carry_detect = false;
    __mmask8 carry_mask = _mm512_cmpgt_epu64_mask(result_vec, AVX512_52_MASK);
    carry_mask >>= 1;
    carry_mask |= (c << 7);
    carry_detect = !!carry_mask;

    /* Phase3: Carry Propagation */
    if (carry_detect)
    {
        __m512i carry_vec = _mm512_mask_set1_epi64(AVX512_ZEROS, carry_mask, 1);
        result_vec = _mm512_add_epi64(result_vec, carry_vec);
        result_vec = _mm512_and_si512(result_vec, AVX512_52_MASK);
    }
    // store the result
    _mm512_store_si512((__m512i *)result->limbs, result_vec);
}

void limb_t_add_n_1024(limb_t *result, limb_t *a, limb_t *b)
{
    int n = a->size;
    /* handle the last four limb manually using 256-bit vector */
    __m256i a_vec_256 = _mm256_load_si256((__m256i *)(a->limbs + 16));
    __m256i b_vec_256 = _mm256_load_si256((__m256i *)(b->limbs + 16));
    __m256i result_vec_256 = _mm256_add_epi64(a_vec_256, b_vec_256);
    __mmask8 carry_mask_256 = _mm256_cmpgt_epu64_mask(result_vec_256, AVX256_52_MASK);
    uint c = carry_mask_256 & 0x01;
    carry_mask_256 >>= 1;
    bool carry_detect_256 = !!carry_mask_256;
    if (carry_detect_256)
    {
        __m256i carry_vec_256 = _mm256_mask_set1_epi64(AVX256_ZEROS, carry_mask_256, 1);
        result_vec_256 = _mm256_add_epi64(result_vec_256, carry_vec_256);
        result_vec_256 = _mm256_and_si256(result_vec_256, AVX256_52_MASK);
    }
    // store the result
    _mm256_store_si256((__m256i *)(result->limbs + 16), result_vec_256);
    uint c0 = c;
    for (int i = 8; i >= 0; i -= 8)
    {
        c0 = c;

        /* Phase1: Add the numbers without accounting for carry */
        // load 8 64-bit limb into 512-bit AVX vector
        __m512i a_vec = _mm512_load_si512((__m512i *)(a->limbs + i));
        __m512i b_vec = _mm512_load_si512((__m512i *)(b->limbs + i));
        __m512i result_vec = _mm512_add_epi64(a_vec, b_vec);

        /* Phase2: Carry Detection*/
        bool carry_detect = false;
        __mmask8 carry_mask = _mm512_cmpgt_epu64_mask(result_vec, AVX512_52_MASK);
        c = carry_mask & 0x01;
        carry_mask >>= 1;
        carry_mask |= (c0 << 7);
        carry_detect = !!carry_mask;

        /* Phase3: Carry Propagation */
        if (carry_detect)
        {
            __m512i carry_vec = _mm512_mask_set1_epi64(AVX512_ZEROS, carry_mask, 1);
            result_vec = _mm512_add_epi64(result_vec, carry_vec);
            __mmask8 mask_1 = _mm512_cmpgt_epu64_mask(result_vec, AVX512_52_MASK);
            c = mask_1 & 0x01;
            result_vec = _mm512_and_si512(result_vec, AVX512_52_MASK);
        }
        // store the result
        _mm512_store_si512((__m512i *)(result->limbs + i), result_vec);
    }
}

void limb_t_add_n_2048(limb_t *result, limb_t *a, limb_t *b)
{
    int n = a->size;
    uint c0 = 0, c = 0;
    for (int i = 32; i >= 0; i -= 8)
    {
        c0 = c;

        /* Phase1: Add the numbers without accounting for carry */
        // load 8 64-bit limb into 512-bit AVX vector
        __m512i a_vec = _mm512_load_si512((__m512i *)(a->limbs + i));
        __m512i b_vec = _mm512_load_si512((__m512i *)(b->limbs + i));
        __m512i result_vec = _mm512_add_epi64(a_vec, b_vec);

        /* Phase2: Carry Detection*/
        bool carry_detect = false;
        __mmask8 carry_mask = _mm512_cmpgt_epu64_mask(result_vec, AVX512_52_MASK);
        c = carry_mask & 0x01;
        carry_mask >>= 1;
        carry_mask |= (c0 << 7);
        carry_detect = !!carry_mask;

        /* Phase3: Carry Propagation */
        if (carry_detect)
        {
            __m512i carry_vec = _mm512_mask_set1_epi64(AVX512_ZEROS, carry_mask, 1);
            result_vec = _mm512_add_epi64(result_vec, carry_vec);
            __mmask8 mask_1 = _mm512_cmpgt_epu64_mask(result_vec, AVX512_52_MASK);
            c = mask_1 & 0x01;
            result_vec = _mm512_and_si512(result_vec, AVX512_52_MASK);
        }
        // store the result
        _mm512_store_si512((__m512i *)(result->limbs + i), result_vec);
    }
}

void limb_t_add_n_16384(limb_t *result, limb_t *a, limb_t *b)
{
    int n = a->size;
    /* handle the last four limb manually using 256-bit vector */
    __m256i a_vec_256 = _mm256_load_si256((__m256i *)(a->limbs + 312));
    __m256i b_vec_256 = _mm256_load_si256((__m256i *)(b->limbs + 312));
    __m256i result_vec_256 = _mm256_add_epi64(a_vec_256, b_vec_256);
    __mmask8 carry_mask_256 = _mm256_cmpgt_epu64_mask(result_vec_256, AVX256_52_MASK);
    uint c = carry_mask_256 & 0x01;
    carry_mask_256 >>= 1;
    bool carry_detect_256 = !!carry_mask_256;
    if (carry_detect_256)
    {
        __m256i carry_vec_256 = _mm256_mask_set1_epi64(AVX256_ZEROS, carry_mask_256, 1);
        result_vec_256 = _mm256_add_epi64(result_vec_256, carry_vec_256);
        result_vec_256 = _mm256_and_si256(result_vec_256, AVX256_52_MASK);
    }
    // store the result
    _mm256_store_si256((__m256i *)(result->limbs + 312), result_vec_256);
    uint c0 = c;
    for (int i = 304; i >= 0; i -= 8)
    {
        c0 = c;

        /* Phase1: Add the numbers without accounting for carry */
        // load 8 64-bit limb into 512-bit AVX vector
        __m512i a_vec = _mm512_load_si512((__m512i *)(a->limbs + i));
        __m512i b_vec = _mm512_load_si512((__m512i *)(b->limbs + i));
        __m512i result_vec = _mm512_add_epi64(a_vec, b_vec);

        /* Phase2: Carry Detection*/
        bool carry_detect = false;
        __mmask8 carry_mask = _mm512_cmpgt_epu64_mask(result_vec, AVX512_52_MASK);
        c = carry_mask & 0x01;
        carry_mask >>= 1;
        carry_mask |= (c0 << 7);
        carry_detect = !!carry_mask;

        /* Phase3: Carry Propagation */
        if (carry_detect)
        {
            __m512i carry_vec = _mm512_mask_set1_epi64(_mm512_setzero_si512(), carry_mask, 1);
            result_vec = _mm512_add_epi64(result_vec, carry_vec);
            __mmask8 mask_1 = _mm512_cmpgt_epu64_mask(result_vec, AVX512_52_MASK);
            c = mask_1 & 0x01;
            result_vec = _mm512_and_si512(result_vec, AVX512_52_MASK);
        }
        // store the result
        _mm512_store_si512((__m512i *)(result->limbs + i), result_vec);
    }
    if (c)
    {
        // shift the result by one digit to the right, before reallocate the memory
        limb_t_realloc(result, n + 1);
        result->limbs[0] = 1;
    }
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

    init_memory_pool();

    run_correctness_test(test_case);
    run_benchmarking_test(test_case, measure_type);

    destroy_memory_pool();

    return 0;
}

/*
 Does the following for testing correctness:
    1. read the test cases from the file
    2. path: ../test/cases/<num_bits>/<test_case>.csv.gz
    3. there are four test cases: random.csv.gz, equal.csv.gz, greater.csv.gz, smaller.csv.gz
    4. first line contains a header: a, b, result
    5. next line onwards contains the test cases, 100000 test cases
    6. verify the results of the addition of a and b with the result
*/
void run_correctness_test(int test_case)
{
    printf("Trying to run correctness test\n");
    // Create directories for the results
    create_directory("experiments/results");
    // open the perf file
    gzFile timespec_file, rdtsc_file, cputime_file;

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

    // extract bit size
    int bits = NUM_BITS;

    void *func_ptr;

    switch (bits)
    {
    case 256:
        func_ptr = limb_t_add_n_256;
        break;
    case 512:
        func_ptr = limb_t_add_n_512;
        break;
    case 1024:
        func_ptr = limb_t_add_n_1024;
        break;
    case 2048:
        func_ptr = limb_t_add_n_2048;
        break;
    case 16384:
        func_ptr = limb_t_add_n_16384;
        break;
    default:
        printf("Invalid bit size\n");
        exit(EXIT_FAILURE);
    }

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

        int n_1 = strlen(a_str);
        int n_2 = strlen(b_str);

        // convert a and b into limbs
        limb_t *a, *b;
        a = limb_set_str(a_str);
        b = limb_set_str(b_str);

        // adjust the sizes of a and b
        limb_t_adjust_limb_sizes(a, b);
        int n = a->size;

        limb_t *sum_limb = limb_t_alloc(n);

        // Call the function to add a and b
        void (*add_func)(limb_t *, limb_t *, limb_t *) = func_ptr;

        /***** Start of addition *****/

        add_func(sum_limb, a, b);

        /***** End of addition *****/

        char *sum_str = limb_get_str(sum_limb);
        int str_len = strlen(sum_str);

        // verify the converted string with result
        if (!check_result(sum_str, result_str, str_len))
        {
            printf("Test case failed, at iteration %d\n", i);
            exit(EXIT_FAILURE);
        }
        limb_t_free(a);
        limb_t_free(b);
        limb_t_free(sum_limb);
    }
    switch (test_case)
    {
    case 0:
        printf("Random test cases passed for bit-size %d\n", NUM_BITS);
        break;
    case 1:
        printf("Equal test cases passed for bit-size %d\n", NUM_BITS);
        break;
    case 2:
        printf("Greater test cases passed for bit-size %d\n", NUM_BITS);
        break;
    case 3:
        printf("Smaller test cases passed for bit-size %d\n", NUM_BITS);
        break;
    }
    // close the test file
    gzclose(test_file);
}

/*
  Does the following for measuring the time taken for addition:
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
    printf("Trying to run benchmarking test\n");
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

    char rdtsc_filename[100];
    char test_filename[100];
    char timespec_filename[100];
    char cputime_filename[100];

    int bits = NUM_BITS;
    void *func_ptr;
    switch (bits)
    {
    case 256:
        func_ptr = limb_t_add_n_256;
        break;
    case 512:
        func_ptr = limb_t_add_n_512;
        break;
    case 1024:
        func_ptr = limb_t_add_n_1024;
        break;
    case 2048:
        func_ptr = limb_t_add_n_2048;
        break;
    case 16384:
        func_ptr = limb_t_add_n_16384;
        break;
    default:
        printf("Invalid bit size\n");
        exit(EXIT_FAILURE);
    }

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

        limb_t *a, *b;
        a = limb_set_str(a_str);
        b = limb_set_str(b_str);

        // adjust the sizes of a and b
        limb_t_adjust_limb_sizes(a, b);
        int n = a->size;

        limb_t *sum_limb = limb_t_alloc(n);

        // Call the function to add a and b
        void (*add_func)(limb_t *, limb_t *, limb_t *) = func_ptr;

        printf("Starting addition\n");
        int cpu_info[4], decimals;
        unsigned long long int t0, t1;
        unsigned long long niter;
        double f, ops_per_sec, time_taken_ms, time_taken;
        // clear cache content for a_limbs, b_limbs
        for (int i = 0; i < n; i += 64)
        {
            _mm_clflush((char *)a + i);
            _mm_clflush((char *)b + i);
        }

        // Ensure that the cache flush operations are completed
        _mm_mfence();

        switch (measure_type)
        {
        case 0:             // RDTSC
            time_taken = 0; // initialize time taken

            printf("Calibrating CPU speed using RDTSC...\n");
            fflush(stdout);
            // interrupt
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

            TIME_RDTSC(time_taken, add_func(a, b, sum_limb));
            printf("done\n");
            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("Adding %lld times\n", niter);
            fflush(stdout);

            t0 = measure_rdtsc_start();
            for (int i = 0; i < niter; i++)
            {
                add_func(a, b, sum_limb);
            }
            t1 = measure_rdtscp_end();
            t1 = t1 - t0;

            // coverting ticks to microsecond: 1 tick = 1/2.8 GHz = 0.357 ns = 0.000357 us
            time_taken = t1 * 0.000357;
            ops_per_sec = (1e6 * niter) / time_taken;
            f = 100.0;

            for (decimals = 0;; decimals++)
            {
                if (ops_per_sec > f)
                    break;
                f = f * 0.1;
            }

            printf("RESULT: %.*f operations per second\n", decimals, ops_per_sec);

            break;
        case 1:             // Timespec
            time_taken = 0; // initialize time taken
            printf("Calibrating CPU speed using timespec...\n");
            fflush(stdout);
            // interrupt
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

            TIME_TIMESPEC(time_taken, add_func(a, b, sum_limb));

            printf("done\n");
            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("Adding %lld times\n", niter);
            fflush(stdout);

            struct timespec ts_0, ts_1;
            ts_0 = get_timespec();
            for (int i = 0; i < niter; i++)
            {
                add_func(a, b, sum_limb);
            }
            ts_1 = get_timespec();
            t1 = diff_timespec_us(ts_0, ts_1);

            // Convert t1 from microseconds to seconds for the ops_per_sec calculation
            ops_per_sec = (1e6 * niter) / t1;
            f = 100.0;

            for (decimals = 0;; decimals++)
            {
                if (ops_per_sec > f)
                    break;
                f = f * 0.1;
            }

            printf("RESULT: %.*f operations per second\n", decimals, ops_per_sec);
            break;
        case 2:             // Rusage
            time_taken = 0; // initialize time taken
            printf("Calibrating CPU speed using rusage...\n");
            fflush(stdout);

            // interrupt
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

            // calibrate the time
            TIME_RUSAGE(time_taken, add_func(a, b, sum_limb));

            printf("done\n");

            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("Adding %lld times\n", niter);
            fflush(stdout);

            t0 = cputime();
            for (int i = 0; i < niter; i++)
            {
                add_func(a, b, sum_limb);
            }
            t1 = cputime() - t0;
            printf("done!\n");

            // Convert t1 from microseconds to seconds for the ops_per_sec calculation
            ops_per_sec = (1e6 * niter) / t1;
            f = 100.0;

            for (decimals = 0;; decimals++)
            {
                if (ops_per_sec > f)
                    break;
                f = f * 0.1;
            }

            printf("RESULT: %.*f operations per second\n", decimals, ops_per_sec);
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