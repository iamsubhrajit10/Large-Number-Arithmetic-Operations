/*
This code adds two numbers, represented as array of digits.
a --> array of digits of first number, of length n
b --> array of digits of second number, of length m
#Pre-processing:
1. Equalize the length of both arrays by adding leading zeros to the smaller array.
Note: For pre-processing, we can use the realloc function to add leading zeros to the smaller array.
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

#define MAX_EVENTS 6

#define LIMB_SIZE 9
#define ITERATIONS 100000

uint32_t *sum_space;
uint32_t *carry_space;
static int sum_space_ptr = 0;
static int carry_space_ptr = 0;

static uint32_t LIMB_DIGITS = 1000000000;
__m512i limb_digits;
__m512i minus_limb_digits;
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
/*
 This function simply adds two arrays of numbers and stores the result in a third array.
    The arrays are assumed to be of the same length.
    It uses avx512 instructions to add the numbers.
    As, data is of type uint32_t, we can add 16 numbers at a time.
    Procedure:
    1. Load a and b into a_vec, b_vec respectively.
    2. sum_vec = a_vec + b_vec
    3. mask = sum_vec >= LIMB_DIGITS
    4. carry_vec = 0
    5. carry_vec = mask ? 1 : 0
    6. sum_vec = mask ? sum_vec - LIMB_DIGITS : sum_vec
    7. Store sum_vec in sum
    8. Repeat steps 1-7 for the remaining elements
    9. Shift the carry array to the left by 1 position
    10. sum = sum + carry
    11. Repeat step 10 for the remaining elements
    12. Return the sum
*/

void *sum_avx512(uint32_t *a, uint32_t *b, int n, uint32_t *sum, int *sum_size)
{

    int i;
    // Allocate scratch space for carry array
    uint32_t *carry_array = carry_space;

    // Process first 16 elements separately

    // Load 16 elements from a and b
    __m512i a_vec = _mm512_load_si512((__m512i *)a);
    __m512i b_vec = _mm512_load_si512((__m512i *)b);

    // Step 1: Add 16 elements at a time
    __m512i sum_vec = _mm512_add_epi32(a_vec, b_vec);

    // Step 2: Extract carry mask of 16 elements at once
    __mmask16 mask = _mm512_cmpge_epu32_mask(sum_vec, limb_digits);

    mask = mask & 0xFFFE; // 0xFFFE masks out the first bit

    // Step 3: If Carry[0] is 1, sum[0] = sum[0] - LIMB_DIGITS
    __m512i temp = _mm512_mask_sub_epi32(sum_vec, mask, sum_vec, limb_digits);
    __m512i carry_vec = _mm512_maskz_set1_epi32(mask, 1);

    // Store the carry in the carry_array
    _mm512_storeu_si512((__m512i *)carry_array, carry_vec);

    // Store the sum in the sum array
    _mm512_storeu_si512((__m512i *)sum, temp);

    // Process addition with AVX-512 instructions
    for (i = 16; i < n; i += 16)
    {
        // Load 16 elements from a and b
        a_vec = _mm512_load_si512((__m512i *)(a + i));
        b_vec = _mm512_load_si512((__m512i *)(b + i));

        // Add 16 elements at a time
        sum_vec = _mm512_add_epi32(a_vec, b_vec);

        // Extract carry mask and adjust sum simultaneously
        mask = _mm512_cmpge_epu32_mask(sum_vec, limb_digits);

        // Adjust sum_vec where carry occurred
        temp = _mm512_mask_sub_epi32(sum_vec, mask, sum_vec, limb_digits);

        // Convert carry_mask to carry vector and store directly
        carry_vec = _mm512_maskz_set1_epi32(mask, 1);
        _mm512_storeu_si512((__m512i *)(carry_array + i), carry_vec);

        // Store the adjusted sum in the sum array
        _mm512_storeu_si512((__m512i *)(sum + i), temp);
    }

    // Shift the carry_array to the left by 1 position
    carry_array = carry_array + 1;
    carry_array[n - 1] = 0;

    for (i = 0; i < n; i += 16)
    {
        carry_vec = _mm512_loadu_si512((__m512i *)(carry_array + i));
        sum_vec = _mm512_loadu_si512((__m512i *)(sum + i));

        sum_vec = _mm512_add_epi32(sum_vec, carry_vec);
        _mm512_storeu_si512((__m512i *)(sum + i), sum_vec);
    }

    // // Align i to the next multiple of 16
    // i = (n + 15) & ~15;
    // for (; i >= 0; i -= 16)
    // {
    //     carry_vec = _mm512_loadu_si512((__m512i *)(carry_array + i));
    //     sum_vec = _mm512_loadu_si512((__m512i *)(sum + i));

    //     sum_vec = _mm512_add_epi32(sum_vec, carry_vec);
    //     _mm512_storeu_si512((__m512i *)(sum + i), sum_vec);
    // }
}

/*
 This function simply adds two arrays of numbers and stores the result in a third array.
    The arrays are assumed to be of the same length.
    It uses avx512 instructions to add the numbers.
    As, data is of type uint32_t, we can add 16 numbers at a time.
    Procedure:
    0. vec0 <- 0, vec1 <- 0
    1. Load a and b into a_vec, b_vec respectively starting from the least significant limb.
    2. sum_vec = b_vec + vec1
    3. sum_vec = a_vec + sum_vec
    4. mask = sum_vec >= LIMB_DIGITS
    5. carry_vec = 0
    6. carry_vec = mask ? 1 : 0
    7. <vec1,vec0> = left shift carry_vec by 1 position
    8. sum_vec = mask ? sum_vec - LIMB_DIGITS : sum_vec
    9. sum = sum_vec + vec0
    10. Store sum in the sum array
    11. Repeat steps 1-10 for the remaining elements in reverse order (from the least significant limb to the most significant limb)
    12. Return the sum
*/
// Function to print a __mmask16 in binary
void print_mask_binary(__mmask16 mask)
{
    for (int i = 15; i >= 0; --i)
    {
        printf("%d", (mask >> i) & 1);
    }
    printf("\n");
}

// Function to add two numbers
/*
Procedure:
1. Equalize the length of both arrays.
2. Add the digits of the two arrays, starting from the least significant digit.
   (Note: Don't compute carry, just add the digits)
3. Loop through the digits of the sum array from the least significant digit to the most significant digit.
   If the digit is greater than 9, subtract 10 from the digit and add 1 to the next digit.
// 4. If the most significant digit is 0, remove it.
*/
void *add_n(uint32_t *a, uint32_t *b, int n, uint32_t *sum, int *sum_size)
{
    // Compute sum without carry propagation using avx512; sum_avx512 function
    // int i = 0;
    // for (i = 0; i < n; i += 16)
    // {
    //     __m512i a_vec = _mm512_load_si512((__m512i *)(a + i));
    //     __m512i b_vec = _mm512_load_si512((__m512i *)(b + i));
    //     __m512i sum_vec = _mm512_add_epi32(a_vec, b_vec);
    //     _mm512_storeu_si512((__m512i *)(sum + i), sum_vec);
    // }
    // uint32_t *sum_pointer = sum + n - 1;

    // // Loop through the digits of the sum array from the least significant digit to the most significant digit.
    // uint32_t carry = 0;
    // for (int i = 0; i < n; i++)
    // {
    //     uint32_t temp_sum = *sum_pointer + carry;
    //     carry = (temp_sum >= LIMB_DIGITS);
    //     *sum_pointer = carry ? (temp_sum - LIMB_DIGITS) : temp_sum;
    //     sum_pointer--;
    // }
    // If the sum has a carry in the most significant digit
    // if (carry)
    // {
    //     // Shift the sum array to the right by one position
    //     memmove(sum + 1, sum, n * sizeof(uint32_t));
    //     sum[0] = carry;
    //     *sum_size = n + 1;
    // }
    sum_avx512(a, b, n, sum, sum_size);
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
    char binary_name[] = "add_limb_avx_"; // replace with actual binary name
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

    // Allocate scratch space for the sum and carry arrays
    uint32_t *sum_space = (uint32_t *)malloc(1 << 30);
    if (sum_space == NULL)
    {
        perror("Memory allocation failed for sum_space\n");
        exit(0);
    }

    for (int iter = 0; iter < ITERATIONS; iter++)
    {

        // Generate random numbers using  GMP library
        mpz_t num1_gmp, num2_gmp;
        mpz_t sum_gmp;
        mpz_init(num1_gmp);
        mpz_init(num2_gmp);
        mpz_init(sum_gmp);
        gmp_randstate_t state;
        gmp_randinit_default(state);
        gmp_randseed_ui(state, time(NULL));
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

        int sum_size;
        // int *sum = (int *)malloc((n > m ? n : m) * sizeof(int));

        // allocate from scratch space
        uint32_t *sum = sum_space + sum_space_ptr;
        sum_space_ptr += (n + 31) & ~31;
        // Clear the sum array
        memset(sum, 0, (n + 1) * sizeof(uint32_t));

        carry_space = (uint32_t *)malloc((n) * sizeof(uint32_t));
        if (carry_space == NULL)
        {
            perror("Memory allocation failed for carry_space\n");
            exit(0);
        }
        carry_space_ptr = 0;
        memset(carry_space, 0, n * sizeof(uint32_t));

        uint64_t values[MAX_EVENTS];
        assert(n_limb == m_limb);
        sum_size = n_limb;
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

        add_n(a_limbs, b_limbs, n_limb, sum, &sum_size);

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

        mpz_add(sum_gmp, num1_gmp, num2_gmp); // Use mpz_add function to add two numbers

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
        // printf("Time taken to add two numbers using GMP: %lf seconds\n", end.tv_sec - start.tv_sec + (end.tv_nsec - start.tv_nsec) / 1e9);

        gmp_total_time += (double)(end.tv_sec - start.tv_sec) + (double)(end.tv_nsec - start.tv_nsec) / 1e9;

        char *sum_gmp_str = mpz_get_str(NULL, 10, sum_gmp);

        // printf("\n");

        // printf("The sum of the two numbers using GMP is: %s\n", sum_gmp_str);

        // convert add's output sum into a string
        char *sum_str = formatResult(sum, &sum_size);
        // printf("The sum of the two numbers using add function is: %s\n", sum_str);
        // check if the two sums are equal
        if (strlen(sum_gmp_str) != strlen(sum_str))
        {
            printf("The two sums are not equal\n");
            printf("Lengths are different\n");
            printf("Length of add_sum = %d, length of gmp_sum = %ld\n", sum_size, strlen(sum_gmp_str));
            printf("add_sum = %s, gmp_sum = %s\n", sum_str, sum_gmp_str);
            return 1;
        }
        for (int i = 0; i < sum_size; i++)
        {
            if (sum_str[i] != sum_gmp_str[i])
            {
                printf("The two sums are not equal\n");
                printf("Mismatch at index %d\n", i);
                printf("add_sum[%d] = %c, gmp_sum[%d] = %c\n", i, sum_str[i], i, sum_gmp_str[i]);
                printf("add_sum = %s\ngmp_sum = %s\n", &sum_str[i], &sum_gmp_str[i]);
                printf("add_sum = %s\ngmp_sum = %s\n", sum_str, sum_gmp_str);
                return 1;
            }
        }
        // printf("The two sums are equal, iteration %d\n", iter);
        free(a);
        free(b);
        free(a_limbs);
        free(b_limbs);
        free(carry_space);
        mpz_clear(num1_gmp);
        mpz_clear(num2_gmp);
        mpz_clear(sum_gmp);
        memset(sum_space, 0, (n + 1) * sizeof(uint32_t));
        sum_space_ptr = 0;
    }
    printf("Total time taken to add two numbers using AVX: %lf seconds\n", avx_total_time);
    printf("Total time taken to add two numbers using GMP: %lf seconds\n", gmp_total_time);
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
    for (i = 0; i < *result_length; i++)
    {
        char temp[15];
        sprintf(temp, "%09d", result[i]);
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
// Function to make the two number strings equidistant by adding zeroes in front of the smaller number, and reallocate space for the smaller number
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