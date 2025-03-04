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

__m512i one;
__m512i mask;
__m512i ZEROS;
// 1,0,2,1,0,1,0,0
__m512i perm_idx_11;
// 1,4,3,2,1,0,3,2
__m512i perm_idx_12;

// 4,0,1,2,3,4,0,1
__m512i perm_idx_22;

// 2,3,0,1,2,0,1,0
__m512i perm_idx_21;

// 4,3,4,3,2,4,3,2
__m512i perm_idx_13;

// 3,4,2,3,4,1,2,3
__m512i perm_idx_23;

// extra permutation indices
__m512i perm_idx_0;

__m512i perm_idx_1;

__m512i perm_idx_2;

__m512i perm_idx_3;
__m512i perm_idx_4;

__m512i perm_idx_r_hi_0;
__m512i perm_idx_r_hi_1;
__m512i perm_idx_res_0_X_2_lo;
__m512i perm_idx_res_1_X_2_lo;

void limb_mul_n_52(limb_t *a, limb_t *b, uint64_t *res_lo, uint64_t *res_hi)
{
    // Pre-fetch data into L1 cache
    _mm_prefetch((char *)a->limbs, _MM_HINT_NTA);
    _mm_prefetch((char *)b->limbs, _MM_HINT_NTA);
    uint64_t *num1 = a->limbs;
    uint64_t *num2 = b->limbs;

    // Load the numbers into base
    __m512i base_1 = _mm512_load_si512(num1);
    __m512i a_vec_1 = _mm512_permutexvar_epi64(perm_idx_11, base_1);
    __m512i a_vec_2 = _mm512_permutexvar_epi64(perm_idx_12, base_1);

    __m512i base_2 = _mm512_load_si512(num2);
    __m512i b_vec_1 = _mm512_permutexvar_epi64(perm_idx_21, base_2);
    __m512i res_0_hi = _mm512_madd52hi_epu64(ZEROS, a_vec_1, b_vec_1);
    __m512i b_vec_2 = _mm512_permutexvar_epi64(perm_idx_22, base_2);
    __m512i res_0_hi_perm_0 = _mm512_permutexvar_epi64(perm_idx_0, res_0_hi);
    __m512i res_1_hi = _mm512_madd52hi_epu64(ZEROS, a_vec_2, b_vec_2);
    _mm512_store_si512(res_hi, res_0_hi);

    __m512i res_1_hi_perm_0 = _mm512_permutexvar_epi64(perm_idx_1, res_1_hi);
    __m512i X_0 = _mm512_mask_blend_epi64(0b11100000, res_0_hi_perm_0, res_1_hi_perm_0);
    __m512i res_0_lo = _mm512_madd52lo_epu64(X_0, a_vec_1, b_vec_1);
    // _mm512_store_si512(res_lo, res_0_lo);

    __m512i res_1_hi_perm_1 = _mm512_permutexvar_epi64(perm_idx_2, res_1_hi);
    _mm512_store_si512(res_hi + 8, res_1_hi);

    __m512i a_vec_3 = _mm512_permutexvar_epi64(perm_idx_13, base_1);
    __m512i b_vec_3 = _mm512_permutexvar_epi64(perm_idx_23, base_2);
    __m512i res_2_hi = _mm512_madd52hi_epu64(ZEROS, a_vec_3, b_vec_3);
    __m512i res_2_hi_perm_0 = _mm512_permutexvar_epi64(perm_idx_3, res_2_hi);
    __m512i temp_x = _mm512_mask_blend_epi64(0b10111000, res_1_hi_perm_1, res_2_hi_perm_0);
    __m512i X_1 = _mm512_mask_blend_epi64(0b01000000, temp_x, ZEROS);
    __m512i res_1_lo = _mm512_madd52lo_epu64(X_1, a_vec_2, b_vec_2);
    // _mm512_store_si512(res_lo + 8, res_1_lo);

    __m512i res_2_hi_perm_1 = _mm512_permutexvar_epi64(perm_idx_4, res_2_hi);
    __m512i y = _mm512_mask_blend_epi64(0b11100100, res_2_hi_perm_1, ZEROS);
    __m512i res_2_lo = _mm512_madd52lo_epu64(y, a_vec_3, b_vec_3);
    _mm512_store_si512(res_lo + 16, res_2_lo);

    __uint128_t prod = (__uint128_t)num1[4] * num2[4];

    // res_lo[23] += (prod >> 52);
    // res_lo[0] += res_hi[2];
    // res_lo[2] += res_hi[5];
    // res_lo[5] += res_hi[9];
    // res_lo[9] += res_hi[14];

    // permute res_hi_0 and res_hi_1
    __m512i res_0_hi_perm_2 = _mm512_permutexvar_epi64(perm_idx_r_hi_0, res_0_hi);
    __m512i res_1_hi_perm_2 = _mm512_permutexvar_epi64(perm_idx_r_hi_1, res_1_hi);
    // blend res_hi_0_perm_1 and res_hi_1_perm_1
    __m512i res_hi_0_1 = _mm512_mask_blend_epi64(0b00001100, res_0_hi_perm_2, res_1_hi_perm_2);
    __m512i X_2 = _mm512_mask_blend_epi64(0b00001111, ZEROS, res_hi_0_1);

    __m512i res_0_X_2_lo = _mm512_permutexvar_epi64(perm_idx_res_0_X_2_lo, X_2);
    res_0_lo = _mm512_add_epi64(res_0_lo, res_0_X_2_lo);
    _mm512_store_si512(res_lo, res_0_lo);

    __m512i res_1_X_2_lo = _mm512_permutexvar_epi64(perm_idx_res_1_X_2_lo, X_2);
    res_1_lo = _mm512_add_epi64(res_1_lo, res_1_X_2_lo);

    // store the results

    _mm512_store_si512(res_lo + 8, res_1_lo);

    res_lo[23] += (prod >> 52);

    res_hi[9] = prod & 0xFFFFFFFFFFFFF;
    res_hi[8] = res_lo[22] + res_lo[23];
    uint carry = res_hi[8] >> 52;
    res_hi[8] &= 0xFFFFFFFFFFFFF;
    res_hi[7] = res_lo[19] + res_lo[20] + res_lo[21] + carry;
    carry = res_hi[7] >> 52;
    res_hi[7] &= 0xFFFFFFFFFFFFF;
    res_hi[6] = res_lo[15] + res_lo[16] + res_lo[17] + res_lo[18] + carry;
    carry = res_hi[6] >> 52;
    res_hi[6] &= 0xFFFFFFFFFFFFF;
    res_hi[5] = res_lo[10] + res_lo[11] + res_lo[12] + res_lo[13] + res_lo[14] + carry;
    carry = res_hi[5] >> 52;
    res_hi[5] &= 0xFFFFFFFFFFFFF;
    res_hi[4] = res_lo[6] + res_lo[7] + res_lo[8] + res_lo[9] + carry;
    carry = res_hi[4] >> 52;
    res_hi[4] &= 0xFFFFFFFFFFFFF;
    res_hi[3] = res_lo[3] + res_lo[4] + res_lo[5] + carry;
    carry = res_hi[3] >> 52;
    res_hi[3] &= 0xFFFFFFFFFFFFF;
    res_hi[2] = res_lo[1] + res_lo[2] + carry;
    carry = res_hi[2] >> 52;
    res_hi[2] &= 0xFFFFFFFFFFFFF;
    res_hi[1] = res_lo[0] + carry;
    carry = res_hi[1] >> 52;
    res_hi[1] &= 0xFFFFFFFFFFFFF;
    res_hi[0] += carry;
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

    perm_idx_11 = _mm512_set_epi64(1, 0, 2, 1, 0, 1, 0, 0);
    // 1,4,3,2,1,0,3,2
    perm_idx_12 = _mm512_set_epi64(1, 4, 3, 2, 1, 0, 3, 2);

    // 4,0,1,2,3,4,0,1
    perm_idx_22 = _mm512_set_epi64(4, 0, 1, 2, 3, 4, 0, 1);

    // 2,3,0,1,2,0,1,0
    perm_idx_21 = _mm512_set_epi64(2, 3, 0, 1, 2, 0, 1, 0);

    // 4,3,4,3,2,4,3,2
    perm_idx_13 = _mm512_set_epi64(4, 3, 4, 3, 2, 4, 3, 2);

    // 3,4,2,3,4,1,2,3
    perm_idx_23 = _mm512_set_epi64(3, 4, 2, 3, 4, 1, 2, 3);

    // extra permutation indices
    perm_idx_0 = _mm512_set_epi64(0, 0, 0, 7, 6, 4, 3, 1);

    perm_idx_1 = _mm512_set_epi64(3, 2, 0, 0, 0, 0, 0, 0);

    perm_idx_2 = _mm512_set_epi64(0, 0, 0, 0, 0, 7, 5, 4);

    perm_idx_3 = _mm512_set_epi64(3, 0, 2, 1, 0, 0, 0, 0);
    perm_idx_4 = _mm512_set_epi64(0, 0, 0, 7, 6, 0, 5, 4);
    perm_idx_r_hi_0 = _mm512_set_epi64(0, 0, 0, 0, 0, 0, 5, 2);
    perm_idx_r_hi_1 = _mm512_set_epi64(0, 0, 0, 0, 6, 1, 0, 0);
    perm_idx_res_0_X_2_lo = _mm512_set_epi64(4, 4, 2, 4, 4, 1, 4, 0);
    perm_idx_res_1_X_2_lo = _mm512_set_epi64(4, 4, 4, 4, 4, 4, 3, 4);

    init_memory_pool();

    // run_correctness_test(test_case);
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
    6. verify the results of the multiplication of a and b with the result
*/
void run_correctness_test(int test_case)
{

    // read the test case from the file

    gzFile test_file;
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
    test_file = open_gzfile(test_filename, "rb");

    // skip the first line, header
    skip_first_line(test_file);

    // Read ITERATIONS test cases
    for (int i = 0; i < ITERATIONS; i++)
    {
        // printf("Running test case %d\n", i);
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
        ZEROS = _mm512_setzero_si512();

        limb_t *res_lo = limb_t_alloc(n * n * sizeof(uint64_t));
        limb_t *res_hi = limb_t_alloc(n * n * sizeof(uint64_t));

        limb_mul_n_52(a, b, res_lo->limbs, res_hi->limbs);

        // print the results
        res_hi->size = 2 * n;
        char *res_lo_str = limb_get_str(res_hi);
        int str_len = strlen(res_lo_str);
        // check with the result
        // verify the converted string with result
        if (!check_result(res_lo_str, result_str, str_len))
        {
            printf("Test case failed, at iteration %d\n", i);
            exit(EXIT_FAILURE);
        }
        // printf("Test case passed: %d\n", i);
    }
    printf("All test cases passed\n");
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
    for (int iter_count = 0; iter_count < 10; ++iter_count)
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
        ZEROS = _mm512_setzero_si512();

        limb_t *res_lo = limb_t_alloc(n * n * sizeof(uint64_t));
        limb_t *res_hi = limb_t_alloc(n * n * sizeof(uint64_t));

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

        // // prefetch the data
        // for (int i = 0; i < n; i += 64)
        // {
        //     _mm_prefetch((char *)a + i, _MM_HINT_T0);
        //     _mm_prefetch((char *)b + i, _MM_HINT_T0);
        // }

        switch (measure_type)
        {
        case 0:             // RDTSC
            time_taken = 0; // initialize time taken
            printf("Calibrating CPU speed using RDTSC...\n");
            fflush(stdout);
            // interrupt
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

            TIME_RDTSC(time_taken, limb_mul_n_52(a, b, res_lo->limbs, res_hi->limbs));
            printf("done\n");
            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("multiplying %d times\n", niter);
            fflush(stdout);

            t0 = measure_rdtsc_start();
            for (int i = 0; i < niter; i++)
            {
                limb_mul_n_52(a, b, res_lo->limbs, res_hi->limbs);
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

            TIME_TIMESPEC(time_taken, limb_mul_n_52(a, b, res_lo->limbs, res_hi->limbs));

            printf("done\n");
            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("multiplying %d times\n", niter);
            fflush(stdout);

            struct timespec ts_0, ts_1;
            ts_0 = get_timespec();
            for (int i = 0; i < niter; i++)
            {
                limb_mul_n_52(a, b, res_lo->limbs, res_hi->limbs);
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
            TIME_RUSAGE(time_taken, limb_mul_n_52(a, b, res_lo->limbs, res_hi->limbs));

            printf("done\n");

            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("multiplying %d times\n", niter);
            fflush(stdout);

            t0 = cputime();
            for (int i = 0; i < niter; i++)
            {
                limb_mul_n_52(a, b, res_lo->limbs, res_hi->limbs);
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