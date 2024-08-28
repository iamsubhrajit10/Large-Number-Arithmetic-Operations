#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/time.h>
#include <gmp.h>
#include <unistd.h>

#define NUMBER_OF_BITS 8192

int *urdhva(int *number1, int *number2, int n)
{
    int *product = (int *)calloc(2 * n - 1, sizeof(int));
    int *carry = (int *)calloc(2 * n - 1, sizeof(int));
    int i, j, n1_index, n2_index;
    int p, c;

    // Compute Prefixes
    for (i = 0, j = n - 1; j >= 0; j--)
    {
        p = 0;
        for (n1_index = i, n2_index = j; n2_index >= 0 && n1_index <= n - 1; n1_index++, n2_index--)
        {
            p += number1[n1_index] * number2[n2_index];
            // printf("i: %d, j:%d, n1_index: %d, n2_index: %d, p: %d \n",i,j,n1_index,n2_index,p);
        }
        if ((j + i) != 0)
        {
            carry[j + i - 1] = p / 10;
            product[j + i] = p % 10;
        }
        else
        {
            product[j + i] = p;
        }
    }

    // Compute Suffixes
    for (j = n - 1, i++; i <= n - 1; i++)
    {
        p = 0;
        for (n1_index = i, n2_index = j; n2_index >= 0 && n1_index <= n - 1; n1_index++, n2_index--)
        {
            p += number1[n1_index] * number2[n2_index];
            // printf("i: %d, j:%d, n1_index: %d, n2_index: %d, p: %d \n", i, j, n1_index, n2_index, p);
        }
        if ((j + i) != 0)
        {
            carry[j + i - 1] = p / 10;
            product[j + i] = p % 10;
        }
        else
        {
            product[j + i] = p;
        }
    }

    // Adjust Carries
    for (c = 0, i = 2 * n - 2; i >= 0; i--)
    {
        p = product[i] + carry[i] + c;
        c = p / 10;
        if (i != 0)
            product[i] = p % 10;
        else
            product[i] = p;
    }

    free(carry);
    return product;
}

// Function to make the two number strings equidistant by adding zeroes in front of the smaller number, and reallocate space for the smaller number
void make_equidistant(int **num1_base, int **num2_base, int *n_1, int *n_2)
{
    if (*n_1 == *n_2)
        return;

    int n1 = *n_1;
    int n2 = *n_2;
    int *num1 = *num1_base;
    int *num2 = *num2_base;

    if (n1 > n2)
    {
        // printf("Num1 is greater\n");
        int *temp = (int *)calloc(n1, sizeof(int));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }
        // copy from the LSB to MSB of num2 into temp
        for (int i = n2 - 1; i >= 0; i--)
        {
            // printf("Copying %d into temp index of %d\n", num2[i], i + n1 - n2);
            temp[i + n1 - n2] = num2[i];
        }
        // fill the remaining MSB with zeroes in temp
        for (int i = 0; i < n1 - n2; i++)
        {
            temp[i] = 0;
        }

        printf("\n");
        // reallocate space for num2 using realloc
        num2 = (int *)realloc(num2, n1 * sizeof(int));
        if (num2 == NULL)
        {
            perror("Memory reallocation failed for num2\n");
            exit(0);
        }
        for (int i = 0; i < n1; i++)
        {
            num2[i] = temp[i];
        }
        // copy the temp into num2
        *n_2 = n1;
        *num2_base = num2;
        free(temp);
    }
    else if (n2 > n1)
    {
        // printf("Num2 is greater\n");
        int *temp = (int *)calloc(n2, sizeof(int));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }

        // copy from the LSB to MSB of num1 into temp
        for (int i = n1 - 1; i >= 0; i--)
        {
            // printf("Copying %d into temp index of %d\n", num1[i], i + n2 - n1);
            temp[i + n2 - n1] = num1[i];
        }
        // fill the remaining MSB with zeroes in temp
        for (int i = 0; i < n2 - n1; i++)
        {
            temp[i] = 0;
        }
        // reallocate space for num1 using realloc
        num1 = (int *)realloc(num1, n2 * sizeof(int));
        if (num1 == NULL)
        {
            perror("Memory reallocation failed for num1\n");
            exit(0);
        }
        // copy the temp into num1
        for (int i = 0; i < n2; i++)
        {
            num1[i] = temp[i];
        }
        *n_1 = n2;
        *num1_base = num1;
        free(temp);
    }
}

char *generateRandomNumber(int seed)
{
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
    char *resultString = mpz_get_str(NULL, 10, random_number);

    // Clean up
    mpz_clear(random_number);
    gmp_randclear(state);

    return resultString;
}

void generate_seed()
{
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

int *remove_leading_zeros(int *number, int *length)
{
    int i = 0;
    while (i < *length && number[i] == 0)
    {
        i++;
    }
    *length = *length - i;
    return number + i;
}

// helper function to extract the most significant digits seperately for urdhva MSB
int *extract_MSB_digits(int *number, int length)
{
    int result_length = length;
    if (number[0] > 9)
    {
        // find the number of digits in the most significant digit
        int temp = number[0];
        while (temp > 9)
        {
            temp = temp / 10;
            result_length++;
        }
    }
    else
        return number;
    int *result = (int *)calloc(result_length, sizeof(int));
    // extract the most significant digits and store in result
    int i = result_length - length;
    while (number[0] > 0)
    {
        result[i--] = number[0] % 10;
        number[0] = number[0] / 10;
    }
    // Copy the remaining digits of number to result
    int j;
    for (i = result_length - length + 1, j = 1; j < length; j++, i++)
    {
        result[i] = number[j];
    }
    return result;
}

void main()
{
    // Initialize GMP variables
    mpz_t num1_gmp, num2_gmp, product_gmp;
    mpz_init(num1_gmp);
    mpz_init(num2_gmp);
    mpz_init(product_gmp);

    for (int iter = 0; iter < 1000; iter++)
    {
        // Generate two random numbers and convert them to integer arrays
        generate_seed();
        int randomNumber = (rand() % 100) + 1;
        char *randomString = generateRandomNumber(randomNumber);
        char *num1_str = randomString;
        generate_seed();
        randomNumber = (rand() % 100) + 1;
        randomString = generateRandomNumber(randomNumber);
        char *num2_str = randomString;
        int n1 = strlen(num1_str);
        int n2 = strlen(num2_str);
        int *num1 = (int *)calloc(n1, sizeof(int));
        int *num2 = (int *)calloc(n2, sizeof(int));
        for (int i = 0; i < n1; i++)
            num1[i] = num1_str[i] - '0';
        for (int i = 0; i < n2; i++)
            num2[i] = num2_str[i] - '0';

        // Make the two numbers equidistant
        make_equidistant(&num1, &num2, &n1, &n2);

        // Compute product using urdhva
        int n = (n1 > n2) ? n1 : n2;
        int *urdhva_product = urdhva(num1, num2, n);
        int urdhva_product_len = 2 * n - 1;

        // Compute product using GMP
        mpz_set_str(num1_gmp, num1_str, 10);
        mpz_set_str(num2_gmp, num2_str, 10);
        mpz_mul(product_gmp, num1_gmp, num2_gmp);
        char *gmp_product_str = mpz_get_str(NULL, 10, product_gmp);
        int gmp_product_len = strlen(gmp_product_str);
        int *gmp_product = (int *)calloc(gmp_product_len, sizeof(int));
        for (int i = 0; i < gmp_product_len; i++)
            gmp_product[i] = gmp_product_str[i] - '0';
        urdhva_product = extract_MSB_digits(urdhva_product, urdhva_product_len);
        urdhva_product = remove_leading_zeros(urdhva_product, &urdhva_product_len);
        gmp_product = remove_leading_zeros(gmp_product, &gmp_product_len);
        for (int i = 0; i < urdhva_product_len; i++)
        {
            if (urdhva_product[i] != gmp_product[i])
            {
                printf("Not matching for index %d, value at urdhva: %d, value at gmp: %d\n", i, urdhva_product[i], gmp_product[i]);
                printf("urdhva_product: ");
                for (int i = 0; i < urdhva_product_len; i++)
                    printf("%d", urdhva_product[i]);
                printf("\n");
                printf("gmp_product: \n");
                for (int i = 0; i < gmp_product_len; i++)
                    printf("%d", gmp_product[i]);
                printf("\n");
                printf("ABORT!, result does not match\n");
                break;
            }
        }
        printf("PASS: %d\n", iter);

        // // Clean up
        // free(num1);
        // free(num2);
        // free(urdhva_product);
        // free(gmp_product);
        // free(num1_str);
        // free(num2_str);
        // free(gmp_product_str);
    }

    // Clean up GMP variables
    mpz_clear(num1_gmp);
    mpz_clear(num2_gmp);
    mpz_clear(product_gmp);
}
