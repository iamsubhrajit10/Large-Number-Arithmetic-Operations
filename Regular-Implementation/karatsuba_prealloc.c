#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <gmp.h>
#include <float.h>
#include <math.h>

#define NUM_DIGITS 1000
#define NUM_ITERATIONS 1
#define NUMBER_OF_BITS 8192

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

void generate_seed()
{
    // Get the current time
    time_t now = time(0);

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

    char *a = malloc(first_half + 1);
    char *b = malloc(second_half + 1);
    char *c = malloc(first_half + 1);
    char *d = malloc(second_half + 1);

    if (a == NULL || b == NULL || c == NULL || d == NULL)
    {
        perror("Memory allocation failed");
        exit(1);
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

    char *result = add(add(shift(ac, 2 * second_half), shift(ad_plus_bc_minus_ac_minus_bd, second_half)), bd);
    free(a);
    free(b);
    free(c);
    free(d);
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
    char *result = malloc(max_len + 2);
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

        char *result = malloc(len_x + 1);
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
    char *result = (char *)malloc(x_len + n + 1);
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

int main()
{
    struct BigInteger *nums, *results;

    // Allocate memory for two arrays of BigIntegers
    nums = (struct BigInteger *)malloc(NUM_DIGITS * sizeof(struct BigInteger));
    if (nums == NULL)
    {
        printf("Memory allocation failed for nums.\n");
        return 1;
    }

    results = (struct BigInteger *)malloc((NUM_DIGITS / 2) * sizeof(struct BigInteger));
    if (results == NULL)
    {
        printf("Memory allocation failed for results.\n");
        free(nums);
        return 1;
    }

    generate_seed(); // Generate seed for random number generation
    char *sampleString = generateRandomNumber((rand() % 100) + 1);
    int sample_length = strlen(sampleString);

    // Preallocate memory for each integer and use it to generate random numbers
    char *nums_space = (char *)malloc(NUM_DIGITS * (sample_length + 1) * sizeof(char));

    generate_seed();
    sampleString = generateRandomNumber((rand() % 100) + 1);
    sample_length = strlen(sampleString);

    // Preallocate memory for each integer and use it to generate random numbers
    char *results_space = (char *)malloc((NUM_DIGITS / 2) * (2 * (sample_length + 1) + 1) * sizeof(char));
    // printf("Results Space size: %ld\n", sizeof(results_space));
    if (results_space == NULL)
    {
        printf("Memory allocation failed.\n");
        return 1;
    }
    for (int i = 0; i < NUM_DIGITS / 2; i++)
    {
        int length = nums[i].length + nums[i + 1].length + 1;
        results[i].digits = results_space + i * (length + 1);
        if (results[i].digits == NULL)
        {
            printf("Memory allocation failed.\n");
            return 1;
        }
        results[i].length = length;
    }
    // Loop to generate random numbers and perform Karatsuba multiplicati
    int k = 0;
    // Run your code here...
    // printf("Starting the computation for non-thp...\n");
    int left = 0;
    int right = NUM_DIGITS - 1;

    while (left < right)
    {
        // Your computation code goes here...
        // Generate random numbers for Karatsuba multiplication
        char *num1_string = generateRandomNumber(left);
        char *num2_string = generateRandomNumber(right);

        // Convert random number strings to BigIntegers
        nums[left].digits = num1_string;
        nums[right].digits = num2_string;
        start_ticks = rdtsc();
        // Perform Karatsuba multiplication
        results[k].digits = karatsuba(nums[left].digits, nums[right].digits);
        // printf("Num1: %s, Num2: %s, Result: %s\n",nums[left].digits, nums[right].digits, karatsuba(nums[left].digits, nums[right].digits));
        end_ticks = rdtsc();
        if (end_ticks - start_ticks < min_ticks)
        {
            min_ticks = end_ticks - start_ticks;
        }
        total_ticks += end_ticks - start_ticks;
        left++;
        right--;
        k++;
    }

    // Output minimum and total ticks
    printf("Minimum ticks: %lu\n", min_ticks);
    printf("Total ticks: %lu\n", total_ticks);

    // Free allocated memory
    for (int i = 0; i < NUM_DIGITS; i++)
    {
        free(nums[i].digits);
    }
    free(nums);
    free(results);

    return 0;
}
