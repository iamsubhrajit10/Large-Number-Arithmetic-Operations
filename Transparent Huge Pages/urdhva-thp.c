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

#define HPAGE_SIZE (2 * 1024 * 1024)
#define NUMBER_OF_BITS 32768
#define CSV_FILENAME "experiment_urdhva_multiplication_results_32768.csv"
struct BigInteger final_result;
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



struct BigInteger {
    char *digits;
    int length;
};

struct BigInteger initBigInteger(char *num_str) {
    struct BigInteger result;
    int len = strlen(num_str);
 
    // Allocate memory with huge pages
    result.digits = aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);

    int err = madvise(result.digits, HPAGE_SIZE, MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise");
        exit(EXIT_FAILURE);
    }

    // Copy digits in reverse order
    for (int i = 0; i < len; i++) {
        result.digits[i] = num_str[len - i - 1];
    }
    
    result.length = len;
    return result;
}

void removeLeadingZero() {
    int n = final_result.length;
    int i;
    for (i = 0; i < final_result.length; ++i) {
        if (final_result.digits[i] != '0') {
            n = i;
            break;
        }
    }

    // Shifting the non-zero part to the beginning
    memmove(final_result.digits, final_result.digits + n, final_result.length - n);
    final_result.digits[final_result.length - n] = '\0';
}

void freeBigInteger(struct BigInteger *num) {
    free(num->digits);
}
void printBigIntegerToFile(struct BigInteger num, FILE *file) {
    fprintf(file, "%s", num.digits);
}

void printResultsToFile(FILE *file, int iteration) {
    fprintf(file, "%d,", iteration);
    printBigIntegerToFile(num1, file);
    fprintf(file, ",");
    printBigIntegerToFile(num2, file);
    fprintf(file, ",");
    printBigIntegerToFile(final_result, file);
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


// Function to multiply two large numbers represented as strings
void multiply() {
    int len1 = num1.length;
    int len2 = num2.length;
    char* num1_digits = aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);
    int err = madvise(num1_digits, HPAGE_SIZE, MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise");
        exit(EXIT_FAILURE);
    } 
    num1_digits[0] = '0';
    char* num2_digits = aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);
    err = madvise(num2_digits, HPAGE_SIZE, MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise");
        exit(EXIT_FAILURE);
    } 
    num2_digits[0] = '0';

    // Copy digits
    for(int i = 0; i < num1.length; ++i) {
        num1_digits[i] = num1.digits[i];
    }

    for(int i = 0; i < num2.length; ++i) {
        num2_digits[i] = num2.digits[i];
    }

    // Record the starting ticks
    start_ticks = rdtsc();
    clock_gettime(CLOCK_MONOTONIC, &start_time);

    // Multiplying each digit and add to the result
    for (int i = len1 - 1; i >= 0; --i) {
        int carry = 0;
        for (int j = len2 - 1; j >= 0; --j) {
            int temp = (num1_digits[i] - '0') * (num2_digits[j] - '0') + (final_result.digits[i + j + 1] - '0') + carry;
            final_result.digits[i + j + 1] = temp % 10 + '0';
            carry = temp / 10;
        }
        final_result.digits[i] += carry; // Add the carry to the current digit
    }

    clock_gettime(CLOCK_MONOTONIC, &end_time);
    end_ticks = rdtsc();

    execution_time = (end_time.tv_sec - start_time.tv_sec) +
                     (end_time.tv_nsec - start_time.tv_nsec) / 1e9;

    // Removing leading zeros from the result
    removeLeadingZero();

    // Record the ending ticks

    total_ticks += (end_ticks - start_ticks);
    total_time += execution_time;

    if ((end_ticks - start_ticks) < min_ticks) {
        min_ticks = (end_ticks - start_ticks);
    }

    if (execution_time < min_time) {
        min_time = execution_time;
    }
}

int main() {
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
        final_result.length = num1.length + num2.length + 1;

        final_result.digits = aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);

        int err = madvise(final_result.digits, HPAGE_SIZE, MADV_HUGEPAGE);
        if (err != 0) {
            perror("madvise");
            exit(EXIT_FAILURE);
        } 
        for (int i = 0; i < num1.length + num2.length; ++i) {
            final_result.digits[i] = '0';
        }
        final_result.digits[num1.length + num2.length] = '\0';

        multiply();

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
        freeBigInteger(&final_result);
    }

    // Print summary information
    fprintf(results_file, "\nAverage Execution Time: %f seconds\n", (double)(total_time / 30));
    fprintf(results_file, "Average Ticks: %f\n", (double)(total_ticks / 30));
    fprintf(results_file, "Minimum Execution Time: %f seconds\n", min_time);
    fprintf(results_file, "Minimum Ticks: %lu\n", min_ticks);

    fclose(results_file);

    return 0;
}
