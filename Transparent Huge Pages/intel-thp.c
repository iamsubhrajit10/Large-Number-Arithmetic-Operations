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

#define HPAGE_SIZE (2<<21)
#define MAX_EVENTS 6 // Adjust as needed

long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags) {
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}

struct BigInteger final_result;
struct BigInteger num1;
struct BigInteger num2;
int NUMBER_OF_BITS;
uint64_t start_ticks, end_ticks,total_ticks,min_ticks=UINT64_MAX;


char* generateRandomNumber(int seed) {
    gmp_randstate_t state;
    mpz_t random_number;

    // Initialize random number state
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL) +seed);


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
    result.digits = NULL;
    // posix_memalign((void **)&result.digits, HPAGE_SIZE, result.length*sizeof(int));
    posix_memalign((void **)&result.digits, HPAGE_SIZE, HPAGE_SIZE);
    int err = madvise(result.digits, HPAGE_SIZE, MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise");
        exit(EXIT_FAILURE);
    }
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
    long int product,carry;

    start_ticks = rdtsc();
    for (int i = 0; i < len1; i++)
    {
        carry = 0;
        for (int  j = 0; j < len2; j++)
        {
            product = num1.digits[i] * num2.digits[j] + final_result.digits[i + j] + carry;
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
    end_ticks = rdtsc();
}
void monitor_performance() {
    struct perf_event_attr pe[MAX_EVENTS];
    memset(&pe, 0, sizeof(struct perf_event_attr) * MAX_EVENTS);

    // Define the events to monitor
    pe[0].type = PERF_TYPE_HARDWARE;
    pe[0].config = PERF_COUNT_HW_CPU_CYCLES;

    pe[1].type = PERF_TYPE_HARDWARE;
    pe[1].config = PERF_COUNT_HW_INSTRUCTIONS;

    pe[2].type = PERF_TYPE_SOFTWARE;
    pe[2].config = PERF_COUNT_SW_PAGE_FAULTS;

    pe[3].type = PERF_TYPE_HW_CACHE;
    pe[3].config = (PERF_COUNT_HW_CACHE_LL | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    pe[4].type = PERF_TYPE_HW_CACHE;
    pe[4].config = (PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    pe[5].type = PERF_TYPE_HW_CACHE;
    pe[5].config = (PERF_COUNT_HW_CACHE_ITLB | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    int fd[MAX_EVENTS];

    for (int i = 0; i < MAX_EVENTS; i++) {
        fd[i] = perf_event_open(&pe[i], 0, -1, -1, 0);
        if (fd[i] == -1) {
            perror("Error opening performance counter");
            exit(EXIT_FAILURE);
        }
    }

    // Start monitoring
    for (int i = 0; i < MAX_EVENTS; i++) {
        if (ioctl(fd[i], PERF_EVENT_IOC_ENABLE, 0) == -1) {
            perror("Error enabling counter");
            exit(EXIT_FAILURE);
        }
    }

    // Your computation code goes here...
    for (int i =0;i<1000;i++){
        // printf("Iteration %d starting...\n",i);
        multiply();
        // printf("Iteration %d done...\n",i);
            // Record the ending ticks
        total_ticks += (end_ticks - start_ticks);
    
        if ((end_ticks - start_ticks) < min_ticks) {
            min_ticks = (end_ticks - start_ticks);
        } 
            
    }

    // Stop monitoring
    for (int i = 0; i < MAX_EVENTS; i++) {
        if (ioctl(fd[i], PERF_EVENT_IOC_DISABLE, 0) == -1) {
            perror("Error disabling counter");
            exit(EXIT_FAILURE);
        }
    }

    // Read and print the counter values
    uint64_t values[MAX_EVENTS];
    for (int i = 0; i < MAX_EVENTS; i++) {
        if (read(fd[i], &values[i], sizeof(uint64_t)) == -1) {
            perror("Error reading counter value");
            exit(EXIT_FAILURE);
        }
    }

    printf("CPU Cycles: %lu\n", values[0]);
    printf("Instructions: %lu\n", values[1]);
    printf("Page Faults: %lu\n", values[2]);
    printf("L3 Cache Misses: %lu\n", values[3]);
    printf("L1 Data Cache Misses: %lu\n", values[4]);
    printf("L2 TLB Misses: %lu\n", values[5]);

    // Close the file descriptors
    for (int i = 0; i < MAX_EVENTS; i++) {
        close(fd[i]);
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
    final_result.digits = NULL;
    // posix_memalign((void **)&final_result.digits, HPAGE_SIZE, final_result.length*(sizeof(int)));
    posix_memalign((void **)&final_result.digits, HPAGE_SIZE, HPAGE_SIZE);
    int err = madvise(final_result.digits, HPAGE_SIZE, MADV_HUGEPAGE);
    if (err != 0) {
        perror("madvise");
        exit(EXIT_FAILURE);
    }
    final_result.digits[0]=0;

    for (int i = 0; i < num1.length + num2.length; ++i) {
        final_result.digits[i] = 0;
    }
    


    

    // Print results to the file
    printResultsToFile(results_file);
    printf("Average ticks: %f, Min Ticks: %ld\n",(double)total_ticks/(1000),min_ticks);
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
