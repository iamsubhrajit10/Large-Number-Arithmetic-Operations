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
#define MAX_EVENTS 11 // Maximum number of events to monitor

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
    int fd[MAX_EVENTS];
    long long count[MAX_EVENTS];
    int i;

    memset(&pe, 0, sizeof(struct perf_event_attr) * MAX_EVENTS);

    // Define the events to monitor
    pe[0].type = PERF_TYPE_HARDWARE;
    pe[0].config = PERF_COUNT_HW_CPU_CYCLES;

    pe[1].type = PERF_TYPE_HARDWARE;
    pe[1].config = PERF_COUNT_HW_INSTRUCTIONS;

    pe[2].type = PERF_TYPE_SOFTWARE;
    pe[2].config = PERF_COUNT_SW_PAGE_FAULTS;

    pe[3].type = PERF_TYPE_HW_CACHE;
    pe[3].config = (PERF_COUNT_HW_CACHE_L1D | 
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) | 
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    pe[4].type = PERF_TYPE_HW_CACHE;
    pe[4].config = (PERF_COUNT_HW_CACHE_DTLB | 
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) | 
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    // Cache Misses
    pe[5].type = PERF_TYPE_HARDWARE;
    pe[5].config = PERF_COUNT_HW_CACHE_MISSES;

    // TLB Misses
    pe[6].type = PERF_TYPE_HW_CACHE;
    pe[6].config = (PERF_COUNT_HW_CACHE_DTLB | 
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) | 
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    // Page Walks
    pe[7].type = PERF_TYPE_HW_CACHE;
    pe[7].config = (PERF_COUNT_HW_CACHE_DTLB | 
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) | 
                    (PERF_COUNT_HW_CACHE_RESULT_ACCESS << 16));

    // CPU Migrations
    pe[8].type = PERF_TYPE_SOFTWARE;
    pe[8].config = PERF_COUNT_SW_CPU_MIGRATIONS;

    // Minor page faults
    pe[9].type = PERF_TYPE_SOFTWARE;
    pe[9].config = PERF_COUNT_SW_PAGE_FAULTS_MIN;

    // Major page faults
    pe[10].type = PERF_TYPE_SOFTWARE;
    pe[10].config = PERF_COUNT_SW_PAGE_FAULTS_MAJ;


    // Open the events
    for (i = 0; i < MAX_EVENTS; i++) {
        fd[i] = perf_event_open(&pe[i], 0, -1, -1, 0);
        if (fd[i] == -1) {
            fprintf(stderr, "Error opening event %d\n", i);
            exit(EXIT_FAILURE);
        }
    }
    // Array of event type names
    const char *event_names[MAX_EVENTS] = {
        "PERF_COUNT_HW_CPU_CYCLES",
        "PERF_COUNT_HW_INSTRUCTIONS",
        "PERF_COUNT_SW_PAGE_FAULTS",
        "PERF_COUNT_HW_CACHE_L1D_MISS",
        "PERF_COUNT_HW_CACHE_DTLB_MISS",
        "PERF_COUNT_HW_CACHE_MISS",
        "PERF_COUNT_HW_CACHE_DTLB_MISS",
        "PERF_COUNT_HW_CACHE_DTLB_ACCESSES",
        "PERF_COUNT_SW_CPU_MIGRATIONS",
        "PERF_COUNT_SW_PAGE_FAULTS_MIN",
        "PERF_COUNT_SW_PAGE_FAULTS_MAJ"
    };

   // Open a file for writing
    char binary_name[] = "intel-thp"; // replace with actual binary name
    int input_size = 100; // replace with actual input size

    char filename[100];
    sprintf(filename, "perf_data_%s_%d.csv", binary_name, NUMBER_OF_BITS);

    FILE *file = fopen(filename, "w");

    // Write the header to the CSV file
    for (int j = 0; j < MAX_EVENTS; j++) {
        fprintf(file, "%s,", event_names[j]);
    }
    fprintf(file, "\n");

    // Run your code here...
    for (int i = 0; i < 1000000; i++) {
        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++) {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }

        // Your computation code goes here...
        multiply();
        if(end_ticks - start_ticks < min_ticks){
            min_ticks = end_ticks - start_ticks;
        }
        total_ticks += end_ticks - start_ticks;

        // Stop monitoring
        for (int j = 0; j < MAX_EVENTS; j++) {
            if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1) {
                perror("Error disabling counter");
                exit(EXIT_FAILURE);
            }
        }

        // Read and print the counter values
        uint64_t values[MAX_EVENTS];
        for (int j = 0; j < MAX_EVENTS; j++) {
            if (read(fd[j], &values[j], sizeof(uint64_t)) == -1) {
                perror("Error reading counter value");
                exit(EXIT_FAILURE);
            }
        }

        // Write the counter values to the CSV file
        for (int j = 0; j < MAX_EVENTS; j++) {
            fprintf(file, "%lu,", values[j]);
        }
        fprintf(file, "\n");
    }

    // Close the file
    fclose(file);

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
    
    monitor_performance();

    

    // Print results to the file
    printResultsToFile(results_file);
    printf("Average ticks: %f, Min Ticks: %ld\n",(double)total_ticks/(1000000),min_ticks);
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
