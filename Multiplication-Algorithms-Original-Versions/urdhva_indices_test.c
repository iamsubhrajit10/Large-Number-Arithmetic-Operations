#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <float.h>
#include <fcntl.h> // For file opening
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <linux/hw_breakpoint.h>
#include <sys/syscall.h> // For syscall()
#include <asm/unistd.h>  // For __NR_perf_event_open
#define _GNU_SOURCE
#include <x86intrin.h>
#include <gmp.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <omp.h>
#include <immintrin.h>

#define NUM_ITERATIONS 1000
#define NUMBER_OF_BITS 8192
#define MAX_EVENTS 9 // Maximum number of events to monitor
#define PERF_SAMPLE_SIZE 1000000
uint64_t start_ticks, end_ticks, total_ticks, min_ticks = UINT64_MAX;

long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags)
{
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}

// Function to get the current value of the Time Stamp Counter
static inline uint64_t rdtsc(void)
{
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}

// Function to perform grade-school multiplication on two numbers represented as arrays of digits
void gradeSchoolMultiplication(int *num1, int len1, int *num2, int len2, int *result)
{

    // Multiply each digit of num2 with num1
    for (int i = len2 - 1; i >= 0; i--)
    {
        for (int j = len1 - 1; j >= 0; j--)
        {
            int product = num2[i] * num1[j] + result[i + j + 1];
            result[i + j + 1] = product % 10;
            result[i + j] += product / 10;
        }
    }
}

// Helper functions for min and max if not included already
static inline int max(int a, int b) { return (a > b) ? a : b; }
static inline int min(int a, int b) { return (a < b) ? a : b; }

// Declare the helper functions for Urdhva-Tiryagbhyam multiplication
uint16_t *extract_MSB_digits(uint16_t *number, int *length);
uint16_t *remove_leading_zeros_16_t(uint16_t *number, int *length);

// As, urdhva only multiplies single digits, we can always precompute the multiplication of all possible pairs of digits
// Precompute in two different arrays, one for the product and the other for the carry
// The product of two digits will be at product_memory[digit1][digit2] and the carry will be at carry_memory[digit1][digit2]
// const uint16_t product_memory[10][10] = {
//     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
//     {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
//     {0, 2, 4, 6, 8, 0, 2, 4, 6, 8},
//     {0, 3, 6, 9, 2, 5, 8, 1, 4, 7},
//     {0, 4, 8, 2, 6, 0, 4, 8, 2, 6},
//     {0, 5, 0, 5, 0, 5, 0, 5, 0, 5},
//     {0, 6, 2, 8, 4, 0, 6, 2, 8, 4},
//     {0, 7, 4, 1, 8, 5, 2, 9, 6, 3},
//     {0, 8, 6, 4, 2, 0, 8, 6, 4, 2},
//     {0, 9, 8, 7, 6, 5, 4, 3, 2, 1}};
// // carry_memory[digit1][digit2] stores the most significant digit of the product of digit1 and digit2
// const uint16_t carry_memory[10][10] = {
//     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
//     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
//     {0, 0, 0, 0, 0, 1, 1, 1, 1, 1},
//     {0, 0, 0, 0, 1, 1, 1, 2, 2, 2},
//     {0, 0, 0, 1, 1, 2, 2, 2, 3, 3},
//     {0, 0, 1, 1, 2, 2, 3, 3, 4, 4},
//     {0, 0, 1, 1, 2, 3, 3, 4, 4, 5},
//     {0, 0, 1, 2, 2, 3, 4, 4, 5, 6},
//     {0, 0, 1, 2, 3, 4, 4, 5, 6, 7},
//     {0, 0, 1, 2, 3, 4, 5, 6, 7, 8}};

// Function to perform Urdhva-Tiryagbhyam multiplication on two numbers represented as arrays of digits
// uint16_t *urdhva_precompute(uint16_t *number1, uint16_t *number2, int n, uint16_t *product, uint16_t *carry, int *result_length)
// {
//     int max_index = n << 1; // max 2n sets for n-digit numbers
//     memset(product, 0, max_index * sizeof(uint16_t));
//     memset(carry, 0, max_index * sizeof(uint16_t));

//     // Parallelize the outer loop
//     // #pragma omp parallel for num_threads(8) schedule(static)
//     for (int set_index = 0; set_index < max_index; set_index++)
//     {
//         register uint16_t p = 0; // Use uint16_t for intermediate product calculation
//         register uint16_t c = 0; // Use uint16_t for intermediate carry calculation
//         int start = (set_index - (n - 1) > 0) ? set_index - (n - 1) : 0;
//         int end = (set_index < n) ? set_index : n - 1;

//         uint16_t *ptr1 = &number1[start];
//         uint16_t *ptr2 = &number2[end];
//         int iterations = end - start + 1;

//         // Loop to calculate product and carry on the fly
//         for (int i = 0; i < iterations; ++ptr1, --ptr2, ++i)
//         {
//             uint16_t prod = (*ptr1) * (*ptr2);
//             p += prod % 10; // Extract the least significant digit
//             c += prod / 10; // Extract the most significant digit
//             c += (p > 9) ? 1 : 0;
//             p = (p > 9) ? p - 10 : p;
//         }

//         (set_index != 0) ? (product[set_index] = p, carry[set_index - 1] = c) : (product[0] = (c != 0) ? c * 10 + p : p);
//     }

//     // Adjust the carry and product in the second loop
//     uint16_t c = 0; // Initialize c for carry
//     for (int i = max_index - 2; i >= 0; i--)
//     {
//         if (carry[i] == 0 && c == 0)
//             continue;
//         uint16_t p = product[i] + carry[i] + c;
//         c = p / 10;
//         product[i] = (i != 0) ? p % 10 : p;
//     }

//     // Call extract_MSB_digits to extract the most significant digits
//     int urdhva_product_len = max_index - 1;
//     product = extract_MSB_digits(product, &urdhva_product_len);
//     // Remove leading zeros
//     product = remove_leading_zeros_16_t(product, &urdhva_product_len);
//     *result_length = urdhva_product_len;
//     return product;
// }
// Refactored function to perform Urdhva-Tiryagbhyam multiplication on two numbers represented as arrays of digits
uint16_t *urdhva(uint16_t *number1, uint16_t *number2, int n, uint16_t *product, uint16_t *carry, int *result_length)
{
    // printf("Performing Urdhva-Tiryagbhyam multiplication\n");
    int max_index = n << 1;
    memset(product, 0, max_index * sizeof(uint16_t));
    memset(carry, 0, max_index * sizeof(uint16_t));
    // #pragma omp parallel for shared(product, carry) num_threads(64) schedule(static)
    int start_threshold = n - 1;
    int end_max = n - 1;
    uint16_t *product_ptr = product;
    uint16_t *carry_ptr = carry;
    for (int set_index = 0; set_index < max_index; set_index++)
    {
        register uint16_t p = 0; // Use uint16_t for intermediate product calculation
                                 // Use precomputed values to simplify calculations
        int start = (set_index > start_threshold) ? set_index - start_threshold : 0;
        int end = (set_index < n) ? set_index : end_max;

        int n2_index = set_index - start; // Initialize n2_index based on the starting value
        uint16_t *ptr1 = number1 + start;
        uint16_t *ptr2 = number2 + end;
        // Calculate the number of iterations outside the loop
        int iterations = (number1 + end) - ptr1 + 1;

        for (int i = 0; i < iterations; ++ptr1, --ptr2, ++i)
        {
            p += (*ptr1) * (*ptr2);
        }
        // product[set_index] = (set_index != 0) ? p % 10 : p;
        // carry[set_index - 1] = (set_index != 0) ? p / 10 : 0;
        *product_ptr = (set_index != 0) ? p % 10 : p;
        *(carry_ptr - 1) = (set_index != 0) ? p / 10 : 0;
        // Increment pointers for the next iteration
        product_ptr++;
        carry_ptr++;
    }

    // Adjust the carry and product in the second loop
    uint16_t c = 0; // Initialize c for carry
    product_ptr = product + max_index - 2;
    carry_ptr = carry + max_index - 2;
    for (int i = max_index - 2; i >= 0; i--, product_ptr--, carry_ptr--)
    {
        if (*carry_ptr == 0 && c == 0)
            continue;

        uint16_t p = *product_ptr + *carry_ptr + c;
        c = p / 10;
        *product_ptr = (i != 0) ? p % 10 : p;
    }
    // printf("Performed Urdhva-Tiryagbhyam multiplication\n");
    // Call extract_MSB_digits to extract the most significant digits
    int urdhva_product_len = max_index - 1;
    product = extract_MSB_digits(product, &urdhva_product_len);
    // Remove leading zeros
    product = remove_leading_zeros_16_t(product, &urdhva_product_len);
    *result_length = urdhva_product_len;
    return product;
}

// Function to make the two number strings equidistant by adding zeroes in front of the smaller number, and reallocate space for the smaller number
void make_equidistant(int **num1_base, int **num2_base, int *n_1, int *n_2)
{
    if (*n_1 == *n_2)
        return;

    int n1 = *n_1;
    int n2 = *n_2;
    int *num1 = *num1_base;
    int *num2 = *num2_base;

    if (n1 > n2)
    {
        // printf("Num1 is greater\n");
        int *temp = (int *)calloc(n1, sizeof(int));
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

        printf("\n");
        // reallocate space for num2 using realloc
        num2 = (int *)realloc(num2, n1 * sizeof(int));
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
        int *temp = (int *)calloc(n2, sizeof(int));
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
        num1 = (int *)realloc(num1, n2 * sizeof(int));
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

char *generateRandomNumber(int seed)
{
    gmp_randstate_t state;
    mpz_t random_number;

    // Initialize random number state
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL) + seed);

    // Initialize big number
    mpz_init(random_number);

    // Generate a random number of NUMBER_OF_BITS bits
    mpz_urandomb(random_number, state, NUMBER_OF_BITS);

    // Convert the number to a string
    char *resultString = mpz_get_str(NULL, 10, random_number);

    // Clean up
    mpz_clear(random_number);
    gmp_randclear(state);

    return resultString;
}

void generate_seed()
{
    // Get the current time in microseconds
    struct timeval time;
    gettimeofday(&time, NULL);
    unsigned long long now = time.tv_sec * 1e6 + time.tv_usec;

    // Get the process ID
    pid_t pid = getpid();

    // Combine the current time and the process ID to create a seed
    unsigned int seed = now ^ pid;

    // Set the seed for the rand() function
    srand(seed);
}
int *remove_leading_zeros(int *number, int *length)
{
    int i = 0;
    while (i < *length && number[i] == 0)
    {
        i++;
    }
    *length = *length - i;
    return number + i;
}

uint16_t *remove_leading_zeros_16_t(uint16_t *number, int *length)
{
    int i = 0;
    uint16_t *number_ptr = number;
    while (i < *length && *number_ptr == 0)
    {
        i++;
        number_ptr++;
    }
    *length = *length - i;
    return number + i;
}

uint16_t *msb_result;
// helper function to extract the most significant digits seperately for urdhva MSB
uint16_t *extract_MSB_digits(uint16_t *number, int *length)
{
    int result_length = *length;
    uint16_t *number_ptr = number; // Pointer to navigate the number array

    if (*number_ptr > 9)
    {
        // find the number of digits in the most significant digit
        int temp = *number_ptr;
        while (temp > 9)
        {
            temp /= 10;
            result_length++;
        }
    }
    else
        return number;

    // extract the most significant digits and store in result
    // adjust msb_result to store the most significant digits
    msb_result = realloc(msb_result, result_length * sizeof(uint16_t));
    uint16_t *msb_result_ptr = msb_result + (result_length - *length); // Pointer to the start position for MSD in msb_result

    while (*number_ptr > 0)
    {
        *msb_result_ptr-- = *number_ptr % 10;
        *number_ptr /= 10;
    }

    // Reset number_ptr to point to the next digit in the original number
    number_ptr = number + 1;

    // Copy the remaining digits of number to result
    for (msb_result_ptr = msb_result + (result_length - *length + 1); msb_result_ptr < msb_result + result_length; msb_result_ptr++, number_ptr++)
    {
        *msb_result_ptr = *number_ptr;
    }

    *length = result_length;
    return msb_result;
}
int main()
{
    // Initialize GMP variables
    mpz_t num1_gmp, num2_gmp, product_gmp;
    mpz_init(num1_gmp);
    mpz_init(num2_gmp);
    mpz_init(product_gmp);

    // Define the events to monitor
    struct perf_event_attr pe[MAX_EVENTS];
    int fd[MAX_EVENTS];
    long long count[MAX_EVENTS];
    int i;

    memset(&pe, 0, sizeof(struct perf_event_attr) * MAX_EVENTS);

    // Initialize the perf_event_attr structure for each event
    memset(pe, 0, sizeof(struct perf_event_attr) * 9);

    // CPU cycles
    pe[0].type = PERF_TYPE_HARDWARE;
    pe[0].config = PERF_COUNT_HW_CPU_CYCLES;
    pe[0].size = sizeof(struct perf_event_attr);
    pe[0].sample_period = 1; // Highly precise sampling
    pe[0].precise_ip = 3;    // Maximum precision
    pe[0].disabled = 1;      // Start disabled

    // User-level instructions
    pe[1].type = PERF_TYPE_HARDWARE;
    pe[1].config = PERF_COUNT_HW_INSTRUCTIONS;
    pe[1].size = sizeof(struct perf_event_attr);
    pe[1].sample_period = 1;
    pe[1].precise_ip = 3;
    pe[1].exclude_kernel = 1;
    pe[1].exclude_user = 0;
    pe[1].disabled = 1;

    // Kernel-level instructions
    pe[2].type = PERF_TYPE_HARDWARE;
    pe[2].config = PERF_COUNT_HW_INSTRUCTIONS;
    pe[2].size = sizeof(struct perf_event_attr);
    pe[2].sample_period = 1;
    pe[2].precise_ip = 3;
    pe[2].exclude_kernel = 0;
    pe[2].exclude_user = 1;
    pe[2].disabled = 1;

    // Page faults
    pe[3].type = PERF_TYPE_SOFTWARE;
    pe[3].config = PERF_COUNT_SW_PAGE_FAULTS;
    pe[3].size = sizeof(struct perf_event_attr);
    pe[3].sample_period = 1;
    pe[3].precise_ip = 3;
    pe[3].disabled = 1;

    // DTLB Misses
    pe[4].type = PERF_TYPE_HW_CACHE;
    pe[4].config = (PERF_COUNT_HW_CACHE_DTLB |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));
    pe[4].size = sizeof(struct perf_event_attr);
    pe[4].sample_period = 1;
    pe[4].precise_ip = 3;
    pe[4].disabled = 1;

    // L1d Cache Accesses
    pe[5].type = PERF_TYPE_HW_CACHE;
    pe[5].config = (PERF_COUNT_HW_CACHE_L1D |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_ACCESS << 16));
    pe[5].size = sizeof(struct perf_event_attr);
    pe[5].sample_period = 1;
    pe[5].precise_ip = 3;
    pe[5].disabled = 1;

    // L1d Cache Misses
    pe[6].type = PERF_TYPE_HW_CACHE;
    pe[6].config = (PERF_COUNT_HW_CACHE_L1D |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));
    pe[6].size = sizeof(struct perf_event_attr);
    pe[6].sample_period = 1;
    pe[6].precise_ip = 3;
    pe[6].disabled = 1;

    // LL Cache Accesses
    pe[7].type = PERF_TYPE_HW_CACHE;
    pe[7].config = (PERF_COUNT_HW_CACHE_LL |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_ACCESS << 16));
    pe[7].size = sizeof(struct perf_event_attr);
    pe[7].sample_period = 1;
    pe[7].precise_ip = 3;
    pe[7].disabled = 1;

    // LL Cache Misses
    pe[8].type = PERF_TYPE_HW_CACHE;
    pe[8].config = (PERF_COUNT_HW_CACHE_LL |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));
    pe[8].size = sizeof(struct perf_event_attr);
    pe[8].sample_period = 1;
    pe[8].precise_ip = 3;
    pe[8].disabled = 1;
    // Open the events
    for (i = 0; i < MAX_EVENTS; i++)
    {
        fd[i] = perf_event_open(&pe[i], 0, -1, -1, 0);
        if (fd[i] == -1)
        {
            fprintf(stderr, "Error opening event %d\n", i);
            exit(EXIT_FAILURE);
        }
    }

    // Array of event type names
    // Array of event type names
    const char *event_names[MAX_EVENTS] = {
        "PERF_COUNT_HW_CPU_CYCLES",          // CPU Cycles
        "PERF_COUNT_HW_USER_INSTRUCTIONS",   // User Instructions
        "PERF_COUNT_HW_KERNEL_INSTRUCTIONS", // Kernel Instructions
        "PERF_COUNT_SW_PAGE_FAULTS",         // Page Faults
        "PERF_COUNT_HW_CACHE_DTLB_MISS",     // DTLB Misses
        "PERF_COUNT_HW_CACHE_L1D_ACCESS",    // L1 Data Cache Accesses
        "PERF_COUNT_HW_CACHE_L1D_MISS",      // L1 Data Cache Misses (already included)
        "PERF_COUNT_HW_CACHE_L3_ACCESS",     // L3 Cache Accesses
        "PERF_COUNT_HW_CACHE_L3_MISS"        // L3 Cache Misses
    };

    // Open a file for writing for grade school
    char binary_name_grade_school[] = "perf_peo_grade_school"; // replace with actual binary name
    char filename_grade_school[100];

    snprintf(filename_grade_school, sizeof(filename_grade_school), "%s_%d.csv", binary_name_grade_school, NUMBER_OF_BITS);
    FILE *file_grade_school = fopen(filename_grade_school, "w");

    if (file_grade_school == NULL)
    {
        perror("Error opening file for writing for grade school\n");
        return -1;
    }

    // Write the header to the CSV file
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        fprintf(file_grade_school, "%s,", event_names[j]);
    }
    fprintf(file_grade_school, "\n");

    // Open a file for writing for urdhva
    char binary_name_urdhva[] = "perf_peo_urdhva"; // replace with actual binary name
    int input_size = 100;                          // replace with actual input size

    char filename_urdhva[100];
    snprintf(filename_urdhva, sizeof(filename_urdhva), "%s_%d.csv", binary_name_urdhva, NUMBER_OF_BITS);
    FILE *file_urdhva = fopen(filename_urdhva, "w");

    if (file_urdhva == NULL)
    {
        perror("Error opening file for writing for urdhva\n");
        return -1;
    }

    // Write the header to the CSV file
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        fprintf(file_urdhva, "%s,", event_names[j]);
    }
    fprintf(file_urdhva, "\n");

    // Open a file for writing for gmp
    char binary_name_gmp[] = "perf_peo_gmp"; // replace with actual binary name
    char filename_gmp[100];
    snprintf(filename_gmp, sizeof(filename_gmp), "%s_%d.csv", binary_name_gmp, NUMBER_OF_BITS);
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

    for (int iter = 0; iter < NUM_ITERATIONS; iter++)
    {
        // Generate two random numbers and convert them to integer arrays
        generate_seed();
        int randomNumber = (rand() % 100) + 1;
        char *randomString = generateRandomNumber(randomNumber);
        char *num1_str = randomString;
        generate_seed();
        randomNumber = (rand() % 100) + 1;
        randomString = generateRandomNumber(randomNumber);
        char *num2_str = randomString;
        int n1 = strlen(num1_str);
        int n2 = strlen(num2_str);
        int *num1 = (int *)calloc(n1, sizeof(int));
        int *num2 = (int *)calloc(n2, sizeof(int));
        for (int i = 0; i < n1; i++)
            num1[i] = num1_str[i] - '0';
        for (int i = 0; i < n2; i++)
            num2[i] = num2_str[i] - '0';

        // Make the two numbers equidistant
        make_equidistant(&num1, &num2, &n1, &n2);

        // Compute product using urdhva
        int n = (n1 > n2) ? n1 : n2;
        uint16_t *urdhva_product = (uint16_t *)calloc(2 * n - 1, sizeof(uint16_t));
        uint16_t *carry = (uint16_t *)calloc(2 * n - 1, sizeof(uint16_t));

        // Create uint16_t arrays for num1 and num2
        uint16_t *num1_uint16 = (uint16_t *)calloc(n, sizeof(uint16_t));
        uint16_t *num2_uint16 = (uint16_t *)calloc(n, sizeof(uint16_t));
        for (int i = n - 1; i >= 0; i--)
        {
            num1_uint16[i] = (uint16_t)num1[i];
            num2_uint16[i] = (uint16_t)num2[i];
        }

        int urdhva_product_len = 2 * n - 1;

        msb_result = (uint16_t *)calloc(urdhva_product_len, sizeof(uint16_t));
        // Compute product using grade school
        int *grade_school_product = (int *)calloc(n1 + n2, sizeof(int));
        uint64_t values[MAX_EVENTS];
        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }

        // // Start monitoring ticks
        // start_ticks = rdtsc();

        // // short delay before starting the function call, 10ms
        // sleep(0.01); // Delay for 10 milliseconds before starting the function call

        gradeSchoolMultiplication(num1, n1, num2, n2, grade_school_product);

        // // short delay after stopping the function call, 10ms
        // sleep(0.01); // Delay for 10 milliseconds after stopping the function call

        // Stop monitoring ticks
        // end_ticks = rdtsc();

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
            fprintf(file_grade_school, "%lu,", values[j]);
        }
        fprintf(file_grade_school, "\n");
        // printf("Grade school multiplicaton ticks: %lu\n", end_ticks - start_ticks);

        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }

        // // Start monitoring ticks
        // start_ticks = rdtsc();

        // // short delay before starting the function call, 10ms
        // sleep(0.01); // Delay for 10 milliseconds before starting the function call

        urdhva_product = urdhva(num1_uint16, num2_uint16, n, urdhva_product, carry, &urdhva_product_len);

        // // short delay after stopping the function call, 10ms
        // sleep(0.01); // Delay for 10 milliseconds after stopping the function call

        // // Stop monitoring ticks
        // end_ticks = rdtsc();

        // Stop monitoring
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
            {
                perror("Error disabling counter");
                exit(EXIT_FAILURE);
            }
        }
        printf("\n");

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
            fprintf(file_urdhva, "%lu,", values[j]);
        }
        fprintf(file_urdhva, "\n");

        // printf("Urdhva-Tiryagbhyam multiplicaton ticks: %lu\n", end_ticks - start_ticks);

        // Compute product using GMP
        mpz_set_str(num1_gmp, num1_str, 10);
        mpz_set_str(num2_gmp, num2_str, 10);

        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }

        // // Start monitoring ticks
        // start_ticks = rdtsc();

        // // short delay before starting the function call, 10ms
        // sleep(0.01); // Delay for 10 milliseconds before starting the function call

        mpz_mul(product_gmp, num1_gmp, num2_gmp);

        // // short delay after stopping the function call, 10ms
        // sleep(0.01); // Delay for 10 milliseconds after stopping the function call

        // // Stop monitoring ticks
        // end_ticks = rdtsc();

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

        // printf("GMP multiplicaton ticks: %lu\n", end_ticks - start_ticks);

        char *gmp_product_str = mpz_get_str(NULL, 10, product_gmp);
        int gmp_product_len = strlen(gmp_product_str);
        int *gmp_product = (int *)calloc(gmp_product_len, sizeof(int));
        for (int i = 0; i < gmp_product_len; i++)
            gmp_product[i] = gmp_product_str[i] - '0';

        gmp_product = remove_leading_zeros(gmp_product, &gmp_product_len);
        int n1_plus_n2 = n1 + n2;
        grade_school_product = remove_leading_zeros(grade_school_product, &n1_plus_n2);
        for (int i = 0; i < n1_plus_n2; i++)
        {
            if (grade_school_product[i] != urdhva_product[i] || grade_school_product[i] != gmp_product[i])
            {
                printf("Not matching for index %d, value at urdhva: %d, value at grade school: %d, value at gmp: %d\n", i, urdhva_product[i], grade_school_product[i], gmp_product[i]);
                printf("urdhva_product: ");
                for (int i = 0; i < urdhva_product_len; i++)
                    printf("%d", urdhva_product[i]);
                printf("\n");
                printf("grade_school_product: \n");
                for (int i = 0; i < n1 + n2; i++)
                    printf("%d", grade_school_product[i]);
                printf("\n");
                printf("gmp_product: \n");
                for (int i = 0; i < gmp_product_len; i++)
                    printf("%d", gmp_product[i]);
                printf("ABORT!, result does not match\n");
                return 1;
            }
        }
        printf("PASS: %d\n", iter);

        // // // Clean up
        // // free(num1);
        // // free(num2);
        // // free(urdhva_product);
        // // free(gmp_product);
        // // free(num1_str);
        // // free(num2_str);
        // // free(gmp_product_str);
    }
    // Close the files
    fclose(file_urdhva);
    fclose(file_gmp);

    // Close the file descriptors
    for (int i = 0; i < MAX_EVENTS; i++)
    {
        close(fd[i]);
    }
    // // Clean up GMP variables
    // mpz_clear(num1_gmp);
    // mpz_clear(num2_gmp);
    // mpz_clear(product_gmp);
    return 0;
}
