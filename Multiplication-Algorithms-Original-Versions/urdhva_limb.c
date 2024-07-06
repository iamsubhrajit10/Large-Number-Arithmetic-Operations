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
#include <errno.h>
#include <pthread.h>
#include <math.h>

#define NUMBER_OF_BITS 8192
#define NUM_ITERATIONS 1000
#define MAX_EVENTS 6

#define LIMB_SIZE 4
#define LIMB_DIGITS 10000 // 10^LIMB_SIZE

uint32_t *returnLimbs(uint32_t *number, int *length);
uint32_t *returnDigits(uint32_t *limbs, int num_limbs, int *length);

void make_equidistant(uint32_t **num1_base, uint32_t **num2_base, int *n_1, int *n_2);
char *generateRandomNumber(int seed);
void generate_seed();
char *formatUrdhvaResult(uint32_t *result, int result_length);
long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags);

// uint64_t returnArraySum(uint32_t *array, int length)
// {
//     uint64_t sum = 0;
//     for (int i = 0; i < length; i++)
//     {
//         sum += array[i];
//     }
//     return sum;
// }
#include <immintrin.h>
#include <stdint.h>

uint64_t returnArraySum(uint32_t *array, int length)
{
    __m512i vsum = _mm512_setzero_si512(); // Initialize the vector sum to zero
    int i = 0;

    // Process chunks of 16 elements at a time
    for (; i + 16 <= length; i += 16)
    {
        __m512i vdata = _mm512_loadu_si512((__m512i *)(array + i));
        vsum = _mm512_add_epi32(vsum, vdata);
    }

    // Extract elements from the vector sum and accumulate them in a 64-bit integer
    uint32_t temp[16];
    _mm512_storeu_si512((__m512i *)temp, vsum);

    uint64_t sum = 0;
    for (int j = 0; j < 16; ++j)
    {
        sum += temp[j];
    }

    // Sum any remaining elements
    for (; i < length; ++i)
    {
        sum += array[i];
    }

    return sum;
}

void mul_int_array_avx512(uint32_t *a, uint32_t *b, uint32_t *result)
{
    __m512i va = _mm512_loadu_si512((__m512i *)(a));
    __m512i vb = _mm512_loadu_si512((__m512i *)(b));
    vb = _mm512_permutexvar_epi32(_mm512_setr_epi32(15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0), vb);
    __m512i vresult = _mm512_mullo_epi32(va, vb);
    _mm512_storeu_si512((__m512i *)(result), vresult);
}

uint32_t *urdhva(uint32_t *number1, uint32_t *number2, int n, uint32_t *product, uint32_t *carry, int *result_length)
{
    int max_index = n << 1;
    int start_threshold = n - 1;
    int end_max = n - 1;
    uint32_t *product_ptr = product;
    uint32_t *carry_ptr = carry;
    uint32_t temp_product[n] __attribute__((aligned(64)));

    for (int set_index = 0; set_index < max_index - 1; set_index++)
    {
        uint64_t p = 0; // Use uint32_t for intermediate product calculation
        int start = (set_index > start_threshold) ? set_index - start_threshold : 0;
        int end = (set_index < n) ? set_index : end_max;

        uint32_t *ptr1 = number1 + start;
        uint32_t *ptr2 = number2 + end;

        int iterations = end - start + 1;
        int avx_iterations = iterations >> 4;
        int avx_remainder = iterations & 15;

        uint32_t *tmp_ptr = temp_product;
        // printf("Iterations: %d, AVX Iterations: %d, AVX Remainder: %d\n", iterations, avx_iterations, avx_remainder);
        for (int i = 0; i < avx_iterations; i++)
        {
            mul_int_array_avx512(ptr1, ptr2 - 15, tmp_ptr);
            ptr1 += 16;
            ptr2 -= 16;
            tmp_ptr += 16;
        }
        // multiply remaining elements using avx too, but only consider upto avx_remainder elements
        mul_int_array_avx512(ptr1, ptr2 - 15, tmp_ptr);
        tmp_ptr = temp_product;
        p = returnArraySum(tmp_ptr, iterations);

        *product_ptr = (set_index != 0) ? p % LIMB_DIGITS : p;
        *(carry_ptr - 1) = (set_index != 0) ? p / LIMB_DIGITS : 0;
        product_ptr++;
        carry_ptr++;
    }

    // print values of product and carry

    // Adjust the carry and product in the second loop
    uint32_t c = 0; // Initialize c for carry
    product_ptr = product + max_index - 2;
    carry_ptr = carry + max_index - 2;
    for (int i = max_index - 2; i >= 0; i--, product_ptr--, carry_ptr--)
    {
        if (*carry_ptr == 0 && c == 0)
            continue;

        uint32_t p = *product_ptr + *carry_ptr + c;
        c = p / LIMB_DIGITS;

        *product_ptr = (i != 0) ? p % LIMB_DIGITS : p;
        *result_length = i + 1;
    }
    *result_length = max_index - 1;
    return product;
}

int main()
{
    // Prepare for the performance counter
    // Define the events to monitor
    struct perf_event_attr pe[MAX_EVENTS];
    int fd[MAX_EVENTS];
    long long count[MAX_EVENTS];
    int i;

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
    // Array of event type names
    const char *event_names[MAX_EVENTS] = {
        "PERF_COUNT_HW_CPU_CYCLES",          // CPU Cycles
        "PERF_COUNT_HW_USER_INSTRUCTIONS",   // User Instructions
        "PERF_COUNT_HW_KERNEL_INSTRUCTIONS", // Kernel Instructions
        "PERF_COUNT_SW_PAGE_FAULTS",         // Page Faults
        "PERF_COUNT_L1D_CACHE_READS",        // L1D Cache Reads
        "PERF_COUNT_L1D_CACHE_READ_MISSES"   // L1D Cache Read Misses
    };

    // Open a file for writing for urdhva
    char binary_name_urdhva[] = "Urdhva_Limb_"; // replace with actual binary name
    int input_size = 100;                       // replace with actual input size

    char filename_urdhva[100];
    snprintf(filename_urdhva, sizeof(filename_urdhva), "experiments/%s_%d.csv", binary_name_urdhva, NUMBER_OF_BITS);
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
    char binary_name_gmp[] = "GMP_"; // replace with actual binary name
    char filename_gmp[100];
    snprintf(filename_gmp, sizeof(filename_gmp), "experiments/%s_%d.csv", binary_name_gmp, NUMBER_OF_BITS);
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
        uint32_t *num1 = (uint32_t *)calloc(n1, sizeof(uint32_t));
        uint32_t *num2 = (uint32_t *)calloc(n2, sizeof(uint32_t));
        for (int i = 0; i < n1; i++)
            num1[i] = num1_str[i] - '0';
        for (int i = 0; i < n2; i++)
            num2[i] = num2_str[i] - '0';

        // Make the two numbers equidistant
        make_equidistant(&num1, &num2, &n1, &n2);

        // Compute product using urdhva
        int n = (n1 > n2) ? n1 : n2;

        // printf("Number 1: ");
        // for (int i = 0; i < n1; i++)
        // {
        //     printf("%d", num1[i]);
        // }
        // printf("\n");
        // printf("Number 2: ");
        // for (int i = 0; i < n2; i++)
        // {
        //     printf("%d", num2[i]);
        // }
        // printf("\n");

        uint32_t *urdhva_product = (uint32_t *)calloc(2 * n - 1, sizeof(uint32_t));
        uint32_t *carry = (uint32_t *)calloc(2 * n - 1, sizeof(uint32_t));
        memset(urdhva_product, 0, 2 * n - 1);
        memset(carry, 0, 2 * n - 1);
        // Create uint32_t arrays for num1 and num2
        uint32_t *num1_uint32_t = (uint32_t *)calloc(n, sizeof(uint32_t));
        uint32_t *num2_uint32_t = (uint32_t *)calloc(n, sizeof(uint32_t));
        for (int i = n - 1; i >= 0; i--)
        {
            num1_uint32_t[i] = (uint32_t)num1[i];
            num2_uint32_t[i] = (uint32_t)num2[i];
        }

        int urdhva_product_len = 2 * n - 1;
        uint32_t *limbs1 = returnLimbs(num1_uint32_t, &n1);
        uint32_t *limbs2 = returnLimbs(num2_uint32_t, &n2);

        n = (n1 > n2) ? n1 : n2;
        // printf("Number 1: ");
        // for (int i = 0; i < n1; i++)
        // {
        //     printf("%d ", limbs1[i]);
        // }

        // printf("\n");
        // printf("Number 2: ");
        // for (int i = 0; i < n2; i++)
        // {
        //     printf("%d ", limbs2[i]);
        // }
        // printf("\n");

        int result_length = 2 * n - 1;

        uint64_t values[MAX_EVENTS];
        // flash out all the cache contents

        // prefetch the arrays
        __builtin_prefetch(limbs1, 0, 3);
        __builtin_prefetch(limbs2, 0, 3);

        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }

        uint32_t *result = urdhva(limbs1, limbs2, n, urdhva_product, carry, &result_length);

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
            fprintf(file_urdhva, "%lu,", values[j]);
        }
        fprintf(file_urdhva, "\n");

        char *result_str_no_leading_zeros = formatUrdhvaResult(result, result_length);
        // printf("Urdhva Product: ");
        // for (int i = 0; i < result_length; i++)
        // {
        //     printf("%d ", result[i]);
        // }
        // printf("\n");

        // Assuming result_length is the number of elements in result_number

        // printf("Urdhva Result: %s\n", result_str_no_leading_zeros);
        // GMP Mul
        mpz_t num1_gmp, num2_gmp, product_gmp;
        mpz_init(num1_gmp);
        mpz_init(num2_gmp);
        mpz_init(product_gmp);
        mpz_set_ui(num1_gmp, 0);
        mpz_set_ui(num2_gmp, 0);
        mpz_set_ui(product_gmp, 0);
        n1 = strlen(num1_str);
        n2 = strlen(num2_str);
        // Compute product using GMP
        mpz_set_str(num1_gmp, num1_str, 10);
        mpz_set_str(num2_gmp, num2_str, 10);

        // Start monitoring
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }

        mpz_mul(product_gmp, num1_gmp, num2_gmp);

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

        char *product_gmp_str = mpz_get_str(NULL, 10, product_gmp);
        // printf("GMP Result:    %s\n", product_gmp_str);
        int length_gmp = strlen(product_gmp_str);
        // Compare the results
        for (int i = 0; i < length_gmp; i++)
        {
            if (result_str_no_leading_zeros[i] != product_gmp_str[i])
            {
                printf("Results do not match, exiting\n");
                printf("Urdhva Product Arr: ");
                for (int i = 0; i < result_length; i++)
                {
                    printf("%d ", result[i]);
                }
                printf("\n");
                printf("Urdhva Product Str: %s\n", result_str_no_leading_zeros);
                printf("GMP Product Str:    %s\n", product_gmp_str);
                printf("index: %d, urdhva: %c, gmp: %c\n", i, result_str_no_leading_zeros[i], product_gmp_str[i]);
                return 1;
            }
        }
        printf("Results match, continuing, iteration: %d\n", iter);
        // free the allocated memories
        // free(result_str_no_leading_zeros);
        // free(num1);
        // free(num2);
        // free(urdhva_product);
        // free(carry);
        // free(num1_uint32_t);
        // free(num2_uint32_t);
        // free(limbs1);
        // free(limbs2);
        // free(product_gmp_str);
    }
}

long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags)
{
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}

char *formatUrdhvaResult(uint32_t *result, int result_length)
{
    char *result_str = (char *)calloc(result_length * 11 + 1, sizeof(char)); // 10 digits + null terminator per number
    if (result_str == NULL)
    {
        perror("Memory allocation failed for result_str\n");
        exit(EXIT_FAILURE);
    }

    char *temp_ptr = result_str; // Use a temporary pointer to append to the string
    for (int i = 0; i < result_length; i++)
    {
        if (i == 0 && result[i] == 0)
        {
            continue;
        }
        else if (i != 0 && result[i] < 1000)
        {
            // Append '0' before the number if it's less than 1000 and not the first element
            int num_zeros = 0;
            // if (result[i] < 10)
            // {
            //     num_zeros = 3;
            // }
            // else if (result[i] < 100)
            // {
            //     num_zeros = 2;
            // }
            // else
            // {
            //     num_zeros = 1;
            // }
            int temp = result[i];
            int threshold = LIMB_DIGITS / 10;
            while (threshold > 9 && temp < threshold)
            {
                num_zeros++;
                threshold /= 10;
            }

            for (int j = 0; j < num_zeros; j++)
            {
                temp_ptr += sprintf(temp_ptr, "0");
            }
            temp_ptr += sprintf(temp_ptr, "%u", result[i]);
        }
        else
        {
            // Use sprintf to append each number to the string normally
            temp_ptr += sprintf(temp_ptr, "%u", result[i]);
        }
    }
    // remove leading zeros
    int i = 0;
    while (result_str[i] == '0')
    {
        i++;
    }
    if (i == result_length * 11)
    {
        i--;
    }
    char *result_str_no_leading_zeros = result_str + i;
    return result_str_no_leading_zeros;
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

uint32_t *returnDigits(uint32_t *limbs, int num_limbs, int *length)
{
    int first_limb = limbs[0];
    int first_limb_digits = 0;
    while (first_limb > 0)
    {
        first_limb_digits++;
        first_limb /= 10;
    }
    int total_digits = (num_limbs - 1) * LIMB_SIZE + first_limb_digits;
    uint32_t *number = (uint32_t *)malloc(total_digits * sizeof(uint32_t));
    if (number == NULL)
    {
        printf("Memory could not be allocated for number\n");
        exit(1);
    }
    // Initially, extract the first limb digits
    int i = first_limb_digits - 1; // Index for the number array
    int j = 0;                     // Index for the limbs array
    int first_limb_copy = limbs[j];
    while (first_limb_copy > 0)
    {
        number[i] = first_limb_copy % 10;
        first_limb_copy /= 10;
        i--;
    }
    j++;
    i = first_limb_digits;
    // Extract the remaining limbs
    while (j < num_limbs)
    {
        int limb = limbs[j];
        for (int k = 0; k < LIMB_SIZE; k++)
        {
            number[i] = limb % 10;
            limb /= 10;
            i++;
        }
        j++;
    }

    *length = total_digits;
    return number;
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

        printf("\n");
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
