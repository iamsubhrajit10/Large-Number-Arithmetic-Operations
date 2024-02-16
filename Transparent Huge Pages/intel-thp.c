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
#define NUMBER_OF_BITS 8192
#define CSV_FILENAME "experiment_intel_multiplication_results_8192.csv"
#define ITERATIONS 100

struct BigInteger final_result;
struct BigInteger num1;
struct BigInteger num2;
int* num1_digits;
int* num2_digits;

uint64_t start_ticks, end_ticks;
uint64_t min_ticks = UINT64_MAX;
uint64_t total_ticks = 0;

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

struct BigInteger
{
  long int *digits;
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
 
  // Allocate memory aligned to a huge page
  result.digits = aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);
  int err = madvise(result.digits, HPAGE_SIZE, MADV_HUGEPAGE);
  if (err != 0) {
    perror("madvise");
    exit(EXIT_FAILURE);
  }

  // Initialize digits
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
  printBigIntegerToFile(final_result, file);
  fprintf(file, ",%lu\n", end_ticks - start_ticks);
}

// Function to get the current value of the Time Stamp Counter
static inline uint64_t rdtsc(void) {
  unsigned int lo, hi;
  asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
  return ((uint64_t)hi << 32) | lo;
}

void multiply()
{
  int len1 = num1.length;
  int len2 = num2.length;

  start_ticks = rdtsc();
  for (int iter = 0; iter < ITERATIONS; iter++) {
    for (int i = 0; i < len1; i++)
    {
      long int carry = 0;
      for (int j = 0; j < len2; j++)
      {
        long int product = num1.digits[i] * num2.digits[j] + final_result.digits[i + j] + carry;
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
  }
  end_ticks = rdtsc();
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

  // Initialize memory for digits
  num1_digits = aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);
  num2_digits = aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);
  final_result.digits = aligned_alloc(HPAGE_SIZE, HPAGE_SIZE);

  printHeader(results_file);
  
  // Multiplication
  for (int iteration = 1; iteration <= ITERATIONS; ++iteration) {
    srand(time(NULL));

    // Generate random numbers
    num1 = initBigInteger(generateRandomNumber(iteration));
    num2 = initBigInteger(generateRandomNumber(iteration + 1));
    final_result.length = num1.length + num2.length;

    // Zero-initialize digits
    memset(final_result.digits, 0, sizeof(long int) * (num1.length + num2.length));

    multiply();

    // Print results to the file
    printResultsToFile(results_file, iteration);
    printf("\nDone: Iter%d\n", iteration);
    freeBigInteger(&num1);
    freeBigInteger(&num2);
  }

  // Print summary information
  fprintf(results_file, "Average Ticks: %f\n", (double)(total_ticks / ITERATIONS));
  fprintf(results_file, "Minimum Ticks: %lu\n", min_ticks);

  // Free allocated memory
  free(num1_digits);
  free(num2_digits);
  free(final_result.digits);

  fclose(results_file);

  return 0;
}
