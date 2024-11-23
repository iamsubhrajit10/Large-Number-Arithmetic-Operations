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

int CORE_NO; // Core number to run the tests on

int NUM_BITS; // Number of bits for the numbers

// Function prototypes
void run_benchmarking_test(int, int); // Function to run the benchmarking tests
void run_correctness_test(int);

inline void limb_mul_n(limb_t *mul, limb_t *a, limb_t *b) __attribute__((always_inline));

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

    run_correctness_test(test_case);
    // run_benchmarking_test(test_case, measure_type);

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
        limb_t *a, *b, *mul;
        a = limb_set_str(a_str);
        b = limb_set_str(b_str);

        // Adjust the sizes of the two numbers
        limb_t_adjust_limb_sizes(a, b);

        // Get the number of limbs
        int n = a->size;

        /***** Start of multiplication *****/
        limb_mul_n(mul, a, b);

        /***** End of multiplication *****/

        char *mul_str = limb_get_str(mul);
        // sum_size = strlen(sum_str);

        // verify the converted string with result
        if (!check_result(mul_str, result_str, mul->size))
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

// /*
//   Does the following for measuring the time taken for multiplication:
//     1. read the test cases from the file
//     2. path: ../test/cases/<num_bits>/<test_case>.csv.gz
//     3. starts measuring the time wtih one of the three methods: RDTSC, timespec, rusage
//        a. measure_type = 0: RDTSC
//        b. measure_type = 1: timespec
//        c. measure_type = 2: rusage
//     4. writes the time taken to the file: experiments/results/<measure_type>/<test_case>_<num_bits>_<core_no>.csv.gz
// */
// void run_benchmarking_test(int test_case, int measure_type)
// {
//     printf("Trying to run benchmarking test\n");
//     // Create directories for the results
//     create_directory("experiments/results");
//     // open the perf file
//     gzFile timespec_file, rdtsc_file, cputime_file;
//     switch (measure_type)
//     {
//     case 0: // RDTSC
//         printf("Running the tests with RDTSC measurements\n");
//         create_directory("experiments/results/rdtsc_measurements");
//         break;
//     case 1: // Timespec gettime()
//         printf("Running the tests with timespec measurements\n");
//         create_directory("experiments/results/timespec_measurements");
//         break;
//     case 2: // CPU time, rusage
//         printf("Running the tests with rusage measurements\n");
//         create_directory("experiments/results/cputime_measurements");
//         break;
//     default:
//         printf("Invalid measure type\n");
//         exit(EXIT_FAILURE);
//     }

//     char rdtsc_filename[100];
//     char test_filename[100];
//     char timespec_filename[100];
//     char cputime_filename[100];

//     switch (test_case)
//     {
//     case 0: // Random test cases
//         printf("Running random test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
//         snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/random.csv.gz", NUM_BITS);
//         if (measure_type == 0) // RDTSC
//         {
//             snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             rdtsc_file = open_gzfile(rdtsc_filename, "wb");
//             if (rdtsc_file == NULL)
//             {
//                 perror("Error opening rdtsc file");
//                 exit(EXIT_FAILURE);
//             }
//             break;
//         }
//         else if (measure_type == 1) // Timespec
//         {
//             snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             timespec_file = open_gzfile(timespec_filename, "wb");
//             if (timespec_file == NULL)
//             {
//                 perror("Error opening timespec file");
//                 exit(EXIT_FAILURE);
//             }
//             break;
//         }
//         else if (measure_type == 2) // rusage
//         {
//             snprintf(cputime_filename, sizeof(cputime_filename), "experiments/results/cputime_measurements/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             cputime_file = open_gzfile(cputime_filename, "wb");
//             if (cputime_file == NULL)
//             {
//                 perror("Error opening cputime file");
//                 exit(EXIT_FAILURE);
//             }
//             break;
//         }
//         break;
//     case 1: // Equal test cases
//         printf("Running equal test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
//         snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/equal.csv.gz", NUM_BITS);
//         if (measure_type == 0) // RDTSC
//         {
//             snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             rdtsc_file = open_gzfile(rdtsc_filename, "wb");
//             if (rdtsc_file == NULL)
//             {
//                 perror("Error opening rdtsc file");
//                 exit(EXIT_FAILURE);
//             }
//             break;
//         }
//         else if (measure_type == 1) // Timespec
//         {
//             snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             timespec_file = open_gzfile(timespec_filename, "wb");
//             if (timespec_file == NULL)
//             {
//                 perror("Error opening timespec file");
//                 exit(EXIT_FAILURE);
//             }
//             break;
//         }
//         else if (measure_type == 2) // rusage
//         {
//             snprintf(cputime_filename, sizeof(cputime_filename), "experiments/results/cputime_measurements/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             cputime_file = open_gzfile(cputime_filename, "wb");
//             if (cputime_file == NULL)
//             {
//                 perror("Error opening cputime file");
//                 exit(EXIT_FAILURE);
//             }
//             break;
//         }
//         break;
//     case 2: // Greater test cases
//         printf("Running greater test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
//         snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/greater.csv.gz", NUM_BITS);
//         if (measure_type == 0) // RDTSC
//         {
//             snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             rdtsc_file = open_gzfile(rdtsc_filename, "wb");
//             if (rdtsc_file == NULL)
//             {
//                 perror("Error opening rdtsc file");
//                 exit(EXIT_FAILURE);
//             }
//             break;
//         }
//         else if (measure_type == 1) // Timespec
//         {
//             snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             timespec_file = open_gzfile(timespec_filename, "wb");
//             if (timespec_file == NULL)
//             {
//                 perror("Error opening timespec file");
//                 exit(EXIT_FAILURE);
//             }
//             break;
//         }
//         else if (measure_type == 2) // rusage
//         {
//             snprintf(cputime_filename, sizeof(cputime_filename), "experiments/results/cputime_measurements/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             cputime_file = open_gzfile(cputime_filename, "wb");
//             if (cputime_file == NULL)
//             {
//                 perror("Error opening cputime file");
//                 exit(EXIT_FAILURE);
//             }
//             break;
//         }
//         break;
//     case 3: // Smaller test cases
//         printf("Running smaller test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
//         snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/smaller.csv.gz", NUM_BITS);
//         if (measure_type == 0) // RDTSC
//         {
//             snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             rdtsc_file = open_gzfile(rdtsc_filename, "wb");
//             if (rdtsc_file == NULL)
//             {
//                 perror("Error opening rdtsc file");
//                 exit(EXIT_FAILURE);
//             }
//         }
//         else if (measure_type == 1) // Timespec
//         {
//             snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             timespec_file = open_gzfile(timespec_filename, "wb");
//             if (timespec_file == NULL)
//             {
//                 perror("Error opening timespec file");
//                 exit(EXIT_FAILURE);
//             }
//         }
//         else if (measure_type == 2) // rusage
//         {
//             snprintf(cputime_filename, sizeof(cputime_filename), "experiments/results/cputime_measurements/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
//             cputime_file = open_gzfile(cputime_filename, "wb");
//             if (cputime_file == NULL)
//             {
//                 perror("Error opening cputime file");
//                 exit(EXIT_FAILURE);
//             }
//         }

//         break;
//     default:
//         printf("Invalid test case\n");
//         exit(EXIT_FAILURE);
//     }

//     // open the test file
//     gzFile test_file = open_gzfile(test_filename, "rb");

//     // skip the first line, header
//     skip_first_line(test_file);

//     // pick a random i from 0 to ITERATIONS-1; keep it as random as possible
//     unsigned long seed = generate_seed();
//     srand(seed);
//     int iter_count = 0;
//     printf("Running %d iterations...\n", ITERATIONS / ITERATIONS);
//     for (int iter_count = 0; iter_count < (ITERATIONS / ITERATIONS); ++iter_count)
//     {
//         int i = rand() % ITERATIONS;
//         printf("Iteration %d, reading test case %d\n", iter_count, i);
//         // buffer to read the test case
//         char buffer[CHUNK];
//         // reset the file pointer to the beginning of the file
//         gzrewind(test_file);
//         // skip the first line, header
//         skip_first_line(test_file);
//         // read ith line from the test_file
//         for (int j = 0; j < i; j++)
//         {
//             // flush the buffer
//             memset(buffer, 0, CHUNK);
//             if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
//             {
//                 if (gzeof(test_file))
//                 {
//                     return; // End of file reached
//                 }
//                 else
//                 {
//                     perror("Error reading line");
//                     gzclose(test_file);
//                     exit(EXIT_FAILURE);
//                 }
//             }
//         }

//         // Parse the test case
//         char *a_str = strtok(buffer, ",");
//         char *b_str = strtok(NULL, ",");
//         char *result_str = strtok(NULL, ",");

//         if (a_str == NULL || b_str == NULL || result_str == NULL)
//         {
//             fprintf(stderr, "Error parsing line: %s\n", buffer);
//             gzclose(test_file);
//             exit(EXIT_FAILURE);
//         }

//         int n_1 = strlen(a_str);
//         int n_2 = strlen(b_str);

//         // convert a and b into limbs
//         aligned_uint64_ptr a, b;
//         limb_set_str(a_str, b_str, &a, &b, &n_1, &n_2);
//         int n = n_1;

//         // allocate from scratch space
//         aligned_uint64_ptr sum = sum_space + sum_space_ptr;
//         size_t sum_size = n;
//         sum_space_ptr += (sum_size + 7) & ~7;
//         carry_space_ptr += (n + 7) & ~7;

//         printf("Starting multiplication\n");
//         int cpu_info[4], decimals;
//         unsigned long long int t0, t1;
//         int niter;
//         double f, ops_per_sec, time_taken_ms, time_taken;
//         // clear cache content for a_limbs, b_limbs
//         for (int i = 0; i < n; i += 64)
//         {
//             _mm_clflush((char *)a + i);
//             _mm_clflush((char *)b + i);
//         }

//         // Ensure that the cache flush operations are completed
//         _mm_mfence();

//         switch (measure_type)
//         {
//         case 0:             // RDTSC
//             time_taken = 0; // initialize time taken
//             printf("Calibrating CPU speed using RDTSC...\n");
//             fflush(stdout);
//             // interrupt
//             __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

//             TIME_RDTSC(time_taken, limb_mul_n(a, b, &sum, n));
//             printf("done\n");
//             printf("Calibrated time: %f microseconds\n", time_taken);

//             niter = 1 + (unsigned long)(1e7 / time_taken);
//             printf("multiplying %d times\n", niter);
//             fflush(stdout);

//             t0 = measure_rdtsc_start();
//             for (int i = 0; i < niter; i++)
//             {
//                 bool extra_digit = limb_mul_n(a, b, &sum, n);
//                 if (extra_digit)
//                 {
//                     // shift the sum by one digit to the right
//                     memmove(sum + 1, sum, n * sizeof(uint64_t));
//                     sum[0] = 1;
//                     sum_size++;
//                 }
//             }
//             t1 = measure_rdtscp_end();
//             t1 = t1 - t0;

//             // coverting ticks to microsecond: 1 tick = 1/2.8 GHz = 0.357 ns = 0.000357 us
//             time_taken = t1 * 0.000357;
//             ops_per_sec = (1e6 * niter) / time_taken;
//             f = 100.0;

//             for (decimals = 0;; decimals++)
//             {
//                 if (ops_per_sec > f)
//                     break;
//                 f = f * 0.1;
//             }

//             printf("RESULT: %.*f operations per second\n", decimals, ops_per_sec);

//             break;
//         case 1:             // Timespec
//             time_taken = 0; // initialize time taken
//             printf("Calibrating CPU speed using timespec...\n");
//             fflush(stdout);
//             // interrupt
//             __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

//             TIME_TIMESPEC(time_taken, limb_mul_n(a, b, &sum, n));

//             printf("done\n");
//             printf("Calibrated time: %f microseconds\n", time_taken);

//             niter = 1 + (unsigned long)(1e7 / time_taken);
//             printf("multiplying %d times\n", niter);
//             fflush(stdout);

//             struct timespec ts_0, ts_1;
//             ts_0 = get_timespec();
//             for (int i = 0; i < niter; i++)
//             {
//                 bool extra_digit = limb_mul_n(a, b, &sum, n);
//                 if (extra_digit)
//                 {
//                     // shift the sum by one digit to the right
//                     memmove(sum + 1, sum, n * sizeof(uint64_t));
//                     sum[0] = 1;
//                     sum_size++;
//                 }
//             }
//             ts_1 = get_timespec();
//             t1 = diff_timespec_us(ts_0, ts_1);

//             // Convert t1 from microseconds to seconds for the ops_per_sec calculation
//             ops_per_sec = (1e6 * niter) / t1;
//             f = 100.0;

//             for (decimals = 0;; decimals++)
//             {
//                 if (ops_per_sec > f)
//                     break;
//                 f = f * 0.1;
//             }

//             printf("RESULT: %.*f operations per second\n", decimals, ops_per_sec);
//             break;
//         case 2:             // Rusage
//             time_taken = 0; // initialize time taken
//             printf("Calibrating CPU speed using rusage...\n");
//             fflush(stdout);

//             // interrupt
//             __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

//             // calibrate the time
//             TIME_RUSAGE(time_taken, limb_mul_n(a, b, &sum, n));

//             printf("done\n");

//             printf("Calibrated time: %f microseconds\n", time_taken);

//             niter = 1 + (unsigned long)(1e7 / time_taken);
//             printf("multiplying %d times\n", niter);
//             fflush(stdout);

//             t0 = cputime();
//             for (int i = 0; i < niter; i++)
//             {
//                 bool extra_digit = limb_mul_n(a, b, &sum, n);
//                 if (extra_digit)
//                 {
//                     // shift the sum by one digit to the right
//                     memmove(sum + 1, sum, n * sizeof(uint64_t));
//                     sum[0] = 1;
//                     sum_size++;
//                 }
//             }
//             t1 = cputime() - t0;
//             printf("done!\n");

//             // Convert t1 from microseconds to seconds for the ops_per_sec calculation
//             ops_per_sec = (1e6 * niter) / t1;
//             f = 100.0;

//             for (decimals = 0;; decimals++)
//             {
//                 if (ops_per_sec > f)
//                     break;
//                 f = f * 0.1;
//             }

//             printf("RESULT: %.*f operations per second\n", decimals, ops_per_sec);
//             break;
//         default:
//             printf("Invalid measure type\n");
//             exit(EXIT_FAILURE);
//         }
//     }
//     // close the test file
//     gzclose(test_file);

//     // close the benchmarking file
//     if (measure_type == 0)
//     {
//         gzclose(rdtsc_file);
//     }
//     else if (measure_type == 1)
//     {
//         gzclose(timespec_file);
//     }
//     else if (measure_type == 2)
//     {
//         gzclose(cputime_file);
//     }
// }