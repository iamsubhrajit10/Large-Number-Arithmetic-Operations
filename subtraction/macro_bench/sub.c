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
#include "myutils.h"
#include "limb_utils.h"
#include "perf_utils.h"

#define ITERATIONS 100000 // Number of iterations for each test

int CORE_NO; // Core number to run the tests on

int NUM_BITS; // Number of bits for the numbers

extern __m512i AVX512_ZEROS; // AVX512 vector of zeros
extern __m256i AVX256_ZEROS; // AVX256 vector of zeros
extern __m128i AVX128_ZEROS; // AVX128 vector of zeros
extern __m512i AVX512_MASK;  // AVX512 vector of 64-bit mask
extern __m256i AVX256_MASK;  // AVX256 vector of 64-bit mask
extern __m128i AVX128_MASK;  // AVX128 vector of 64-bit mask

// Function prototypes
void run_benchmarking_test(int, int); // Function to run the benchmarking tests
void run_correctness_test(int);
void run_macro_bench_test(int);

/*
 * @brief Subtracts two four-limbed numbers, using 256-bit vectors
 * @param result The result of the subtraction
 * @param a The first number to subtract
 * @param b The second number to subtract
 * @param b_in The borrow-in generated from the previous subtraction
 * @param b_out The borrow-out generated from the subtraction
 * @return none
 */
#define __SUB_N_4(result, a, b, b_in, b_out)                                           \
    do                                                                                 \
    {                                                                                  \
        __m256i a_vec = _mm256_load_si256((__m256i *)(a));                             \
        __m256i b_vec = _mm256_load_si256((__m256i *)(b));                             \
        __m256i result_vec = _mm256_sub_epi64(a_vec, b_vec);                           \
        __mmask8 borrow_mask = _mm256_cmpgt_epu64_mask(b_vec, a_vec);                  \
        *(b_out) = borrow_mask & 1;                                                    \
        borrow_mask |= ((*b_in) << 4);                                                 \
        bool borrow_detect = !!borrow_mask;                                            \
        borrow_mask >>= 1;                                                             \
        __mmask8 mask_1;                                                               \
        if (borrow_detect)                                                             \
        {                                                                              \
            __m256i borrow_vec = _mm256_mask_set1_epi64(AVX256_ZEROS, borrow_mask, 1); \
            __m256i result_vec_new = _mm256_sub_epi64(result_vec, borrow_vec);         \
            mask_1 = _mm256_cmpgt_epu64_mask(result_vec_new, result_vec);              \
            *(b_out) = (mask_1 & 0b1) | *(b_out);                                      \
            result_vec = result_vec_new;                                               \
            if (unlikely(mask_1 & 254))                                                \
            {                                                                          \
                printf("mask_1: %d\n", mask_1);                                        \
                mask_1 >>= 1;                                                          \
                _mm256_store_si256((__m256i *)(result), result_vec);                   \
                for (int i = 6; i >= 0; i--)                                           \
                {                                                                      \
                    if (mask_1 >> i)                                                   \
                    {                                                                  \
                        result[i] -= 1;                                                \
                        if (result[i] == -1)                                           \
                        {                                                              \
                            mask_1 |= (1 << (i - 1));                                  \
                        }                                                              \
                    }                                                                  \
                }                                                                      \
                break;                                                                 \
            }                                                                          \
        }                                                                              \
        _mm256_store_si256((__m256i *)(result), result_vec);                           \
    } while (0)

/*
 * @brief Subtracts two eight-limbed numbers, using 512-bit vectors
 * @param result The result of the subtraction
 * @param a The first number to subtract
 * @param b The second number to subtract
 * @param b_in The borrow-in generated from the previous subtraction
 * @param b_out The borrow-out generated from the subtraction
 * @return none
 */
#define __SUB_N_8(result, a, b, b_in, b_out)                                           \
    do                                                                                 \
    {                                                                                  \
        __m512i a_vec = _mm512_load_si512((__m512i *)(a));                             \
        __m512i b_vec = _mm512_load_si512((__m512i *)(b));                             \
        __m512i result_vec = _mm512_sub_epi64(a_vec, b_vec);                           \
        __mmask8 borrow_mask = _mm512_cmpgt_epu64_mask(b_vec, a_vec);                  \
        (*b_out) = borrow_mask & 1;                                                    \
        borrow_mask >>= 1;                                                             \
        borrow_mask |= ((*b_in) << 7);                                                 \
        bool borrow_detect = !!borrow_mask;                                            \
        __mmask8 mask_1;                                                               \
        if (borrow_detect)                                                             \
        {                                                                              \
            __m512i borrow_vec = _mm512_mask_set1_epi64(AVX512_ZEROS, borrow_mask, 1); \
            __m512i result_vec_new = _mm512_sub_epi64(result_vec, borrow_vec);         \
            mask_1 = _mm512_cmpgt_epu64_mask(result_vec_new, result_vec);              \
            *(b_out) = (mask_1 & 0b1) | *(b_out);                                      \
            result_vec = result_vec_new;                                               \
            if (unlikely(mask_1 & 254))                                                \
            {                                                                          \
                mask_1 >>= 1;                                                          \
                _mm512_store_si512((__m512i *)(result), result_vec);                   \
                for (int i = 6; i >= 0; i--)                                           \
                {                                                                      \
                    if (mask_1 >> i)                                                   \
                    {                                                                  \
                        result[i] -= 1;                                                \
                        if (result[i] == -1)                                           \
                        {                                                              \
                            mask_1 |= (1 << (i - 1));                                  \
                        }                                                              \
                    }                                                                  \
                }                                                                      \
                break;                                                                 \
            }                                                                          \
        }                                                                              \
        _mm512_store_si512((__m512i *)(result), result_vec);                           \
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
    int b_in = 0, b_out = 0;
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
    __SUB_N_4((result->limbs), (a->limbs), (b->limbs), &b_in, &b_out);
}

void __sub_n(limb_t *result, limb_t *x, limb_t *y)
{
    int b_in = 0, b_out = 0;
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

    for (int i = n - 8; i >= 0; i -= 8)
    {
        __SUB_N_8((res_ptr + i), (x_ptr + i), (y_ptr + i), &b_in, &b_out);
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
        // run_perf_test();
        break;
    default:
        printf("Invalid type of measure\n");
        exit(EXIT_FAILURE);
    }

    destroy_memory_pool();

    return 0;
}

void run_correctness_test(int test_case)
{
    printf("Trying to run correctness test\n");
    // Create directories for the results
    create_directory("experiments/results");

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

    // Step 1: Open the test file
    gzFile test_file = open_gzfile(test_filename, "rb");
    if (test_file == NULL)
    {
        perror("Error opening test file");
        exit(EXIT_FAILURE);
    }

    // Skip the first line (header)
    skip_first_line(test_file);

    // Step 2: Allocate arrays to store test cases
    printf("Loading test cases...\n");
    limb_t **operands_a = (limb_t **)malloc(ITERATIONS * sizeof(limb_t *));
    limb_t **operands_b = (limb_t **)malloc(ITERATIONS * sizeof(limb_t *));
    char **expected_results = (char **)malloc(ITERATIONS * sizeof(char *));
    int actual_iterations = 0;

    // Step 3: Read all test cases into arrays
    for (int i = 0; i < 1000; i++)
    {
        char buffer[CHUNK];
        memset(buffer, 0, CHUNK);

        if (gzgets(test_file, buffer, sizeof(buffer)) == NULL)
        {
            if (gzeof(test_file))
            {
                break; // End of file reached
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
            continue;
        }

        // Store operands and expected result
        operands_a[i] = limb_set_str(a_str);
        operands_b[i] = limb_set_str(b_str);
        expected_results[i] = strdup(result_str);

        // Adjust sizes of a and b
        limb_t_adjust_limb_sizes(operands_a[i], operands_b[i]);

        actual_iterations++;
    }

    gzclose(test_file);
    printf("Loaded %d test cases\n", actual_iterations);

    // Step 4: Allocate an array for results
    limb_t **results = (limb_t **)malloc(actual_iterations * sizeof(limb_t *));
    for (int i = 0; i < actual_iterations; i++)
    {
        results[i] = limb_t_alloc(operands_a[i]->size);
    }

    // Step 5: Process all subtractions
    printf("Performing subtraction operations...\n");
    fflush(stdout); // Flush stdout to ensure all output is printed
    _mm_mfence();   // Ensure all previous operations are completed
    long double t0 = cputime();
    for (int j = 0; j < 1000; ++j)
    {
        for (int i = 0; i < actual_iterations; ++i)
        {
            limb_t_sub_n(operands_a[i], operands_b[i], results[i]);
        }
    }
    long double t1 = cputime();
    printf("Time taken for %d subtractions: %.2Lf microseconds\n", actual_iterations, t1 - t0);
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

        limb_t *a, *b;
        a = limb_set_str(a_str);
        b = limb_set_str(b_str);

        // adjust the sizes of a and b
        limb_t_adjust_limb_sizes(a, b);
        int n = a->size;

        limb_t *s = limb_t_alloc(n);

        printf("Starting subtraction\n");
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

            TIME_RDTSC(time_taken, limb_t_sub_n(a, b, s));
            printf("done\n");
            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("Adding %lld times\n", niter);
            fflush(stdout);

            t0 = measure_rdtsc_start();
            for (int i = 0; i < niter; i++)
            {
                limb_t_sub_n(a, b, s);
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

            TIME_TIMESPEC(time_taken, limb_t_sub_n(a, b, s));

            printf("done\n");
            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("Adding %lld times\n", niter);
            fflush(stdout);

            struct timespec ts_0, ts_1;
            ts_0 = get_timespec();
            for (int i = 0; i < niter; i++)
            {
                limb_t_sub_n(a, b, s);
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
            TIME_RUSAGE(time_taken, limb_t_sub_n(a, b, s));

            printf("done\n");

            printf("Calibrated time: %f microseconds\n", time_taken);

            niter = 1 + (unsigned long)(1e7 / time_taken);
            printf("Adding %lld times\n", niter);
            fflush(stdout);

            t0 = cputime();
            for (int i = 0; i < niter; i++)
            {
                limb_t_sub_n(a, b, s);
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