#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <limits.h>
#include <unistd.h>
#include <sys/mman.h>

#define HUGEPAGE_SIZE (2 * 1024 * 1024) // 2 MiB

void *thp_malloc(size_t size) {
    void *ptr;
    if (size > SIZE_MAX / sizeof(void *)) {
        return NULL;
    }
    if (posix_memalign(&ptr, HUGEPAGE_SIZE, size) != 0) {
        return NULL;
    }
    if (madvise(ptr, size, MADV_HUGEPAGE) != 0) {
        return NULL;
    }
    return ptr;
}

void thp_free(void *ptr) {
    free(ptr);
}

int main() {
    // Example usage
    int *arr = (int *)thp_malloc(100 * sizeof(int));
    if (arr == NULL) {
        perror("thp_malloc");
        return EXIT_FAILURE;
    }

    for (int i = 0; i < 100; ++i) {
        arr[i] = i;
    }

    for (int i = 0; i < 100; ++i) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    thp_free(arr);

    return EXIT_SUCCESS;
}
