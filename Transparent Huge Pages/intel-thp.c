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
#include <linux/perf_event.h>
#include <sys/ioctl.h>

#define HPAGE_SIZE (2<<21)
#define MAX_EVENTS 2048 // Maximum number of events to retrieve

// Function to open a file descriptor for a performance counter
long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags) {
    return syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
}

// Function to retrieve and print all possible events
void print_all_possible_events() {
    struct perf_event_attr pe;
    memset(&pe, 0, sizeof(struct perf_event_attr));
    pe.type = PERF_TYPE_RAW; // Type of events to query
    pe.size = sizeof(struct perf_event_attr);

    int fd = perf_event_open(&pe, 0, -1, -1, 0); // Open the file descriptor
    if (fd == -1) {
        perror("Error opening performance counter");
        exit(EXIT_FAILURE);
    }

    // Retrieve list of events
    struct perf_event_query_query q;
    memset(&q, 0, sizeof(q));
    q.attr = pe;
    q.flags = 0;

    struct perf_event_query_bpf_event_desc desc[MAX_EVENTS];
    memset(desc, 0, sizeof(desc));

    if (ioctl(fd, PERF_EVENT_IOC_QUERY_BPF, &q) < 0) {
        perror("Error querying BPF events");
        close(fd);
        exit(EXIT_FAILURE);
    }

    // Print the list of events
    for (int i = 0; i < MAX_EVENTS; i++) {
        if (desc[i].name[0] == '\0') break; // Stop if no more events
        printf("Event name: %s\n", desc[i].name);
    }

    close(fd); // Close the file descriptor
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

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <No of bits>\n", argv[0]);
        return 1;
    }
    print_all_possible_events();
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
