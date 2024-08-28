#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <fcntl.h>
#include <errno.h>

// Function to generate a seed for random number generation
unsigned long generate_seed()
{
    struct timespec ts1, ts2;
    clock_gettime(CLOCK_MONOTONIC, &ts1);
    clock_gettime(CLOCK_REALTIME, &ts2);

    int urandom_fd = open("/dev/urandom", O_RDONLY);
    uint32_t urandom_value;
    read(urandom_fd, &urandom_value, sizeof(urandom_value));
    close(urandom_fd);

    pid_t pid = getpid();
    pid_t tid = syscall(SYS_gettid);

    return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
}

void generate_no_borrow_propagation(uint32_t **a, uint32_t **b, int n)
{
    // Allocate memory for arrays a and b
    *a = (uint32_t *)malloc(n * sizeof(uint32_t));
    *b = (uint32_t *)malloc(n * sizeof(uint32_t));

    if (*a == NULL || *b == NULL)
    {
        perror("Memory allocation failed for a or b\n");
        exit(EXIT_FAILURE);
    }

    // Seed the random number generator
    int seed = generate_seed();
    srand(seed);

    // Fill the arrays from the least significant end
    for (int i = n - 1; i >= 0;)
    {
        // Determine the size of the current group
        int group_size = (i >= 8) ? 9 : (i + 1);
        int start_index = i - group_size + 1;

        // Generate the group for array a in non-increasing order
        uint32_t start_value = rand() % 10;
        for (int j = 0; j < group_size; j++)
        {
            (*a)[start_index + j] = start_value;
            // Randomly decide if the next digit should be the same or smaller
            if (rand() % 2 == 0 && start_value > 0)
            {
                start_value--;
            }
        }

        // Generate the group for array b as the reverse of array a
        for (int j = 0; j < group_size; j++)
        {
            (*b)[start_index + j] = (*a)[start_index + group_size - 1 - j];
        }

        i -= group_size;
    }
}

int main()
{
    uint32_t *a, *b;
    int n = 2466; // Example size

    generate_no_borrow_propagation(&a, &b, n);

    // Print the arrays for verification
    printf("Array a: ");
    for (int i = 0; i < n; i++)
    {
        printf("%u", a[i]);
    }
    printf("\n");

    printf("Array b: ");
    for (int i = 0; i < n; i++)
    {
        printf("%u", b[i]);
    }
    printf("\n");

    // Free allocated memory
    free(a);
    free(b);

    return 0;
}
