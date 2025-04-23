#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>
#include "limb_utils.h"
#include "time.h"

int main()
{
    // Initialize memory pool
    init_memory_pool();

    // create a temporary string of 1024-bit using GMP library
    mpz_t num_mpz;
    char *str;
    mpz_init(num_mpz);

    // Initialize random state
    gmp_randstate_t state;
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL));

    // random number of 1024-bit
    mpz_urandomb(num_mpz, state, 65536);  // 65536 bits = 16384 hex digits = 1024-limbs
    str = mpz_get_str(NULL, 16, num_mpz); // Get hex-string (base 16)

    printf("Hex string: %s\n", str);

    // Create limb_t
    limb_t *num = limb_set_str(str);

    // print the limb
    printf("Limb representation: ");
    if (num->sign)
    {
        printf("-");
    }
    for (int i = 0; i < num->size; i++)
    {
        printf("%" PRIx64 " ", num->limbs[i]);
    }
    char *op_str = limb_get_str(num);
    printf("\nConverted back to hex string: %s\n", op_str);

    printf("strlen(str): %ld\n", strlen(str));
    printf("strlen(op_str): %ld\n", strlen(op_str));
    printf("num->size: %ld\n", num->size);

    // check if the strings are equal, ignore case
    if (strcasecmp(str, op_str) == 0)
    {
        printf("Strings are equal\n");
    }
    else
    {
        printf("Strings are not equal\n");
    }

    // Free allocated memory
    // free(str);
    // free(op_str);
    mpz_clear(num_mpz);
    gmp_randclear(state);

    return 0;
}