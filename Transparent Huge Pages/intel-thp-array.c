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
#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))

int* final_result;
int* num1;
int* num2;
int num1_length, num2_length, final_result_length;
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
    gmp_randseed_ui(state, time(NULL) + iteration + seed);


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


int initBigInteger(char *num_str, int** num) {
    int len = strlen(num_str);

    *num = aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);
    if (*num == NULL) {  // Check for allocation failure
        perror("posix_memalign");
        exit(EXIT_FAILURE);
    }
    int err = madvise(*num, len * sizeof(int), MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise");
        exit(EXIT_FAILURE);
    }
    (*num)[0]=0;

    if (!verify_thp_allocation(*num)) {
        printf("THP allocation may not have been successful.\n");
    }

    for (int i = 0; i < len; i++) {
        (*num)[i] = num_str[len - i - 1] - '0';
    }

    return len;
}

void freeBigInteger(int **num, int len) {
    madvise(*num, len * sizeof(int), MADV_DONTNEED);
    free(*num);
}

void printBigIntegerToFile(int* num, FILE *file, int len) {
    for (int i = len - 1; i >= 0; i--) {
        fprintf(file, "%d", num[i]);
    }
}

void printResultsToFile(FILE *file, int iteration) {
    fprintf(file, "%d,", iteration);
    printBigIntegerToFile(num1, file, num1_length);
    fprintf(file, ",");
    printBigIntegerToFile(num2, file, num2_length);
    fprintf(file, ",");
    printBigIntegerToFile(final_result, file, final_result_length);
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

void multiply() {
    long int product, carry;

    start_ticks = rdtsc();
    for (int i = 0; i < num1_length; i++) {
        carry = 0;
        for (int j = 0; j < num2_length; j++) {
            product = num1[i] * num2[j] + final_result[i + j] + carry;
            carry = product / 10;
            final_result[i + j] = product % 10;
        }

        if (carry) {
            final_result[i + num2_length] += carry;
        }
    }

    while (final_result_length > 1 && final_result[final_result_length - 1] == 0) {
        final_result_length--;
    }
    end_ticks = rdtsc();

    // Record the ending ticks
    total_ticks += (end_ticks - start_ticks);

    if ((end_ticks - start_ticks) < min_ticks) {
        min_ticks = (end_ticks - start_ticks);
    }
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <No of bits> <No of epochs>\n", argv[0]);
        return 1;
    }

    NUMBER_OF_BITS = atoi(argv[1]);
    int NUMBER_OF_EPOCHS = atoi(argv[2]);

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
    for (iteration = 1; iteration <= NUMBER_OF_EPOCHS; ++iteration) {
        printf("\nStarting Iteration %d...\n", iteration);
        srand(time(NULL));

        // Generate a random number between 1 and 100
        randomNumber = (rand() % 100) + 1;
        num1_length = initBigInteger(generateRandomNumber(randomNumber), &num1);

        randomNumber = (rand() % 100) + 1;
        num2_length = initBigInteger(generateRandomNumber(randomNumber), &num2);

        final_result_length = num1_length + num2_length;

        final_result = aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);
        int err = madvise(final_result, final_result_length * sizeof(int), MADV_HUGEPAGE);
        if (err != 0) {
            perror("madvise");
            exit(EXIT_FAILURE);
        }
        final_result[0] = 0;

        if (!verify_thp_allocation(final_result)) {
            printf("THP allocation may not have been successful.\n");
        }

        for (int i = 0; i < num1_length + num2_length; ++i) {
            final_result[i] = 0;
        }

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
        freeBigInteger(&final_result, final_result_length);
        freeBigInteger(&num1, num1_length);
        freeBigInteger(&num2, num2_length);
    }

    // Print summary information
    if (results_file == NULL) {
        printf("Error opening CSV file for writing!\n");
        return 1;
    }

    fprintf(results_file, "Average Ticks: %f\n", (double)total_ticks / NUMBER_OF_EPOCHS);
    fprintf(results_file, "Minimum Ticks: %lu\n", min_ticks);

    fclose(results_file);

    return 0;
}
