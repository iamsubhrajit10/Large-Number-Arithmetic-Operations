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
#define NUM_BITS 8192
#define LIMB_SIZE 8
#define LIMB_DIGITS 100000000

int *scratch_space;
int scratch_pointer = 0;

uint32_t *returnLimbs(uint32_t *number, int *length);
char *formatResult(uint32_t *result, int result_length);
void make_equidistant(uint32_t **num1_base, uint32_t **num2_base, int *n_1, int *n_2);

long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags)
{
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
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
    uint32_t *sum_pointer = sum + n - 1;
    uint32_t *a_pointer = a + n - 1;
    uint32_t *b_pointer = b + n - 1;

    uint32_t carry = 0;
    // Add the digits of the two arrays, starting from the least significant digit.
    for (int i = 0; i < n; i++)
    {
        uint32_t temp_sum = *a_pointer + *b_pointer;
        temp_sum += carry;
        carry = (temp_sum >= LIMB_DIGITS);
        *sum_pointer = carry ? (temp_sum - LIMB_DIGITS) : temp_sum;
        sum_pointer--;
        a_pointer--;
        b_pointer--;
    }
    // If the sum has a carry in the most significant digit
    if (carry)
    {
        // Shift the sum array to the right by one position
        memmove(sum + 1, sum, n * sizeof(uint32_t));
        sum[0] = carry;
        *sum_size = n + 1;
        // scratch_pointer++;
    }
}

int main()
{
    // allocate 2MB scratch space
    scratch_space = (int *)malloc(2 * 1024 * 1024);
    if (scratch_space == NULL)
    {
        perror("Error allocating scratch space\n");
        return -1;
    }

    // Generate random numbers using  GMP library
    mpz_t num1_gmp, num2_gmp;
    mpz_init(num1_gmp);
    mpz_init(num2_gmp);
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

    // printf("The two numbers are: ");
    // for (int i = 0; i < n; i++)
    // {
    //     printf("%d", a[i]);
    // }
    // printf(" ");
    // for (int i = 0; i < m; i++)
    // {
    //     printf("%d", b[i]);
    // }
    // printf("\n");

    // Convert array of digits to array of limbs
    int n_limb = n;
    int m_limb = m;
    uint32_t *a_limbs = returnLimbs(a, &n_limb);
    uint32_t *b_limbs = returnLimbs(b, &m_limb);
    // printf("The two numbers in limbs are: ");
    // for (int i = 0; i < n_limb; i++)
    // {
    //     printf("%u ", a_limbs[i]);
    // }
    // printf("\n");
    // for (int i = 0; i < m_limb; i++)
    // {
    //     printf("%u ", b_limbs[i]);
    // }
    // printf("\n");

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
    const char *event_names[MAX_EVENTS] = {
        "PERF_COUNT_HW_CPU_CYCLES",          // CPU Cycles
        "PERF_COUNT_HW_USER_INSTRUCTIONS",   // User Instructions
        "PERF_COUNT_HW_KERNEL_INSTRUCTIONS", // Kernel Instructions
        "PERF_COUNT_SW_PAGE_FAULTS",         // Page Faults
        "PERF_COUNT_L1D_CACHE_READS",        // L1D Cache Reads
        "PERF_COUNT_L1D_CACHE_READ_MISSES"   // L1D Cache Read Misses
    };

    // Open a file for writing formatted output
    char binary_name[] = "add_limb_"; // replace with actual binary name
    int input_size = 100;             // replace with actual input size

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

    int sum_size;
    int *sum = (int *)malloc((n > m ? n : m) * sizeof(int));

    // allocate from scratch space
    sum = scratch_space + scratch_pointer;
    scratch_pointer += (n + 31) & ~31;

    // // measure elapsed time with high precision
    // struct timespec start, end;
    // clock_gettime(CLOCK_REALTIME, &start);
    uint64_t values[MAX_EVENTS];
    assert(n_limb == m_limb);
    sum_size = n_limb;
    // Start the events
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
        ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
    }

    add_n(a_limbs, b_limbs, n_limb, sum, &sum_size);

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

    // clock_gettime(CLOCK_REALTIME, &end);
    // double time_taken = end.tv_sec - start.tv_sec + (end.tv_nsec - start.tv_nsec) / 1e9;
    // printf("Time taken to add two numbers: %lf seconds\n", time_taken);
    // printf("The sum of the two numbers is: ");
    // for (int i = 0; i < sum_size; i++)
    // {
    //     printf("%d ", sum[i]);
    // }
    // add with GMP's addition
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
    mpz_t sum_gmp;

    mpz_init(sum_gmp);

    // // measure elapsed time with high precision
    // clock_gettime(CLOCK_REALTIME, &start);

    // Start the events
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
        ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
    }
    mpz_add(sum_gmp, num1_gmp, num2_gmp); // Use mpz_add function to add two numbers

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

    // clock_gettime(CLOCK_REALTIME, &end);
    char *sum_gmp_str = mpz_get_str(NULL, 10, sum_gmp);

    // printf("\n");

    // printf("The sum of the two numbers using GMP is: %s\n", sum_gmp_str);

    // convert add's output sum into a string
    char *sum_str = formatResult(sum, sum_size);
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
            return 1;
        }
    }
    printf("The two sums are equal\n");
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

char *formatResult(uint32_t *result, int result_length)
{
    char *result_str = (char *)calloc(result_length * 15 + 1, sizeof(char)); // 10 digits + null terminator per number
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
        else if (i != 0 && result[i] < LIMB_DIGITS / 10)
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
            uint32_t temp = result[i];
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
            temp_ptr += sprintf(temp_ptr, "%d", result[i]);
        }
        else
        {
            // Use sprintf to append each number to the string normally
            temp_ptr += sprintf(temp_ptr, "%d", result[i]);
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