#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
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
#define _GNU_SOURCE
#if defined(__i386__) || defined(__x86_64__)
#include <x86intrin.h>
#endif
#include <math.h>
#include <limits.h>
#include <inttypes.h>
#include <sys/types.h>
#include <sys/stat.h>


#define NUM_DIGITS 100000
#define NUM_MULTIPLICATIONS 10000
#define NUM_ITERATIONS 1
#define NUMBER_OF_BITS 512
#define MAX_EVENTS 7 // Maximum number of events to monitor
struct BigInteger *nums,*results;
typedef struct {
    double real;
    double imag;
} Complex;
Complex *x_one,*x_two, *y_one,*y_two,*y_three;


long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags) {
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}
// Function to read the Time Stamp Counter
static inline uint64_t rdtsc(void)
{
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}

struct BigInteger
{
    int *digits;
    int length;
};

struct timespec start_time, end_time;
double execution_time;
uint64_t start_ticks, end_ticks;
uint64_t min_ticks = UINT64_MAX;
double min_time = DBL_MAX;
double total_time = 0;
uint64_t total_ticks = 0;
int iteration;


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






void fft(Complex* x, Complex *y, int N, int inverse) {
    int i, j, k;
    double pi = 3.14159265358979323846;
    double angle;
    Complex w, w_N;
    int step = 1;
    for (i = 0; i < N; i++) {
        y[i] = x[i];
    }
    for (i = 0; i < N; i++) {
        j = 0;
        int temp = i;
        for (k = 0; k < log2(N); k++) {
            j = (j << 1) | (temp & 1);
            temp >>= 1;
        }
        if (j < N) {
            x[j] = y[i];
        }
    }
    for (i = 1; i <= log2(N); i++) {
        step *= 2;
        for (j = 0; j < N; j += step) {
            angle = 2 * pi / step;
            w.real = cos(angle);
            w.imag = sin(angle);
            if (inverse) {
                w.imag = -w.imag;
            }
            w_N.real = 1;
            w_N.imag = 0;
            for (k = 0; k < step / 2; k++) {
                Complex u = x[j + k];
                Complex v = x[j + k + step / 2];
                x[j + k].real = u.real + w_N.real * v.real - w_N.imag * v.imag;
                x[j + k].imag = u.imag + w_N.real * v.imag + w_N.imag * v.real;
                x[j + k + step / 2].real = u.real - w_N.real * v.real + w_N.imag * v.imag;
                x[j + k + step / 2].imag = u.imag - w_N.real * v.imag - w_N.imag * v.real;
                Complex temp = w_N;
                w_N.real = temp.real * w.real - temp.imag * w.imag;
                w_N.imag = temp.real * w.imag + temp.imag * w.real;
            }
        }
    }
    if (inverse) {
        for (i = 0; i < N; i++) {
            x[i].real /= N;
            x[i].imag /= N;
        }
    }
}

void multiply(struct BigInteger * num1, struct BigInteger *num2, struct BigInteger *result) {
    // Convert the input numbers to Complex arrays
    int len1 = num1->length;
    int len2 = num2->length;
    int N = 2 * (int)pow(2, ceil(log2(2 * (len1 + len2))));


    for (int i = 0; i < len1; i++) {
        x_one[i].real = num1->digits[len1 - i - 1] - '0';
    }

    for (int i = 0; i < len2; i++) {
        x_two[i].real = num2->digits[len2 - i - 1] - '0';
    }

    // Perform FFT on the input numbers
    fft(x_one, y_one, N, 0);
    fft(x_two, y_two, N, 0);

    // Multiply the transformed numbers
    for (int i = 0; i < N; i++) {
        double real = x_one[i].real * x_two[i].real - x_one[i].imag * x_two[i].imag;
        double imag = x_one[i].real * x_two[i].imag + x_one[i].imag * x_two[i].real;
        x_one[i].real = real;
        x_one[i].imag = imag;
    }

    // Perform inverse FFT to get the result
    fft(x_one, y_three, N, 1);

    // Convert the result back to the time domain and handle carry
    
    for (int i = 0; i < N; i++) {
        result->digits[i] = round(x_one[i].real);
    }
    for (int i = 0; i < N; i++) {
        if (result->digits[i] >= 10) {
            int carry = result->digits[i] / 10;
            result->digits[i] %= 10;
            int j = i + 1;
            while (carry > 0) {
                result->digits[j] += carry;
                carry = result->digits[j] / 10;
                result->digits[j] %= 10;
                j++;
            }
        }
    }
}

// Function to print the header of the CSV file
void printHeader(FILE *file) {
    fprintf(file, "Number 1,Number 2,Result,Ticks\n");
}

// Function to print a BigInteger to a file
void printBigIntegerToFile(struct BigInteger num, FILE *file) {
    for (int i = num.length-1; i>=0; i--) {
        fprintf(file, "%d", num.digits[i]);
    }
}

// Function to print the results to a file
void printResultsToFile(FILE *file, struct BigInteger num1, struct BigInteger num2,int index1, int index2, struct BigInteger final_result) {
    printBigIntegerToFile(num1, file);
    fprintf(file, ",");
    printBigIntegerToFile(num2, file);
    fprintf(file, ",");
    fprintf(file, "%d,%d,",index1,index2);
    printBigIntegerToFile(final_result, file);
    // fprintf(file, ",%lu\n", end_ticks - start_ticks);
}

// Function to flush the cache for a given pointer and size
void flushCache(void *p, int size) {
    char *cp = (char *)p;
    for (int i = 0; i < size; i += 64) {
        _mm_clflush(cp + i);  // Flush L1
        _mm_clwb(cp + i);     // Write back to L2/L3
        _mm_clflushopt(cp + i);  // Flush from all cache levels
    }
}

void generate_seed() {
    // Get the current time in microseconds
    struct timeval time;
    gettimeofday(&time, NULL);
    unsigned long long now = time.tv_sec * 1e6 + time.tv_usec;

    // Get the process ID
    pid_t pid = getpid();

    // Combine the current time and the process ID to create a seed
    unsigned int seed = now ^ pid;

    // Set the seed for the rand() function
    srand(seed);
}


int main() {
    // Allocate memory for two integers
    char CSV_FILENAME[100];
    snprintf(CSV_FILENAME, sizeof(CSV_FILENAME), "experiment_FFT_multiplication_results_peo_%d.csv", NUMBER_OF_BITS);

    FILE *results_file;
    results_file = fopen(CSV_FILENAME, "w");
    if (results_file == NULL) {
        printf("Error opening CSV file for writing!\n");
        return 1;
    }

    printHeader(results_file);
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

    // Preallocate memory for each integer and use it to generate random numbers
    int *nums_space = (int *)malloc(NUM_DIGITS*(sample_length + 1) * sizeof(int));
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
        for (int j=0; j<length; j++) {
            nums[i].digits[j] = randomString[j] - '0';
        }

        nums[i].length = length;
    }


    generate_seed();
    sampleString = generateRandomNumber((rand() % 100) + 1);
    sample_length = strlen(sampleString);
    
    // Preallocate memory for each integer and use it to generate random numbers
    int *results_space = (int *)malloc((NUM_DIGITS/2)*(2*(sample_length+1) + 1) * sizeof(int));
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

    // Define the events to monitor
    struct perf_event_attr pe[MAX_EVENTS];
    int fd[MAX_EVENTS];
    long long count[MAX_EVENTS];
    int i;

    memset(&pe, 0, sizeof(struct perf_event_attr) * MAX_EVENTS);

        // Define the events to monitor

    // CPU cycles
    pe[0].type = PERF_TYPE_HARDWARE;
    pe[0].config = PERF_COUNT_HW_CPU_CYCLES;

    // User-level instructions
    pe[1].type = PERF_TYPE_HARDWARE;
    pe[1].config = PERF_COUNT_HW_INSTRUCTIONS;
    pe[1].exclude_kernel = 1;
    pe[1].exclude_user = 0;

    // Kernel-level instructions
    pe[2].type = PERF_TYPE_HARDWARE;
    pe[2].config = PERF_COUNT_HW_INSTRUCTIONS;
    pe[2].exclude_kernel = 0;
    pe[2].exclude_user = 1;

    // Page faults
    pe[3].type = PERF_TYPE_SOFTWARE;
    pe[3].config = PERF_COUNT_SW_PAGE_FAULTS;

    // DTLB Misses
    pe[4].type = PERF_TYPE_HW_CACHE;
    pe[4].config = (PERF_COUNT_HW_CACHE_DTLB | 
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) | 
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    // LL1 Misses
    pe[5].type = PERF_TYPE_HW_CACHE;
    pe[5].config = (PERF_COUNT_HW_CACHE_L1D | 
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) | 
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    // LLC Misses
    pe[6].type = PERF_TYPE_HW_CACHE;
    pe[6].config = (PERF_COUNT_HW_CACHE_LL | 
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) | 
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));



    // Open the events
    for (i = 0; i < MAX_EVENTS; i++) {
        fd[i] = perf_event_open(&pe[i], 0, -1, -1, 0);
        if (fd[i] == -1) {
            fprintf(stderr, "Error opening event %d\n", i);
            exit(EXIT_FAILURE);
        }
    }

    // Array of event type names
    // Array of event type names
    const char *event_names[MAX_EVENTS] = {
        "PERF_COUNT_HW_CPU_CYCLES",
        "PERF_COUNT_HW_USER_INSTRUCTIONS",
        "PERF_COUNT_HW_KERNEL_INSTRUCTIONS",
        "PERF_COUNT_SW_PAGE_FAULTS",
        "PERF_COUNT_HW_CACHE_DTLB_MISS",
        "PERF_COUNT_HW_CACHE_L1D_MISS",
        "PERF_COUNT_HW_CACHE_LLC_MISS"
    };

   // Open a file for writing
    char binary_name[] = "perf_peo_FFT"; // replace with actual binary name
    int input_size = 100; // replace with actual input size

    char filename[100];
    snprintf(filename, sizeof(filename), "%s_%d.csv", binary_name, NUMBER_OF_BITS);
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
    // int left = 0;
    // int right = NUM_DIGITS - 1;

    // printf("Starting the computation for thp...\n");
    int indices[NUM_DIGITS];
    for (int i = 0; i < NUM_DIGITS; i++) {
        indices[i] = i;
    }
    printf("Starting the computation for non-thp...\n");
    for (int i = 0; i < NUM_MULTIPLICATIONS; i += 2) {
        // Shuffle the indices array
        for (int j = NUM_DIGITS - 1; j > 0; j--) {
            int randomIndex = rand() % (j + 1);
            int temp = indices[j];
            indices[j] = indices[randomIndex];
            indices[randomIndex] = temp;
        }
        
        int index1 = indices[i];
        int index2 = indices[i + 1];

        // flush the caches here
        // Align the pointers and their sizes to 64 bytes
        uintptr_t aligned_ptr1 = (uintptr_t)nums[index1].digits;
        uintptr_t aligned_ptr2 = (uintptr_t)nums[index2].digits;
        uintptr_t aligned_ptr3 = (uintptr_t)results[k].digits;


        aligned_ptr1 = (aligned_ptr1 + 63) & ~63;
        aligned_ptr2 = (aligned_ptr2 + 63) & ~63;
        aligned_ptr3 = (aligned_ptr3 + 63) & ~63;

        // size_t aligned_size1 = (nums[index1].length * sizeof(int)) + (aligned_ptr1 - (uintptr_t)nums[index1].digits);
        // size_t aligned_size2 = (nums[index2].length * sizeof(int)) + (aligned_ptr2 - (uintptr_t)nums[index2].digits);
        // size_t aligned_size3 = (results[k].length * sizeof(int)) + (aligned_ptr3 - (uintptr_t)results[k].digits);
        size_t aligned_size1 = ((nums[index1].length * sizeof(int)) + 63) & ~63;
        size_t aligned_size2 = ((nums[index2].length * sizeof(int)) + 63) & ~63;
        size_t aligned_size3 = ((results[k].length * sizeof(int)) + 63) & ~63;

        // Flush the cache for the aligned pointers and sizes
        flushCache((void*)aligned_ptr1, aligned_size1);
        flushCache((void*)aligned_ptr2, aligned_size2);
        flushCache((void*)aligned_ptr3, aligned_size3);


        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++) {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }
        int length = nums[index1].length + nums[index2].length + 1;
        // Your computation code goes here...
        for (int j = 0; j < NUM_ITERATIONS; j++) {
            // start_ticks = rdtsc();
            // flush the caches
        
            
            x_one =(Complex*)calloc(length, sizeof(Complex));
            x_two =(Complex*)calloc(length,sizeof(Complex));
            y_one =(Complex*)calloc(length, sizeof(Complex));
            y_two =(Complex*)calloc(length,sizeof(Complex));
            y_three =(Complex*)calloc(length,sizeof(Complex));
            multiply(&nums[index1], &nums[index2], &results[k]);
            
            printf("Multiplication of Num %d and Num %d done, count: %d \n", index1, index2, k);

            free(x_one);
            free(x_two);
            free(y_one);
            free(y_two);
            free(y_three);
        }
        // Stop monitoring
        for (int j = 0; j < MAX_EVENTS; j++) {
            if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1) {
                perror("Error disabling counter");
                exit(EXIT_FAILURE);
            }
        }
        printf("Multiplication of Num %d and Num %d done, count: %d \n", index1, index2, k);

        printResultsToFile(results_file, nums[index1], nums[index2],index1,index2, results[k]);

        k++;
        


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
    // printf("Ending the computation for non-thp...\n");

    // Close the file
    fclose(file);

    // Close the file descriptors
    for (int i = 0; i < MAX_EVENTS; i++) {
        close(fd[i]);
    }

    // printf("Minimum ticks: %lu\n", min_ticks);
    // printf("Total ticks: %lu\n", total_ticks);
    free(nums_space);
    free(results_space);
    return 0;
}
