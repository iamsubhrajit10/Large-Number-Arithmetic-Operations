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
#include <cpuid.h>

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

// function to get the timespec stamp
inline struct timespec get_timespec()
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC_RAW, &ts);
    return ts;
}

// function to compute the difference between two timespec stamps
inline struct timespec diff_timespec(struct timespec start, struct timespec end)
{
    struct timespec temp;
    if ((end.tv_nsec - start.tv_nsec) < 0)
    {
        temp.tv_sec = end.tv_sec - start.tv_sec - 1;
        temp.tv_nsec = 1000000000 + end.tv_nsec - start.tv_nsec;
    }
    else
    {
        temp.tv_sec = end.tv_sec - start.tv_sec;
        temp.tv_nsec = end.tv_nsec - start.tv_nsec;
    }
    return temp;
}

// function to convert a timespec stamp to nanoseconds
inline long long timespec_to_ns(struct timespec ts)
{
    return ts.tv_sec * 1000000000 + ts.tv_nsec;
}

// function to write timespec(ns) to a file
inline void write_timespec(gzFile file, struct timespec ts)
{
    gzprintf(file, "%lld\n", timespec_to_ns(ts));
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
    if (argc != 5)
    {
        printf("Usage: %s <number of bits> <core number> <test-case number> <measure_type>\n", argv[0]);
        return 1;
    }

    assert(atoi(argv[1]) > 0);
    NUM_BITS = atoi(argv[1]);
    CORE_NO = atoi(argv[2]);
    int test_case = atoi(argv[3]);
    int measure_type = atoi(argv[4]);

    run_tests(test_case, measure_type);

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
            // Close previously opened file descriptors
            for (int j = 0; j < i; j++)
            {
                close(fd[j]);
            }
            exit(EXIT_FAILURE);
        }
    }
}

void read_perf(uint64_t values[])
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

void write_perf(gzFile file, uint64_t values[])
{
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        if (gzprintf(file, "%" PRIu64 ",", values[j]) <= 0)
        {
            int errnum;
            const char *errmsg = gzerror(file, &errnum);
            fprintf(stderr, "Error writing to gzFile: %s\n", errmsg);
            exit(EXIT_FAILURE);
        }
    }
    if (gzprintf(file, "\n") <= 0)
    {
        int errnum;
        const char *errmsg = gzerror(file, &errnum);
        fprintf(stderr, "Error writing newline to gzFile: %s\n", errmsg);
        exit(EXIT_FAILURE);
    }
}

void start_perf()
{
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        if (ioctl(fd[j], PERF_EVENT_IOC_RESET, 0) == -1)
        {
            perror("Error resetting perf event");
            exit(EXIT_FAILURE);
        }
        if (ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0) == -1)
        {
            perror("Error enabling perf event");
            exit(EXIT_FAILURE);
        }
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

void run_tests(int test_case, int measure_type)
{
    // read the test cases from the file
    // path: ../test/cases/<num_bits>/<test_case>.csv.gz
    // there are four test cases: random.csv.gz, equal.csv.gz, greater.csv.gz, smaller.csv.gz
    // first line contains a header: a, b, result
    // next line onwards contains the test cases, 100000 test cases
    // verify the results of the subtraction of a and b with the result

    // Create directories for the results
    create_directory("experiments/results");
    // create_directory("experiments/perf_data");
    // create_directory("experiments/rdtsc_data");
    // open the perf file
    gzFile perf_file, timespec_file, rdtsc_file;
    switch (measure_type)
    {
    case 0:
        printf("Running the tests without any measurements\n");
        create_directory("experiments/results/without_measurements");
        break;
    case 1:
        printf("Running the tests with RDTSC measurements\n");
        create_directory("experiments/results/rdtsc_measurements");
        break;
    case 2:
        printf("Running the tests with perf measurements\n");
        create_directory("experiments/results/perf_measurements");
        break;
    case 3:
        printf("Running the tests with timespec measurements\n");
        create_directory("experiments/results/timespec_measurements");
        break;
    default:
        printf("Invalid measure type\n");
        exit(EXIT_FAILURE);
    }

    unsigned long long start_rdtsc, end_rdtsc;
    unsigned long long total_rdtsc = 0;
    unsigned cycles_low, cycles_high, cycles_low1, cycles_high1;
    uint64_t values[MAX_EVENTS];

    char perf_filename[100];
    char rdtsc_filename[100];
    char test_filename[100];
    char timespec_filename[100];

    switch (test_case)
    {
    case 0:
        printf("Running random test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/random.csv.gz", NUM_BITS);
        // snprintf(perf_filename, sizeof(perf_filename), "experiments/perf_data/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
        // snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/rdtsc_data/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
        if (measure_type == 0)
        {
            break;
        }
        else if (measure_type == 1)
        {
            snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            rdtsc_file = open_gzfile(rdtsc_filename, "wb");
            if (rdtsc_file == NULL)
            {
                perror("Error opening rdtsc file");
                exit(EXIT_FAILURE);
            }
        }
        else if (measure_type == 2)
        {
            snprintf(perf_filename, sizeof(perf_filename), "experiments/results/perf_measurements/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            perf_file = open_gzfile(perf_filename, "wb");
            if (perf_file == NULL)
            {
                perror("Error opening perf file");
                exit(EXIT_FAILURE);
            }
            // open the perf events
            initialize_perf();
        }
        else if (measure_type == 3)
        {
            snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/random_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            timespec_file = open_gzfile(timespec_filename, "wb");
            if (timespec_file == NULL)
            {
                perror("Error opening timespec file");
                exit(EXIT_FAILURE);
            }
        }
        break;
    case 1:
        printf("Running equal test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        // snprintf(perf_filename, sizeof(perf_filename), "experiments/perf_data/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
        // snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/rdtsc_data/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/equal.csv.gz", NUM_BITS);
        if (measure_type == 0)
        {
            break;
        }
        else if (measure_type == 1)
        {
            snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            rdtsc_file = open_gzfile(rdtsc_filename, "wb");
            if (rdtsc_file == NULL)
            {
                perror("Error opening rdtsc file");
                exit(EXIT_FAILURE);
            }
        }
        else if (measure_type == 2)
        {
            snprintf(perf_filename, sizeof(perf_filename), "experiments/results/perf_measurements/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            perf_file = open_gzfile(perf_filename, "wb");
            if (perf_file == NULL)
            {
                perror("Error opening perf file");
                exit(EXIT_FAILURE);
            }
            initialize_perf();
        }
        else if (measure_type == 3)
        {
            snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/equal_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            timespec_file = open_gzfile(timespec_filename, "wb");
            if (timespec_file == NULL)
            {
                perror("Error opening timespec file");
                exit(EXIT_FAILURE);
            }
        }
        break;
    case 2:
        printf("Running greater test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        // snprintf(perf_filename, sizeof(perf_filename), "experiments/perf_data/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
        // snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/rdtsc_data/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/greater.csv.gz", NUM_BITS);
        if (measure_type == 0)
        {
            break;
        }
        else if (measure_type == 1)
        {
            snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            rdtsc_file = open_gzfile(rdtsc_filename, "wb");
            if (rdtsc_file == NULL)
            {
                perror("Error opening rdtsc file");
                exit(EXIT_FAILURE);
            }
        }
        else if (measure_type == 2)
        {
            snprintf(perf_filename, sizeof(perf_filename), "experiments/results/perf_measurements/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            perf_file = open_gzfile(perf_filename, "wb");
            if (perf_file == NULL)
            {
                perror("Error opening perf file");
                exit(EXIT_FAILURE);
            }
            initialize_perf();
        }
        else if (measure_type == 3)
        {
            snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/greater_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            timespec_file = open_gzfile(timespec_filename, "wb");
            if (timespec_file == NULL)
            {
                perror("Error opening timespec file");
                exit(EXIT_FAILURE);
            }
        }
        break;
    case 3:
        printf("Running smaller test cases for bit-size %d on core %d\n", NUM_BITS, CORE_NO);
        // snprintf(perf_filename, sizeof(perf_filename), "experiments/perf_data/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
        // snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/rdtsc_data/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
        snprintf(test_filename, sizeof(test_filename), "../test/cases/%d/smaller.csv.gz", NUM_BITS);
        if (measure_type == 0)
        {
            break;
        }
        else if (measure_type == 1)
        {
            snprintf(rdtsc_filename, sizeof(rdtsc_filename), "experiments/results/rdtsc_measurements/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            rdtsc_file = open_gzfile(rdtsc_filename, "wb");
            if (rdtsc_file == NULL)
            {
                perror("Error opening rdtsc file");
                exit(EXIT_FAILURE);
            }
        }
        else if (measure_type == 2)
        {
            snprintf(perf_filename, sizeof(perf_filename), "experiments/results/perf_measurements/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            perf_file = open_gzfile(perf_filename, "wb");
            if (perf_file == NULL)
            {
                perror("Error opening perf file");
                exit(EXIT_FAILURE);
            }
            initialize_perf();
        }
        else if (measure_type == 3)
        {
            snprintf(timespec_filename, sizeof(timespec_filename), "experiments/results/timespec_measurements/smaller_%d_%d.csv.gz", NUM_BITS, CORE_NO);
            timespec_file = open_gzfile(timespec_filename, "wb");
            if (timespec_file == NULL)
            {
                perror("Error opening timespec file");
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
    total_rdtsc = 0;
    struct timespec start_timespec, end_timespec;
    struct timespec total_timespec;

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
            gzclose(test_file);
            exit(EXIT_FAILURE);
        }

        // convert the strings to mpz_t
        mpz_t a, b, result_gmp;
        mpz_init(a);
        mpz_init(b);

        // convert the strings to mpz_t
        if (mpz_set_str(a, a_str, 10) != 0)
        {
            perror("Error: Failed to set mpz_t from string a_str");
            exit(EXIT_FAILURE);
        }
        if (mpz_set_str(b, b_str, 10) != 0)
        {
            perror("Error: Failed to set mpz_t from string b_str");
            exit(EXIT_FAILURE);
        }

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
        int cpu_info[4];
        __cpuid(0, cpu_info[0], cpu_info[1], cpu_info[2], cpu_info[3]);

        switch (measure_type)
        {
        case 0:
            break;
        case 1:
            warmup_rdtsc();
            start_rdtsc = measure_rdtsc_start();
            break;
        case 2:
            start_perf();
            break;
        case 3:
            start_timespec = get_timespec();
            break;
        default:
            printf("Invalid measure type\n");
            exit(EXIT_FAILURE);
        }

        // perform the subtraction
        mpz_sub(result_gmp, a, b);

        // measure the end
        switch (measure_type)
        {
        case 0:
            break;
        case 1:
            end_rdtsc = measure_rdtscp_end();
            if (end_rdtsc < start_rdtsc)
            {
                perror("Error: RDTSC end time is less than start time\n");
                exit(EXIT_FAILURE);
            }
            total_rdtsc += (end_rdtsc - start_rdtsc);
            write_rdtsc(rdtsc_file, end_rdtsc - start_rdtsc);
            break;
        case 2:
            stop_perf();
            read_perf(values);
            write_perf(perf_file, values);
            break;
        case 3:
            end_timespec = get_timespec();
            write_timespec(timespec_file, diff_timespec(start_timespec, end_timespec));
            break;
        default:
            printf("Invalid measure type\n");
            exit(EXIT_FAILURE);
        }

        // convert the result into a string
        char *sub_str = mpz_get_str(NULL, 10, result_gmp);
        int sub_size = strlen(sub_str);

        // verify the converted string with result
        if (!check_result(sub_str, result_str, sub_size))
        {
            printf("Test case failed, at iteration %d\n", i);
            printf("a = %s, b = %s, result = %s\n", a_str, b_str, result_str);
            printf("Subtraction result = %s\n", sub_str);
            exit(EXIT_FAILURE);
        }

        for (size_t i = 0; i < a_size; i += 64) // 64 bytes is the typical cache line size
        {
            _mm_clflush((char *)a->_mp_d + i);
        }

        for (size_t i = 0; i < b_size; i += 64) // 64 bytes is the typical cache line size
        {
            _mm_clflush((char *)b->_mp_d + i);
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
    gzclose(test_file);
    if (measure_type == 1)
    {
        gzclose(rdtsc_file);
    }
    else if (measure_type == 2)
    {
        gzclose(perf_file);
    }
    else if (measure_type == 3)
    {
        gzclose(timespec_file);
    }
}