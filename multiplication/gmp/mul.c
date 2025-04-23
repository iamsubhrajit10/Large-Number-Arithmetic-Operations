/*
 This program computes multiplication of two numbers using GMP library, with the test cases for the same.
 Also, it writes various data like performance counters, rdtsc values to files, for analysis.
*/

/* This is the baseline version, without explicit SIMD */
/*
This code multiplies two numbers, represented as array of digits.
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

#define ITERATIONS 100000 // Number of iterations for each test

int NUM_BITS; // Number of bits for the numbers

// Function prototypes
void run_benchmarking_test(int, int); // Function to run the benchmarking tests
void run_correctness_test(int);

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

        mpz_t a, b, result_gmp;
        mpz_init(a);
        mpz_init(b);

        // convert the strings to mpz_t
        if (mpz_set_str(a, a_str, 16) != 0)
        {
            perror("Error: Failed to set mpz_t from string a_str");
            exit(EXIT_FAILURE);
        }
        if (mpz_set_str(b, b_str, 16) != 0)
        {
            perror("Error: Failed to set mpz_t from string b_str");
            exit(EXIT_FAILURE);
        }

        /***** Start of multiplication *****/
        mpz_mul(result_gmp, a, b);

        /***** End of multiplication *****/

        char *mul_str = mpz_get_str(NULL, 16, result_gmp);
        int mul_size = strlen(mul_str);

        // verify the converted string with result
        if (!check_result(mul_str, result_str, mul_size))
        {
            printf("Test case failed, at iteration %d\n", i);
            printf("a = %s, b = %s\n Expected result = %s\n", a_str, b_str, result_str);
            printf("Experimental result = %s\n", mul_str);
            exit(EXIT_FAILURE);
        }
    }
    printf("*** All %d test cases passed ***\n", ITERATIONS);
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

    // convert the strings to mpz_t
    mpz_t a, b, result_gmp;
    mpz_init(a);
    mpz_init(b);

    // convert the strings to mpz_t
    if (mpz_set_str(a, a_str, 16) != 0)
    {
        perror("Error: Failed to set mpz_t from string a_str");
        exit(EXIT_FAILURE);
    }
    if (mpz_set_str(b, b_str, 16) != 0)
    {
        perror("Error: Failed to set mpz_t from string b_str");
        exit(EXIT_FAILURE);
    }

    printf("Starting multiplication\n");

    double time_taken;

    // clear cache before each test case
    size_t a_size = mpz_size(a) * sizeof(mp_limb_t);
    size_t b_size = mpz_size(b) * sizeof(mp_limb_t);

    // Ensure that the cache flush operations are completed
    _mm_mfence();
    // Ensure the flush is completed
    int cpu_info[4], decimals;
    unsigned long long int t0, t1;
    int niter;
    double f, ops_per_sec, time_taken_ms;

    // clear cache content for a_limbs, b_limbs
    for (int i = 0; i < a_size; i += 64)
    {
        _mm_clflush((char *)a->_mp_d + i);
    }
    for (int i = 0; i < b_size; i += 64)
    {
        _mm_clflush((char *)b->_mp_d + i);
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

        TIME_RDTSC(time_taken, mpz_mul(result_gmp, a, b));
        printf("done\n");
        printf("Calibrated time: %f microseconds\n", time_taken);

        niter = 1 + (unsigned long)(1e7 / time_taken);
        printf("multiplying %d times\n", niter);
        fflush(stdout);

        t0 = measure_rdtsc_start();
        for (int i = 0; i < niter; i++)
        {
            mpz_mul(result_gmp, a, b);
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

        TIME_TIMESPEC(time_taken, mpz_mul(result_gmp, a, b));

        printf("done\n");
        printf("Calibrated time: %f microseconds\n", time_taken);

        niter = 1 + (unsigned long)(1e7 / time_taken);
        printf("multiplying %d times\n", niter);
        fflush(stdout);

        struct timespec ts_0, ts_1;
        ts_0 = get_timespec();
        for (int i = 0; i < niter; i++)
        {
            mpz_mul(result_gmp, a, b);
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
        TIME_RUSAGE(time_taken, mpz_mul(result_gmp, a, b));

        printf("done\n");

        printf("Calibrated time: %f microseconds\n", time_taken);

        niter = 1 + (unsigned long)(1e7 / time_taken);
        printf("multiplying %d times\n", niter);
        fflush(stdout);

        t0 = cputime();
        for (int i = 0; i < niter; i++)
        {
            mpz_mul(result_gmp, a, b);
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