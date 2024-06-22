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

#define NUM_ITERATIONS 1000
#define NUMBER_OF_BITS 8192
#define MAX_EVENTS 7 // Maximum number of events to monitor
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

// Function to perform Urdhva-Tiryagbhyam multiplication using memoization
void urdhva(int *number1, int *number2, int n, int *product, int *carry, const int memo[10][10])
{
    int max_index = 2 * n;

    for (int sum = 0; sum < max_index; sum++)
    {
        int p = 0;
        int start = (sum - (n - 1) > 0) ? sum - (n - 1) : 0;
        int end = (sum < n) ? sum : n - 1;

        int n2_index = sum - start; // Initialize n2_index based on the starting value
        for (int n1_index = start; n1_index <= end; n1_index++, n2_index--)
        {
            p += number1[n1_index] * number2[n2_index];
        }
        if (sum != 0)
        {
            carry[sum - 1] = p / 10;
            product[sum] = p % 10;
        }
        else
        {
            product[sum] = p; // For the very first digit, there's no carry to consider
        }
    }

    for (int c = 0, i = max_index - 2; i >= 0; i--)
    {
        if (carry[i] == 0 && c == 0)
            continue;
        int p = product[i] + carry[i] + c;
        c = p / 10;
        product[i] = (i != 0) ? p % 10 : p;
    }
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

// helper function to extract the most significant digits seperately for urdhva MSB
int *extract_MSB_digits(int *number, int length)
{
    int result_length = length;
    if (number[0] > 9)
    {
        // find the number of digits in the most significant digit
        int temp = number[0];
        while (temp > 9)
        {
            temp = temp / 10;
            result_length++;
        }
    }
    else
        return number;
    int *result = (int *)calloc(result_length, sizeof(int));
    // extract the most significant digits and store in result
    int i = result_length - length;
    while (number[0] > 0)
    {
        result[i--] = number[0] % 10;
        number[0] = number[0] / 10;
    }
    // Copy the remaining digits of number to result
    int j;
    for (i = result_length - length + 1, j = 1; j < length; j++, i++)
    {
        result[i] = number[j];
    }
    return result;
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

    // Define the events to monitor

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

    // DTLB Misses
    pe[4].type = PERF_TYPE_HW_CACHE;
    pe[4].config = (PERF_COUNT_HW_CACHE_DTLB |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    // LL1 Misses
    pe[5].type = PERF_TYPE_HW_CACHE;
    pe[5].config = (PERF_COUNT_HW_CACHE_L1D |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    // LLC Misses
    pe[6].type = PERF_TYPE_HW_CACHE;
    pe[6].config = (PERF_COUNT_HW_CACHE_LL |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

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
        "PERF_COUNT_HW_CPU_CYCLES",
        "PERF_COUNT_HW_USER_INSTRUCTIONS",
        "PERF_COUNT_HW_KERNEL_INSTRUCTIONS",
        "PERF_COUNT_SW_PAGE_FAULTS",
        "PERF_COUNT_HW_CACHE_DTLB_MISS",
        "PERF_COUNT_HW_CACHE_L1D_MISS",
        "PERF_COUNT_HW_CACHE_LLC_MISS"};

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
    // As, urdhva only multiplies single digits, we can always precompute the multiplication of all possible pairs of digits
    const int memo[10][10] = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
        {0, 2, 4, 6, 8, 10, 12, 14, 16, 18},
        {0, 3, 6, 9, 12, 15, 18, 21, 24, 27},
        {0, 4, 8, 12, 16, 20, 24, 28, 32, 36},
        {0, 5, 10, 15, 20, 25, 30, 35, 40, 45},
        {0, 6, 12, 18, 24, 30, 36, 42, 48, 54},
        {0, 7, 14, 21, 28, 35, 42, 49, 56, 63},
        {0, 8, 16, 24, 32, 40, 48, 56, 64, 72},
        {0, 9, 18, 27, 36, 45, 54, 63, 72, 81}};

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
        int *urdhva_product = (int *)calloc(2 * n - 1, sizeof(int));
        int *carry = (int *)calloc(2 * n - 1, sizeof(int));

        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }

        urdhva(num1, num2, n, urdhva_product, carry, memo);
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
        uint64_t values[MAX_EVENTS];
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

        int urdhva_product_len = 2 * n - 1;

        // Compute product using grade school
        int *grade_school_product = (int *)calloc(n1 + n2, sizeof(int));

        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }

        gradeSchoolMultiplication(num1, n1, num2, n2, grade_school_product);

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

        // Compute product using GMP
        mpz_set_str(num1_gmp, num1_str, 10);
        mpz_set_str(num2_gmp, num2_str, 10);

        // Start the events
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

        char *gmp_product_str = mpz_get_str(NULL, 10, product_gmp);
        int gmp_product_len = strlen(gmp_product_str);
        int *gmp_product = (int *)calloc(gmp_product_len, sizeof(int));
        for (int i = 0; i < gmp_product_len; i++)
            gmp_product[i] = gmp_product_str[i] - '0';
        urdhva_product = extract_MSB_digits(urdhva_product, urdhva_product_len);
        urdhva_product = remove_leading_zeros(urdhva_product, &urdhva_product_len);
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
                break;
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
