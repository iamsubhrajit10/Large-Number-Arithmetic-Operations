/*
This code subs two numbers, represented as array of digits.
a --> array of digits of first number, of length n
b --> array of digits of second number, of length m
#Pre-processing:
1. Equalize the length of both arrays by subing leading zeros to the smaller array.
Note: For pre-processing, we can use the realloc function to sub leading zeros to the smaller array.
*/

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

#define MAX_EVENTS 6

#define LIMB_SIZE 9
// #define LIMB_SIZE 2
#define ITERATIONS 100000

#define unlikely(expr) __builtin_expect(!!(expr), 0)
#define likely(expr) __builtin_expect(!!(expr), 1)

uint32_t *sub_space;
uint32_t *borrow_space;
static int sub_space_ptr = 0;
static int borrow_space_ptr = 0;

static uint32_t LIMB_DIGITS = 1000000000;
// static uint32_t LIMB_DIGITS = 100;

__m512i limb_digits;
__m512i minus_limb_digits;
__m512i zeros;
static int NUM_BITS;

uint32_t *returnLimbs(uint32_t *number, int *length);
char *formatResult(uint32_t *result, int *result_length);
void make_equidistant(uint32_t **num1_base, uint32_t **num2_base, int *n_1, int *n_2);

long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags)
{
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}
unsigned long generate_seed()
{
    struct timespec ts1, ts2;
    clock_gettime(CLOCK_MONOTONIC, &ts1);
    clock_gettime(CLOCK_REALTIME, &ts2);

    int urandom_fd = open("/dev/urandom", O_RDONLY);
    uint32_t urandom_value;
    read(urandom_fd, &urandom_value, sizeof(urandom_value));
    close(urandom_fd);

    pid_t pid = getpid();
    pid_t tid = syscall(SYS_gettid);

    return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
}

bool is_less_than(uint32_t *a, uint32_t *b, uint32_t n)
{
    for (int i = 0; i < n; i++)
    {
        if (a[i] < b[i])
        {
            return true;
        }
        else if (a[i] > b[i])
        {
            return false;
        }
    }
    return false;
}

void sub_n(uint32_t *a, uint32_t *b, uint32_t **result_ptr, int n, int *result_size)
{
    uint32_t *result = *result_ptr;
    bool is_less = is_less_than(a, b, n);
    uint32_t sign = 1;
    if (is_less)
    {
        // swap a and b
        uint32_t *temp = a;
        a = b;
        b = temp;
        sign = -1;
    }
    uint32_t *borrow_array = borrow_space;
    __m512i a_vec, b_vec, result_vec;
    int i;

    for (i = 0; i < n; i += 16)
    {
        // load 16 elements from a and b
        a_vec = _mm512_loadu_si512(a + i);
        b_vec = _mm512_loadu_si512(b + i);

        // subtract a and b
        result_vec = _mm512_sub_epi32(a_vec, b_vec);

        // if result_vec[j] < 0, set borrow mask to 1
        __mmask16 borrow_mask = _mm512_cmplt_epi32_mask(result_vec, zeros);

        // based on borrow mask, result_vec[j] = limb_digits + result_vec[j]
        result_vec = _mm512_mask_add_epi32(result_vec, borrow_mask, result_vec, limb_digits);

        __m512i borrow = _mm512_maskz_set1_epi32(borrow_mask, 1);

        // store the borrow
        _mm512_storeu_si512(borrow_array + i, borrow);

        // store the result
        _mm512_storeu_si512(result + i, result_vec);
    }

    bool borrow_flag = false;
    // left shift the borrow array by 1
    borrow_array = borrow_array + 1;

    // zero out all the elements of borrow_vec
    // store the borrow_vec
    _mm512_storeu_si512(borrow_array + n - 1, zeros);
    _mm512_storeu_si512(result + n, zeros);

    int last_borrow_block = -1;
    for (i = 0; i < n; i += 16)
    {
        __m512i borrow_vec = _mm512_loadu_si512(borrow_array + i);
        result_vec = _mm512_loadu_si512(result + i);
        result_vec = _mm512_sub_epi32(result_vec, borrow_vec);

        // check if result_vec[j] < 0
        __mmask16 borrow_mask = _mm512_cmplt_epi32_mask(result_vec, zeros);
        if (unlikely(borrow_mask))
        {
            printf("Borrow mask is not zero\n");
            borrow_flag = true;
            last_borrow_block = i;
        }

        // generate borrow_vec
        borrow_vec = _mm512_maskz_set1_epi32(borrow_mask, 1);

        // update the borrow array
        _mm512_storeu_si512(borrow_array + i, borrow_vec);

        _mm512_storeu_si512(result + i, result_vec);
    }

    if (unlikely(borrow_flag))
    {

        i = (last_borrow_block + 16);
        i = (i > n - 1) ? (n - 1) : i;

        for (; i >= 0; i--)
        {
            if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
            {
                result[i] = result[i] + LIMB_DIGITS;
                result[i - 1] = result[i - 1] - 1;

                if (unlikely(result[i - 1] > LIMB_DIGITS))
                {

                    borrow_array[i - 1] = 1;
                }
                borrow_array[i] = 0;
            }
        }
    }

    if (sign == -1)
    {
        int i = 0;
        while (result[i] <= 0)
        {
            i++;
        }
        result[i] = -result[i];
        // update the result
        result = result + i;
        // update to result_ptr
        *result_ptr = result;
        *result_size = *result_size - i;
    }
}

// Function to print a __mmask16 in binary
void print_mask_binary(__mmask16 mask)
{
    for (int i = 15; i >= 0; --i)
    {
        printf("%d", (mask >> i) & 1);
    }
    printf("\n");
}

// main function with cmd arguments
int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("Usage: %s <number of bits>\n", argv[0]);
        return 1;
    }
    assert(atoi(argv[1]) > 0);
    NUM_BITS = atoi(argv[1]);
    // Define the events to monitor
    struct perf_event_attr pe[MAX_EVENTS];
    int fd[MAX_EVENTS];
    long long count[MAX_EVENTS];
    int i;

    struct timespec start, end;
    double elapsed_time;

    double avx_total_time = 0;
    double gmp_total_time = 0;

    limb_digits = _mm512_set1_epi32(LIMB_DIGITS);
    minus_limb_digits = _mm512_set1_epi32(-LIMB_DIGITS);
    zeros = _mm512_set1_epi32(0);

    memset(pe, 0, sizeof(struct perf_event_attr) * MAX_EVENTS);
    for (i = 0; i < MAX_EVENTS; i++)
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
    for (i = 0; i < MAX_EVENTS; i++)
    {
        fd[i] = perf_event_open(&pe[i], 0, 0, -1, 0);
        if (fd[i] == -1)
        {
            fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
            exit(EXIT_FAILURE);
        }
    }

    // Array of event type names
    const char *event_names[MAX_EVENTS] = {
        "PERF_COUNT_HW_CPU_CYCLES",          // CPU Cycles
        "PERF_COUNT_HW_USER_INSTRUCTIONS",   // User Instructions
        "PERF_COUNT_HW_KERNEL_INSTRUCTIONS", // Kernel Instructions
        "PERF_COUNT_SW_PAGE_FAULTS",         // Page Faults
        "PERF_COUNT_L1D_CACHE_READS",        // L1D Cache Reads
        "PERF_COUNT_L1D_CACHE_READ_MISSES"   // L1D Cache Read Misses
    };

    // Open a file for writing formatted output
    char binary_name[] = "sub_limb_avx_"; // replace with actual binary name
    int input_size = 100;                 // replace with actual input size

    char filename[100];
    snprintf(filename, sizeof(filename), "%s_%d.csv", binary_name, NUM_BITS);
    FILE *file = fopen(filename, "w");

    if (file == NULL)
    {
        perror("Error opening file for writing \n");
        return -1;
    }

    // Write the header to the CSV file
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        fprintf(file, "%s,", event_names[j]);
    }
    fprintf(file, "\n");

    // Open a file for writing for gmp
    char binary_name_gmp[] = "GMP_"; // replace with actual binary name
    char filename_gmp[100];
    snprintf(filename_gmp, sizeof(filename_gmp), "%s_%d.csv", binary_name_gmp, NUM_BITS);
    FILE *file_gmp = fopen(filename_gmp, "w");

    if (file_gmp == NULL)
    {
        perror("Error opening file for writing for gmp\n");
        return -1;
    }

    // Write the header to the CSV file
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        fprintf(file_gmp, "%s,", event_names[j]);
    }
    fprintf(file_gmp, "\n");

    // Allocate scratch space for the sub and borrow arrays
    uint32_t *sub_space = (uint32_t *)malloc(1 << 30);
    if (sub_space == NULL)
    {
        perror("Memory allocation failed for sub_space\n");
        exit(0);
    }

    for (int iter = 0; iter < ITERATIONS; iter++)
    {

        // Generate random numbers using  GMP library
        mpz_t num1_gmp, num2_gmp;
        mpz_t sub_gmp;
        mpz_init(num1_gmp);
        mpz_init(num2_gmp);
        mpz_init(sub_gmp);
        gmp_randstate_t state;
        unsigned long seed = generate_seed();
        gmp_randinit_default(state);
        gmp_randseed_ui(state, seed);
        mpz_urandomb(num1_gmp, state, NUM_BITS);
        mpz_urandomb(num2_gmp, state, NUM_BITS);
        char *num1_str = mpz_get_str(NULL, 10, num1_gmp);
        char *num2_str = mpz_get_str(NULL, 10, num2_gmp);
        int n = strlen(num1_str);
        int m = strlen(num2_str);
        uint32_t *a = (uint32_t *)malloc(n * sizeof(uint32_t));
        uint32_t *b = (uint32_t *)malloc(m * sizeof(uint32_t));
        for (int i = 0; i < n; i++)
        {
            a[i] = num1_str[i] - '0';
        }
        for (int i = 0; i < m; i++)
        {
            b[i] = num2_str[i] - '0';
        }

        // Make the two numbers equidistant
        make_equidistant(&a, &b, &n, &m);

        // Convert array of digits to array of limbs
        int n_limb = n;
        int m_limb = m;
        uint32_t *a_limbs = returnLimbs(a, &n_limb);
        uint32_t *b_limbs = returnLimbs(b, &m_limb);

        int sub_size;
        // int *sub = (int *)malloc((n > m ? n : m) * sizeof(int));

        // allocate from scratch space
        uint32_t *sub = sub_space + sub_space_ptr;
        sub_space_ptr += (n + 31) & ~31;
        // Clear the sub array
        memset(sub, 0, (n + 1) * sizeof(uint32_t));

        borrow_space = (uint32_t *)malloc((n) * sizeof(uint32_t));
        if (borrow_space == NULL)
        {
            perror("Memory allocation failed for borrow_space\n");
            exit(0);
        }
        borrow_space_ptr = 0;
        memset(borrow_space, 0, n * sizeof(uint32_t));

        uint64_t values[MAX_EVENTS];
        assert(n_limb == m_limb);
        sub_size = n_limb;
        // struct timespec start, end;

        // prefetched the arrays
        __builtin_prefetch(a_limbs, 0, 3);
        __builtin_prefetch(b_limbs, 0, 3);

        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }

        // Get the start time
        if (clock_gettime(CLOCK_MONOTONIC_RAW, &start) == -1)
        {
            perror("Error getting start time");
            exit(EXIT_FAILURE);
        }

        sub_n(a_limbs, b_limbs, &sub, n_limb, &sub_size);

        // Get the end time
        if (clock_gettime(CLOCK_MONOTONIC_RAW, &end) == -1)
        {
            perror("Error getting end time");
            exit(EXIT_FAILURE);
        }

        // Stop monitoring
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
            {
                perror("Error disabling counter");
                exit(EXIT_FAILURE);
            }
        }

        // Read and print the counter values
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            if (read(fd[j], &values[j], sizeof(uint64_t)) == -1)
            {
                perror("Error reading counter value");
                exit(EXIT_FAILURE);
            }
        }

        // Write the counter values to the CSV file
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            fprintf(file, "%lu,", values[j]);
        }
        fprintf(file, "\n");
        avx_total_time += (double)(end.tv_sec - start.tv_sec) + (double)(end.tv_nsec - start.tv_nsec) / 1e9;

        // print number of limbs of num1gmp
        // printf("Number of limbs of num1_gmp: %ld\n", mpz_size(num1_gmp));

        // printf("Number of limbs of my implementation: %d\n", n_limb);
        // printf("n: %d\n", n);

        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }
        // Get the start time
        if (clock_gettime(CLOCK_MONOTONIC_RAW, &start) == -1)
        {
            perror("Error getting start time");
            exit(EXIT_FAILURE);
        }

        mpz_sub(sub_gmp, num1_gmp, num2_gmp); // Use mpz_sub function to sub two numbers

        // Get the end time
        if (clock_gettime(CLOCK_MONOTONIC_RAW, &end) == -1)
        {
            perror("Error getting end time");
            exit(EXIT_FAILURE);
        }

        // Stop monitoring
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
            {
                perror("Error disabling counter");
                exit(EXIT_FAILURE);
            }
        }
        // Read and print the counter values
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            if (read(fd[j], &values[j], sizeof(uint64_t)) == -1)
            {
                perror("Error reading counter value");
                exit(EXIT_FAILURE);
            }
        }

        // Write the counter values to the CSV file
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            fprintf(file_gmp, "%lu,", values[j]);
        }
        fprintf(file_gmp, "\n");
        // printf("Time taken to sub two numbers using GMP: %lf seconds\n", end.tv_sec - start.tv_sec + (end.tv_nsec - start.tv_nsec) / 1e9);

        gmp_total_time += (double)(end.tv_sec - start.tv_sec) + (double)(end.tv_nsec - start.tv_nsec) / 1e9;

        char *sub_gmp_str = mpz_get_str(NULL, 10, sub_gmp);

        // printf("\n");

        // printf("The sub of the two numbers using GMP is: %s\n", sub_gmp_str);

        // convert sub's output sub into a string
        // if (result_sign == -1)
        // {
        //     int i = 0;
        //     while (i < sub_size && sub[i] == 0)
        //     {
        //         i++;
        //     }
        //     sub[i] = -sub[i];
        // }
        char *sub_str = formatResult(sub, &sub_size);
        // printf("The sub of the two numbers using sub function is: %s\n", sub_str);
        // check if the two subs are equal
        if (strlen(sub_gmp_str) != strlen(sub_str))
        {
            printf("The two subs are not equal\n");
            printf("Lengths are different\n");
            printf("Length of sub_sub = %d, length of gmp_sub = %ld\n", sub_size, strlen(sub_gmp_str));
            printf("sub_sub = %s, gmp_sub = %s\n", sub_str, sub_gmp_str);
            return 1;
        }
        for (int i = 0; i < sub_size; i++)
        {
            if (sub_str[i] != sub_gmp_str[i])
            {
                printf("The two subs are not equal\n");
                printf("Mismatch at index %d\n", i);
                printf("sub_sub[%d] = %c, gmp_sub[%d] = %c\n", i, sub_str[i], i, sub_gmp_str[i]);
                printf("sub_sub = %s\ngmp_sub = %s\n", &sub_str[i], &sub_gmp_str[i]);
                printf("sub_sub = %s\ngmp_sub = %s\n", sub_str, sub_gmp_str);
                return 1;
            }
        }
        // printf("The two subs are equal, iteration %d\n", iter);
        printf("Iteration %d passed\n", iter);
        free(a);
        free(b);
        free(a_limbs);
        free(b_limbs);
        free(borrow_space);
        mpz_clear(num1_gmp);
        mpz_clear(num2_gmp);
        mpz_clear(sub_gmp);
        memset(sub_space, 0, (n + 1) * sizeof(uint32_t));
        sub_space_ptr = 0;
    }
    printf("Total time taken to sub two numbers using AVX: %lf seconds\n", avx_total_time);
    printf("Total time taken to sub two numbers using GMP: %lf seconds\n", gmp_total_time);
    return 0;
}

// This function, given a number represented as an array of digits, groups 4 digits together and returns the number of groups
// Starts grouping from the least significant digit, and also appends zeros to the number if the number of digits is not a multiple of 4
uint32_t *returnLimbs(uint32_t *number, int *length)
{
    uint32_t *limbs __attribute__((aligned(64)));
    int n = *length;
    int num_limbs = n / LIMB_SIZE;
    int multiple = (n % LIMB_SIZE == 0) ? 0 : 1;
    if (multiple)
    {
        num_limbs++;
    }
    limbs = (uint32_t *)_mm_malloc(num_limbs * sizeof(uint32_t), 64);
    if (limbs == NULL)
    {
        printf("Memory could not be allocated for limbs\n");
        exit(1);
    }
    int i = n - 1;
    int j = 0;
    int k = num_limbs - 1;
    while (i >= 0)
    {
        uint32_t limb = 0;
        for (j = i; j > i - LIMB_SIZE && j >= 0; j--)
        {
            limb += number[j] * (pow(10, i - j));
        }
        limbs[k] = limb;
        k--;
        i = j;
    }
    *length = num_limbs;
    return limbs;
}

char *formatResult(uint32_t *result, int *result_length)
{
    char *result_str = (char *)calloc(*result_length * 15 + 1, sizeof(char)); // 15 digits + null terminator per number
    if (result_str == NULL)
    {
        perror("Memory allocation failed for result_str\n");
        exit(0);
    }
    int i = 0;
    // Handle the first element separately (without leading zeros)
    sprintf(result_str, "%d", result[0]); // Print result[0] as it is
    // check if the first element is negative and it has sucessive zeros after the sign
    if (result[0] < 0)
    {
        printf("Result[0]: %d\n", result[0]);
        i = 1;
        while (result_str[i] == '0')
        {
            i++;
        }
        if (i == strlen(result_str))
        {
            char *temp = (char *)calloc(2, sizeof(char));
            temp[0] = '0';
            temp[1] = '\0';
            return temp;
        }
    }

    // Handle the rest of the elements (with leading zeros)
    for (int i = 1; i < *result_length; i++)
    {
        char temp[15];
        sprintf(temp, "%09d", result[i]); // Print with leading zeros
        strcat(result_str, temp);
    }
    // remove leading zeroes
    i = 0;
    while (result_str[i] == '0')
    {
        i++;
    }
    if (i == strlen(result_str))
    {
        char *temp = (char *)calloc(2, sizeof(char));
        temp[0] = '0';
        temp[1] = '\0';
        return temp;
    }
    char *final_result = (char *)calloc(strlen(result_str) - i + 1, sizeof(char));
    if (final_result == NULL)
    {
        perror("Memory allocation failed for final_result\n");
        exit(0);
    }
    int j = 0;
    while (result_str[i] != '\0')
    {
        final_result[j] = result_str[i];
        i++;
        j++;
    }
    final_result[j] = '\0';
    free(result_str);
    *result_length = strlen(final_result);
    return final_result;
}
// Function to make the two number strings equidistant by subing zeroes in front of the smaller number, and reallocate space for the smaller number
void make_equidistant(uint32_t **num1_base, uint32_t **num2_base, int *n_1, int *n_2)
{
    if (*n_1 == *n_2)
        return;

    int n1 = *n_1;
    int n2 = *n_2;
    uint32_t *num1 = *num1_base;
    uint32_t *num2 = *num2_base;

    if (n1 > n2)
    {
        // printf("Num1 is greater\n");
        uint32_t *temp = (uint32_t *)calloc(n1, sizeof(uint32_t));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }
        // copy from the LSB to MSB of num2 into temp
        for (int i = n2 - 1; i >= 0; i--)
        {
            // printf("Copying %d into temp index of %d\n", num2[i], i + n1 - n2);
            temp[i + n1 - n2] = num2[i];
        }
        // fill the remaining MSB with zeroes in temp
        for (int i = 0; i < n1 - n2; i++)
        {
            temp[i] = 0;
        }

        // reallocate space for num2 using realloc
        num2 = (uint32_t *)realloc(num2, n1 * sizeof(uint32_t));
        if (num2 == NULL)
        {
            perror("Memory reallocation failed for num2\n");
            exit(0);
        }
        for (int i = 0; i < n1; i++)
        {
            num2[i] = temp[i];
        }
        // copy the temp into num2
        *n_2 = n1;
        *num2_base = num2;
        free(temp);
    }
    else if (n2 > n1)
    {
        // printf("Num2 is greater\n");
        uint32_t *temp = (uint32_t *)calloc(n2, sizeof(uint32_t));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }

        // copy from the LSB to MSB of num1 into temp
        for (int i = n1 - 1; i >= 0; i--)
        {
            // printf("Copying %d into temp index of %d\n", num1[i], i + n2 - n1);
            temp[i + n2 - n1] = num1[i];
        }
        // fill the remaining MSB with zeroes in temp
        for (int i = 0; i < n2 - n1; i++)
        {
            temp[i] = 0;
        }
        // reallocate space for num1 using realloc
        num1 = (uint32_t *)realloc(num1, n2 * sizeof(uint32_t));
        if (num1 == NULL)
        {
            perror("Memory reallocation failed for num1\n");
            exit(0);
        }
        // copy the temp into num1
        for (int i = 0; i < n2; i++)
        {
            num1[i] = temp[i];
        }
        *n_1 = n2;
        *num1_base = num1;
        free(temp);
    }
}