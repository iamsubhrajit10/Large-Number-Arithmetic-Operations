#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <asm/unistd.h>
#include <string.h>
#include <signal.h>
#include <sys/mman.h>

#define PAGE_SIZE (2<<21)

static long
perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
                int cpu, int group_fd, unsigned long flags)
{
    int ret;

    ret = syscall(__NR_perf_event_open, hw_event, pid, cpu,
                   group_fd, flags);
    return ret;
}

// Make fd and count global
int fd;
long long count;

void segfault_handler(int signal) {
    // Stop the performance counter
    ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);

    // Read the performance counter
    read(fd, &count, sizeof(long long));

    printf("Page faults: %lld\n", count);
    printf("Segmentation fault (page fault) occurred!\n");
    exit(1);
}

int main() {
    struct perf_event_attr pe;

    // Set up the signal handler for SIGSEGV
    signal(SIGSEGV, segfault_handler);

    // Initialize the perf_event_attr structure
    memset(&pe, 0, sizeof(struct perf_event_attr));
    pe.type = PERF_TYPE_SOFTWARE;
    pe.size = sizeof(struct perf_event_attr);
    pe.config = PERF_COUNT_SW_PAGE_FAULTS;
    // pe.disabled = 1;
    pe.exclude_kernel = 0;
    pe.exclude_hv = 0;

    // Open the performance counter
    fd = perf_event_open(&pe, 0, -1, -1, 0);
    if (fd == -1) {
        fprintf(stderr, "Error opening performance counter\n");
        return -1;
    }
   
    //char* array = malloc(PAGE_SIZE);  // Allocate a page-sized array
    char *array;
    int err = posix_memalign((void**)&array, PAGE_SIZE, PAGE_SIZE);
    if (err) {
        fprintf(stderr, "Error allocating memory\n");
        return -1;
    }
    err = madvise(array, PAGE_SIZE, MADV_HUGEPAGE);
    if (err) {
        fprintf(stderr, "Error using huge pages\n");
        return -1;
    } 
    array[0] = 1;
    // Start the performance counter
    ioctl(fd, PERF_EVENT_IOC_RESET, 0);
    ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
    // Access an element outside the allocated page
    char element = array[11*4096];

    // Stop the performance counter
    ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);

    // Read the performance counter
    read(fd, &count, sizeof(long long));

    printf("Page faults: %lld\n", count);

    free(array);  // Free the allocated memory

    close(fd);

    return 0;
}