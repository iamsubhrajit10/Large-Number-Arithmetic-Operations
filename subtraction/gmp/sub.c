/*
 This program computes subtraction of two numbers using GMP library, with the test cases for the same.
 Also, it writes various data like performance counters, rdtsc values to files, for analysis.
*/

/* This is the baseline version, without explicit SIMD */
/*
This code subs two numbers, represented as array of digits.
a --> array of digits of first number, of length n
b --> array of digits of second number, of length m
#Pre-processing:
1. Equalize the length of both arrays by subtracting leading zeros to the smaller array.
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
#include "timing_utils.h"
#include "perf_utils.h"

#define ITERATIONS 100000 // Number of iterations for each test

int CORE_NO; // Core number to run the tests on

int NUM_BITS; // Number of bits for the numbers

// Function prototypes
void run_benchmarking_test(int, int); // Function to run the benchmarking tests
void run_correctness_test(int);
void run_perf_test();

// main function with cmd arguments
int main(int argc, char *argv[])
{
    if (argc != 6)
    {
        printf("Usage: %s <number of bits> <core number> <test-case number> <benchmark measure type> <type of measure>\n", argv[0]);
        printf("test-case number: 0 --> Random numbers\n");
        printf("test-case number: 1 --> Random numbers with a < b\n");
        printf("test-case number: 2 --> Random numbers with a > b\n");
        printf("test-case number: 3 --> Random numbers with a = b\n");
        printf("benchmark measure type: 0 --> RDTSC\n");
        printf("benchmark measure type: 1 --> Timespec\n");
        printf("benchmark measure type: 2 --> RUSAGE\n");
        printf("type of measure: 0 --> correctness test\n");
        printf("type of measure: 1 --> benchmarking test\n");
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

    assert(atoi(argv[5]) >= 0 && atoi(argv[5]) < 3);
    int type_of_measure = atoi(argv[5]);

    switch (type_of_measure)
    {
    case 0:
        run_correctness_test(test_case);
        break;
    case 1:
        run_benchmarking_test(test_case, measure_type);
        break;
    case 2:
        run_perf_test();
        break;
    default:
        printf("Invalid type of measure\n");
        exit(EXIT_FAILURE);
    }
    return 0;
}

void run_perf_test()
{
    // printf("Trying to run perf test\n");

    // test case file name
    char test_filename[100];
    snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/random.csv.gz", NUM_BITS);

    // open the test file
    gzFile test_file = open_gzfile(test_filename, "rb");
    if (test_file == NULL)
    {
        perror("Error opening test file");
        exit(EXIT_FAILURE);
    }
    // skip the first line, header
    skip_first_line(test_file);
    // Read random test case number
    // seed the random number generator
    srand(time(NULL));
    int i = rand() % ITERATIONS;
    // printf("Reading test case %d\n", i);
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
    // convert the strings to mpz_t
    if (mpz_set_str(result_gmp, result_str, 16) != 0)
    {
        perror("Error: Failed to set mpz_t from string result_str");
        exit(EXIT_FAILURE);
    }
    mpz_sub(result_gmp, a, b);

    initialize_perf();

    // perf overhead
    start_perf();

    stop_perf();
    long long values_overhead[MAX_EVENTS];
    read_perf(values_overhead);
    // printf("Perf overhead: \n");
    // write the perf values to file
    // write_perf(stdout, values_overhead);

    // clear cache before each test case
    size_t a_size = mpz_size(a) * sizeof(mp_limb_t);
    size_t b_size = mpz_size(b) * sizeof(mp_limb_t);

    for (size_t i = 0; i < a_size; i += 64) // 64 bytes is the typical cache line size
    {
        _mm_clflush((char *)a->_mp_d + i);
    }

    for (size_t i = 0; i < b_size; i += 64) // 64 bytes is the typical cache line size
    {
        _mm_clflush((char *)b->_mp_d + i);
    }
    // Ensure that the cache flush operations are completed
    _mm_mfence();

    // printf("Starting perf test\n");
    start_perf();
    // Start the perf test
    mpz_sub(result_gmp, a, b);
    stop_perf();
    long long values[MAX_EVENTS];
    read_perf(values);

    // close the test file

    printf("User instructions: %lld\n", values[0] - values_overhead[0]);

    gzclose(test_file);

    // start measuring RDTSC Ticks
    double t;
    RECORD_RDTSC(t, mpz_sub(result_gmp, a, b));

    printf("Avg. RDTSC Ticks: %f\n", t);

    // free the mpz_t variables
    mpz_clear(a);
    mpz_clear(b);
    mpz_clear(result_gmp);
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
    // printf("Trying to run correctness test\n");

    // open the perf file
    gzFile timespec_file, rdtsc_file, cputime_file;

    char test_filename[100];

    switch (test_case)
    {
    case 0:
        // printf("Running random test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/random.csv.gz", NUM_BITS);
        break;
    case 1:
        // printf("Running equal test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/equal.csv.gz", NUM_BITS);
        break;
    case 2:
        // printf("Running greater test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/greater.csv.gz", NUM_BITS);
        break;
    case 3:
        // printf("Running smaller test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
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

        /***** Start of addition *****/
        mpz_sub(result_gmp, a, b);

        /***** End of addition *****/

        char *sum_str = mpz_get_str(NULL, 16, result_gmp);
        int sum_size = strlen(sum_str);

        // verify the converted string with result
        if (!check_result(sum_str, result_str, sum_size))
        {
            printf("Test case failed, at iteration %d\n", i);
            printf("a = %s, b = %s\n Expected result = %s\n", a_str, b_str, result_str);
            printf("Experimental result = %s\n", sum_str);
            exit(EXIT_FAILURE);
        }
    }

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
    // printf("Trying to run benchmarking test\n");

    // open the perf file
    gzFile timespec_file, rdtsc_file, cputime_file;

    char rdtsc_filename[100];
    char test_filename[100];
    char timespec_filename[100];
    char cputime_filename[100];

    switch (test_case)
    {
    case 0: // Random test cases
        // printf("Running random test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/random.csv.gz", NUM_BITS);

        break;
    case 1: // Equal test cases
        // printf("Running equal test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/equal.csv.gz", NUM_BITS);

        break;
    case 2: // Greater test cases
        // printf("Running greater test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/greater.csv.gz", NUM_BITS);

        break;
    case 3: // Smaller test cases
        // printf("Running smaller test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
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
    int iter_count = 0;
    // printf("Running %d iterations...\n", ITERATIONS / ITERATIONS);
    for (int iter_count = 0; iter_count < (ITERATIONS / ITERATIONS); ++iter_count)
    {
        int i = rand() % ITERATIONS;
        // printf("Iteration %d, reading test case %d\n", iter_count, i);
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

        // printf("Starting addition\n");

        double time_taken;

        // clear cache before each test case
        size_t a_size = mpz_size(a) * sizeof(mp_limb_t);
        size_t b_size = mpz_size(b) * sizeof(mp_limb_t);

        for (size_t i = 0; i < a_size; i += 64) // 64 bytes is the typical cache line size
        {
            _mm_clflush((char *)a->_mp_d + i);
        }

        for (size_t i = 0; i < b_size; i += 64) // 64 bytes is the typical cache line size
        {
            _mm_clflush((char *)b->_mp_d + i);
        }
        // Ensure that the cache flush operations are completed
        _mm_mfence();
        // Ensure the flush is completed
        int cpu_info[4], decimals;
        unsigned long long int t0, t1;
        int niter;
        double f, ops_per_sec, time_taken_ms;

        switch (measure_type)
        {
        case 0:             // RDTSC
            time_taken = 0; // initialize time taken
            // printf("Calibrating CPU speed using RDTSC...\n");
            fflush(stdout);
            // interrupt
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

            TIME_RDTSC(time_taken, mpz_sub(result_gmp, a, b));
            // printf("done\n");
            printf("Execution time: %.1f ns\n", time_taken * 1000);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            // printf("Adding %d times\n", niter);
            fflush(stdout);

            t0 = measure_rdtsc_start();
            for (int i = 0; i < niter; i++)
            {
                mpz_sub(result_gmp, a, b);
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

            printf("Throughput: %.*f OP/s\n", decimals, ops_per_sec);

            break;
        case 1:             // Timespec
            time_taken = 0; // initialize time taken
            // printf("Calibrating CPU speed using timespec...\n");
            fflush(stdout);
            // interrupt
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

            TIME_TIMESPEC(time_taken, mpz_sub(result_gmp, a, b));

            // printf("done\n");
            printf("Execution time: %.1f ns\n", time_taken * 1000);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            // printf("Adding %d times\n", niter);
            fflush(stdout);

            struct timespec ts_0, ts_1;
            ts_0 = get_timespec();
            for (int i = 0; i < niter; i++)
            {
                mpz_sub(result_gmp, a, b);
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

            printf("Throughput: %.*f OP/s\n", decimals, ops_per_sec);
            break;
        case 2:             // Rusage
            time_taken = 0; // initialize time taken
            // printf("Calibrating CPU speed using rusage...\n");
            fflush(stdout);

            // interrupt
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

            // calibrate the time
            TIME_RUSAGE(time_taken, mpz_sub(result_gmp, a, b));

            // printf("done\n");

            printf("Execution time: %.1f ns\n", time_taken * 1000);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            // printf("Adding %d times\n", niter);
            fflush(stdout);

            t0 = cputime();
            for (int i = 0; i < niter; i++)
            {
                mpz_sub(result_gmp, a, b);
            }
            t1 = cputime() - t0;
            // printf("done!\n");

            // Convert t1 from microseconds to seconds for the ops_per_sec calculation
            ops_per_sec = (1e6 * niter) / t1;
            f = 100.0;

            for (decimals = 0;; decimals++)
            {
                if (ops_per_sec > f)
                    break;
                f = f * 0.1;
            }

            printf("Throughput: %.*f operations per second\n", decimals, ops_per_sec);
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