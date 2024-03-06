#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <gmp.h>
#include <float.h>


#define NUM_DIGITS 1000
#define NUM_ITERATIONS 100
#define NUMBER_OF_BITS 8192

uint64_t start_ticks, end_ticks, total_ticks, min_ticks = UINT64_MAX;

struct BigInteger
{
    int *digits;
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
    char* resultString = mpz_get_str(NULL, 10, random_number);

    // Clean up
    mpz_clear(random_number);
    gmp_randclear(state);

    return resultString;
}

void multiply(struct BigInteger *x, struct BigInteger *y, struct BigInteger *result)
{
    int n = x->length;
    int half = n / 2;

    // Base case for recursion
    if (n <= 64)
    {
        for (int i = 0; i < n; ++i)
        {
            for (int j = 0; j < n; ++j)
            {
                result->digits[i + j] += (x->digits[i]) * (y->digits[j]);
            }
        }
        return;
    }

    // Splitting the digit sequences about the middle
    struct BigInteger high1, low1, high2, low2;
    high1.digits = x->digits;
    high1.length = half;
    low1.digits = x->digits + half;
    low1.length = n - half;
    high2.digits = y->digits;
    high2.length = half;
    low2.digits = y->digits + half;
    low2.length = n - half;

    // Intermediate results
    //preallocate space for z0, z1, and z2
    int *z_space = (int *)malloc(3 * n* 2* sizeof(int));
    if (z_space == NULL) {
        perror("Memory allocation failed");
        exit(EXIT_FAILURE);
    }
    struct BigInteger z0, z1, z2;
    z0.digits = z_space;
    z0.length = n * 2;
    z1.digits = z_space + n*2;
    z1.length = n * 2;
    z2.digits = z_space + 2*n*2;
    z2.length = n * 2;

    // Compute z0, z1, and z2
    multiply(&low1, &low2, &z0);
    multiply(&high1, &high2, &z2);

    //preallocate space for low_sum and high_sum
    int *sum_space = (int *)malloc(2 * n* 2* sizeof(int));
    if (sum_space == NULL) {
        perror("Memory allocation failed");
        free(z_space);
        exit(EXIT_FAILURE);
    }
    struct BigInteger low_sum, high_sum;
    low_sum.digits = sum_space;
    low_sum.length = n * 2;
    high_sum.digits = sum_space + n*2;
    high_sum.length = n * 2;

    // Compute (low1 + high1) * (low2 + high2)
    for (int i = 0; i < low1.length; ++i)
    {
        low_sum.digits[i] = low1.digits[i];
    }
    for (int i = 0; i < high1.length; ++i)
    {
        high_sum.digits[i] = high1.digits[i];
    }
    for (int i = 0; i < low2.length; ++i)
    {
        low_sum.digits[i + half] += low2.digits[i];
    }
    for (int i = 0; i < high2.length; ++i)
    {
        high_sum.digits[i + half] += high2.digits[i];
    }

    multiply(&low_sum, &high_sum, &z1);

    // Compute the final result
    for (int i = 0; i < n; ++i)
    {
        z1.digits[i] -= (z0.digits[i] + z2.digits[i]);
    }

    // Perform digit-wise addition to obtain the final result
    for (int i = 0; i < n; ++i)
    {
        result->digits[i] += z0.digits[i];
        result->digits[i + half] += z1.digits[i];
        result->digits[i + n] += z2.digits[i];
    }
    // Handle carry
    for (int i = 0; i < n * 2; ++i)
    {
        if (result->digits[i] >= 10)
        {
            result->digits[i + 1] += result->digits[i] / 10;
            result->digits[i] %= 10;
        }
    }
    // Clean up memory
    free(z_space);
    free(sum_space);
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
    char* sampleString = generateRandomNumber((rand() % 100) + 1);
    int sample_length = strlen(sampleString);

    // Preallocate memory for each integer and use it to generate random numbers
    int *nums_space = (int *)malloc(NUM_DIGITS*(sample_length + 1) * sizeof(int));

    generate_seed();
    sampleString = generateRandomNumber((rand() % 100) + 1);
    sample_length = strlen(sampleString);
    
    // Preallocate memory for each integer and use it to generate random numbers
    int *results_space = (int *)malloc((NUM_DIGITS/2)*(2*(sample_length+1) + 1) * sizeof(int));
    //printf("Results Space size: %ld\n", sizeof(results_space));
    if (results_space == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }
    for (int i=0; i<NUM_DIGITS/2; i++) {
        int length = nums[i].length+nums[i+1].length+1;
        results[i].digits = results_space + i*(length + 1);
        if (results[i].digits == NULL) {
            printf("Memory allocation failed.\n");
            return 1;
        }
        results[i].length = length;
    }
`   // Loop to generate random numbers and perform Karatsuba multiplicati
    int k=0;
    // Run your code here...
    // printf("Starting the computation for non-thp...\n");
    int left = 0;
    int right = NUM_DIGITS - 1;

    while (left < right) {
        // Your computation code goes here...
        for (int j = 0; j < NUM_ITERATIONS; j++) {
            start_ticks = rdtsc();
            multiply(&nums[left], &nums[right], &results[k]);
            end_ticks = rdtsc();
            if(end_ticks - start_ticks < min_ticks){
                min_ticks = end_ticks - start_ticks;
            }
            total_ticks += end_ticks - start_ticks;
        }
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
