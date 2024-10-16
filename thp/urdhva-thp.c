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
    result.digits=aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);
    if (!result.digits){
        perror("aligned_alloc failed");
        exit(EXIT_FAILURE);
    }
    int err = madvise(result.digits, len * sizeof(char), MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise");
        exit(EXIT_FAILURE);
    }
    result.digits[0]='0';


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
    madvise(num->digits, HPAGE_SIZE, MADV_DONTNEED);
}
void printBigIntegerToFile(struct BigInteger num, FILE *file) {
    fprintf(file, "%s", num.digits);
}

void printResultsToFile(FILE *file) {
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
    fprintf(file, "Number 1,Number 2,Result,Ticks\n");
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
    // Multiplication
        srand(time(NULL));

        // Generate a random number between 1 and 100
        randomNumber = (rand() % 100) + 1;
        num1 = initBigInteger(generateRandomNumber(randomNumber));
        randomNumber = (rand() % 100) + 1;
        num2 = initBigInteger(generateRandomNumber(randomNumber));
        final_result.length = num1.length + num2.length + 1;

        final_result.digits = aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);
        if (!final_result.digits){
            perror("aligned_alloc failed!");
            exit(EXIT_FAILURE);
        }
        int err = madvise(final_result.digits, HPAGE_SIZE, MADV_HUGEPAGE);
        if (err != 0) {
            perror("madvise");
            exit(EXIT_FAILURE);
        } 
        final_result.digits[0]='0';

        for (int i = 0; i < num1.length + num2.length; ++i) {
            final_result.digits[i] = '0';
        }
        final_result.digits[num1.length + num2.length] = '\0';

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
