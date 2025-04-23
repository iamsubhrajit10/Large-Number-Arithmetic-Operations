#include <immintrin.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <inttypes.h>
#include <string.h>

// Define the SIMD constants
__m512i zeros;

__m512i shift_right_1_bit(__m512i data)
{
    __m512i shifted_right_1 = _mm512_srli_epi64(data, 1);
    __m512i aligned_elements = _mm512_alignr_epi64(data, zeros, 7);
    __m512i shifted_left_63 = _mm512_slli_epi64(aligned_elements, 63);
    __m512i result = _mm512_or_si512(shifted_right_1, shifted_left_63);
    return result;
}

void shift_right_1_avx(__mmask8 *data_array, int size)
{
    // size -> number of 8-bit values
    // AVX registers can operate on 512-bit data at a time. So, we need to process 64 8-bit values at a time.
    int avx_size = size / 64;
    __m512i data_array_512[avx_size];
    for (int i = 0; i < avx_size; i++)
    {
        uint8_t *val = (uint8_t *)&data_array[i * 64];
        data_array_512[i] = _mm512_loadu_epi8(val);
    }

    // Initialize carry as zeros
    __m512i carry = zeros;
    uint8_t lsb_array[avx_size];
    // Process all data with the shift right by 1 bit with carry propagation
    for (int i = 0; i < avx_size; i++)
    {
        // extract lsb of of data_array[i*8 + 7]
        // uint64_t lsb = data_array[i * 64 + 7] & 0x1;
        uint8_t lsb = data_array[i * 64 + 63] & 0x1;
        lsb_array[i] = lsb;
        data_array_512[i] = shift_right_1_bit(data_array_512[i]);
    }

    // Convert __m512i array back to __mmask8 array
    for (int i = 0; i < avx_size; i++)
    {
        uint8_t *val = (uint8_t *)&data_array[i * 64];
        printf("\nLoaded data: \n");
        for (int j = 0; j < 64; j++)
        {
            printf("%02x ", val[j]);
        }
        _mm512_storeu_epi8(val, data_array_512[i]);
        printf("\nStored data: \n");
        for (int j = 0; j < 64; j++)
        {
            printf("%02x ", val[j]);
        }
        if (i > 0 && lsb_array[i - 1] == 1)
        {
            printf("\nCarry propagated for index %d\n", i);
            val[0] |= 0x80;
            printf("After: %02x\n", val[0]);
        }
    }
}

void naive_shift_right_1(__mmask8 *data_array, int size)
{
    __mmask8 carry_prev = 0;

    for (int i = 0; i < size; i++)
    {
        __mmask8 carry_next = data_array[i] & 0x1;
        data_array[i] = (data_array[i] >> 1) | carry_prev;
        carry_prev = carry_next << 7;
    }
}

int main()
{
    zeros = _mm512_setzero_si512(); // Initialize zeros as a chunk of 8 64-bit integers

    // Initialize a 4096-bit data stored in a contiguous __mmask8 array
    __mmask8 *data_array = (__mmask8 *)malloc(512 * sizeof(__mmask8));
    srand(time(NULL));
    printf("Data:\n");
    for (int i = 0; i < 512; i++)
    {
        data_array[i] = rand() % 256; // Randomly initialize each 8-bit value
        printf("%02x ", data_array[i]);
    }

    // Prepare two copies of data_array
    __mmask8 *data_array_copy1 = (__mmask8 *)malloc(512 * sizeof(__mmask8));
    __mmask8 *data_array_copy2 = (__mmask8 *)malloc(512 * sizeof(__mmask8));
    for (int i = 0; i < 512; i++)
    {
        data_array_copy1[i] = data_array[i];
        data_array_copy2[i] = data_array[i];
    }

    // Naive version shifting
    naive_shift_right_1(data_array_copy1, 512);

    // AVX version shifting
    shift_right_1_avx(data_array_copy2, 512);

    printf("\nNaive result:\n");
    for (int i = 0; i < 512; i++)
    {
        printf("%02x ", data_array_copy1[i]);
    }

    printf("\nAVX result:\n");
    for (int i = 0; i < 512; i++)
    {
        printf("%02x ", data_array_copy2[i]);
    }

    // Compare each 64-bit value as a string
    int match = 1;
    for (int i = 0; i < 512; i++)
    {
        if (data_array_copy1[i] != data_array_copy2[i])
        {
            printf("Mismatch at index %d: %02x vs %02x\n", i, data_array_copy1[i], data_array_copy2[i]);
            match = 0;
            break;
        }
    }

    if (match)
    {
        printf("The naive and AVX versions produce the same result.\n");
    }
    else
    {
        printf("There are mismatches between the naive and AVX versions.\n");
    }

    // Free allocated memory
    free(data_array);
    free(data_array_copy1);
    free(data_array_copy2);

    return 0;
}