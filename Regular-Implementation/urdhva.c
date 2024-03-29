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


struct BigInteger final_result;
struct BigInteger num1;
struct BigInteger num2;
int NUMBER_OF_BITS;

uint64_t start_ticks, end_ticks;
uint64_t min_ticks = UINT64_MAX;

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

struct BigInteger {
    char *digits;
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
    result.digits = (char *)malloc(len * sizeof(char));
    result.length = len;
    // Copy digits in reverse order
    for (int i = 0; i < len; i++) {
        result.digits[i] = num_str[len - i - 1];
    }
    
    result.length = len;
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

void printResultsToFile(FILE *file) {
    printBigIntegerToFile(num1, file);
    fprintf(file, ",");
    printBigIntegerToFile(num2, file);
    fprintf(file, ",");
    printBigIntegerToFile(final_result, file);
    fprintf(file, ",%lu\n", end_ticks - start_ticks);
}

void printHeader(FILE *file) {
    fprintf(file, "Iteration,Number 1,Number 2,Result,Ticks\n");
}
// Function to remove leading zeros from a string representing a number
void removeLeadingZero(char num[]) {
    int n = strlen(num) - 1;
    int i;
    for (i = 0; i < strlen(num) - 1; ++i) {
        if (num[i] != '0') {
            n = i;
            break;
        }
    }

    // Shifting the non-zero part to the beginning
    memmove(num, num + n, strlen(num) - n);
    num[strlen(num) - n] = '\0';
}
// Function to get the current value of the Time Stamp Counter
static inline uint64_t rdtsc(void)
{
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}


// Function to multiply two large numbers represented as strings
void multiply() {
    int len1 = num1.length;
    int len2 = num2.length;
    int carry, temp;

    // Record the starting ticks
    start_ticks = rdtsc();

    // Multiplying each digit and add to the result
    for (int i = len1 - 1; i >= 0; --i) {
        carry = 0;
        for (int j = len2 - 1; j >= 0; --j) {
            temp = (num1.digits[i] - '0') * (num2.digits[j] - '0') + (final_result.digits[i + j + 1] - '0') + carry;
            final_result.digits[i + j + 1] = temp % 10 + '0';
            carry = temp / 10;
        }
        final_result.digits[i] += carry; // Add the carry to the current digit
    }

    end_ticks = rdtsc();


    // Removing leading zeros from the result
    //removeLeadingZero();

}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <No of bits>\n", argv[0]);
        return 1;
    }

    NUMBER_OF_BITS = atoi(argv[1]);

    char CSV_FILENAME[100];
    snprintf(CSV_FILENAME, sizeof(CSV_FILENAME), "experiment_intel_multiplication_results_%d.csv", NUMBER_OF_BITS);

    FILE *results_file;
    results_file = fopen(CSV_FILENAME, "w");
    if (results_file == NULL) {
        printf("Error opening CSV file for writing!\n");
        return 1;
    }

    printHeader(results_file);
    int randomNumber;

        srand(time(NULL));

        // Generate a random number between 1 and 100
        randomNumber = (rand() % 100) + 1;
        num1 = initBigInteger(generateRandomNumber(randomNumber));
        randomNumber = (rand() % 100) + 1;
        num2 = initBigInteger(generateRandomNumber(randomNumber));
        final_result.length = num1.length+num2.length;
        final_result.digits = (char *)malloc(final_result.length * sizeof(char));

        multiply();

        // Print results to the file
        printResultsToFile(results_file);
        printf("Ticks: %ld\n",end_ticks-start_ticks);
        freeBigInteger(&final_result);
        freeBigInteger(&num1);
        freeBigInteger(&num2);

    // Print summary information
    if (results_file == NULL) {
        printf("Error opening CSV file for writing!\n");
        return 1;
    }

    fclose(results_file);

    return 0;
}

