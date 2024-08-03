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
#include <gmp.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <omp.h>
#include <immintrin.h>
#include <errno.h>
#include <pthread.h>

#define MAX_EVENTS 11

long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags)
{
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
    return ret;
}

int main()
{
    // Define the events to monitor
    struct perf_event_attr pe[MAX_EVENTS];
    int fd[MAX_EVENTS];
    long long count[MAX_EVENTS];
    int i;

    memset(pe, 0, sizeof(struct perf_event_attr) * MAX_EVENTS);
    for (i = 0; i < MAX_EVENTS; i++)
    {
        pe[i].size = sizeof(struct perf_event_attr);
        pe[i].disabled = 1;
        pe[i].exclude_kernel = 0;
        pe[i].exclude_hv = 1;
        pe[i].exclude_idle = 1;
        pe[i].exclude_user = 0; // Initialize exclude_user explicitly
        pe[i].pinned = 1;       // Ensure counter stays on the specific CPU
    }

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

    // L1d Cache Accesses
    pe[5].type = PERF_TYPE_HW_CACHE;
    pe[5].config = (PERF_COUNT_HW_CACHE_L1D |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_ACCESS << 16));

    // L1d Cache Misses
    pe[6].type = PERF_TYPE_HW_CACHE;
    pe[6].config = (PERF_COUNT_HW_CACHE_L1D |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    // L1i Cache Accesses
    pe[7].type = PERF_TYPE_HW_CACHE;
    pe[7].config = (PERF_COUNT_HW_CACHE_L1I |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_ACCESS << 16));

    // L1i Cache Misses
    pe[8].type = PERF_TYPE_HW_CACHE;
    pe[8].config = (PERF_COUNT_HW_CACHE_L1I |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));

    // Corrected indexes for LL Cache Accesses and Misses
    pe[9].type = PERF_TYPE_HW_CACHE;
    pe[9].config = (PERF_COUNT_HW_CACHE_LL |
                    (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                    (PERF_COUNT_HW_CACHE_RESULT_ACCESS << 16));

    pe[10].type = PERF_TYPE_HW_CACHE;
    pe[10].config = (PERF_COUNT_HW_CACHE_LL |
                     (PERF_COUNT_HW_CACHE_OP_READ << 8) |
                     (PERF_COUNT_HW_CACHE_RESULT_MISS << 16));
    // Open the events
    for (i = 0; i < MAX_EVENTS; i++)
    {
        fd[i] = perf_event_open(&pe[i], 0, -1, -1, 0);
        if (fd[i] == -1)
        {
            fprintf(stderr, "Error opening event %d: %s\n", i, strerror(errno));
            exit(EXIT_FAILURE);
        }
    }
    // Array of event type names
    const char *event_names[MAX_EVENTS] = {
        "PERF_COUNT_HW_CPU_CYCLES",          // CPU Cycles
        "PERF_COUNT_HW_USER_INSTRUCTIONS",   // User Instructions
        "PERF_COUNT_HW_KERNEL_INSTRUCTIONS", // Kernel Instructions
        "PERF_COUNT_SW_PAGE_FAULTS",         // Page Faults
        "PERF_COUNT_HW_CACHE_DTLB_MISS",     // DTLB Misses
        "PERF_COUNT_HW_CACHE_L1D_ACCESS",    // L1 Data Cache Accesses
        "PERF_COUNT_HW_CACHE_L1D_MISS",      // L1 Data Cache Misses (already included)
        "PERF_COUNT_HW_CACHE_L1I_ACCESS",    // L1 Instruction Cache Accesses
        "PERF_COUNT_HW_CACHE_L1I_MISS",      // L1 Instruction Cache Misses
        "PERF_COUNT_HW_CACHE_L3_ACCESS",     // L3 Cache Accesses
        "PERF_COUNT_HW_CACHE_L3_MISS"        // L3 Cache Misses
    };
    uint64_t values[MAX_EVENTS];

    // Start the events
    for (int j = 0; j < MAX_EVENTS; j++)
    {
        ioctl(fd[j], PERF_EVENT_IOC_RESET, 0);
        ioctl(fd[j], PERF_EVENT_IOC_ENABLE, 0);
    }

    // // Dummy workload
    for (int k = 0; k < 1000000; k++)
        ;
    // More realistic workload
    volatile int array[10000];
    for (int k = 0; k < 10000; k++)
    {
        array[k] = k;
    }

    for (int k = 0; k < 10000; k++)
    {
        array[k] = array[k] * 2;
    }

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
        if (read(fd[j], &values[j], sizeof(unsigned long long)) == -1)
        {
            perror("Error reading counter value");
            exit(EXIT_FAILURE);
        }
    }

    // Close the file descriptors
    for (i = 0; i < MAX_EVENTS; i++)
    {
        close(fd[i]);
    }

    for (i = 0; i < MAX_EVENTS; i++)
    {
        printf("%s: %llu\n", event_names[i], (unsigned long long)values[i]);
    }

    return 0;
}
