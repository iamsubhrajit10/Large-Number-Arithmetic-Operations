#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <gmp.h>
#include <float.h>
#include <math.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <linux/mman.h>
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <linux/hw_breakpoint.h>
#include <sys/syscall.h>
#include <asm/unistd.h>


#define NUM_DIGITS 10000
#define NUM_ITERATIONS 1
#define NUMBER_OF_BITS 256
#define MAX_EVENTS 11 // Maximum number of events to monitor
#define HPAGE_SIZE (2<<21)

uint64_t start_ticks, end_ticks, total_ticks, min_ticks = UINT64_MAX;
char *add(char *x, char *y);
char *subtract(char *x, char *y);
char *shift(char *x, int n);
char *karatsuba(char *x, char *y);
char *remove_leading_zeros(char *str);
char *padding(char *x, int n);

// Structure to store a big integer
struct BigInteger
{
    char *digits;
    int length;
};

// Function to get the current value of the Time Stamp Counter
static inline uint64_t rdtsc(void)
{
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}
long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags) {
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}
void generate_seed() {
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


char *remove_leading_zeros(char *str)
{
    while (*str == '0')
    {
        str++;
    }
    return str;
}
// pad x with n 0's at the left
char *padding(char *x, int n)
{
    int x_len = strlen(x);
    char *result = (char *)malloc(x_len + n + 1);
    if (result == NULL)
    {
        perror("Memory allocation failed");
        exit(1);
    }
    for (int i = 0; i < n; i++)
    {
        result[i] = '0';
    }
    strncpy(result + n, x, x_len);
    result[x_len + n] = '\0';
    return result;
}

char *karatsuba(char *x, char *y)
{
    // if x or y is 0, return 0
    if (strcmp(x, "0") == 0 || strcmp(y, "0") == 0)
    {
        char *result = malloc(2);
        if (result == NULL)
        {
            perror("Memory allocation failed");
            exit(1);
        }
        result[0] = '0';
        result[1] = '\0';
        return result;
    }
    // if x and/or y is negative
    if (x[0] == '-' && y[0] == '-')
    {
        return karatsuba(x + 1, y + 1);
    }
    else if (x[0] == '-')
    {
        char *result = karatsuba(x + 1, y);
        if (strcmp(result, "0") != 0)
        {
            memmove(result + 1, result, strlen(result) + 1);
            result[0] = '-';
        }
        return result;
    }
    else if (y[0] == '-')
    {
        char *result = karatsuba(x, y + 1);
        if (strcmp(result, "0") != 0)
        {
            memmove(result + 1, result, strlen(result) + 1);
            result[0] = '-';
        }
        return result;
    }

    int x_len = strlen(x);
    int y_len = strlen(y);
    // Base case: Switch to simple multiplication if small numbers
    if (x_len < 2 || y_len < 2)
    {
        int result = atoi(x) * atoi(y);

        // Calculate the number of digits in the result
        int num_digits = (result == 0) ? 1 : (int)log10(result) + 1;

        // Allocate space for result and null terminator
        char *result_str = malloc(num_digits + 1);
        if (result_str == NULL)
        {
            printf("Memory allocation failed\n");
            exit(1);
        }

        // Use snprintf instead of sprintf
        snprintf(result_str, num_digits + 1, "%d", result);
        result_str[num_digits] = '\0'; // Ensure the string is null-terminated

        return result_str;
    }
    int n = (x_len > y_len) ? x_len : y_len;
    if (x_len > y_len)
    {
        y = padding(y, x_len - y_len);
    }
    else if (y_len > x_len)
    {
        x = padding(x, y_len - x_len);
    }

    int first_half;
    if (n % 2 == 0)
    {
        first_half = n / 2;
    }
    else
    {
        first_half = (n / 2) + 1;
    }
    int second_half = n - first_half;

    //char *a = malloc(first_half + 1);
    // char *b = malloc(second_half + 1);
    // char *c = malloc(first_half + 1);
    // char *d = malloc(second_half + 1);

    /* if (a == NULL || b == NULL || c == NULL || d == NULL)
    {
        perror("Memory allocation failed");
        exit(1);
    }*/
    char *a;
    int err = posix_memalign((void **)&a, HPAGE_SIZE, (first_half + 1) * sizeof(char));
    if (err != 0)
    {
        perror("posix_memalign a");
        exit(EXIT_FAILURE);
    }
    err = madvise(a, (first_half + 1) * sizeof(char), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise a");
        exit(EXIT_FAILURE);
    }
    char *b;
    err = posix_memalign((void **)&b, HPAGE_SIZE, (second_half + 1) * sizeof(char));
    if (err != 0)
    {
        perror("posix_memalign b");
        exit(EXIT_FAILURE);
    }
    err = madvise(b, (second_half + 1) * sizeof(char), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise b");
        exit(EXIT_FAILURE);
    }
    char *c;
    err = posix_memalign((void **)&c, HPAGE_SIZE, (first_half + 1) * sizeof(char));
    if (err != 0)
    {
        perror("posix_memalign c");
        exit(EXIT_FAILURE);
    }
    err = madvise(c, (first_half + 1) * sizeof(char), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise c");
        exit(EXIT_FAILURE);
    }
    char *d;
    err = posix_memalign((void **)&d, HPAGE_SIZE, (second_half + 1) * sizeof(char));
    if (err != 0)
    {
        perror("posix_memalign d");
        exit(EXIT_FAILURE);
    }
    err = madvise(d, (second_half + 1) * sizeof(char), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise d");
        exit(EXIT_FAILURE);
    }

    strncpy(a, x, first_half);
    a[first_half] = '\0';
    strncpy(b, x + first_half, second_half);
    b[second_half] = '\0';
    strncpy(c, y, first_half);
    c[first_half] = '\0';
    strncpy(d, y + first_half, second_half);
    d[second_half] = '\0';

    char *ac = karatsuba(a, c);
    // printf("ac:%s\n",ac);
    char *bd = karatsuba(b, d);
    // printf("bd:%s\n",bd);
    char *ad_plus_bc = karatsuba(add(a, b), add(c, d));
    // printf("ad_plus_bc:%s\n",ad_plus_bc);
    char *ad_plus_bc_minus_ac_minus_bd = subtract(subtract(ad_plus_bc, ac), bd);
    // printf("ad_plus_bc_minus_ac_minus_bd:%s\n",ad_plus_bc_minus_ac_minus_bd);

    char *return_result = add(add(shift(ac, 2 * second_half), shift(ad_plus_bc_minus_ac_minus_bd, second_half)), bd);
    // char *result = (char *)malloc(strlen(return_result) + 1);
    char *result;
    err = posix_memalign((void **)&result, HPAGE_SIZE, (strlen(return_result) + 1) * sizeof(char));
    if (err != 0)
    {
        perror("posix_memalign result");
        exit(EXIT_FAILURE);
    }
    err = madvise(result, (strlen(return_result) + 1) * sizeof(char), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise result");
        exit(EXIT_FAILURE);
    }
    strncpy(result, return_result, strlen(return_result) + 1);
    // free(a);
    err = madvise(a, (first_half + 1) * sizeof(char), MADV_DONTNEED);
    if (err != 0)
    {
        perror("madvise free a");
        exit(EXIT_FAILURE);
    }
    // free(b);
    err = madvise(b, (second_half + 1) * sizeof(char), MADV_DONTNEED);
    if (err != 0)
    {
        perror("madvise free b");
        exit(EXIT_FAILURE);
    }
    // free(c);
    err = madvise(c, (first_half + 1) * sizeof(char), MADV_DONTNEED);
    if (err != 0)
    {
        perror("madvise free c");
        exit(EXIT_FAILURE);
    }
    // free(d);
    err = madvise(d, (second_half + 1) * sizeof(char), MADV_DONTNEED);
    if (err != 0)
    {
        perror("madvise free d");
        exit(EXIT_FAILURE);
    }

    // free(ad_plus_bc);
    // free(ac);
    // free(bd);
    // free(ad_plus_bc_minus_ac_minus_bd);
    err = madvise(ad_plus_bc_minus_ac_minus_bd, (strlen(ad_plus_bc_minus_ac_minus_bd) + 1) * sizeof(char), MADV_DONTNEED);
    if (err != 0)
    {
        perror("madvise free ad_plus_bc");
        exit(EXIT_FAILURE);
    }
    result = remove_leading_zeros(result);
    return result;
}

char *add(char *x, char *y)
{
    int is_x_negative = (x[0] == '-');
    int is_y_negative = (y[0] == '-');

    if (is_x_negative && is_y_negative)
    {
        // If both numbers are negative, remove the '-' sign and add the numbers
        char *result = add(x + 1, y + 1);
        // Add a '-' sign to the result
        memmove(result + 1, result, strlen(result) + 1);
        result[0] = '-';
        return result;
    }
    else if (is_x_negative)
    {
        // If x is negative and y is positive, subtract y from |x|
        char *result = subtract(y, x + 1);
        return result;
    }
    else if (is_y_negative)
    {
        // If y is negative and x is positive, subtract |y| from x
        char *result = subtract(x, y + 1);
        return result;
    }
    int len_x = strlen(x);
    int len_y = strlen(y);
    if (len_x == 0)
    {
        return y;
    }
    if (len_y == 0)
    {
        return x;
    }
    if (len_x == 1 && len_y == 1)
    {
        int result = (x[0] - '0') + (y[0] - '0');
        int num_digits = (result == 0) ? 1 : (int)log10(result) + 1;
        char *result_str = malloc(num_digits + 1);
        if (result_str == NULL)
        {
            perror("Memory allocation failed");
            exit(1);
        }
        snprintf(result_str, num_digits + 1, "%d", result);
        result_str[num_digits] = '\0';
        return result_str;
    }

    int max_len = (len_x > len_y) ? len_x : len_y;
    int carry = 0;
    int i = len_x - 1, j = len_y - 1, k = max_len;
    // char *result = malloc(max_len + 2);
    char *result;
    int err = posix_memalign((void **)&result, HPAGE_SIZE, (max_len + 2) * sizeof(char));
    if (err != 0)
    {
        perror("posix_memalign result");
        exit(EXIT_FAILURE);
    }
    err = madvise(result, (max_len + 2) * sizeof(char), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise result");
        exit(EXIT_FAILURE);
    }

    if (result == NULL)
    {
        perror("Memory allocation failed");
        exit(1);
    }
    result[max_len + 1] = '\0';
    while (i >= 0 || j >= 0)
    {
        int digit_x = (i >= 0) ? x[i] - '0' : 0;
        int digit_y = (j >= 0) ? y[j] - '0' : 0;
        int sum = digit_x + digit_y + carry;
        carry = sum / 10;
        result[k] = (sum % 10) + '0';
        i--;
        j--;
        k--;
    }
    if (carry > 0)
    {
        result[k] = carry + '0';
        k--;
    }
    memmove(result, result + k + 1, max_len + 1);
    return result;
}
char *subtract(char *x, char *y)
{

    int is_x_negative = (x[0] == '-');
    int is_y_negative = (y[0] == '-');

    if (is_x_negative && !is_y_negative)
    {
        // If x is negative and y is positive, add |x| and y and return the result with a '-' sign
        char *result = add(x + 1, y);
        memmove(result + 1, result, strlen(result) + 1);
        result[0] = '-';
        return result;
    }
    else if (!is_x_negative && is_y_negative)
    {
        // If x is positive and y is negative, add x and |y|
        char *result = add(x, y + 1);
        return result;
    }
    else if (is_x_negative && is_y_negative)
    {
        // If both x and y are negative, subtract |y| from |x|
        char *result = subtract(y + 1, x + 1);
        return result;
    }
    else
    {
        // If both x and y are positive, subtract y from x
        int len_x = strlen(x);
        int len_y = strlen(y);
        int swap = 0;
        if (len_x < len_y || (len_x == len_y && strcmp(x, y) < 0))
        {
            char *temp = x;
            x = y;
            y = temp;
            swap = 1;
            len_x = strlen(x);
            len_y = strlen(y);
        }

        // char *result = malloc(len_x + 1);
        char *result;
        int err = posix_memalign((void **)&result, HPAGE_SIZE, (len_x + 1) * sizeof(char));
        if (err != 0)
        {
            perror("posix_memalign result");
            exit(EXIT_FAILURE);
        }
        err = madvise(result, (len_x + 1) * sizeof(char), MADV_HUGEPAGE);
        if (err != 0)
        {
            perror("madvise result");
            exit(EXIT_FAILURE);
        }
        int i = len_x - 1, j = len_y - 1, k = len_x - 1;
        int borrow = 0;

        while (i >= 0)
        {
            int digit_x = x[i] - '0';
            int digit_y = (j >= 0) ? y[j] - '0' : 0;

            digit_x -= borrow;

            if (digit_x < digit_y)
            {
                digit_x += 10;
                borrow = 1;
            }
            else
            {
                borrow = 0;
            }

            result[k] = digit_x - digit_y + '0';

            i--;
            j--;
            k--;
        }

        result[len_x] = '\0';
        int leading_zero = 0;
        while (result[leading_zero] == '0')
        {
            leading_zero++;
        }
        memmove(result, result + leading_zero, len_x - leading_zero + 1);

        if (result[0] == '\0')
        {
            result[0] = '0';
            result[1] = '\0';
        }

        if (swap)
        {
            memmove(result + 1, result, strlen(result) + 1);
            result[0] = '-';
        }
        return result;
    }
}

char *shift(char *x, int n)
{
    int x_len = strlen(x);
    // char *result = (char *)malloc(x_len + n + 1);
    char *result;
    int err = posix_memalign((void **)&result, HPAGE_SIZE, (x_len + n + 1) * sizeof(char));
    if (err != 0)
    {
        perror("posix_memalign result");
        exit(EXIT_FAILURE);
    }
    err = madvise(result, (x_len + n + 1) * sizeof(char), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise result");
        exit(EXIT_FAILURE);
    }
    if (result == NULL)
    {
        perror("Memory allocation failed");
        exit(1);
    }
    strncpy(result, x, x_len);
    for (int i = 0; i < n; i++)
    {
        result[x_len + i] = '0';
    }
    result[x_len + n] = '\0';
    return result;
}

// Function to print the header of the CSV file
void printHeader(FILE *file) {
    fprintf(file, "Number 1,Number 2,Result,Ticks\n");
}

// Function to print a BigInteger to a file
void printBigIntegerToFile(struct BigInteger num, FILE *file) {
    for (int i = num.length-1; i>=0; i--) {
        fprintf(file, "%c", num.digits[i]);
    }
}

// Function to print the results to a file
void printResultsToFile(FILE *file, struct BigInteger num1, struct BigInteger num2, struct BigInteger final_result) {
    printBigIntegerToFile(num1, file);
    fprintf(file, ",");
    printBigIntegerToFile(num2, file);
    fprintf(file, ",");
    printBigIntegerToFile(final_result, file);
    fprintf(file, ",%lu\n", end_ticks - start_ticks);
}

int main()
{
    char CSV_FILENAME[100];
    snprintf(CSV_FILENAME, sizeof(CSV_FILENAME), "experiment_karatsuba_results_peo_%d.csv", NUMBER_OF_BITS);

    FILE *results_file;
    results_file = fopen(CSV_FILENAME, "w");

    printHeader(results_file);
    if (results_file == NULL) {
        printf("Error opening CSV file for writing!\n");
        return 1;
    }
    struct BigInteger *nums, *results;

    // Allocate memory for two integers
    int err = posix_memalign((void **)&nums, HPAGE_SIZE, NUM_DIGITS * sizeof(struct BigInteger));
    if (err != 0)
    {
        perror("posix_memalign nums");
        exit(EXIT_FAILURE);
    }
    err = madvise(nums, NUM_DIGITS * sizeof(struct BigInteger), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise nums");
        exit(EXIT_FAILURE);
    }
    err = posix_memalign((void **)&results, HPAGE_SIZE, (NUM_DIGITS / 2) * sizeof(struct BigInteger));
    if (err != 0)
    {
        perror("posix_memalign results");
        exit(EXIT_FAILURE);
    }
    err = madvise(results, (NUM_DIGITS / 2) * sizeof(struct BigInteger), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise results");
        exit(EXIT_FAILURE);
    }

    // Check if memory allocation was successful
    if (nums == NULL)
    {
        printf("Memory allocation failed for nums.\n");
        return 1;
    }
    if (results == NULL)
    {
        printf("Memory allocation failed for results.\n");
        return 1;
    }

    generate_seed(); // Generate seed for random number generation
    char *sampleString = generateRandomNumber((rand() % 100) + 1);
    int sample_length = strlen(sampleString);

    // Preallocate memory for each integer and use it to generate random numbers
    char *nums_space;
    err = posix_memalign((void **)&nums_space, HPAGE_SIZE, NUM_DIGITS * (sample_length + 1) * sizeof(char));
    if (err != 0)
    {
        perror("posix_memalign nums_space");
        exit(EXIT_FAILURE);
    }
    err = madvise(nums_space, NUM_DIGITS * (sample_length + 1) * sizeof(char), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise nums_space");
        exit(EXIT_FAILURE);
    }
    for (int i = 0; i < NUM_DIGITS; i++)
    {
        generate_seed();
        int randomNumber = (rand() % 100) + 1;
        char *randomString = generateRandomNumber(randomNumber);
        int length = strlen(randomString);
        nums[i].digits = nums_space + i * (length + 1);
        if (nums[i].digits == NULL)
        {
            printf("Memory allocation failed.\n");
            return 1;
        }
        for (int j = 0; j < length; j++)
        {
            nums[i].digits[j] = randomString[j];
        }
        nums[i].digits[length] = '\0';
        nums[i].length = length;
    }   

      /* monitoring performance */
    struct perf_event_attr pe[MAX_EVENTS];
    int fd[MAX_EVENTS];
    long long count[MAX_EVENTS];
    int i;

    memset(&pe, 0, sizeof(struct perf_event_attr) * MAX_EVENTS);

    // Define the events to monitor
    pe[0].type = PERF_TYPE_HARDWARE;
    pe[0].config = PERF_COUNT_HW_CPU_CYCLES;

    pe[1].type = PERF_TYPE_HARDWARE;
    pe[1].config = PERF_COUNT_HW_INSTRUCTIONS;

    pe[2].type = PERF_TYPE_SOFTWARE;
    pe[2].config = PERF_COUNT_SW_PAGE_FAULTS;

    pe[3].type = PERF_TYPE_HW_CACHE;
    pe[3].config = (PERF_COUNT_HW_CACHE_L1D | 
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) | 
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    pe[4].type = PERF_TYPE_HW_CACHE;
    pe[4].config = (PERF_COUNT_HW_CACHE_DTLB | 
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) | 
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    // Cache Misses
    pe[5].type = PERF_TYPE_HARDWARE;
    pe[5].config = PERF_COUNT_HW_CACHE_MISSES;

    // TLB Misses
    pe[6].type = PERF_TYPE_HW_CACHE;
    pe[6].config = (PERF_COUNT_HW_CACHE_DTLB | 
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) | 
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    // Page Walks
    pe[7].type = PERF_TYPE_HW_CACHE;
    pe[7].config = (PERF_COUNT_HW_CACHE_DTLB | 
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) | 
                    (PERF_COUNT_HW_CACHE_RESULT_ACCESS << 16));

    // CPU Migrations
    pe[8].type = PERF_TYPE_SOFTWARE;
    pe[8].config = PERF_COUNT_SW_CPU_MIGRATIONS;

    // Minor page faults
    pe[9].type = PERF_TYPE_SOFTWARE;
    pe[9].config = PERF_COUNT_SW_PAGE_FAULTS_MIN;

    // Major page faults
    pe[10].type = PERF_TYPE_SOFTWARE;
    pe[10].config = PERF_COUNT_SW_PAGE_FAULTS_MAJ;


    // Open the events
    for (i = 0; i < MAX_EVENTS; i++) {
        fd[i] = perf_event_open(&pe[i], 0, -1, -1, 0);
        if (fd[i] == -1) {
            fprintf(stderr, "Error opening event %d\n", i);
            exit(EXIT_FAILURE);
        }
    }
    // Array of event type names
    const char *event_names[MAX_EVENTS] = {
        "PERF_COUNT_HW_CPU_CYCLES",
        "PERF_COUNT_HW_INSTRUCTIONS",
        "PERF_COUNT_SW_PAGE_FAULTS",
        "PERF_COUNT_HW_CACHE_L1D_MISS",
        "PERF_COUNT_HW_CACHE_DTLB_MISS",
        "PERF_COUNT_HW_CACHE_MISS",
        "PERF_COUNT_HW_CACHE_DTLB_MISS",
        "PERF_COUNT_HW_CACHE_DTLB_ACCESSES",
        "PERF_COUNT_SW_CPU_MIGRATIONS",
        "PERF_COUNT_SW_PAGE_FAULTS_MIN",
        "PERF_COUNT_SW_PAGE_FAULTS_MAJ"
    };

   // Open a file for writing
    char binary_name[] = "perf_peo_karatsuba"; // replace with actual binary name
    int input_size = 100; // replace with actual input size

    char filename[100];
    snprintf(filename, sizeof(filename), "%s_%d.csv", binary_name, NUMBER_OF_BITS);
    FILE *file = fopen(filename, "w");

    if (file == NULL) {
        perror("Error opening file");
        return -1;
    }

    // Write the header to the CSV file
    for (int j = 0; j < MAX_EVENTS; j++) {
        fprintf(file, "%s,", event_names[j]);
    }
    fprintf(file, "\n");

     int k=0;
    // Run your code here...

    // printf("Starting the computation for thp...\n");
    // int left = 0;
    // int right = NUM_DIGITS - 1;

    // printf("Starting the computation for thp...\n");
    int indices[NUM_DIGITS];
    for (int i = 0; i < NUM_DIGITS; i++) {
        indices[i] = i;
    }
    
    for (int i = 0; i < NUM_DIGITS; i += 2) {
        // Shuffle the indices array
        for (int j = NUM_DIGITS - 1; j > 0; j--) {
            int randomIndex = rand() % (j + 1);
            int temp = indices[j];
            indices[j] = indices[randomIndex];
            indices[randomIndex] = temp;
        }
        
        int index1 = indices[i];
        int index2 = indices[i + 1];
        
        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++) {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }
        
        // Your computation code goes here...
        for (int j = 0; j < NUM_ITERATIONS; j++) {
            printf("Index1: %d, Index2: %d\n", index1, index2);
            start_ticks = rdtsc();
            results[k].digits = karatsuba(nums[index1].digits, nums[index2].digits);
            end_ticks = rdtsc();
            results[k].length = strlen(results[k].digits);
            // printf("Multiplying %s and %s\n", nums[index1].digits, nums[index2].digits);
            // printf("Result: %s\n", results[k].digits);
            
            
            if (end_ticks - start_ticks < min_ticks) {
                min_ticks = end_ticks - start_ticks;
            }
            total_ticks += end_ticks - start_ticks;
        }
        printResultsToFile(results_file, nums[index1], nums[index2], results[k]);

        k++;
        
        // Stop monitoring
        for (int j = 0; j < MAX_EVENTS; j++) {
            if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1) {
                perror("Error disabling counter");
                exit(EXIT_FAILURE);
            }
        }

        // Read and print the counter values
        uint64_t values[MAX_EVENTS];
        for (int j = 0; j < MAX_EVENTS; j++) {
            if (read(fd[j], &values[j], sizeof(uint64_t)) == -1) {
                perror("Error reading counter value");
                exit(EXIT_FAILURE);
            }
        }

        // Write the counter values to the CSV file
        for (int j = 0; j < MAX_EVENTS; j++) {
            fprintf(file, "%lu,", values[j]);
        }
        fprintf(file, "\n");
        printf("Multiplication %d done\n", k);
    }
    // printf("Ending the computation for thp...\n");

    // Close the file
    fclose(file);

    // Close the file descriptors
    for (int i = 0; i < MAX_EVENTS; i++) {
        close(fd[i]);
    }
    printf("Minimum ticks: %lu\n", min_ticks);
    printf("Total ticks: %lu\n", total_ticks);
    madvise(nums_space, NUM_DIGITS*(sample_length + 1) * sizeof(int), MADV_DONTNEED);
    madvise(nums, NUM_DIGITS * sizeof(struct BigInteger), MADV_DONTNEED);
    madvise(results, (NUM_DIGITS/2) * sizeof(struct BigInteger), MADV_DONTNEED);


    // madvise(results_space, (NUM_DIGITS/2)*(2*(sample_length+1) + 1) * sizeof(int), MADV_DONTNEED);
    return 0;
}