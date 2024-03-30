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

#define MAX_N 4 
#define CSV_FILENAME "fft_multiplication_results.csv"

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

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


void fft(complex double* input, complex double* output, int n) {
    if (n <= 1) {
        output[0] = input[0];
        return;
    }

    complex double even[n/2];
    complex double odd[n/2];
    for (int i = 0; i < n/2; i++) {
        even[i] = input[2*i];
        odd[i] = input[2*i + 1];
    }

    fft(even, output, n/2);
    fft(odd, output + n/2, n/2);

    for (int k = 0; k < n/2; k++) {
        complex double t = cexp(-I * 2 * M_PI * k / n) * output[k + n/2];
        output[k] = even[k] + t;
        output[k + n/2] = even[k] - t;
    }
}

void ifft(complex double* input, complex double* output, int n) {
    if (n <= 1) {
        output[0] = input[0];
        return;
    }

    complex double even[n/2];
    complex double odd[n/2];
    for (int i = 0; i < n/2; i++) {
        even[i] = input[2*i];
        odd[i] = input[2*i + 1];
    }

    ifft(even, output, n/2);
    ifft(odd, output + n/2, n/2);

    for (int k = 0; k < n/2; k++) {
        complex double t = cexp(I * 2 * M_PI * k / n) * output[k + n/2];
        output[k] = even[k] + t;
        output[k + n/2] = even[k] - t;
    }

    for (int i = 0; i < n; i++) {
        output[i] /= n;
    }
}

void multiply(int a[], int b[], int res[], int n) {
    // Print the a and b array
    printf("a: ");
    for (int i = 0; i < n; i++) {
        printf("%d", a[i]);
    }
    printf("\n");

    printf("b: ");
    for (int i = 0; i < n; i++) {
        printf("%d", b[i]);
    }
    printf("\n");
    // 1. Perform FFT on both coefficient vectors
    complex double A[n], B[n];
    for (int i = 0; i < n; i++) {
        A[i] = a[i];
        B[i] = b[i];
    }
    fft(A, A, n);
    fft(B, B, n);

    // 2. Pointwise multiplication of FFT results
    complex double C[n];
    for (int i = 0; i < n; i++) {
        C[i] = A[i] * B[i];
    }

    // 3. Apply IFFT to get convolution
    complex double D[n];
    ifft(C, D, n);

    // 4. Handle carry-over and construct the result string
    int carry = 0;
    for (int i = 0; i < 2 * n; i++) {
        int sum = round(creal(D[i])) + carry;
        res[i] = sum % 10;
        carry = sum / 10;
    }
    // Print the res array
    printf("res: ");
    for (int i = 0; i < 2 * n; i++) {
        printf("%d", res[i]);
    }

    // 5. Reverse the result array
    for (int i = 0; i < n; i++) {
        res[i] = res[2 * n - i - 1];
    }
}


int main() {
    num1 = generateRandomNumber(0);
    num2 = generateRandomNumber(1);
    printf("Number 1: %s\n", num1);
    printf("Number 2: %s\n", num2);
    result = (char *)malloc((strlen(num1) + strlen(num2) + 1) * sizeof(char));
    int n1 = strlen(num1), n2 = strlen(num2),n;
    printf("n1: %d, n2: %d\n", n1, n2);
    // Pad the shorter length number with leading 0s to make it same length
    if (n1 > n2) {
        n = n1;
        num2 = (char *)realloc(num2, n1 * sizeof(char));
        for (int i = n2 - 1; i >= 0; i--) {
            num2[i + n1 - n2] = num2[i];
        }
        for (int i = 0; i < n1 - n2; i++) {
            num2[i] = '0';
        }
    } else {
        n = n2;
        num1 = (char *)realloc(num1, n2 * sizeof(char));
        for (int i = n1 - 1; i >= 0; i--) {
            num1[i + n2 - n1] = num1[i];
        }
        for (int i = 0; i < n2 - n1; i++) {
            num1[i] = '0';
        }
    }
    printf("n: %d\n", n);
    // Converting numbers to integer arrays (coefficients)
    int a[n], b[n], res[n * 2];
    for (int i = 0; i < n; ++i) {
        a[i] = num1[i] - '0';
        b[i] = num2[i] - '0';
    }
    multiply(a, b, res, n);

    printf("Result: ");
    for (int i = 0; i < 2 * n; ++i) {
        result[i] = res[i] + '0';
        printf("%d", res[i]);
    }
    printf("\n");



    return 0;
}
