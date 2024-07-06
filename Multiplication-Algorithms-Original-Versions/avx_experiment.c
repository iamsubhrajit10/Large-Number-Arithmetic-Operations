#include <immintrin.h>
#include <stdint.h>
#include <stddef.h>
#include <stdio.h>

#include <immintrin.h>
#include <stdint.h>

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

int main()
{
    uint32_t array[33] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
                          17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33};
    uint64_t sum = returnArraySum(array, 33);
    printf("Sum: %lu\n", sum);
    return 0;
}
