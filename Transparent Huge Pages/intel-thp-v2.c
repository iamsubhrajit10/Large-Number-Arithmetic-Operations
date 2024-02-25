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

#define HPAGE_SIZE (2<<21)
#define NUM_BIG_NUMBERS 1000

struct BigInteger {
    int *digits;
    int length;
};

struct BigInteger final_results[NUM_BIG_NUMBERS];
struct BigInteger num1[NUM_BIG_NUMBERS];
struct BigInteger num2[NUM_BIG_NUMBERS];
int NUMBER_OF_BITS;
uint64_t start_ticks, end_ticks, total_ticks, min_ticks = UINT64_MAX;

char* generateRandomNumber(int seed) {
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

struct BigInteger initBigInteger(char *num_str[], int num_count) {
    struct BigInteger result;
    int total_length = 0;

    // Calculate total length of all numbers
    for (int i = 0; i < num_count; i++) {
        total_length += strlen(num_str[i]);
    }

    result.length = total_length;
    result.digits = NULL;

    // Allocate memory for digits of all numbers
    posix_memalign((void **)&result.digits, HPAGE_SIZE, total_length * sizeof(int));
    int err = madvise(result.digits, total_length * sizeof(int), MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise");
        exit(EXIT_FAILURE);
    }
    result.digits[0] = 0;

    // Convert strings to digits and store in result.digits
    int index = 0;
    for (int i = 0; i < num_count; i++) {
        int len = strlen(num_str[i]);
        for (int j = 0; j < len; j++) {
            result.digits[index++] = num_str[i][len - j - 1] - '0';
        }
    }

    return result;
}

void freeBigInteger(struct BigInteger *num) {
    madvise(num->digits, num->length, MADV_DONTNEED);
}

void printBigIntegerToFile(struct BigInteger num, FILE *file) {
    for (int i = num.length - 1; i >= 0; i--) {
        fprintf(file, "%d", num.digits[i]);
    }
}

void printResultsToFile(FILE *file) {
    for (int i = 0; i < NUM_BIG_NUMBERS; i++) {
        printBigIntegerToFile(num1[i], file);
        fprintf(file, ",");
        printBigIntegerToFile(num2[i], file);
        fprintf(file, ",");
        printBigIntegerToFile(final_results[i], file);
        fprintf(file, ",%lu\n", end_ticks - start_ticks);
    }
}

// Function to get the current value of the Time Stamp Counter
static inline uint64_t rdtsc(void) {
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}

void multiply(struct BigInteger *n1, struct BigInteger *n2, struct BigInteger *result)
{
    int len1 = n1->length;
    int len2 = n2->length;    
    long int product,carry;

    start_ticks = rdtsc();
    for (int i = 0; i < len1; i++)
    {
        carry = 0;
        for (int  j = 0; j < len2; j++)
        {
            product = n1->digits[i] * n2->digits[j] + result->digits[i + j] + carry;
            carry = product / 10;
            result->digits[i + j] = product % 10;
        }

        if (carry)
        {
            result->digits[i + len2] += carry;
        }
    }

    while (result->length > 1 && result->digits[result->length - 1] == 0)
    {
        result->length--;
    }
    end_ticks = rdtsc();
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

    // Multiplication
    srand(time(NULL));

    // Generate and initialize big numbers
    char* num_strs[NUM_BIG_NUMBERS * 2];
    for (int i = 0; i < NUM_BIG_NUMBERS * 2; i++) {
        // Generate a random number between 1 and 100
        int randomNumber = (rand() % 100) + 1;
        num_strs[i] = generateRandomNumber(randomNumber);
    }

    // Initialize all 1000 big numbers at once
    struct BigInteger nums = initBigInteger(num_strs, NUM_BIG_NUMBERS * 2);
  
    // Allocate memory for final results
    for (int i = 0; i < NUM_BIG_NUMBERS; i++) {
        final_results[i].length = nums.length * 2 + 1; // Length of the final result
        final_results[i].digits = NULL;
        posix_memalign((void **)&final_results[i].digits, HPAGE_SIZE, final_results[i].length * sizeof(int));
        int err = madvise(final_results[i].digits, final_results[i].length * sizeof(int), MADV_HUGEPAGE);
        if (err != 0) {
            perror("madvise");
            exit(EXIT_FAILURE);
        }
        final_results[i].digits[0] = 0;
    }

    // Perform multiplication
    for (int i = 0; i < NUM_BIG_NUMBERS; i += 2) {
        multiply(&(nums[i]), &(nums[i + 1]), &final_results[i]);
        total_ticks += (end_ticks - start_ticks);
  
        if ((end_ticks - start_ticks) < min_ticks) {
            min_ticks = (end_ticks - start_ticks);
        }
    }

    // Print results to the file
    printResultsToFile(results_file);
    printf("Average ticks: %f, Min Ticks: %ld\n", (double)total_ticks / (1000 * NUM_BIG_NUMBERS), min_ticks);

    // Free memory
    for (int i = 0; i < NUM_BIG_NUMBERS; i++) {
        freeBigInteger(&final_results[i]);
    }

    // Print summary information
    fclose(results_file);

    return 0;
}
