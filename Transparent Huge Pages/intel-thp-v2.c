#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <gmp.h>
#include <float.h>
#include <fcntl.h>  // For file opening

#define HPAGE_SIZE (2 << 21)

struct BigInteger final_result;
struct BigInteger num1;
struct BigInteger num2;
int NUMBER_OF_BITS;
uint64_t start_ticks, end_ticks, total_ticks, min_ticks = UINT64_MAX;

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

struct BigInteger
{
    int *digits;
    int length;
};

struct BigInteger initBigInteger(char *num_str, int *preallocated_memory, int start_index)
{
    struct BigInteger result;
    int len = 0;
    while (num_str[len] != '\0')
    {
        len++;
    }
    result.length = len;

    result.digits = preallocated_memory + start_index;

    for (int i = 0; i < len; i++)
    {
        result.digits[i] = num_str[len - i - 1] - '0';
    }

    return result;
}

void freeBigInteger(struct BigInteger *num)
{
    // No need to free preallocated memory
}

void printBigIntegerToFile(struct BigInteger num, FILE *file)
{
    for (int i = num.length - 1; i >= 0; i--)
    {
        fprintf(file, "%d", num.digits[i]);
    }
}

void printResultsToFile(FILE *file)
{
    printBigIntegerToFile(num1, file);
    fprintf(file, ",");
    printBigIntegerToFile(num2, file);
    fprintf(file, ",");
    printBigIntegerToFile(final_result, file);
    fprintf(file, ",%lu\n", end_ticks - start_ticks);
}

// Function to get the current value of the Time Stamp Counter
static inline uint64_t rdtsc(void)
{
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}

void printHeader(FILE *file)
{
    fprintf(file, "Number 1,Number 2,Result,Ticks\n");
}

void multiply()
{
    int len1 = num1.length;
    int len2 = num2.length;
    long int product, carry;

    start_ticks = rdtsc();
    for (int i = 0; i < len1; i++)
    {
        carry = 0;
        for (int j = 0; j < len2; j++)
        {
            product = num1.digits[i] * num2.digits[j] + final_result.digits[i + j] + carry;
            carry = product / 10;
            final_result.digits[i + j] = product % 10;
        }

        if (carry)
        {
            final_result.digits[i + len2] += carry;
        }
    }

    while (final_result.length > 1 && final_result.digits[final_result.length - 1] == 0)
    {
        final_result.length--;
    }
    end_ticks = rdtsc();
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("Usage: %s <No of bits>\n", argv[0]);
        return 1;
    }

    NUMBER_OF_BITS = atoi(argv[1]);

    char CSV_FILENAME[100];
    snprintf(CSV_FILENAME, sizeof(CSV_FILENAME), "experiment_intel_multiplication_results_%d.csv", NUMBER_OF_BITS);

    FILE *results_file;
    results_file = fopen(CSV_FILENAME, "w");
    if (results_file == NULL)
    {
        printf("Error opening CSV file for writing!\n");
        return 1;
    }

    printHeader(results_file);

    // Pre-allocate memory for final_result
    final_result.length = NUMBER_OF_BITS * 2 + 1; // An approximation of the length
    final_result.digits = NULL;
    posix_memalign((void **)&final_result.digits, HPAGE_SIZE, final_result.length * sizeof(int));
    int err = madvise(final_result.digits, final_result.length * sizeof(int), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise");
        exit(EXIT_FAILURE);
    }
    final_result.digits[0] = 0;

    // Pre-allocate memory for random numbers
    int *preallocated_memory = NULL;
    int preallocated_memory_size = strlen(generateRandomNumber(0)) * 1000; // Estimate the size based on a single random number
    posix_memalign((void **)&preallocated_memory, HPAGE_SIZE, preallocated_memory_size * sizeof(int));
    err = madvise(preallocated_memory, preallocated_memory_size * sizeof(int), MADV_HUGEPAGE);
    if (err != 0)
    {
        perror("madvise");
        exit(EXIT_FAILURE);
    }

    // Loop through each iteration
    for (int i = 0; i < 1000; i++)
    {
        // Generate random numbers
        int randomNumber = (rand() % 100) + 1;
        num1 = initBigInteger(generateRandomNumber(randomNumber), preallocated_memory, i * preallocated_memory_size / 1000);
        randomNumber = (rand() % 100) + 1;
        num2 = initBigInteger(generateRandomNumber(randomNumber), preallocated_memory, i * preallocated_memory_size / 1000);
        multiply();
        // Record the ending ticks
        total_ticks += (end_ticks - start_ticks);

        if ((end_ticks - start_ticks) < min_ticks)
        {
            min_ticks = (end_ticks - start_ticks);
        }
    }

    // Print results to the file
    printResultsToFile(results_file);
    printf("Average ticks: %f, Min Ticks: %ld\n", (double)total_ticks / (1000), min_ticks);

    free(final_result.digits);
    free(preallocated_memory);

    // Print summary information
    if (results_file == NULL)
    {
        printf("Error opening CSV file for writing!\n");
        return 1;
    }

    fclose(results_file);

    return 0;
}
