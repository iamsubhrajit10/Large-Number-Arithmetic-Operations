/*
 This program computes subtraction of two numbers using our optimized subtraction, with the test cases for the same.
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
#include "timing_utils.h"
#include "limb_utils.h"
#include "perf_utils.h"

#define ITERATIONS 100000 // Number of iterations for each test

int CORE_NO; // Core number to run the tests on

int NUM_BITS; // Number of bits for the numbers

// Function prototypes
void run_benchmarking_test(int, int); // Function to run the benchmarking tests
void run_correctness_test(int);

#define __SUB_N_4(result, a, b, b_out)       \
    do                                       \
    {                                        \
        for (int i = 3; i >= 0; --i)         \
        {                                    \
            result[i] = a[i] - b[i] - b_out; \
            b_out = 0;                       \
            if (b[i] > a[i])                 \
            {                                \
                b_out = 1;                   \
            }                                \
        }                                    \
    } while (0)

#define __SUB_N_8(result, a, b, b_in, b_out) \
    do                                       \
    {                                        \
        for (int j = 7; j >= 0; --j)         \
        {                                    \
            result[j] = a[j] - b[j] - b_in;  \
            b_in = (b[j] > a[j]);            \
        }                                    \
        b_out = b_in;                        \
    } while (0)

/**
 * @brief Subtracts two numbers represented as limb_t, and stores the sum in result.
 * @brief Subtracts from the least significant limb to the most significant limb.
 * @brief Being 52-bit format, total 5 limbs are required to store 256-bit number.
 * @brief Handles the last limb first, then the remaining limbs at once.
 * @param result The result of the subtraction
 * @param a The first number to subtract
 * @param b The second number to subtract
 * @return none
 */
void limb_t_sub_n_256(limb_t *result, limb_t *a, limb_t *b)
{
    // swap a and b if a < b
    int i = 0;
    do
    {
        if (likely(a->limbs[i] > b->limbs[i]))
        {
            break;
        }
        else if (a->limbs[i] < b->limbs[i])
        {
            limb_t *temp = a;
            a = b;
            b = temp;
            result->sign = 1;
            break;
        }
        ++i;
        if (unlikely(i == 4))
        {
            // a and b are equal
            result->size = 1;
            result->limbs[0] = 0;
            return;
        }
    } while (i);
    __mmask16 b_in = 0, b_out = 0;
    __SUB_N_4((result->limbs), (a->limbs), (b->limbs), b_out);
}

void __sub_n(limb_t *result, limb_t *x, limb_t *y)
{
    int n = x->size;
    // swap x and y if x < y
    int i = 0;
    do
    {
        if (likely(x->limbs[i] > y->limbs[i]))
        {
            break;
        }
        else if (x->limbs[i] < y->limbs[i])
        {
            limb_t *temp = x;
            x = y;
            y = temp;
            result->sign = 1;
            break;
        }
        ++i;
        if (unlikely(i == n))
        {
            // a and b are equal
            result->size = 1;
            result->limbs[0] = 0;
            return;
        }
    } while (1);

    uint64_t *res_ptr = result->limbs;
    uint64_t *x_ptr = x->limbs;
    uint64_t *y_ptr = y->limbs;

    __mmask16 b_in = 0, b_out = 0;
    for (int i = n - 8; i >= 0; i -= 8)
    {
        __SUB_N_8((res_ptr + i), (x_ptr + i), (y_ptr + i), b_in, b_out);
        b_in = b_out;
    }
}

void limb_t_sub_n(limb_t *result, limb_t *a, limb_t *b)
{
    int n = a->size;

    if (n <= 4)
    {
        limb_t_sub_n_256(result, a, b);
    }
    else
    {
        __sub_n(result, a, b);
    }
}

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

    init_memory_pool();
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

    destroy_memory_pool();

    return 0;
}

void run_perf_test()
{
    // printf("Running perf test\n");
    char test_filename[100];
    snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/random.csv.gz", NUM_BITS);
    // open the test file
    gzFile test_file = open_gzfile(test_filename, "rb");
    // skip the first line, header
    skip_first_line(test_file);
    // Read random test case number
    // seed the random number generator
    srand(time(NULL));
    int i = rand() % ITERATIONS;
    // printf("Iteration %d, reading test case %d\n", 0, i);
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

    limb_t *s = limb_t_alloc(n);
    limb_t_sub_n(s, a, b);
    // perf variables
    initialize_perf();

    // perf overhead
    start_perf();

    stop_perf();
    long long values_overhead[MAX_EVENTS];
    read_perf(values_overhead);
    // printf("Perf overhead: \n");
    // write the perf values to file
    // write_perf(stdout, values_overhead);

    // clear cache content for a_limbs, b_limbs
    for (int i = 0; i < n; i += 64)
    {
        _mm_clflush((char *)a + i);
        _mm_clflush((char *)b + i);
    }

    // Ensure that the cache flush operations are completed
    _mm_mfence();

    // printf("Starting perf test\n");
    start_perf();
    // Start the perf test
    limb_t_sub_n(s, a, b);
    stop_perf();
    long long values[MAX_EVENTS];
    read_perf(values);

    // close the test file

    // print user instructions (values[1] - values_overhead[1]), L1D Cache Miss % (values[4] - values_overhead[4])/(values[5] - values_overhead[5])*100
    printf("User instructions: %lld\n", values[0] - values_overhead[0]);
    // printf("L1D Cache Reads: %lld\n", (values[4] - values_overhead[4]));
    // printf("L1D Cache Misses: %lld\n", (values[5] - values_overhead[5]));
    // printf("L1D Cache Miss %: %f\n", ((double)(values[5] - values_overhead[5]) / (double)(values[4] - values_overhead[4])) * 100);

    // start measuring RDTSC Ticks
    double t;
    RECORD_RDTSC(t, limb_t_sub_n(s, a, b));

    printf("Avg. RDTSC Ticks: %f\n", t);

    // close the test file
    gzclose(test_file);
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

        int n_1 = strlen(a_str);
        int n_2 = strlen(b_str);

        // convert a and b into limbs
        limb_t *a, *b;
        a = limb_set_str(a_str);
        b = limb_set_str(b_str);

        // adjust the sizes of a and b
        limb_t_adjust_limb_sizes(a, b);
        int n = a->size;

        limb_t *s = limb_t_alloc(n);

        /***** Start of addition *****/

        limb_t_sub_n(s, a, b);

        /***** End of addition *****/

        char *sum_str = limb_get_str(s);
        int str_len = strlen(sum_str);

        // verify the converted string with result
        if (!check_result(sum_str, result_str, str_len))
        {
            printf("Test case failed, at iteration %d\n", i);
            exit(EXIT_FAILURE);
        }
        limb_t_free(a);
        limb_t_free(b);
        limb_t_free(s);
    }
    // switch (test_case)
    // {
    // case 0:
    //     printf("Random test cases passed for bit-size %d\n", NUM_BITS);
    //     break;
    // case 1:
    //     printf("Equal test cases passed for bit-size %d\n", NUM_BITS);
    //     break;
    // case 2:
    //     printf("Greater test cases passed for bit-size %d\n", NUM_BITS);
    //     break;
    // case 3:
    //     printf("Smaller test cases passed for bit-size %d\n", NUM_BITS);
    //     break;
    // }
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

        limb_t *a, *b;
        a = limb_set_str(a_str);
        b = limb_set_str(b_str);

        // adjust the sizes of a and b
        limb_t_adjust_limb_sizes(a, b);
        int n = a->size;

        limb_t *s = limb_t_alloc(n);

        // printf("Starting addition\n");
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

            // printf("Calibrating CPU speed using RDTSC...\n");
            fflush(stdout);
            // interrupt
            __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

            TIME_RDTSC(time_taken, limb_t_sub_n(s, a, b));
            // printf("done\n");
            printf("Execution time: %.1f ns\n", time_taken * 1000);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            // printf("Adding %lld times\n", niter);
            fflush(stdout);

            t0 = measure_rdtsc_start();
            for (int i = 0; i < niter; i++)
            {
                limb_t_sub_n(s, a, b);
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

            TIME_TIMESPEC(time_taken, limb_t_sub_n(s, a, b));

            // printf("done\n");
            printf("Execution time: %.1f ns\n", time_taken * 1000);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            // printf("Adding %lld times\n", niter);
            fflush(stdout);

            struct timespec ts_0, ts_1;
            ts_0 = get_timespec();
            for (int i = 0; i < niter; i++)
            {
                limb_t_sub_n(s, a, b);
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
            TIME_RUSAGE(time_taken, limb_t_sub_n(s, a, b));

            // printf("done\n");

            printf("Execution time: %.1f ns\n", time_taken * 1000);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            // printf("Adding %lld times\n", niter);
            fflush(stdout);

            t0 = cputime();
            for (int i = 0; i < niter; i++)
            {
                limb_t_sub_n(s, a, b);
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

            printf("Throughput: %.*f OP/s\n", decimals, ops_per_sec);
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