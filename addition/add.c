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
#define MAX_EVENTS 6

#define NUM_BITS 8192
#define LIMB_SIZE 4

int *scratch_space;
int scratch_pointer = 0;
long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags)
{
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}

// Function to equalize the length of two arrays, while holding existing values, appending zeros to the front of the smaller array
void equalizeLength(int **a, int **b, int n, int m)
{
    int diff, i;
    int *temp;

    if (n > m)
    {
        diff = n - m;
        // temp = (int *)malloc(n * sizeof(int));
        temp = scratch_space + scratch_pointer;
        scratch_pointer += n;

        // Fill the new positions with zeros
        for (i = 0; i < diff; i++)
        {
            temp[i] = 0;
        }

        // Copy the old array to the new position
        memcpy(temp + diff, *b, m * sizeof(int));
        free(*b);
        *b = temp;
    }
    else if (m > n)
    {
        diff = m - n;
        // temp = (int *)malloc(m * sizeof(int));
        temp = scratch_space + scratch_pointer;
        scratch_pointer += m;

        // Fill the new positions with zeros
        for (i = 0; i < diff; i++)
        {
            temp[i] = 0;
        }

        // Copy the old array to the new position
        memcpy(temp + diff, *a, n * sizeof(int));
        free(*a);
        *a = temp;
    }
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
int *add(int *a, int *b, int n, int m, int *sum, int *sum_size)
{
    // Equalize the length of both arrays
    if (n != m)
    {
        equalizeLength(&a, &b, n, m);
        *sum_size = (n > m ? n : m);
    }
    else
    {
        *sum_size = n;
    }
    // sum = (int *)realloc(sum, *sum_size * sizeof(int));
    // allocate from scratch space
    sum = scratch_space + scratch_pointer;
    scratch_pointer += *sum_size;

    // Add the digits of the two arrays, starting from the least significant digit.
    for (int i = *sum_size - 1; i >= 0; i--)
    {
        sum[i] = a[i] + b[i];
    }
    // Loop through the digits of the sum array from the least significant digit to the most significant digit.
    int carry = 0;
    for (int i = *sum_size - 1; i >= 0; i--)
    {
        sum[i] += carry;
        carry = sum[i] / 10;
        sum[i] %= 10;
    }
    // If the sum has a carry in the most significant digit
    if (carry)
    {
        // reallocate sum
        sum = (int *)realloc(sum, (*sum_size + 1) * sizeof(int));
        sum[0] = carry;
        sum[1] = sum[1] % 10;
        *sum_size += 1;
    }
    return sum;
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
    int *a = (int *)malloc(n * sizeof(int));
    int *b = (int *)malloc(m * sizeof(int));
    for (int i = 0; i < n; i++)
    {
        a[i] = num1_str[i] - '0';
    }
    for (int i = 0; i < m; i++)
    {
        b[i] = num2_str[i] - '0';
    }
    printf("The two numbers are: ");
    for (int i = 0; i < n; i++)
    {
        printf("%d", a[i]);
    }
    printf(" ");
    for (int i = 0; i < m; i++)
    {
        printf("%d", b[i]);
    }
    printf("\n");

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

    // Open a file for writing formatted output
    char binary_name[] = "add_"; // replace with actual binary name
    int input_size = 100;        // replace with actual input size

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
    // // measure elapsed time with high precision
    // struct timespec start, end;
    // clock_gettime(CLOCK_REALTIME, &start);
    uint64_t values[MAX_EVENTS];
    // Start the events
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
        ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
    }

    sum = add(a, b, n, m, sum, &sum_size);

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
    printf("The sum of the two numbers is: ");
    for (int i = 0; i < sum_size; i++)
    {
        printf("%d", sum[i]);
    }
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
    // Start the events
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
        ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
    }

    mpz_init(sum_gmp);

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

    // // measure elapsed time with high precision
    // clock_gettime(CLOCK_REALTIME, &start);
    mpz_add(sum_gmp, num1_gmp, num2_gmp); // Use mpz_add function to add two numbers
    // clock_gettime(CLOCK_REALTIME, &end);
    char *sum_gmp_str = mpz_get_str(NULL, 10, sum_gmp);

    printf("\n");

    printf("The sum of the two numbers using GMP is: %s\n", sum_gmp_str);

    // convert add's output sum into a string
    char *sum_str = (char *)malloc(sum_size * sizeof(char));
    for (int i = 0; i < sum_size; i++)
    {
        sum_str[i] = sum[i] + '0';
    }
    sum_str[sum_size] = '\0';
    // printf("The sum of the two numbers using add function is: %s\n", sum_str);
    // check if the two sums are equal
    if (strlen(sum_gmp_str) != sum_size)
    {
        printf("The two sums are not equal\n");
        printf("Lengths are different\n");
        printf("Length of add_sum = %d, length of gmp_sum = %ld\n", sum_size, strlen(sum_gmp_str));
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
