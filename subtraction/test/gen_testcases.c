/*
This file is used to generate testcases for the subtraction operation.
 Usage: ./gen_testcases <bit-size> <num-testcases> [<test-case-no>]
    <bit-size>: bit-size of the numbers
    <num-testcases>: number of testcases to generate
    <test-case-no>: number of testcases to generate, 0 for all testcases, 1 for random testcases, 2 for a = b, 3 for a > b, 4 for a < b
    If <test-case-no> is not provided, all testcases are generated
    The testcases are stored in the subtraction/test/cases/<bit-size> directory
    The testcases are stored in the following files:
        1. Random testcases: random.txt
        2. Testcases with a = b: equal.txt
        3. Testcases with a > b: greater.txt
        4. Testcases with a < b: smaller.txt
    The format of the file is:
        num1,num2,result
        123,456,123
        789,123,666
        ...

*/

#include <stdio.h>
#include <gmp.h>
#include <time.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <inttypes.h>

#define BUFFER_SIZE 1000

int BIT_SIZE;
int TESTCASE_SIZE;

// Files to store the testcases
FILE *testcases0, *testcases1, *testcases2, *testcases3;
FILE *testcases;

// Utility functions
unsigned long generate_seed();
FILE *open_file(char *filename, char *mode);
void close_file(FILE *file);

// Function to generate testcase0: Random testcases
void generate_testcase0(int bit_size, int num_testcases)
{
    gmp_randstate_t state;
    gmp_randinit_default(state);
    unsigned long seed = generate_seed();
    gmp_randseed_ui(state, seed);

    mpz_t a, b, c;
    mpz_inits(a, b, c, NULL);

    // print header <num1>,<num2>,<result>
    fprintf(testcases0, "num1,num2,result\n");

    char buffer[BUFFER_SIZE * 100]; // Adjust size based on expected string length
    int buffer_index = 0;

    for (int i = 0; i < num_testcases; i++)
    {
        seed = generate_seed();
        gmp_randseed_ui(state, seed);

        mpz_urandomb(a, state, bit_size);
        mpz_urandomb(b, state, bit_size);

        mpz_sub(c, a, b);

        char *a_str = mpz_get_str(NULL, 10, a);
        char *b_str = mpz_get_str(NULL, 10, b);
        char *c_str = mpz_get_str(NULL, 10, c);

        buffer_index += snprintf(buffer + buffer_index, sizeof(buffer) - buffer_index, "%s,%s,%s\n", a_str, b_str, c_str);

        free(a_str);
        free(b_str);
        free(c_str);

        if (buffer_index >= sizeof(buffer) - 100) // Leave some space for safety
        {
            fwrite(buffer, 1, buffer_index, testcases0);
            buffer_index = 0;
        }
    }

    // Write any remaining data in the buffer to the file
    if (buffer_index > 0)
    {
        fwrite(buffer, 1, buffer_index, testcases0);
    }

    mpz_clears(a, b, c, NULL);
    gmp_randclear(state);
}

// Function to generate testcase1: Testcases with a = b
void generate_testcase1(int bit_size, int num_testcases)
{
    gmp_randstate_t state;
    gmp_randinit_default(state);
    unsigned long seed = generate_seed();
    gmp_randseed_ui(state, seed);

    mpz_t a, b, c;
    mpz_inits(a, b, c, NULL);

    // print header <num1>,<num2>,<result>
    fprintf(testcases1, "num1,num2,result\n");

    char buffer[BUFFER_SIZE * 100]; // Adjust size based on expected string length
    int buffer_index = 0;

    for (int i = 0; i < num_testcases; i++)
    {
        seed = generate_seed();
        gmp_randseed_ui(state, seed);

        mpz_urandomb(a, state, bit_size);
        mpz_set(b, a);

        mpz_sub(c, a, b);

        char *a_str = mpz_get_str(NULL, 10, a);
        char *b_str = mpz_get_str(NULL, 10, b);
        char *c_str = mpz_get_str(NULL, 10, c);

        buffer_index += snprintf(buffer + buffer_index, sizeof(buffer) - buffer_index, "%s,%s,%s\n", a_str, b_str, c_str);

        free(a_str);
        free(b_str);
        free(c_str);

        if (buffer_index >= sizeof(buffer) - 100) // Leave some space for safety
        {
            fwrite(buffer, 1, buffer_index, testcases1);
            buffer_index = 0;
        }
    }

    // Write any remaining data in the buffer to the file
    if (buffer_index > 0)
    {
        fwrite(buffer, 1, buffer_index, testcases1);
    }

    mpz_clears(a, b, c, NULL);
    gmp_randclear(state);
}

// Function to generate testcase2: Testcases with a > b
void generate_testcase2(int bit_size, int num_testcases)
{
    gmp_randstate_t state;
    gmp_randinit_default(state);
    unsigned long seed = generate_seed();
    gmp_randseed_ui(state, seed);

    mpz_t a, b, c;
    mpz_inits(a, b, c, NULL);

    // print header <num1>,<num2>,<result>
    fprintf(testcases2, "num1,num2,result\n");

    char buffer[BUFFER_SIZE * 100]; // Adjust size based on expected string length
    int buffer_index = 0;

    for (int i = 0; i < num_testcases; i++)
    {
        seed = generate_seed();
        gmp_randseed_ui(state, seed);

        mpz_urandomb(a, state, bit_size);
        mpz_urandomb(b, state, bit_size);

        if (mpz_cmp(a, b) < 0)
        {
            mpz_swap(a, b);
        }

        mpz_sub(c, a, b);

        char *a_str = mpz_get_str(NULL, 10, a);
        char *b_str = mpz_get_str(NULL, 10, b);
        char *c_str = mpz_get_str(NULL, 10, c);

        buffer_index += snprintf(buffer + buffer_index, sizeof(buffer) - buffer_index, "%s,%s,%s\n", a_str, b_str, c_str);

        free(a_str);
        free(b_str);
        free(c_str);

        if (buffer_index >= sizeof(buffer) - 100) // Leave some space for safety
        {
            fwrite(buffer, 1, buffer_index, testcases2);
            buffer_index = 0;
        }
    }

    // Write any remaining data in the buffer to the file
    if (buffer_index > 0)
    {
        fwrite(buffer, 1, buffer_index, testcases2);
    }

    mpz_clears(a, b, c, NULL);
    gmp_randclear(state);
}

// Function to generate testcase3: Testcases with a < b
void generate_testcase3(int bit_size, int num_testcases)
{
    gmp_randstate_t state;
    gmp_randinit_default(state);
    unsigned long seed = generate_seed();
    gmp_randseed_ui(state, seed);

    mpz_t a, b, c;
    mpz_inits(a, b, c, NULL);

    // print header <num1>,<num2>,<result>
    fprintf(testcases3, "num1,num2,result\n");
    char buffer[BUFFER_SIZE * 100]; // Adjust size based on expected string length
    int buffer_index = 0;

    for (int i = 0; i < num_testcases; i++)
    {
        seed = generate_seed();
        gmp_randseed_ui(state, seed);

        mpz_urandomb(a, state, bit_size);
        mpz_urandomb(b, state, bit_size);

        if (mpz_cmp(a, b) > 0)
        {
            mpz_swap(a, b);
        }

        mpz_sub(c, a, b);

        char *a_str = mpz_get_str(NULL, 10, a);
        char *b_str = mpz_get_str(NULL, 10, b);
        char *c_str = mpz_get_str(NULL, 10, c);

        buffer_index += snprintf(buffer + buffer_index, sizeof(buffer) - buffer_index, "%s,%s,%s\n", a_str, b_str, c_str);

        free(a_str);
        free(b_str);
        free(c_str);
        if (buffer_index >= sizeof(buffer) - 100) // Leave some space for safety
        {
            fwrite(buffer, 1, buffer_index, testcases3);
            buffer_index = 0;
        }
    }
    // Write any remaining data in the buffer to the file
    if (buffer_index > 0)
    {
        fwrite(buffer, 1, buffer_index, testcases3);
    }
    mpz_clears(a, b, c, NULL);
    gmp_randclear(state);
}

int main(int argc, char *argv[])
{
    if (argc < 3 || argc > 4)
    {
        printf("Usage: %s <bit-size> <num-testcases> [<test-case-no>]\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // argv[1] is the bit-size
    BIT_SIZE = atoi(argv[1]);
    // sanity check
    if (BIT_SIZE <= 0 || BIT_SIZE > INT32_MAX)
    {
        printf("Invalid bit-size, should be between 1 and 2^31-1\n");
        exit(EXIT_FAILURE);
    }

    // argv[2] is the num of testcases
    TESTCASE_SIZE = atoi(argv[2]);
    // sanity check
    if (TESTCASE_SIZE <= 0 || TESTCASE_SIZE > INT32_MAX)
    {
        printf("Invalid testcase-size, should be between 1 and 2^31-1\n");
        exit(EXIT_FAILURE);
    }

    // argv[3] is the test case number (optional)
    int test_case_no = -1;
    if (argc == 4)
    {
        test_case_no = atoi(argv[3]);
        // sanity check
        if (test_case_no < -1 || test_case_no > 3)
        {
            printf("Invalid number of testcases, should be between 0 and 3, and -1 for all\n");
            exit(EXIT_FAILURE);
        }
    }
    printf("BIT_SIZE: %d\n", BIT_SIZE);
    printf("NUM_TESTCASES: %d\n", TESTCASE_SIZE);
    printf("TEST_CASE_NO: %d\n", test_case_no);

    // based on test-case-no, generate the names of the files
    if (test_case_no == -1) // create all test cases
    {
        char filename_0[100], filename_1[100], filename_2[100], filename_3[100];
        sprintf(filename_0, "cases/%d/random.txt", BIT_SIZE);
        sprintf(filename_1, "cases/%d/equal.txt", BIT_SIZE);
        sprintf(filename_2, "cases/%d/greater.txt", BIT_SIZE);
        sprintf(filename_3, "cases/%d/smaller.txt", BIT_SIZE);

        testcases0 = open_file(filename_0, "w");
        testcases1 = open_file(filename_1, "w");
        testcases2 = open_file(filename_2, "w");
        testcases3 = open_file(filename_3, "w");

        generate_testcase0(BIT_SIZE, TESTCASE_SIZE);
        generate_testcase1(BIT_SIZE, TESTCASE_SIZE);
        generate_testcase2(BIT_SIZE, TESTCASE_SIZE);
        generate_testcase3(BIT_SIZE, TESTCASE_SIZE);

        close_file(testcases0);
        close_file(testcases1);
        close_file(testcases2);
        close_file(testcases3);
    }
    else
    {
        char filename[100];
        if (test_case_no == 0) // random testcases
        {
            sprintf(filename, "cases/%d/random.txt", BIT_SIZE);
            open_file(filename, "w");
            generate_testcase0(BIT_SIZE, TESTCASE_SIZE);
        }
        else if (test_case_no == 1) // a = b
        {
            sprintf(filename, "cases/%d/equal.txt", BIT_SIZE);
            generate_testcase1(BIT_SIZE, TESTCASE_SIZE);
        }
        else if (test_case_no == 2) // a > b
        {
            sprintf(filename, "cases/%d/greater.txt", BIT_SIZE);
            open_file(filename, "w");
            generate_testcase2(BIT_SIZE, TESTCASE_SIZE);
        }
        else if (test_case_no == 3) // a < b
        {
            sprintf(filename, "cases/%d/smaller.txt", BIT_SIZE);
            open_file(filename, "w");
            generate_testcase3(BIT_SIZE, TESTCASE_SIZE);
        }
        close_file(testcases);
    }
    printf("Testcases generated successfully\n");
    return 0;
}

// Function to generate a seed for random number generation
unsigned long generate_seed()
{
    struct timespec ts1, ts2;
    clock_gettime(CLOCK_MONOTONIC, &ts1);
    clock_gettime(CLOCK_REALTIME, &ts2);

    int urandom_fd = open("/dev/urandom", O_RDONLY);
    if (urandom_fd == -1)
    {
        perror("Error opening /dev/urandom");
        exit(EXIT_FAILURE);
    }

    uint64_t urandom_value;
    ssize_t result = read(urandom_fd, &urandom_value, sizeof(urandom_value));
    if (result != sizeof(urandom_value))
    {
        perror("Error reading from /dev/urandom");
        close(urandom_fd);
        exit(EXIT_FAILURE);
    }
    close(urandom_fd);

    pid_t pid = getpid();
    pid_t tid = syscall(SYS_gettid);

    return ts1.tv_nsec ^ ts2.tv_nsec ^ urandom_value ^ pid ^ tid;
}

// Function to open a file
FILE *open_file(char *filename, char *mode)
{
    FILE *file = fopen(filename, mode);
    if (file == NULL)
    {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }
    return file;
}

// Function to close a file
void close_file(FILE *file)
{
    if (fclose(file) != 0)
    {
        perror("Error closing file");
        exit(EXIT_FAILURE);
    }
}
