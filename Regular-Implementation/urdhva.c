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

#define NUMBER_OF_BITS 8192
#define CSV_FILENAME "urdhva_multiplication_results_8192.csv"

uint64_t start_ticks, end_ticks;
uint64_t min_ticks = UINT64_MAX;

uint64_t total_ticks = 0;
int iteration;
char *num1,*num2,*result;


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

void printBigIntegerToFile(char *num, FILE *file) {
    fprintf(file, "%s", num);
}

void printResultsToFile(FILE *file, int iteration) {
    fprintf(file, "%d,", iteration);
    printBigIntegerToFile(num1, file);
    fprintf(file, ",");
    printBigIntegerToFile(num2, file);
    fprintf(file, ",");
    printBigIntegerToFile(result, file);
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
    int len1 = strlen(num1);
    int len2 = strlen(num2);

    // Initializing the result array with zeros
    for (int i = 0; i < len1 + len2; ++i) {
        result[i] = '0';
    }
    result[len1 + len2] = '\0';

    

    // Record the starting ticks
    start_ticks = rdtsc();
    // Multiplying each digit and add to the result
    for (int i = len1 - 1; i >= 0; --i) {
        int carry = 0;
        for (int j = len2 - 1; j >= 0; --j) {
            int temp = (num1[i] - '0') * (num2[j] - '0') + (result[i + j + 1] - '0') + carry;
            result[i + j + 1] = temp % 10 + '0';
            carry = temp / 10;
        }
        result[i] += carry; // Add the carry to the current digit
    }
    
    end_ticks = rdtsc();
    
    // Removing leading zeros from the result
    removeLeadingZero(result);
    total_ticks += (end_ticks - start_ticks);

    if ((end_ticks - start_ticks) < min_ticks) {
        min_ticks = (end_ticks - start_ticks);
    }

}

int main() {
    // Initialization
    
    FILE *results_file;
    results_file = fopen(CSV_FILENAME, "w");
    if (results_file == NULL) {
        printf("Error opening CSV file for writing!\n");
        return 1;
    }

    printHeader(results_file);
    int randomNumber;
    // Multiplication
    for (iteration = 1; iteration <= 100; ++iteration) {
        srand(time(NULL));

        // Generate a random number between 1 and 100
        randomNumber = (rand() % 100) + 1;

        num1 = generateRandomNumber(randomNumber);
        // Generate a random number between 1 and 100
        randomNumber = (rand() % 100) + 1;
        num2 = generateRandomNumber(randomNumber);
        result= (char *) malloc ((strlen(num1)+strlen(num2)+1)*sizeof(char));

        multiply(num1,num2,result);

        // Update minimum values
        if ((end_ticks - start_ticks) < min_ticks) {
            min_ticks = (end_ticks - start_ticks);
        }

        // Print results to the file
        printResultsToFile(results_file, iteration);
        printf("\nDone: Iter%d\n", iteration);
        free(result);
    }

    // Print summary information
    fprintf(results_file, "Average Ticks: %f\n", (double)(total_ticks / 100));
    fprintf(results_file, "Minimum Ticks: %lu\n", min_ticks);

    fclose(results_file);

    return 0;
}
