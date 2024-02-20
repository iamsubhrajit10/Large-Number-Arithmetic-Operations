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

#define HPAGE_SIZE (2 * 1024 * 1024)
#define NUMBER_OF_BITS 4096
#define NUMBER_OF_EPOCHS 100
#define CSV_FILENAME "experiment_urdhva_multiplication_results_4096.csv"
struct BigInteger final_result;
struct BigInteger num1;
struct BigInteger num2;
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
int verify_thp_allocation(void *addr) {
    char maps_path[100];
    sprintf(maps_path, "/proc/%d/smaps", getpid());

    FILE *maps_file = fopen(maps_path, "r");
    if (maps_file == NULL) {
        perror("fopen");
        return 0;
    }

    char line[256];
    while (fgets(line, sizeof(line), maps_file) != NULL) {
        // Check for a line representing the allocated region
        if (strstr(line, (char *)addr) != NULL) {
            // Look for the "AnonHugePages" flag. 
            if (strstr(line, "AnonHugePages:") != NULL) {
                fclose(maps_file);
                return 1; // THP allocated
            }
        }
    }

    fclose(maps_file);
    return 0; // THP not found
}


struct BigInteger {
    char *digits;
    int length;
};

struct BigInteger initBigInteger(char *num_str) {
    struct BigInteger result;
    int len = strlen(num_str);
 
    // Allocate memory with huge pages
    posix_memalign((void **)&result.digits, HPAGE_SIZE, len * sizeof (char));
    int err = madvise(result.digits, len * sizeof(char), MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise");
        exit(EXIT_FAILURE);
    }
    result.digits[0]='0';

    // Optional verification (can be commented out)
    if (verify_thp_allocation(result.digits)) {
        //printf("Transparent Huge Page successfully allocated!\n");
    } else {
        printf("THP allocation may not have been successful.\n");
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
    madvise(num->digits, num->length*sizeof(char), MADV_DONTNEED);
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
    fprintf(file, ",%lu\n", end_ticks - start_ticks);
}



// Function to get the current value of the Time Stamp Counter
static inline uint64_t rdtsc(void) {
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}
void printHeader(FILE *file) {
    fprintf(file, "Iteration,Number 1,Number 2,Result,Ticks\n");
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

    total_ticks += (end_ticks - start_ticks);

    if ((end_ticks - start_ticks) < min_ticks) {
        min_ticks = (end_ticks - start_ticks);
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
    for (iteration = 1; iteration <= NUMBER_OF_EPOCHS; ++iteration) {
        printf("\nStarting Iteration %d...\n", iteration);
        srand(time(NULL));

        // Generate a random number between 1 and 100
        randomNumber = (rand() % 100) + 1;
        num1 = initBigInteger(generateRandomNumber(randomNumber));
        randomNumber = (rand() % 100) + 1;
        num2 = initBigInteger(generateRandomNumber(randomNumber));
        final_result.length = num1.length + num2.length + 1;

        final_result.digits = NULL;
        posix_memalign((void **)&final_result.digits, HPAGE_SIZE, final_result.length * sizeof (char));
        int err = madvise(final_result.digits, final_result.length * sizeof(char), MADV_HUGEPAGE);
        if (err != 0) {
            perror("madvise");
            exit(EXIT_FAILURE);
        }
        final_result.digits[0]='0';
    
        // Optional verification (can be commented out)
        if (verify_thp_allocation(final_result.digits)) {
           // printf("Transparent Huge Page successfully allocated!\n");
        } else {
            printf("THP allocation may not have been successful.\n");
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

        // Print results to the file
        printResultsToFile(results_file, iteration);
        printf("\nDone: Iteration %d!\n", iteration);
        printf("Average Ticks: %f\n", (double)total_ticks / iteration);
        printf("Minimum Ticks: %lu\n", min_ticks);
        freeBigInteger(&num1);
        freeBigInteger(&num2);
        freeBigInteger(&final_result);
    }

    // Print summary information
    fprintf(results_file, "Average Ticks: %f\n", (double)total_ticks / NUMBER_OF_EPOCHS);
    fprintf(results_file, "Minimum Ticks: %lu\n", min_ticks);

    fclose(results_file);

    return 0;
}
