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

struct BigInteger final_result;
struct BigInteger num1;
struct BigInteger num2;
int NUMBER_OF_BITS;
uint64_t start_ticks, end_ticks;
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
    result.length = len;
 
    //int size = 4*HPAGE_SIZE;
    result.digits =(int *) malloc( result.length*sizeof(int));
    // if (err != 0) {
    //     perror("madvise");
    //     exit(EXIT_FAILURE);
    // }
    result.digits[0]=0;

    for (int i = 0; i < len; i++)
    {
        result.digits[i] = num_str[len - i - 1] - '0';
    }
    //printf("%d ",is_huge(result.digits));
    return result;
}

void freeBigInteger(struct BigInteger *num)
{
    madvise(num->digits, num->length, MADV_DONTNEED);
    // free(num->digits);
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



// Function to get the current value of the Time Stamp Counter
static inline uint64_t rdtsc(void) {
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}
void printHeader(FILE *file) {
    fprintf(file, "Number 1,Number 2,Result,Ticks\n");
}

void multiply()
{
    int len1 = num1.length;
    int len2 = num2.length;    
    for(int i=0;i<len1;i++){
      final_result.digits[i]=num1.digits[i]+num2.digits[i];
    }
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
    final_result.length = num1.length + num2.length+1;
    final_result.digits = (int *) malloc( final_result.length*sizeof(int));
    // if (err != 0) {
    //     perror("madvise");
    //     exit(EXIT_FAILURE);
    // }
    final_result.digits[0]=0;

    for (int i = 0; i < num1.length + num2.length; ++i) {
        final_result.digits[i] = 0;
    }

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