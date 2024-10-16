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

#define NUM_DIGITS 10000
#define NUM_ITERATIONS 2
#define NUMBER_OF_BITS 16384
#define MAX_EVENTS 11 // Maximum number of events to monitor
#define HPAGE_SIZE (2<<21)

uint64_t start_ticks, end_ticks,total_ticks,min_ticks=UINT64_MAX;
struct BigInteger *nums,*results;

long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags) {
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}
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
    /* monitoring performance */
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
    char binary_name[] = "test"; // replace with actual binary name
    int input_size = 100; // replace with actual input size

    char filename[100];
    snprintf(filename, sizeof(filename), "perf_data_%s_%d.csv", binary_name, NUMBER_OF_BITS);
    FILE *file = fopen(filename, "w");

    if (file == NULL) {
        perror("Error opening file");
        return -1;
    }

    // Write the header to the CSV file
    for (int j = 0; j < MAX_EVENTS; j++) {
        fprintf(file, "%s,", event_names[j]);
    }
    fprintf(file, "\n");

     int k=0;
    // Run your code here...

    // printf("Starting the computation for thp...\n");
    for (int i = 0; i < NUM_DIGITS; i+=2) {
        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++) {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }
        
        // Your computation code goes here...
        for (int j=0;j<NUM_ITERATIONS;j++){
            multiply(&nums[i], &nums[i+1], &results[k]);
            if(end_ticks - start_ticks < min_ticks){
                min_ticks = end_ticks - start_ticks;
            }
            total_ticks += end_ticks - start_ticks;
            }
        k++;
        
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
        // printf("Iteration %d\n",i);
    }
    // printf("Ending the computation for thp...\n");

    // Close the file
    fclose(file);

    // Close the file descriptors
    for (int i = 0; i < MAX_EVENTS; i++) {
        close(fd[i]);
    }
    printf("Minimum ticks: %lu\n", min_ticks);
    printf("Total ticks: %lu\n", total_ticks);
    madvise(nums_space, NUM_DIGITS*(sample_length + 1) * sizeof(char), MADV_DONTNEED);
    madvise(results_space, (NUM_DIGITS/2)*(2*(sample_length+1) + 1) * sizeof(char), MADV_DONTNEED);
    return 0;
}