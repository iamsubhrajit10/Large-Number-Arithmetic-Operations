#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <immintrin.h>
#include <time.h>
#include <stdbool.h>

static uint32_t LIMB_DIGITS = 10;
__m512i limb_digits, zeros;

bool is_less_than(uint32_t *a, uint32_t *b, uint32_t n)
{
    for (uint32_t i = 0; i < n; i++)
    {
        if (a[i] < b[i])
        {
            return true;
        }
        else if (a[i] > b[i])
        {
            return false;
        }
    }
    return false;
}

int sub(uint32_t *a, uint32_t *b, uint32_t *result, uint32_t n)
{
    bool is_less = is_less_than(a, b, n);
    int sign = 1;
    if (is_less)
    {
        // swap a and b
        uint32_t *temp = a;
        a = b;
        b = temp;
        sign = -1;
    }
    uint32_t *borrow_array = (uint32_t *)malloc(2 * n * sizeof(uint32_t));
    __m512i a_vec, b_vec, result_vec;
    for (uint32_t i = 0; i < n; i += 16)
    {
        // load 16 elements from a and b
        a_vec = _mm512_loadu_si512(a + i);
        b_vec = _mm512_loadu_si512(b + i);
        // subtract a and b
        result_vec = _mm512_sub_epi32(a_vec, b_vec);

        // if result_vec[j] < 0, set borrow mask to 1
        __mmask16 borrow_mask = _mm512_cmplt_epi32_mask(result_vec, zeros);

        // based on borrow mask, result_vec[j] = limb_digits + result_vec[j]
        result_vec = _mm512_mask_add_epi32(result_vec, borrow_mask, result_vec, limb_digits);

        __m512i borrow = _mm512_maskz_set1_epi32(borrow_mask, 1);

        // store the borrow
        _mm512_storeu_si512(borrow_array + i, borrow);

        // store the result
        _mm512_storeu_si512(result + i, result_vec);
    }

    // left shift the borrow array by 1
    borrow_array = borrow_array + 1;
    borrow_array[n - 1] = 0;
    int i;
    int last_pos = 0;
    for (i = 0; i < n; i += 16)
    {
        __m512i borrow_vec = _mm512_loadu_si512(borrow_array + i);
        __m512i result_vec = _mm512_loadu_si512(result + i);
        result_vec = _mm512_sub_epi32(result_vec, borrow_vec);

        // check if result_vec[j] < 0
        __mmask16 borrow_mask = _mm512_cmplt_epi32_mask(result_vec, zeros);
        if (borrow_mask != 0)
        {
            last_pos = i;
        }

        // generate borrow_vec
        borrow_vec = _mm512_maskz_set1_epi32(borrow_mask, 1);

        // update the borrow array
        _mm512_storeu_si512(borrow_array + i, borrow_vec);

        _mm512_storeu_si512(result + i, result_vec);
    }

    i = (last_pos + 16);
    i = (i > n) ? (n - 1) : i;
    for (; i >= 0; i--)
    {
        if (borrow_array[i] > 0 && result[i] > LIMB_DIGITS)
        {
            result[i] = result[i] + LIMB_DIGITS;
            result[i - 1] = result[i - 1] - 1;
            borrow_array[i - 1] = 1;
        }
    }

    if (sign == -1)
    {
        int i = 0;
        while (result[i] == 0)
        {
            i++;
        }
        result[i] = -result[i];
    }
    return sign;
}
int main()
{
    uint32_t n = 39;
    uint32_t *a = (uint32_t *)malloc(2 * n * sizeof(uint32_t));
    uint32_t *b = (uint32_t *)malloc(2 * n * sizeof(uint32_t));
    uint32_t *result = (uint32_t *)malloc(2 * n * sizeof(uint32_t));
    limb_digits = _mm512_set1_epi32(LIMB_DIGITS);
    zeros = _mm512_set1_epi32(0);

    // Seed the random number generator
    srand(time(NULL));

    for (uint32_t i = 0; i < n; i++)
    {
        a[i] = rand() % LIMB_DIGITS; // Randomly initialize a[i]
        b[i] = rand() % LIMB_DIGITS; // Randomly initialize b[i]
    }
    printf("A: ");
    for (uint32_t i = 0; i < n; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
    printf("B: ");
    for (uint32_t i = 0; i < n; i++)
    {
        printf("%d ", b[i]);
    }
    printf("\n");

    int result_sign = sub(a, b, result, n);

    printf("Result: ");
    for (uint32_t i = 0; i < n; i++)
    {
        printf("%d ", result[i]);
    }
    printf("\n");
    // free(a);
    // free(b);
    // free(result);
    return 0;
}