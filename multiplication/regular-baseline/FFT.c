#include <stdio.h>
#include <complex.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <float.h> // Include for DBL_MAX
#include <gmp.h> // Include for GMP library

// Function to read the Time Stamp Counter
static inline uint64_t rdtsc(void)
{
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}

#define MAX_N 2048
#define CSV_FILENAME "fft_multiplication_results.csv"

struct timespec start_time, end_time;
double execution_time;
uint64_t start_ticks, end_ticks;
uint64_t min_ticks = UINT64_MAX;
double min_time = DBL_MAX;
double total_time = 0;
uint64_t total_ticks = 0;
int iteration;
char *num1, *num2, *result;

char *generateRandomNumber(int seed) {
    gmp_randstate_t state;
    mpz_t random_number;

    // Initializing random number state
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL) + iteration + seed);

    // Initializing big number
    mpz_init(random_number);

    // Generating a random number of NUMBER_OF_BITS bits
    mpz_urandomb(random_number, state, MAX_N);

    // Converting the number to a string
    char *resultString = mpz_get_str(NULL, 10, random_number);

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
    fprintf(file, ",%f,%lu\n", execution_time, end_ticks - start_ticks);
}

void printHeader(FILE *file) {
    fprintf(file, "Iteration,Number 1,Number 2,Result,Execution Time (seconds),Ticks\n");
}

// Function to perform Fast Fourier Transform
void fft(complex double buf[], complex double out[], int n, int step) {
    if (step < n) {
        fft(out, buf, n, step * 2);
        fft(out + step, buf + step, n, step * 2);

        for (int i = 0; i < n; i += 2 * step) {
            complex double t = cexp(-I * M_PI * i / n) * out[i + step];
            buf[i / 2] = out[i] + t;
            buf[(i + n) / 2] = out[i] - t;
        }
    }
}

// Function to multiply two numbers using FFT
void multiply(int a[], int b[], int res[], int n) {
    complex double fa[MAX_N * 2], fb[MAX_N * 2], out[MAX_N * 2];

    for (int i = 0; i < n; ++i) {
        fa[i] = a[i];
        fb[i] = b[i];
    }

    fft(fa, out, n, 1);
    fft(fb, out, n, 1);

    for (int i = 0; i < n; ++i)
        out[i] = fa[i] * fb[i];

    fft(out, fa, n, 1);

    for (int i = 0; i < n; ++i)
        res[i] = round(creal(fa[i]) / n);
}

int main() {
    FILE *results_file;
    results_file = fopen(CSV_FILENAME, "w");
    if (results_file == NULL) {
        printf("Error opening CSV file for writing!\n");
        return 1;
    }

    printHeader(results_file);

    // Multiplication
    for (iteration = 1; iteration <= 30; ++iteration) {
        // Generating random numbers
        num1 = generateRandomNumber(iteration);
        num2 = generateRandomNumber(iteration);
        result = (char *)malloc((strlen(num1) + strlen(num2) + 1) * sizeof(char));

        // Converting numbers to integer arrays (coefficients)
        int a[MAX_N], b[MAX_N], res[MAX_N * 2];
        for (int i = 0; i < MAX_N; ++i) {
            a[i] = num1[i] - '0';
            b[i] = num2[i] - '0';
        }

        // Timing FFT multiplication
        clock_gettime(CLOCK_MONOTONIC, &start_time);
        start_ticks = rdtsc(); // You need to define or declare this function

        multiply(a, b, res, MAX_N);

        end_ticks = rdtsc(); // You need to define or declare this function
        clock_gettime(CLOCK_MONOTONIC, &end_time);

        execution_time = (end_time.tv_sec - start_time.tv_sec) +
                         (end_time.tv_nsec - start_time.tv_nsec) / 1e9;

        // Updating
        total_ticks += (end_ticks - start_ticks);
        total_time += execution_time;

        if ((end_ticks - start_ticks) < min_ticks) {
            min_ticks = (end_ticks - start_ticks);
        }

        if (execution_time < min_time) {
            min_time = execution_time;
        }

        printResultsToFile(results_file, iteration);
        printf("\nDone: Iter%d\n", iteration);
        free(result);
    }

    // Print summary information
    fprintf(results_file, "\nAverage Execution Time: %f seconds\n", (double)(total_time / 30));
    fprintf(results_file, "Average Ticks: %f\n", (double)(total_ticks / 30));
    fprintf(results_file, "Minimum Execution Time: %f seconds\n", min_time);
    fprintf(results_file, "Minimum Ticks: %lu\n", min_ticks);

    fclose(results_file);

    return 0;
}
