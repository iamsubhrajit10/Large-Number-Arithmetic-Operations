/*
 This program computes multiplication of two numbers using our optimized multiplication, with the test cases for the same.
 Also, it writes various data like performance counters, rdtsc values to files, for analysis.
*/

/* This is the baseline version, without explicit SIMD */
/*
This code subs two numbers, represented as array of digits.
a --> array of digits of first number, of length n
b --> array of digits of second number, of length m
#Pre-processing:
1. Equalize the length of both arrays by multiplying leading zeros to the smaller array.
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
#include "myutils.h"
#include "limb_utils.h"

#define ITERATIONS 100000 // Number of iterations for each test
extern int CORE_NO;
int NUM_BITS; // Number of bits for the numbers

// Function prototypes
void run_benchmarking_test(int, int); // Function to run the benchmarking tests
void run_correctness_test(int);

void limb_mul_n(limb_t *num1, limb_t *num2, uint64_t *res);
void __mul_acc_mul_AVX(limb_t *a, limb_t *b, uint64_t *res);
void __mul_add_limbs(uint64_t *result);
void __mul_adjust_limbs(uint64_t *result);
uint64_t __add_horz_sum_128(__m128i v);

void __mul_acc_mul_AVX(limb_t *a, limb_t *b, uint64_t *res)
{
    uint32_t *num1 = a->limbs;
    uint32_t *num2 = b->limbs;

    // Load and convert in cache-friendly 64-byte chunks
    __m512i base_1 = _mm512_cvtepu32_epi64(_mm256_load_si256((__m256i *)num1));
    __m512i base_2 = _mm512_cvtepu32_epi64(_mm256_load_si256((__m256i *)num2));

    // Group 1
    __m512i perm_idx_11 = _mm512_set_epi64(1, 0, 2, 1, 0, 1, 0, 0);
    __m512i a_vec_1 = _mm512_permutexvar_epi64(perm_idx_11, base_1);
    __m512i perm_idx_21 = _mm512_set_epi64(2, 3, 0, 1, 2, 0, 1, 0);
    __m512i b_vec_1 = _mm512_permutexvar_epi64(perm_idx_21, base_2);
    __m512i res_1 = _mm512_mul_epu32(a_vec_1, b_vec_1);
    _mm512_store_si512(res, res_1);

    // Group 2
    __m512i perm_idx_12 = _mm512_set_epi64(0, 4, 3, 2, 1, 0, 3, 2);
    __m512i a_vec_2 = _mm512_permutexvar_epi64(perm_idx_12, base_1);
    __m512i perm_idx_22 = _mm512_set_epi64(5, 0, 1, 2, 3, 4, 0, 1);
    __m512i b_vec_2 = _mm512_permutexvar_epi64(perm_idx_22, base_2);
    __m512i res_2 = _mm512_mul_epu32(a_vec_2, b_vec_2);
    _mm512_store_si512(res + 8, res_2);

    // Group 3
    __m512i perm_idx_13 = _mm512_set_epi64(2, 1, 0, 5, 4, 3, 2, 1);
    __m512i a_vec_3 = _mm512_permutexvar_epi64(perm_idx_13, base_1);
    __m512i perm_idx_23 = _mm512_set_epi64(4, 5, 6, 0, 1, 2, 3, 4);
    __m512i b_vec_3 = _mm512_permutexvar_epi64(perm_idx_23, base_2);
    __m512i res_3 = _mm512_mul_epu32(a_vec_3, b_vec_3);
    _mm512_store_si512(res + 16, res_3);

    // Group 4
    __m512i perm_idx_14 = _mm512_set_epi64(3, 2, 1, 0, 6, 5, 4, 3);
    __m512i a_vec_4 = _mm512_permutexvar_epi64(perm_idx_14, base_1);
    __m512i perm_idx_24 = _mm512_set_epi64(4, 5, 6, 7, 0, 1, 2, 3);
    __m512i b_vec_4 = _mm512_permutexvar_epi64(perm_idx_24, base_2);
    __m512i res_4 = _mm512_mul_epu32(a_vec_4, b_vec_4);
    _mm512_store_si512(res + 24, res_4);

    // Group 5
    __m512i perm_idx_15 = _mm512_set_epi64(4, 3, 2, 1, 7, 6, 5, 4);
    __m512i a_vec_5 = _mm512_permutexvar_epi64(perm_idx_15, base_1);
    // __m512i perm_idx_25 = _mm512_set_epi64(4, 5, 6, 7, 0, 1, 2, 3);
    // __m512i b_vec_5 = _mm512_permutexvar_epi64(perm_idx_25, base_2);
    __m512i res_5 = _mm512_mul_epu32(a_vec_5, b_vec_4);
    _mm512_store_si512(res + 32, res_5);

    // Group 6
    __m512i perm_idx_16 = _mm512_set_epi64(6, 5, 4, 3, 2, 7, 6, 5);
    __m512i a_vec_6 = _mm512_permutexvar_epi64(perm_idx_16, base_1);
    __m512i perm_idx_26 = _mm512_set_epi64(3, 4, 5, 6, 7, 1, 2, 3);
    __m512i b_vec_6 = _mm512_permutexvar_epi64(perm_idx_26, base_2);
    __m512i res_6 = _mm512_mul_epu32(a_vec_6, b_vec_6);
    _mm512_store_si512(res + 40, res_6);

    // Group 7
    __m512i perm_idx_17 = _mm512_set_epi64(5, 4, 7, 6, 5, 4, 3, 7);
    __m512i a_vec_7 = _mm512_permutexvar_epi64(perm_idx_17, base_1);
    __m512i perm_idx_27 = _mm512_set_epi64(6, 7, 3, 4, 5, 6, 7, 2);
    __m512i b_vec_7 = _mm512_permutexvar_epi64(perm_idx_27, base_2);
    __m512i res_7 = _mm512_mul_epu32(a_vec_7, b_vec_7);
    _mm512_store_si512(res + 48, res_7);

    // Group 8
    __m512i perm_idx_18 = _mm512_set_epi64(7, 7, 6, 7, 6, 5, 7, 6);
    __m512i a_vec_8 = _mm512_permutexvar_epi64(perm_idx_18, base_1);
    __m512i perm_idx_28 = _mm512_set_epi64(7, 6, 7, 5, 6, 7, 4, 5);
    __m512i b_vec_8 = _mm512_permutexvar_epi64(perm_idx_28, base_2);
    __m512i res_8 = _mm512_mul_epu32(a_vec_8, b_vec_8);
    _mm512_store_si512(res + 56, res_8);
}

// void __mul_add_limbs(uint64_t *result)
// {
//     int start_idx = 1;
//     int start = 1;
//     unsigned __int128 sum_acc;

//     // Phase 1: Build sums for block sizes 2 to 8
//     for (int adds = 1; adds < 8; adds++)
//     {
//         int block_size = adds + 1;
//         sum_acc = 0; // Reset accumulator
//         const uint64_t *p = result + start;
//         // Sum block elements
//         for (int i = 0; i < block_size; i++)
//         {
//             sum_acc += p[i];
//         }
//         // Compute carry and add it unconditionally
//         uint64_t carry = (uint64_t)(sum_acc >> 64);
//         result[start_idx - 1] += (carry << 32);
//         // Store lower 64 bits
//         result[start_idx++] = (uint64_t)sum_acc;
//         start += block_size;
//     }

//     // Phase 2: Build sums for block sizes 7 down to 2
//     for (int adds = 6; adds > 0; adds--)
//     {
//         int block_size = adds + 1;
//         sum_acc = 0; // Reset accumulator
//         const uint64_t *p = result + start;
//         // Sum block elements
//         for (int i = 0; i < block_size; i++)
//         {
//             sum_acc += p[i];
//         }
//         // Compute carry and add it unconditionally
//         uint64_t carry = (uint64_t)(sum_acc >> 64);
//         result[start_idx - 1] += (carry << 32);
//         // Store lower 64 bits
//         result[start_idx++] = (uint64_t)sum_acc;
//         start += block_size;
//     }

//     // Final step: Copy last element
//     result[start_idx] = result[63];
// }

static inline void process_block(uint64_t *__restrict result,
                                 int dest, int start, int count, int carry_dest)
{
    __uint128_t sum = 0;
    const uint64_t *p = result + start;
    for (int i = 0; i < count; i++)
    {
        sum += p[i];
    }
    result[dest] = (uint64_t)sum;
    uint64_t carry = (uint64_t)(sum >> 64);
    result[carry_dest] += (carry << 32);
}

void __mul_add_limbs(uint64_t *__restrict result)
{
    // Phase 1
    process_block(result, 1, 1, 2, 0);  // Block size 2: result[1] = result[1] + result[2]
    process_block(result, 2, 3, 3, 1);  // Block size 3: result[2] = result[3] + result[4] + result[5]
    process_block(result, 3, 6, 4, 2);  // Block size 4: result[3] = result[6] + result[7] + result[8] + result[9]
    process_block(result, 4, 10, 5, 3); // Block size 5: result[4] = result[10] + ... + result[14]
    process_block(result, 5, 15, 6, 4); // Block size 6: result[5] = result[15] + ... + result[20]
    process_block(result, 6, 21, 7, 5); // Block size 7: result[6] = result[21] + ... + result[27]
    process_block(result, 7, 28, 8, 6); // Block size 8: result[7] = result[28] + ... + result[35]

    // Phase 2
    process_block(result, 8, 36, 7, 7);   // Block size 7: result[8] = result[36] + ... + result[42]
    process_block(result, 9, 43, 6, 8);   // Block size 6: result[9] = result[43] + ... + result[48]
    process_block(result, 10, 49, 5, 9);  // Block size 5: result[10] = result[49] + ... + result[53]
    process_block(result, 11, 54, 4, 10); // Block size 4: result[11] = result[54] + ... + result[57]
    process_block(result, 12, 58, 3, 11); // Block size 3: result[12] = result[58] + result[59] + result[60]
    process_block(result, 13, 61, 2, 12); // Block size 2: result[13] = result[61] + result[62]

    // Final step: Copy the last limb
    result[14] = result[63];
}

void __mul_adjust_limbs(uint64_t *a)
{
    // Assumes n >= 1 and that a has n+1 elements.
    // Process the very first iteration separately.
    {
        uint64_t s0 = ((a[0] + (a[1] >> 32)) & 0xFFFFFFFF);
        uint64_t overflow = (s0 < (uint32_t)a[0]);
        a[0] = ((s0 << 32) & 0xFFFFFFFF00000000ULL) | ((uint32_t)(a[0] >> 32) + overflow);
    }

    int out = 1; // next output index (a[0] is already used)
    int i = 1;
    int last_pair = 0; // holds the index of the last “complete pair” output
    uint64_t s_high = 0, s_low = 0;
    uint64_t mask = 0, mask_low = 0;
    // Process pairs of iterations.
    while (i < 14)
    {
        s_high = ((a[i] + (a[i + 1] >> 32)) & 0xFFFFFFFF);
        mask = (s_high < (uint32_t)a[i]);
        a[last_pair] += (mask << 32);

        s_low = ((a[i + 1] + (a[i + 2] >> 32)) & 0xFFFFFFFF);
        mask_low = (s_low < (uint32_t)a[i + 1]);
        s_high += mask_low;

        a[out] = ((s_low << 32) & 0xFFFFFFFF00000000ULL) | (uint32_t)s_high;
        last_pair = out;
        out++;
        i += 2;
    }
    // Adjust the ending element's lower half.
    a[last_pair] = (((a[14]) << 32) & 0xFFFFFFFF00000000ULL) | ((a[last_pair] - mask_low) & 0xFFFFFFFF);
}

// Uses Urdhva Tiryakbhyam algorithm for multiplication
void limb_mul_n(limb_t *a, limb_t *b, uint64_t *res)
{
    __mul_acc_mul_AVX(a, b, res);
    __mul_add_limbs(res);
    __mul_adjust_limbs(res);
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

    return 0;
}

/*
 Does the following for testing correctness:
    1. read the test cases from the file
    2. path: ../test/cases/<num_bits>/<test_case>.csv.gz
    3. there are four test cases: random.csv.gz, equal.csv.gz, greater.csv.gz, smaller.csv.gz
    4. first line contains a header: a, b, result
    5. next line onwards contains the test cases, 100000 test cases
    6. verify the results of the multiplication of a and b with the result
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
        limb_t *a, *b;
        a = limb_set_str(a_str);
        b = limb_set_str(b_str);

        // Adjust the sizes of the two numbers
        limb_t_adjust_limb_sizes(a, b);

        // Get the number of limbs
        int n = a->size;
        // char *mul_str = (char *)malloc(2 * n * n * sizeof(uint8_t) + 1);
        char *mul_str = memory_pool_alloc(8 * n * sizeof(uint8_t) + 1);
        if (mul_str == NULL)
        {
            perror("Memory allocation failed for mul_str\n");
            exit(EXIT_FAILURE);
        }
        uint64_t *mul = memory_pool_alloc(2 * n * sizeof(uint64_t));
        if (mul == NULL)
        {
            perror("Memory allocation failed for mul\n");
            exit(EXIT_FAILURE);
        }
        memset(mul, 0, 2 * n * sizeof(uint64_t));

        /***** Start of multiplication *****/
        limb_mul_n(a, b, mul);

        /***** End of multiplication *****/
        limb_get_str32((uint32_t *)mul, 2 * n, &mul_str);
        size_t mul_size = strlen(mul_str);

        // verify the converted string with result
        if (!check_result(mul_str, result_str, mul_size))
        {
            printf("Test case failed, at iteration %d\n", i);
            printf("a = %s, b = %s\n Expected result = %s\n", a_str, b_str, result_str);
            printf("Experimental result = %s\n", mul_str);
            exit(EXIT_FAILURE);
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
  Does the following for measuring the time taken for multiplication:
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

        int n_1 = strlen(a_str);
        int n_2 = strlen(b_str);

        // convert a and b into limbs
        limb_t *a, *b;
        a = limb_set_str(a_str);
        b = limb_set_str(b_str);

        // Adjust the sizes of the two numbers
        limb_t_adjust_limb_sizes(a, b);

        // Get the number of limbs
        int n = a->size;

        char *mul_str = memory_pool_alloc(8 * n * sizeof(uint8_t) + 1);
        if (mul_str == NULL)
        {
            perror("Memory allocation failed for mul_str\n");
            exit(EXIT_FAILURE);
        }
        uint64_t *mul = memory_pool_alloc(2 * n * sizeof(uint64_t));
        if (mul == NULL)
        {
            perror("Memory allocation failed for mul\n");
            exit(EXIT_FAILURE);
        }
        memset(mul, 0, 2 * n * sizeof(uint64_t));

        printf("Starting multiplication\n");
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

        switch (measure_type)
        {
        case 0:             // RDTSC
            time_taken = 0; // initialize time taken
            printf("Calibrating CPU speed using RDTSC...\n");
            fflush(stdout);
            // interrupt
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

            TIME_RDTSC(time_taken, limb_mul_n(a, b, mul));
            printf("done\n");
            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("multiplying %d times\n", niter);
            fflush(stdout);

            t0 = measure_rdtsc_start();
            for (int i = 0; i < niter; i++)
            {
                limb_mul_n(a, b, mul);
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

            TIME_TIMESPEC(time_taken, limb_mul_n(a, b, mul));

            printf("done\n");
            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("multiplying %d times\n", niter);
            fflush(stdout);

            struct timespec ts_0, ts_1;
            ts_0 = get_timespec();
            for (int i = 0; i < niter; i++)
            {
                limb_mul_n(a, b, mul);
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
            TIME_RUSAGE(time_taken, limb_mul_n(a, b, mul));

            printf("done\n");

            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("multiplying %d times\n", niter);
            fflush(stdout);

            t0 = cputime();
            for (int i = 0; i < niter; i++)
            {
                limb_mul_n(a, b, mul);
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