#include <immintrin.h>
#include <stdint.h>
#include <stddef.h>
#include <stdio.h>

#include <immintrin.h>
#include <stdint.h>
#include <math.h>
#define LIMB_SIZE 5
#define LIMB_DIGITS 100000
uint64_t returnArraySum(uint32_t *array, int length)
{
    __m512i vsum = _mm512_setzero_si512(); // Initialize the vector sum to zero
    int i = 0;

    // Process chunks of 16 elements at a time
    for (; i + 16 <= length; i += 16)
    {
        __m512i vdata = _mm512_loadu_si512((__m512i *)(array + i));
        vsum = _mm512_add_epi32(vsum, vdata);
    }

    // Extract elements from the vector sum and accumulate them in a 64-bit integer
    uint32_t temp[16];
    _mm512_storeu_si512((__m512i *)temp, vsum);

    uint64_t sum = 0;
    for (int j = 0; j < 16; ++j)
    {
        sum += temp[j];
    }

    // Sum any remaining elements
    for (; i < length; ++i)
    {
        sum += array[i];
    }

    return sum;
}

void mul_int_array_avx512(uint32_t *a, uint32_t *b, uint64_t *result)
{
    // Load 32-bit integers into __m512i vectors
    __m512i va = _mm512_loadu_si512((__m512i *)(a));
    __m512i vb = _mm512_loadu_si512((__m512i *)(b));

    // Since _mm512_mul_epu32 multiplies even elements from 'a' with odd elements from 'b',
    // and considering the input vectors are not prepared for this kind of operation,
    // we might need to adjust the operation or prepare the data accordingly.
    // For simplicity, let's assume 'a' and 'b' are prepared for this operation.

    // Multiply and get 64-bit results
    __m512i vresult = _mm512_mul_epu32(va, vb);

    // Store the 64-bit result
    _mm512_storeu_si512((__m512i *)(result), vresult);
}

char *formatUrdhvaResult(uint32_t *result, int result_length)
{
    char *result_str = (char *)calloc(result_length * 11 + 1, sizeof(char)); // 10 digits + null terminator per number
    if (result_str == NULL)
    {
        perror("Memory allocation failed for result_str\n");
        exit(EXIT_FAILURE);
    }

    char *temp_ptr = result_str; // Use a temporary pointer to append to the string
    for (int i = 0; i < result_length; i++)
    {
        if (i == 0 && result[i] == 0)
        {
            continue;
        }
        else if (i != 0 && result[i] < 1000)
        {
            // Append '0' before the number if it's less than 1000 and not the first element
            int num_zeros = 0;
            // if (result[i] < 10)
            // {
            //     num_zeros = 3;
            // }
            // else if (result[i] < 100)
            // {
            //     num_zeros = 2;
            // }
            // else
            // {
            //     num_zeros = 1;
            // }
            int temp = result[i];
            int threshold = LIMB_DIGITS / 10;
            while (threshold > 9 && temp < threshold)
            {
                num_zeros++;
                threshold /= 10;
            }

            for (int j = 0; j < num_zeros; j++)
            {
                temp_ptr += sprintf(temp_ptr, "0");
            }
            temp_ptr += sprintf(temp_ptr, "%u", result[i]);
        }
        else
        {
            // Use sprintf to append each number to the string normally
            temp_ptr += sprintf(temp_ptr, "%u", result[i]);
        }
    }
    // remove leading zeros
    int i = 0;
    while (result_str[i] == '0')
    {
        i++;
    }
    if (i == result_length * 11)
    {
        i--;
    }
    char *result_str_no_leading_zeros = result_str + i;
    return result_str_no_leading_zeros;
}

// This function, given a number represented as an array of digits, groups 4 digits together and returns the number of groups
// Starts grouping from the least significant digit, and also appends zeros to the number if the number of digits is not a multiple of 4
uint32_t *returnLimbs(uint32_t *number, int *length)
{
    uint32_t *limbs __attribute__((aligned(64)));
    int n = *length;
    int num_limbs = n / LIMB_SIZE;
    int multiple = (n % LIMB_SIZE == 0) ? 0 : 1;
    if (multiple)
    {
        num_limbs++;
    }
    limbs = (uint32_t *)_mm_malloc(num_limbs * sizeof(uint32_t), 64);
    if (limbs == NULL)
    {
        printf("Memory could not be allocated for limbs\n");
        exit(1);
    }
    int i = n - 1;
    int j = 0;
    int k = num_limbs - 1;
    while (i >= 0)
    {
        uint32_t limb = 0;
        for (j = i; j > i - LIMB_SIZE && j >= 0; j--)
        {
            limb += number[j] * (pow(10, i - j));
        }
        limbs[k] = limb;
        k--;
        i = j;
    }
    *length = num_limbs;
    return limbs;
}

int main()
{
    uint32_t array[33] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
                          17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33};
    uint64_t sum = returnArraySum(array, 33);
    printf("Sum: %lu\n", sum);

    uint32_t a[16] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
    uint32_t b[16] = {16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1};

    uint64_t result[16];
    mul_int_array_avx512(a, b, result);
    for (int i = 0; i < 16; i++)
    {
        printf("%lu ", result[i]);
    }

    uint32_t number[33] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5,
                           6, 7, 8, 0, 0, 0, 2, 3, 4, 5, 6, 7, 8,
                           0, 0, 1, 2, 3};
    int length = 33;
    uint32_t *limbs = returnLimbs(number, &length);
    for (int i = 0; i < length; i++)
    {
        printf("%u ", limbs[i]);
    }
    printf("\n");

    char *result_str = formatUrdhvaResult(limbs, length);
    printf("Result: %s\n", result_str);

    return 0;
}
