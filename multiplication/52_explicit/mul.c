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
int NUM_BITS;             // Number of bits for the numbers

// Function prototypes
void run_benchmarking_test(int, int); // Function to run the benchmarking tests
void run_correctness_test(int);

void vbap_mul_256(limb_t *a, limb_t *b, uint64_t *lo, uint64_t *hi)
{

    const uint64_t *num1 = a->limbs;
    const uint64_t *num2 = b->limbs;

    __m512i base_1 = _mm512_load_si512(num1);
    __m512i a_vec_0 = _mm512_permutexvar_epi64(a_vec_0_perm_idx, base_1);
    __m512i base_2 = _mm512_load_si512(num2);
    __m512i b_vec_0 = _mm512_permutexvar_epi64(b_vec_0_perm_idx, base_2);

    __m512i hi_0 = _mm512_madd52hi_epu64(AVX512_ZEROS, a_vec_0, b_vec_0);
    __m512i a_vec_1 = _mm512_permutexvar_epi64(a_vec_1_perm_idx, base_1);
    __m512i b_vec_1 = _mm512_permutexvar_epi64(b_vec_1_perm_idx, base_2);
    __m512i hi_1 = _mm512_madd52hi_epu64(AVX512_ZEROS, a_vec_1, b_vec_1);

    __m512i hi_1_perm_0 = _mm512_permutexvar_epi64(hi_1_perm_0_idx, hi_1);
    __m512i hi_0_perm_0 = _mm512_permutexvar_epi64(hi_0_perm_0_idx, hi_0);
    __m512i hi_add_lo_0 = _mm512_mask_blend_epi64(0b11100000, hi_0_perm_0, hi_1_perm_0);
    __m512i lo_0 = _mm512_madd52lo_epu64(hi_add_lo_0, a_vec_0, b_vec_0);
    _mm512_store_si512(hi, hi_0);
    _mm512_store_si512(lo, lo_0);

    __m512i hi_1_perm_1 = _mm512_permutexvar_epi64(hi_1_perm_1_idx, hi_1);
    _mm512_store_si512(hi + 8, hi_1);

    __m512i a_vec_2 = _mm512_permutexvar_epi64(a_vec_2_perm_idx, base_1);
    __m512i b_vec_2 = _mm512_permutexvar_epi64(b_vec_2_perm_idx, base_2);
    __m512i hi_2 = _mm512_madd52hi_epu64(AVX512_ZEROS, a_vec_2, b_vec_2);
    __m512i hi_2_perm_0 = _mm512_permutexvar_epi64(hi_2_perm_0_idx, hi_2);
    __m512i hi_add_lo_1 = _mm512_mask_blend_epi64(0b10111000, hi_1_perm_1, hi_2_perm_0);
    hi_add_lo_1 = _mm512_mask_blend_epi64(0b01000000, hi_add_lo_1, AVX512_ZEROS);
    __m512i lo_1 = _mm512_madd52lo_epu64(hi_add_lo_1, a_vec_1, b_vec_1);
    _mm512_store_si512(lo + 8, lo_1);

    __m512i hi_2_perm_1 = _mm512_permutexvar_epi64(hi_2_perm_1_idx, hi_2);
    __m512i hi_add_lo_2 = _mm512_mask_blend_epi64(0b11100100, hi_2_perm_1, AVX512_ZEROS);
    __m512i lo_2 = _mm512_madd52lo_epu64(hi_add_lo_2, a_vec_2, b_vec_2);
    _mm512_store_si512(lo + 16, lo_2);

    __uint128_t prod = (__uint128_t)num1[4] * num2[4];

    lo[23] += (prod >> 52);
    hi[8] = lo[22] + lo[23];

    lo[0] += hi[2];
    lo[2] += hi[5];
    lo[5] += hi[9];
    lo[9] += hi[14];

    hi[9] = (uint64_t)prod;
    uint32_t carry = hi[8] >> 52;

    hi[7] = lo[19] + lo[20] + lo[21] + carry;
    carry = hi[7] >> 52;
    hi[6] = lo[15] + lo[16] + lo[17] + lo[18] + carry;
    carry = hi[6] >> 52;
    hi[5] = lo[10] + lo[11] + lo[12] + lo[13] + lo[14] + carry;
    carry = hi[5] >> 52;
    hi[4] = lo[6] + lo[7] + lo[8] + lo[9] + carry;
    carry = hi[4] >> 52;
    hi[3] = lo[3] + lo[4] + lo[5] + carry;
    carry = hi[3] >> 52;
    hi[2] = lo[1] + lo[2] + carry;
    carry = hi[2] >> 52;
    hi[1] = lo[0] + carry;
    carry = hi[1] >> 52;
    hi[0] += carry;
}

// main function with cmd arguments
int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        printf("Usage: %s <test_type?>  <measure_type>\n", argv[0]);
        printf("test_type: 0 --> correctness test\n");
        printf("test_type: 1 --> benchmarking test\n");
        printf("measure_type: 0 --> RDTSC\n");
        printf("measure_type: 1 --> Timespec\n");
        printf("measure_type: 2 --> RUSAGE\n");
        return 1;
    }
    NUM_BITS = 256;
    int test_type = atoi(argv[1]);
    assert(test_type >= 0 && test_type < 2);

    assert(atoi(argv[2]) >= 0 && atoi(argv[2]) < 3);
    int measure_type = atoi(argv[2]);

    init_utils();
    if (test_type == 0)
    {
        printf("Running correctness test...\n");
        run_correctness_test(0);
    }
    else
    {
        printf("Running benchmarking test...\n");
        run_benchmarking_test(0, measure_type);
    }

    clear_utils();

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
        printf("Running random test cases for bit-size %d\n", NUM_BITS);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/random.csv.gz", NUM_BITS);
        break;
    case 1:
        printf("Running equal test cases for bit-size %d\n", NUM_BITS);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/equal.csv.gz", NUM_BITS);
        break;
    case 2:
        printf("Running greater test cases for bit-size %d\n", NUM_BITS);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/greater.csv.gz", NUM_BITS);
        break;
    case 3:
        printf("Running smaller test cases for bit-size %d\n", NUM_BITS);
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
        AVX512_ZEROS = _mm512_setzero_si512();

        limb_t *lo = limb_t_alloc(n * n * sizeof(uint64_t));
        limb_t *hi = limb_t_alloc(n * n * sizeof(uint64_t));

        vbap_mul_256(a, b, lo->limbs, hi->limbs);

        // print the results
        hi->size = 2 * n;
        char *lo_str = limb_get_str(hi);
        int str_len = strlen(lo_str);
        // check with the result
        // verify the converted string with result
        if (!check_result(lo_str, result_str, str_len))
        {
            printf("Test case failed, at iteration %d\n", i);
            exit(EXIT_FAILURE);
        }
        // printf("Test case passed: %d\n", i);
    }
    printf("**** All %d test cases passed ****\n", ITERATIONS);
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

    char test_filename[100];
    switch (test_case)
    {
    case 0:
        printf("Running random test cases for bit-size %d\n", NUM_BITS);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/random.csv.gz", NUM_BITS);
        break;
    case 1:
        printf("Running equal test cases for bit-size %d\n", NUM_BITS);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/equal.csv.gz", NUM_BITS);
        break;
    case 2:
        printf("Running greater test cases for bit-size %d\n", NUM_BITS);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/greater.csv.gz", NUM_BITS);
        break;
    case 3:
        printf("Running smaller test cases for bit-size %d\n", NUM_BITS);
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

    // pick a random i from 0 to ITERATIONS-1; keep it as random as possible
    unsigned long seed = generate_seed();
    srand(seed);

    int i = rand() % ITERATIONS;
    printf("Reading test case %d\n", i);
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

    limb_t *lo = limb_t_alloc(n * n * sizeof(uint64_t));
    limb_t *hi = limb_t_alloc(n * n * sizeof(uint64_t));

    printf("Starting multiplication\n");
    int cpu_info[4], decimals;
    unsigned long long int t0, t1;
    int niter;
    double f, ops_per_sec, time_taken_ms, time_taken;

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

        TIME_RDTSC(time_taken, vbap_mul_256(a, b, lo->limbs, hi->limbs));
        printf("done\n");
        printf("Avg. Execution time: %f microseconds\n", time_taken);

        niter = 1 + (unsigned long)(1e7 / time_taken);
        printf("Multiplying %d times\n", niter);
        fflush(stdout);

        t0 = measure_rdtsc_start();
        for (int i = 0; i < niter; i++)
        {
            vbap_mul_256(a, b, lo->limbs, hi->limbs);
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

        TIME_TIMESPEC(time_taken, vbap_mul_256(a, b, lo->limbs, hi->limbs));

        printf("done\n");
        printf("Avg. Execution time: %f microseconds\n", time_taken);

        niter = 1 + (unsigned long)(1e7 / time_taken);
        printf("Multiplying %d times\n", niter);
        fflush(stdout);

        struct timespec ts_0, ts_1;
        ts_0 = get_timespec();
        for (int i = 0; i < niter; i++)
        {
            vbap_mul_256(a, b, lo->limbs, hi->limbs);
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
        TIME_RUSAGE(time_taken, vbap_mul_256(a, b, lo->limbs, hi->limbs));

        printf("done\n");

        printf("Avg. Execution time: %f microseconds\n", time_taken);

        niter = 1 + (unsigned long)(1e7 / time_taken);
        printf("Multiplying %d times\n", niter);
        fflush(stdout);

        t0 = cputime();
        for (int i = 0; i < niter; ++i)
        {
            vbap_mul_256(a, b, lo->limbs, hi->limbs);
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
    // close the test file
    gzclose(test_file);
}