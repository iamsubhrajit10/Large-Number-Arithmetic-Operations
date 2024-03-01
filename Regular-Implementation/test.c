#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>
#include <time.h>
#include <string.h>

#define NUM_DIGITS 10000
#define NUMBER_OF_BITS 8192

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

int main() {
    // Allocate memory for two integers
    struct BigInteger *nums = (struct BigInteger *)malloc(NUM_DIGITS * sizeof(struct BigInteger));

    // Check if memory allocation was successful
    if (nums == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    for (int i=0; i<NUM_DIGITS; i++) {
        int randomNumber = (rand() % 100) + 1;
        char* randomString = generateRandomNumber(randomNumber);
        int length = strlen(randomString);
        nums[i].digits = (char *)malloc((length + 1) * sizeof(char));
        strcpy(nums[i].digits, randomString);
        nums[i].length = length;
        if (nums[i].digits == NULL) {
            printf("Memory allocation failed.\n");
            return 1;
        }
    }

    // Print the values
    printf("First integer: %s\n", nums[0].digits);
    printf("Second integer: %s\n", nums[1].digits);

    // Free the allocated memory
    for (int i = 0; i < NUM_DIGITS; i++) {
        free(nums[i].digits);
    }
    free(nums);

    return 0;
}