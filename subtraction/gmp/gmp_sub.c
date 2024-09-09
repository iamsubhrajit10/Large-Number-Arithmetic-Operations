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
1. Equalize the length of both arrays by subing leading zeros to the smaller array.
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

#define MAX_EVENTS 6      // Number of events to monitor
#define LIMB_SIZE 19      // Number of digits in each limb
#define ITERATIONS 100000 // Number of iterations for each test
#define CHUNK 65536       // Chunk size for reading the file

int CORE_NO; // Core number to run the tests on

int NUM_BITS; // Number of bits for the numbers

// Function prototypes
void run_tests();       // Function to run the tests
void initialize_perf(); // Function to initialize the perf events
inline void warmup_rdtsc() __attribute__((always_inline));
inline unsigned long long measure_rdtsc_start() __attribute__((always_inline));
inline unsigned long long measure_rdtscp_end() __attribute__((always_inline));
inline bool check_result(char *result, char *result_gmp, int result_size) __attribute__((always_inline));

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

// perf_event_open system call
long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags)
{
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}

// main function with cmd arguments
int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        printf("Usage: %s <number of bits> <core number>\n", argv[0]);
        return 1;
    }

    assert(atoi(argv[1]) > 0);
    NUM_BITS = atoi(argv[1]);
    CORE_NO = atoi(argv[2]);

    run_tests();

    return 0;
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
            exit(EXIT_FAILURE);
        }
    }
}

void read_perf(long long values[])
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

void write_perf(gzFile file, long long values[])
{
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        gzprintf(file, "%llu,", values[j]);
    }
    gzprintf(file, "\n");
}

void start_perf()
{
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
        ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
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
        printf("Length of result = %ld, length of result_gmp = %ld\n", strlen(result), strlen(result_gmp));
        printf("result = %s\n result_gmp = %s\n", result, result_gmp);
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

void write_rdtsc(gzFile file, unsigned long long rdtsc)
{
    gzprintf(file, "%llu\n", rdtsc);
}

void run_tests()
{
    // read the test cases from the file
    // path: ../test/cases/<num_bits>/<test_case>.csv.gz
    // there are four test cases: random.csv.gz, equal.csv.gz, greater.csv.gz, smaller.csv.gz
    // first line contains a header: a, b, result
    // next line onwards contains the test cases, 100000 test cases
    // verify the results of the subtraction of a and b with the result

    // Create directories for the results
    create_directory("experiments/results");
    create_directory("experiments/perf_data");
    create_directory("experiments/rdtsc_data");

    unsigned long long start_rdtsc, end_rdtsc;
    unsigned long long total_rdtsc = 0;
    unsigned cycles_low, cycles_high, cycles_low1, cycles_high1;
    long long values[MAX_EVENTS];

    // open the perf events
    initialize_perf();

    // testcase: random.txt
    // Open the file for writing the perf experiment data
    char perf_filename_random[100];
    snprintf(perf_filename_random, sizeof(perf_filename_random), "experiments/perf_data/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
    gzFile perf_file_random = open_gzfile(perf_filename_random, "wb");

    // open file to write the rdtsc values
    char rdtsc_filename_random[100];
    snprintf(rdtsc_filename_random, sizeof(rdtsc_filename_random), "experiments/rdtsc_data/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
    gzFile rdtsc_file_random = open_gzfile(rdtsc_filename_random, "wb");

    char test_case[100];
    snprintf(test_case, sizeof(test_case), "../test/cases/%d/random.csv.gz", NUM_BITS);
    gzFile random_file = open_gzfile(test_case, "rb");

    // skip the first line, header
    skip_first_line(random_file);

    // Read ITERATIONS test cases
    char buffer[CHUNK];
    for (int i = 0; i < ITERATIONS; i++)
    {
        // Read the next line
        if (gzgets(random_file, buffer, sizeof(buffer)) == NULL)
        {
            if (gzeof(random_file))
            {
                break; // End of file reached
            }
            else
            {
                perror("Error reading line");
                gzclose(random_file);
                exit(EXIT_FAILURE);
            }
        }

        // Extract a, b, result from the line
        char *a_str = strtok(buffer, ",");
        char *b_str = strtok(NULL, ",");
        char *result_str = strtok(NULL, ",");
        if (a_str == NULL || b_str == NULL || result_str == NULL)
        {
            fprintf(stderr, "Error parsing line: %s\n", buffer);
            gzclose(random_file);
            exit(EXIT_FAILURE);
        }

        // convert the strings to mpz_t
        mpz_t a, b, result_gmp;
        mpz_init(a);
        mpz_init(b);

        // convert the strings to mpz_t
        mpz_set_str(a, a_str, 10);
        mpz_set_str(b, b_str, 10);

        // start the perf events
        start_perf();

        // warm up the rdtsc
        warmup_rdtsc();

        // measure the start rdtsc
        start_rdtsc = measure_rdtsc_start();

        // perform the subtraction
        mpz_sub(result_gmp, a, b);

        // measure the end rdtsc
        end_rdtsc = measure_rdtscp_end();

        // stop the perf events
        stop_perf();

        // read the values of the perf events
        read_perf(values);

        if (end_rdtsc < start_rdtsc)
        {
            perror("Error: RDTSC end time is less than start time\n");
            exit(EXIT_FAILURE);
        }
        // write the rdtsc values to the file
        write_rdtsc(rdtsc_file_random, end_rdtsc - start_rdtsc);

        total_rdtsc += (end_rdtsc - start_rdtsc);

        // write the perf events to the file
        write_perf(perf_file_random, values);

        // convert the result into a string
        char *sub_str = mpz_get_str(NULL, 10, result_gmp);
        int sub_size = strlen(sub_str);

        // verify the converted string with result
        if (!check_result(sub_str, result_str, sub_size))
        {
            printf("Test case failed\n");
            printf("a = %s, b = %s, result = %s\n", a_str, b_str, result_str);
            printf("Subtraction result = %s\n", sub_str);
            exit(EXIT_FAILURE);
        }
    }
    printf("Random test cases passed\n");
    printf("Total RDTSC cycles: %llu\n", total_rdtsc);
    gzclose(perf_file_random);
    gzclose(rdtsc_file_random);
    gzclose(random_file);

    // testcase: equal.txt
    // Open the file for writing the perf experiment data
    char perf_filename_equal[100];
    snprintf(perf_filename_equal, sizeof(perf_filename_equal), "experiments/perf_data/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
    gzFile perf_file_equal = open_gzfile(perf_filename_equal, "wb");

    // open file to write the rdtsc values
    char rdtsc_filename_equal[100];
    snprintf(rdtsc_filename_equal, sizeof(rdtsc_filename_equal), "experiments/rdtsc_data/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
    gzFile rdtsc_file_equal = open_gzfile(rdtsc_filename_equal, "wb");

    snprintf(test_case, sizeof(test_case), "../test/cases/%d/equal.csv.gz", NUM_BITS);
    gzFile equal_file = open_gzfile(test_case, "rb");

    // skip the first line, header
    skip_first_line(equal_file);

    // Read ITERATIONS test cases
    total_rdtsc = 0;
    for (int i = 0; i < ITERATIONS; i++)
    {
        // Read the next line
        if (gzgets(equal_file, buffer, sizeof(buffer)) == NULL)
        {
            if (gzeof(equal_file))
            {
                break; // End of file reached
            }
            else
            {
                perror("Error reading line");
                gzclose(equal_file);
                exit(EXIT_FAILURE);
            }
        }

        // Extract a, b, result from the line
        char *a_str = strtok(buffer, ",");
        char *b_str = strtok(NULL, ",");
        char *result_str = strtok(NULL, ",");
        if (a_str == NULL || b_str == NULL || result_str == NULL)
        {
            fprintf(stderr, "Error parsing line: %s\n", buffer);
            gzclose(equal_file);
            exit(EXIT_FAILURE);
        }

        // convert the strings to mpz_t
        mpz_t a, b, result_gmp;
        mpz_init(a);
        mpz_init(b);

        // convert the strings to mpz_t
        mpz_set_str(a, a_str, 10);
        mpz_set_str(b, b_str, 10);

        // start the perf events
        start_perf();

        // warm up the rdtsc
        warmup_rdtsc();

        // measure the start rdtsc
        start_rdtsc = measure_rdtsc_start();

        // perform the subtraction
        mpz_sub(result_gmp, a, b);

        // measure the end rdtsc
        end_rdtsc = measure_rdtscp_end();

        // stop the perf events
        stop_perf();

        // read the values of the perf events
        read_perf(values);

        if (end_rdtsc < start_rdtsc)
        {
            perror("Error: RDTSC end time is less than start time\n");
            exit(EXIT_FAILURE);
        }
        // write the rdtsc values to the file
        write_rdtsc(rdtsc_file_equal, end_rdtsc - start_rdtsc);

        total_rdtsc += (end_rdtsc - start_rdtsc);

        // write the perf events to the file
        write_perf(perf_file_equal, values);

        // convert the result into a string
        char *sub_str = mpz_get_str(NULL, 10, result_gmp);
        int sub_size = strlen(sub_str);

        // verify the converted string with result
        if (!check_result(sub_str, result_str, sub_size))
        {
            printf("Test case failed\n");
            printf("a = %s, b = %s, result = %s\n", a_str, b_str, result_str);
            printf("Subtraction result = %s\n", sub_str);
            exit(EXIT_FAILURE);
        }
    }
    printf("Equal test cases passed\n");
    printf("Total RDTSC cycles: %llu\n", total_rdtsc);
    gzclose(perf_file_equal);
    gzclose(rdtsc_file_equal);
    gzclose(equal_file);

    // testcase: greater.txt
    // Open the file for writing the perf experiment data
    char perf_filename_greater[100];
    snprintf(perf_filename_greater, sizeof(perf_filename_greater), "experiments/perf_data/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
    gzFile perf_file_greater = open_gzfile(perf_filename_greater, "wb");

    // open file to write the rdtsc values
    char rdtsc_filename_greater[100];
    snprintf(rdtsc_filename_greater, sizeof(rdtsc_filename_greater), "experiments/rdtsc_data/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
    gzFile rdtsc_file_greater = open_gzfile(rdtsc_filename_greater, "wb");

    snprintf(test_case, sizeof(test_case), "../test/cases/%d/greater.csv.gz", NUM_BITS);
    gzFile greater_file = open_gzfile(test_case, "rb");

    // skip the first line, header
    skip_first_line(greater_file);

    // Read ITERATIONS test cases
    total_rdtsc = 0;
    for (int i = 0; i < ITERATIONS; i++)
    {
        // Read the next line
        if (gzgets(greater_file, buffer, sizeof(buffer)) == NULL)
        {
            if (gzeof(greater_file))
            {
                break; // End of file reached
            }
            else
            {
                perror("Error reading line");
                gzclose(greater_file);
                exit(EXIT_FAILURE);
            }
        }

        // Extract a, b, result from the line
        char *a_str = strtok(buffer, ",");
        char *b_str = strtok(NULL, ",");
        char *result_str = strtok(NULL, ",");
        if (a_str == NULL || b_str == NULL || result_str == NULL)
        {
            fprintf(stderr, "Error parsing line: %s\n", buffer);
            gzclose(greater_file);
            exit(EXIT_FAILURE);
        }

        // convert the strings to mpz_t
        mpz_t a, b, result_gmp;
        mpz_init(a);
        mpz_init(b);

        // convert the strings to mpz_t
        mpz_set_str(a, a_str, 10);
        mpz_set_str(b, b_str, 10);

        // start the perf events
        start_perf();

        // warm up the rdtsc
        warmup_rdtsc();

        // measure the start rdtsc
        start_rdtsc = measure_rdtsc_start();

        // perform the subtraction
        mpz_sub(result_gmp, a, b);

        // measure the end rdtsc
        end_rdtsc = measure_rdtscp_end();

        // stop the perf events
        stop_perf();

        // read the values of the perf events
        read_perf(values);

        if (end_rdtsc < start_rdtsc)
        {
            perror("Error: RDTSC end time is less than start time\n");
            exit(EXIT_FAILURE);
        }
        // write the rdtsc values to the file
        write_rdtsc(rdtsc_file_greater, end_rdtsc - start_rdtsc);

        total_rdtsc += (end_rdtsc - start_rdtsc);

        // write the perf events to the file
        write_perf(perf_file_greater, values);

        // convert the result into a string
        char *sub_str = mpz_get_str(NULL, 10, result_gmp);
        int sub_size = strlen(sub_str);

        // verify the converted string with result
        if (!check_result(sub_str, result_str, sub_size))
        {
            printf("Test case failed\n");
            printf("a = %s, b = %s, result = %s\n", a_str, b_str, result_str);
            printf("Subtraction result = %s\n", sub_str);
            exit(EXIT_FAILURE);
        }
    }
    printf("Greater test cases passed\n");
    printf("Total RDTSC cycles: %llu\n", total_rdtsc);
    gzclose(perf_file_greater);
    gzclose(rdtsc_file_greater);
    gzclose(greater_file);

    // testcase: smaller.txt
    // Open the file for writing the perf experiment data
    char perf_filename_smaller[100];
    snprintf(perf_filename_smaller, sizeof(perf_filename_smaller), "experiments/perf_data/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
    gzFile perf_file_smaller = open_gzfile(perf_filename_smaller, "wb");

    // open file to write the rdtsc values
    char rdtsc_filename_smaller[100];
    snprintf(rdtsc_filename_smaller, sizeof(rdtsc_filename_smaller), "experiments/rdtsc_data/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
    gzFile rdtsc_file_smaller = open_gzfile(rdtsc_filename_smaller, "wb");

    snprintf(test_case, sizeof(test_case), "../test/cases/%d/smaller.csv.gz", NUM_BITS);
    gzFile smaller_file = open_gzfile(test_case, "rb");

    // skip the first line, header
    skip_first_line(smaller_file);

    // Read ITERATIONS test cases
    total_rdtsc = 0;
    for (int i = 0; i < ITERATIONS; i++)
    {
        // Read the next line
        if (gzgets(smaller_file, buffer, sizeof(buffer)) == NULL)
        {
            if (gzeof(smaller_file))
            {
                break; // End of file reached
            }
            else
            {
                perror("Error reading line");
                gzclose(smaller_file);
                exit(EXIT_FAILURE);
            }
        }

        // Extract a, b, result from the line
        char *a_str = strtok(buffer, ",");
        char *b_str = strtok(NULL, ",");
        char *result_str = strtok(NULL, ",");
        if (a_str == NULL || b_str == NULL || result_str == NULL)
        {
            fprintf(stderr, "Error parsing line: %s\n", buffer);
            gzclose(smaller_file);
            exit(EXIT_FAILURE);
        }

        // convert the strings to mpz_t
        mpz_t a, b, result_gmp;
        mpz_init(a);
        mpz_init(b);

        // convert the strings to mpz_t
        mpz_set_str(a, a_str, 10);
        mpz_set_str(b, b_str, 10);

        // start the perf events
        start_perf();

        // warm up the rdtsc
        warmup_rdtsc();

        // measure the start rdtsc
        start_rdtsc = measure_rdtsc_start();

        // perform the subtraction
        mpz_sub(result_gmp, a, b);

        // measure the end rdtsc
        end_rdtsc = measure_rdtscp_end();

        // stop the perf events
        stop_perf();

        // read the values of the perf events
        read_perf(values);

        if (end_rdtsc < start_rdtsc)
        {
            perror("Error: RDTSC end time is less than start time\n");
            exit(EXIT_FAILURE);
        }
        // write the rdtsc values to the file
        write_rdtsc(rdtsc_file_smaller, end_rdtsc - start_rdtsc);

        total_rdtsc += (end_rdtsc - start_rdtsc);

        // write the perf events to the file
        write_perf(perf_file_smaller, values);

        // convert the result into a string
        char *sub_str = mpz_get_str(NULL, 10, result_gmp);
        int sub_size = strlen(sub_str);

        // verify the converted string with result
        if (!check_result(sub_str, result_str, sub_size))
        {
            printf("Test case failed\n");
            printf("a = %s, b = %s, result = %s\n", a_str, b_str, result_str);
            printf("Subtraction result = %s\n", sub_str);
            exit(EXIT_FAILURE);
        }
    }
    printf("Smaller test cases passed\n");
    printf("Total RDTSC cycles: %llu\n", total_rdtsc);
    gzclose(perf_file_smaller);
    gzclose(rdtsc_file_smaller);
    gzclose(smaller_file);
}
