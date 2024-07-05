#include <stdio.h>
#include <immintrin.h>
#include <stdint.h>

void mul_int_array_avx512(uint32_t *a, uint32_t *b, uint32_t *result, int iterations, int remainder)
{
    const __m512i permute_index = _mm512_setr_epi32(15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0);

    for (int i = 0; i < iterations; i++)
    {
        __m512i va = _mm512_loadu_si512((__m512i *)(a + i * 16));
        __m512i vb = _mm512_loadu_si512((__m512i *)(b + i * 16));
        vb = _mm512_permutexvar_epi32(permute_index, vb);
        __m512i vresult = _mm512_mullo_epi32(va, vb);
        _mm512_storeu_si512((__m512i *)(result + i * 16), vresult);
    }

    if (remainder > 0)
    {
        __mmask16 mask = (1 << remainder) - 1;
        __m512i va = _mm512_maskz_loadu_epi32(mask, a + iterations * 16);
        __m512i vb = _mm512_maskz_loadu_epi32(mask, b + iterations * 16);
        vb = _mm512_mask_permutexvar_epi32(mask, permute_index, vb);
        __m512i vresult = _mm512_maskz_mullo_epi32(mask, va, vb);
        _mm512_mask_storeu_epi32((result + iterations * 16), mask, vresult);
    }
}

int main()
{
    uint32_t a[48] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
                      17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
                      33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48};
    uint32_t b[48] = {48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33,
                      32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17,
                      16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    uint32_t result[48] = {0};

    int iterations = 48 / 16;
    int remainder = 48 % 16;

    mul_int_array_avx512(a, b, result, iterations, remainder);

    for (size_t i = 0; i < 48; i++)
    {
        printf("result[%zu] = %u\n", i, result[i]);
    }

    return 0;
}
