#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>  // Include this header for uint64_t
#include <stdbool.h>
#include <sys/mman.h>
#include <unistd.h>

#define HPAGE_SIZE (2 * 1024 * 1024)
#define PAGE_SIZE 4096

size_t page_index(void *ptr) {
    return (size_t)ptr / PAGE_SIZE;
}

size_t get_pfn(void *ptr) {
    size_t pi = page_index(ptr);
    FILE *fp = fopen("/proc/self/pagemap", "rb");

    if (fp == NULL) {
        perror("Error opening /proc/self/pagemap");
        exit(EXIT_FAILURE);
    }

    // Each entry in pagemap is 64 bits, i.e., 8 bytes.
    fseek(fp, pi * 8, SEEK_SET);

    uint64_t page_info = 0;
    size_t result = fread(&page_info, 8, 1, fp);
    if (result != 1) {
        perror("Error reading pagemap");
        exit(EXIT_FAILURE);
    }

    // Check if the page is present (bit 63). Otherwise, there is no PFN.
    if (page_info & ((uint64_t)1 << 63)) {
        uint64_t pfn = page_info & (((uint64_t)1 << 55) - 1);

        if (pfn == 0) {
            printf("Could not get page frame number. Does the process have the CAP_SYS_ADMIN capability?\n");
        }

        fclose(fp);
        return (size_t)pfn;
    } else {
        printf("Page not present.\n");
        fclose(fp);
        return 0;
    }
}

size_t get_pflags(void *ptr) {
    size_t pfn = get_pfn(ptr);
    if (pfn == 0) {
        return 0;
    }

    FILE *fp = fopen("/proc/kpageflags", "rb");
    if (fp == NULL) {
        perror("Error opening /proc/kpageflags");
        exit(EXIT_FAILURE);
    }

    fseek(fp, pfn * 8, SEEK_SET);

    uint64_t pflags = 0;
    size_t result = fread(&pflags, 8, 1, fp);
    if (result != 1) {
        perror("Error reading pageflags");
        exit(EXIT_FAILURE);
    }

    fclose(fp);
    return (size_t)pflags;
}

bool is_ehp(void *ptr) {
    uint64_t flags = get_pflags(ptr);
    return (flags & ((uint64_t)1 << 17)); // "huge" flag
}

bool is_thp(void *ptr) {
    uint64_t flags = get_pflags(ptr);
    return (flags & ((uint64_t)1 << 22)); // "transparent huge"
}

bool is_huge(void *ptr) {
    return is_ehp(ptr) || is_thp(ptr);
}

int main() {
    size_t size = 4 * HPAGE_SIZE;
    void *mem = aligned_alloc(HPAGE_SIZE, size);

    madvise(mem, size, MADV_HUGEPAGE);

    // Make sure the page is present
    ((char *)mem)[0] = 'x';

    printf("Is huge? %d\n", is_huge(mem));
    printf("Is THP? %d\n", is_thp(mem));
    long page_size = sysconf(_SC_PAGESIZE);
    printf("Page size for result.digits: %ld bytes\n", page_size);
    return 0;
}
