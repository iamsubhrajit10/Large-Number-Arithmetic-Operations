#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <float.h>
#include <fcntl.h> // For file opening
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <linux/hw_breakpoint.h>
#include <sys/syscall.h> // For syscall()
#include <asm/unistd.h>  // For __NR_perf_event_open
#define _GNU_SOURCE
#include <x86intrin.h>
#define MAX_EVENTS 7

uint64_t start_ticks_units, end_ticks_units, total_ticks_units = 0;
uint64_t start_ticks_chunk, end_ticks_chunk, total_ticks_chunk = 0;

// Function to get the current value of the Time Stamp Counter
static inline uint64_t rdtsc(void)
{
    unsigned int lo, hi;
    asm volatile("rdtsc" : "=a"(lo), "=d"(hi));
    return ((uint64_t)hi << 32) | lo;
}

static long perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
                            int cpu, int group_fd, unsigned long flags)
{
    int ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}

void setup_perf_events(struct perf_event_attr *pe, int *fd)
{
    int i;

    memset(pe, 0, sizeof(struct perf_event_attr) * MAX_EVENTS);

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
    for (i = 0; i < MAX_EVENTS; i++)
    {
        fd[i] = perf_event_open(&pe[i], 0, -1, -1, 0);
        if (fd[i] == -1)
        {
            fprintf(stderr, "Error opening event %d\n", i);
            exit(EXIT_FAILURE);
        }
    }
}

int main()
{
    struct perf_event_attr pe[MAX_EVENTS];
    int fd[MAX_EVENTS];

    setup_perf_events(pe, fd);

    // Array of event type names
    // Array of event type names
    const char *event_names[MAX_EVENTS] = {
        "PERF_COUNT_HW_CPU_CYCLES",
        "PERF_COUNT_HW_USER_INSTRUCTIONS",
        "PERF_COUNT_HW_KERNEL_INSTRUCTIONS",
        "PERF_COUNT_SW_PAGE_FAULTS",
        "PERF_COUNT_HW_CACHE_DTLB_MISS",
        "PERF_COUNT_HW_CACHE_L1D_MISS",
        "PERF_COUNT_HW_CACHE_LLC_MISS"};

    // Open a file for writing for units
    char binary_name_units[] = "1gb_units"; // replace with actual binary name
    int input_size = 100;                   // replace with actual input size
    // Read and print the counter values
    uint64_t values[MAX_EVENTS];
    char filename_units[100];
    snprintf(filename_units, sizeof(filename_units), "%s.csv", binary_name_units);
    FILE *file_units = fopen(filename_units, "w");

    if (file_units == NULL)
    {
        perror("Error opening file for writing for units\n");
        return -1;
    }

    // Write the header to the CSV file
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        fprintf(file_units, "%s,", event_names[j]);
    }
    fprintf(file_units, "\n");

    // Open a file for writing for chunk
    char binary_name_chunk[] = "1gb_chunk"; // replace with actual binary name
    char filename_chunk[100];
    snprintf(filename_chunk, sizeof(filename_chunk), "%s.csv", binary_name_chunk);
    FILE *file_chunk = fopen(filename_chunk, "w");

    if (file_chunk == NULL)
    {
        perror("Error opening file for writing for chunk\n");
        return -1;
    }

    // Write the header to the CSV file
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        fprintf(file_chunk, "%s,", event_names[j]);
    }
    fprintf(file_chunk, "\n");
    // Reset values
    memset(values, 0, sizeof(values));

    // Scenario 1: Allocate a single chunk of 1GB memory using malloc/calloc
    size_t size = 1 * 1024 * 1024 * 1024; // 1GB in bytes

    // Start the events
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
        ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
    }
    // Start counting ticks for chunk
    start_ticks_chunk = rdtsc();

    void *ptr = malloc(size);

    // Stop counting ticks for chunk
    end_ticks_chunk = rdtsc();
    total_ticks_chunk = end_ticks_chunk - start_ticks_chunk;
    // Stop monitoring
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
        {
            perror("Error disabling counter");
            exit(EXIT_FAILURE);
        }
    }

    // Read and print the counter values
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        if (read(fd[j], &values[j], sizeof(uint64_t)) == -1)
        {
            perror("Error reading counter value");
            exit(EXIT_FAILURE);
        }
    }

    // Write the counter values to the CSV file
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        fprintf(file_chunk, "%lu,", values[j]);
    }
    fprintf(file_chunk, "\n");
    if (ptr == NULL)
    {
        printf("Failed to allocate memory.\n");
        return 1;
    }
    printf("Successfully allocated 1GB memory using malloc/calloc, with ticks: %lu\n", total_ticks_chunk);
    free(ptr);

    // Scenario 2: Allocate 1000's of memory units summing up to 1GB
    size_t unitSize = size / 1000;
    void *units[1000];

    for (int i = 0; i < 1000; i++)
    {

        // Start the events
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
            ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
        }
        // Start counting ticks for units
        start_ticks_units = rdtsc();

        units[i] = malloc(unitSize);

        // Stop counting ticks for units
        end_ticks_units = rdtsc();
        total_ticks_units += (end_ticks_units - start_ticks_units);
        // Stop monitoring
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            if (ioctl(fd[j], PERF_EVENT_IOC_DISABLE, 0) == -1)
            {
                perror("Error disabling counter");
                exit(EXIT_FAILURE);
            }
        }

        // Read and print the counter values
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            if (read(fd[j], &values[j], sizeof(uint64_t)) == -1)
            {
                perror("Error reading counter value");
                exit(EXIT_FAILURE);
            }
        }

        // Write the counter values to the CSV file
        for (int j = 0; j < MAX_EVENTS; j++)
        {
            fprintf(file_units, "%lu,", values[j]);
        }
        fprintf(file_units, "\n");

        if (units[i] == NULL)
        {
            printf("Failed to allocate memory.\n");
            return 1;
        }
    }
    // Sum up the 1000 units' performance into a single row
    printf("Successfully allocated 1000's of memory units summing up to 1GB, with ticks: %lu\n", total_ticks_units);
    for (int i = 0; i < 1000; i++)
    {
        free(units[i]);
    }

    return 0;
}