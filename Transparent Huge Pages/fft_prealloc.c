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
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <linux/hw_breakpoint.h>
#include <sys/syscall.h> // For syscall()
#include <asm/unistd.h>  // For __NR_perf_event_open

#define NUM_DIGITS 2000
#define NUM_ITERATIONS 2
#define NUMBER_OF_BITS 8192
#define MAX_EVENTS 11 // Maximum number of events to monitor
uint64_t start_ticks, end_ticks,total_ticks,min_ticks=UINT64_MAX;
struct BigInteger *nums,*results;
complex double f_space;

// Function to get the current value of the Time Stamp Counter
static inline uint64_t rdtsc(void) {
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}

struct BigInteger
{
    char *digits;
    int length;
};

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
    complex double *fa = f_space;
    complex double *fb = fa+ 2*NUMBER_OF_BITS;
    complex double *out = fb + 2*NUMBER_OF_BITS;
    if (fa == NULL || fb == NULL || out == NULL) {
        printf("Memory allocation failed.\n");
        return;
    }

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

void generate_seed() {
    // Get the current time
    time_t now = time(0);

    // Get the process ID
    pid_t pid = getpid();

    // Combine the current time and the process ID to create a seed
    unsigned int seed = now ^ pid;

    // Set the seed for the rand() function
    srand(seed);
}
int main() {
    // Allocate memory for two integers
    nums = (struct BigInteger *)malloc(NUM_DIGITS * sizeof(struct BigInteger));
    // Check if memory allocation was successful
    if (nums == NULL) {
        printf("Memory allocation failed for nums.\n");
        return 1;
    }
    

    results = (struct BigInteger *)malloc((NUM_DIGITS/2) * sizeof(struct BigInteger));
    if (results == NULL) {
        printf("Memory allocation failed for results.\n");
        return 1;
    }
    generate_seed();
    char* sampleString = generateRandomNumber((rand() % 100) + 1);
    int sample_length = strlen(sampleString);
    f_space = (complex double *)malloc(3 * NUMBER_OF_BITS * 2 * sizeof(complex double));

    // Preallocate memory for each integer and use it to generate random numbers
    char *nums_space = (char *)malloc(NUM_DIGITS*(sample_length + 1) * sizeof(char));
    //printf("Nums Space size: %ld\n", sizeof(nums_space));
    for (int i=0; i<NUM_DIGITS; i++) {
        generate_seed();
        int randomNumber = (rand() % 100) + 1;
        char* randomString = generateRandomNumber(randomNumber);
        int length = strlen(randomString);
        //nums[i].digits = (char *)malloc((length + 1) * sizeof(char));
        nums[i].digits = nums_space + i*(length + 1);
        if (nums[i].digits == NULL) {
            printf("Memory allocation failed.\n");
            return 1;
        }
        strcpy(nums[i].digits, randomString);
        nums[i].length = length;
    }


    generate_seed();
    sampleString = generateRandomNumber((rand() % 100) + 1);
    sample_length = strlen(sampleString);
    
    // Preallocate memory for each integer and use it to generate random numbers
    char *results_space = (char *)malloc((NUM_DIGITS/2)*(2*(sample_length+1) + 1) * sizeof(char));
    //printf("Results Space size: %ld\n", sizeof(results_space));
    if (results_space == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }
    for (int i=0; i<NUM_DIGITS/2; i++) {
        int length = nums[i].length+nums[i+1].length+1;
        results[i].digits = results_space + i*(length + 1);
        if (results[i].digits == NULL) {
            printf("Memory allocation failed.\n");
            return 1;
        }
        results[i].length = length;
    }


    int k=0;
    // Run your code here...
    // printf("Starting the computation for non-thp...\n");
    for (int i = 0; i < NUM_DIGITS; i+=2) {        
        // Your computation code goes here...
        for (int j=0;j<NUM_ITERATIONS;j++){
            multiply(&nums[i], &nums[i+1], &results[k]);
            if(end_ticks - start_ticks < min_ticks){
                min_ticks = end_ticks - start_ticks;
            }
            total_ticks += end_ticks - start_ticks;
        }
        k++;
        // printf("Iteration %d\n",i);
    }
    // printf("Ending the computation for non-thp...\n");


    printf("Minimum ticks: %lu\n", min_ticks);
    printf("Total ticks: %lu\n", total_ticks);
    free(nums_space);
    free(results_space);
    return 0;
}