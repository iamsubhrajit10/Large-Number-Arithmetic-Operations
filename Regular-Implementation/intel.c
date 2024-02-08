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


#define NUMBER_OF_BITS 2048
#define CSV_FILENAME "intel_multiplication_results_2048.csv"

struct BigInteger product_result;
struct BigInteger num1;
struct BigInteger num2;
struct timespec start_time, end_time;
double execution_time;
uint64_t start_ticks, end_ticks;
uint64_t min_ticks = UINT64_MAX;
double min_time = DBL_MAX;
double total_time = 0;
uint64_t total_ticks = 0;
int iteration;

char* generateRandomNumber(int seed) {
    gmp_randstate_t state;
    mpz_t random_number;

    // Initialize random number state
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL) + iteration+seed);


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

struct BigInteger
{
    int *digits;
    int length;
};

struct BigInteger initBigInteger(char *num_str)
{
    struct BigInteger result;
    int len = 0;
    while (num_str[len] != '\0')
    {
        len++;
    }
    result.digits = (int *)malloc(len * sizeof(int));
    result.length = len;
    for (int i = 0; i < len; i++)
    {
        result.digits[i] = num_str[len - i - 1] - '0';
    }
    return result;
}

void freeBigInteger(struct BigInteger *num)
{
    free(num->digits);
}
void printBigIntegerToFile(struct BigInteger num, FILE *file) {
    for (int i = num.length-1; i>=0; i--) {
        fprintf(file, "%d", num.digits[i]);
    }
}

void printResultsToFile(FILE *file, int iteration) {
    fprintf(file, "%d,", iteration);
    printBigIntegerToFile(num1, file);
    fprintf(file, ",");
    printBigIntegerToFile(num2, file);
    fprintf(file, ",");
    printBigIntegerToFile(product_result, file);
    fprintf(file, ",%f,%lu\n", execution_time, end_ticks - start_ticks);
}



// Function to get the current value of the Time Stamp Counter
static inline uint64_t rdtsc(void) {
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}
void printHeader(FILE *file) {
    fprintf(file, "Iteration,Number 1,Number 2,Result,Execution Time (seconds),Ticks\n");
}

struct BigInteger multiply(const struct BigInteger *num1, const struct BigInteger *num2)
{
    struct BigInteger result;
    result.length = num1->length + num2->length;
    result.digits = (int *)calloc(result.length, sizeof(int));


    start_ticks = rdtsc();
    clock_gettime(CLOCK_MONOTONIC, &start_time);

    for (int i = 0; i < num1->length; i++)
    {
        int carry = 0;
        for (int j = 0; j < num2->length; j++)
        {
            int product = num1->digits[i] * num2->digits[j] + result.digits[i + j] + carry;
            carry = product / 10;
            result.digits[i + j] = product % 10;
        }

        if (carry)
        {
            result.digits[i + num2->length] += carry;
        }
    }

    while (result.length > 1 && result.digits[result.length - 1] == 0)
    {
        result.length--;
    }
    clock_gettime(CLOCK_MONOTONIC, &end_time);
    end_ticks = rdtsc();

    execution_time = (end_time.tv_sec - start_time.tv_sec) +
                     (end_time.tv_nsec - start_time.tv_nsec) / 1e9;

    // Record the ending ticks

    total_ticks += (end_ticks - start_ticks);
    total_time += execution_time;

    if ((end_ticks - start_ticks) < min_ticks) {
        min_ticks = (end_ticks - start_ticks);
    }

    if (execution_time < min_time) {
        min_time = execution_time;
    }
    return result;
}

int main()
{
    FILE *results_file;
    results_file = fopen(CSV_FILENAME, "w");
    if (results_file == NULL) {
        printf("Error opening CSV file for writing!\n");
        return 1;
    }

    printHeader(results_file);
    int randomNumber;
    // Multiplication
    for (iteration = 1; iteration <= 30; ++iteration) {
        srand(time(NULL));

        // Generate a random number between 1 and 100
        randomNumber = (rand() % 100) + 1;
        num1 = initBigInteger(generateRandomNumber(randomNumber));
        randomNumber = (rand() % 100) + 1;
        num2 = initBigInteger(generateRandomNumber(randomNumber));

        product_result = multiply(&num1, &num2);

   // Update minimum values
        if ((end_ticks - start_ticks) < min_ticks) {
            min_ticks = (end_ticks - start_ticks);
        }

        if (execution_time < min_time) {
            min_time = execution_time;
        }

        // Print results to the file
        printResultsToFile(results_file, iteration);
        printf("\nDone: Iter%d\n", iteration);
        freeBigInteger(&num1);
        freeBigInteger(&num2);
        freeBigInteger(&product_result);
    }

    // Print summary information
    fprintf(results_file, "\nAverage Execution Time: %f seconds\n", (double)(total_time / 30));
    fprintf(results_file, "Average Ticks: %f\n", (double)(total_ticks / 30));
    fprintf(results_file, "Minimum Execution Time: %f seconds\n", min_time);
    fprintf(results_file, "Minimum Ticks: %lu\n", min_ticks);

    fclose(results_file);

    return 0;

    return 0;
}

