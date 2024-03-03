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
#define HPAGE_SIZE (2<<21)

uint64_t start_ticks, end_ticks,total_ticks,min_ticks=UINT64_MAX;
struct BigInteger *nums,*results;

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
void multiply(struct BigInteger *num1, struct BigInteger *num2, struct BigInteger *final_result)
{
    int len1 = num1->length;
    int len2 = num2->length;    
    long int product,carry;
    start_ticks = rdtsc();
    for (int i = 0; i < len1; i++)
    {
        carry = 0;
        for (int  j = 0; j < len2; j++)
        {
            product = num1->digits[i] * num2->digits[j] + final_result->digits[i + j] + carry;
            carry = product / 10;
            final_result->digits[i + j] = product % 10;
        }

        if (carry)
        {
            final_result->digits[i + len2] += carry;
        }
    }

    while (final_result->length > 1 && final_result->digits[final_result->length - 1] == 0)
    {
        final_result->length--;
    }
    end_ticks = rdtsc();
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
    posix_memalign((void **)&nums, HPAGE_SIZE, NUM_DIGITS * sizeof(struct BigInteger));
    int err = madvise(nums, NUM_DIGITS * sizeof(struct BigInteger), MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise nums");
        exit(EXIT_FAILURE);
    }
    posix_memalign((void **)&results, HPAGE_SIZE, (NUM_DIGITS/2) * sizeof(struct BigInteger));
    err = madvise(results, (NUM_DIGITS/2) * sizeof(struct BigInteger), MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise results");
        exit(EXIT_FAILURE);
    }

    // Check if memory allocation was successful
    if (nums == NULL) {
        printf("Memory allocation failed for nums.\n");
        return 1;
    }
    if (results == NULL) {
        printf("Memory allocation failed for nums.\n");
        return 1;
    }
    generate_seed();
    char* sampleString = generateRandomNumber((rand() % 100) + 1);
    int sample_length = strlen(sampleString);

    // Preallocate memory for each integer and use it to generate random numbers
    //char *nums_space = (char *)malloc(NUM_DIGITS*(sample_length + 1) * sizeof(char));
    char *nums_space;
    posix_memalign((void **)&nums_space, HPAGE_SIZE, NUM_DIGITS*(sample_length + 1) * sizeof(char));
    err = madvise(nums_space, NUM_DIGITS*(sample_length + 1) * sizeof(char), MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise nums_space");
        exit(EXIT_FAILURE);
    }
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
    //char *results_space = (char *)malloc((NUM_DIGITS/2)*(2*(sample_length+1) + 1) * sizeof(char));
    char *results_space;
    posix_memalign((void **)&results_space, HPAGE_SIZE, (NUM_DIGITS/2)*(2*(sample_length+1) + 1) * sizeof(char));
    err = madvise(results_space, (NUM_DIGITS/2)*(2*(sample_length+1) + 1) * sizeof(char), MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise results_space");
        exit(EXIT_FAILURE);
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

    // printf("Starting the computation for thp...\n");
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
    }
    printf("Minimum ticks: %lu\n", min_ticks);
    printf("Total ticks: %lu\n", total_ticks);
    madvise(nums_space, NUM_DIGITS*(sample_length + 1) * sizeof(char), MADV_DONTNEED);
    madvise(results_space, (NUM_DIGITS/2)*(2*(sample_length+1) + 1) * sizeof(char), MADV_DONTNEED);
    return 0;
}