#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <gmp.h>
#include <inttypes.h>
#include <stdbool.h>
#include <immintrin.h>
#include "myutils.h"
#define UNLIKELY(expr) __builtin_expect(!!(expr), 0)
#define LIKELY(expr) __builtin_expect(!!(expr), 1)

inline void multiply_AVX(__uint64_t *num1, __uint64_t *num2, __uint64_t *res) __attribute__((always_inline));

inline __uint128_t custom_add(__uint64_t a_high, __uint64_t a_low, __uint64_t b_high, __uint64_t b_low, int *carry) __attribute__((always_inline));
inline void add_limbs(int n, int max_idx, __uint64_t *result) __attribute__((always_inline));
inline __uint64_t *adjust_limbs(int n, __uint64_t *result) __attribute__((always_inline));
inline void remove_intermediary_zeros(int n, __uint64_t *result) __attribute__((always_inline));
void print_array(__uint64_t *arr, int n);

inline void multiply_AVX(__uint64_t *num1, __uint64_t *num2, __uint64_t *res)
{
    // extract 32-bit numbers from num2
    int num2_first = num2[0] >> 32;
    int num2_second = num2[0] & 0xFFFFFFFF;
    int num2_third = num2[1] >> 32;
    int num2_fourth = num2[1] & 0xFFFFFFFF;
    int num2_fifth = num2[2] >> 32;
    int num2_sixth = num2[2] & 0xFFFFFFFF;
    int num2_seventh = num2[3] >> 32;
    int num2_eighth = num2[3] & 0xFFFFFFFF;

    // load num2 into a vector
    __m512i b_vec = _mm512_set_epi32(0, num2_eighth, 0, num2_seventh, 0, num2_sixth, 0, num2_fifth, 0, num2_fourth, 0, num2_third, 0, num2_second, 0, num2_first);
    int first = (num1[0] >> 32);
    int second = (num1[0] & 0xFFFFFFFF);
    int third = (num1[1] >> 32);
    int fourth = (num1[1] & 0xFFFFFFFF);
    int fifth = (num1[2] >> 32);
    int sixth = (num1[2] & 0xFFFFFFFF);
    int seventh = (num1[3] >> 32);
    int eighth = (num1[3] & 0xFFFFFFFF);

    __m512i a_vec_1 = _mm512_set_epi32(0, first, 0, first, 0, first, 0, first, 0, first, 0, first, 0, first, 0, first);
    __m512i res_1 = _mm512_mullo_epi64(a_vec_1, b_vec);
    _mm512_store_epi64(res, res_1);

    __m512i a_vec_2 = _mm512_set_epi32(0, second, 0, second, 0, second, 0, second, 0, second, 0, second, 0, second, 0, second);
    __m512i res_2 = _mm512_mullo_epi64(a_vec_2, b_vec);
    _mm512_store_epi64(res + 8, res_2);

    __m512i a_vec_3 = _mm512_set_epi32(0, third, 0, third, 0, third, 0, third, 0, third, 0, third, 0, third, 0, third);
    __m512i res_3 = _mm512_mullo_epi64(a_vec_3, b_vec);
    _mm512_store_epi64(res + 16, res_3);

    __m512i a_vec_4 = _mm512_set_epi32(0, fourth, 0, fourth, 0, fourth, 0, fourth, 0, fourth, 0, fourth, 0, fourth, 0, fourth);
    __m512i res_4 = _mm512_mullo_epi64(a_vec_4, b_vec);
    _mm512_store_epi64(res + 24, res_4);

    __m512i a_vec_5 = _mm512_set_epi32(0, fifth, 0, fifth, 0, fifth, 0, fifth, 0, fifth, 0, fifth, 0, fifth, 0, fifth);
    __m512i res_5 = _mm512_mullo_epi64(a_vec_5, b_vec);
    _mm512_store_epi64(res + 32, res_5);

    __m512i a_vec_6 = _mm512_set_epi32(0, sixth, 0, sixth, 0, sixth, 0, sixth, 0, sixth, 0, sixth, 0, sixth, 0, sixth);
    __m512i res_6 = _mm512_mullo_epi64(a_vec_6, b_vec);
    _mm512_store_epi64(res + 40, res_6);

    __m512i a_vec_7 = _mm512_set_epi32(0, seventh, 0, seventh, 0, seventh, 0, seventh, 0, seventh, 0, seventh, 0, seventh, 0, seventh);
    __m512i res_7 = _mm512_mullo_epi64(a_vec_7, b_vec);
    _mm512_store_epi64(res + 48, res_7);

    __m512i a_vec_8 = _mm512_set_epi32(0, eighth, 0, eighth, 0, eighth, 0, eighth, 0, eighth, 0, eighth, 0, eighth, 0, eighth);
    __m512i res_8 = _mm512_mullo_epi64(a_vec_8, b_vec);
    _mm512_store_epi64(res + 56, res_8);
}

inline __uint128_t custom_add(__uint64_t a_high, __uint64_t a_low, __uint64_t b_high, __uint64_t b_low, int *carry)
{
    // Combine low parts and carry
    __uint128_t r = (__uint128_t)((__uint128_t)a_low + (__uint128_t)b_low + *carry);

    *carry = ((__uint128_t)r) >> 64; // Extract carry for the next addition

    r &= 0xFFFFFFFFFFFFFFFF; // Mask to keep only the lower 64 bits

    // Combine high parts and carry
    __uint128_t q = (__uint128_t)((__uint128_t)a_high + (__uint128_t)b_high + *carry);

    *carry = ((__uint128_t)q) >> 64; // Extract carry for the next addition

    q &= 0xFFFFFFFFFFFFFFFF; // Mask to keep only the lower 64 bits

    return (__uint128_t)((q << 64) | r);
}

inline void add_limbs(int n, int max_idx, __uint64_t *result)
{
    int add_count = 1, adds = 1;
    int thresh = n - 1;
    int start = 2, end = 4;
    int k = 2;
    while (end + 2 < max_idx)
    {
        __uint128_t r = (__uint128_t)((((__uint128_t)result[start]) << 64) | (result[start + 1]));
        int i = start + 2;
        int m = 0;
        while (m < adds)
        {
            __uint64_t a_high = (r >> 64);
            __uint64_t a_low = r;
            int carry = 0;
            r = custom_add(a_high, a_low, result[i], result[i + 1], &carry);
            if ((UNLIKELY(carry)))
            {
                result[k - 2]++;
                if (result[k - 2] == 0)
                {
                    result[k - 4]++;
                }
            }
            i += 2;
            m++;
        }
        result[k] = r >> 64;
        result[k + 1] = r;
        k += 2;
        start = i;
        add_count++;
        if (add_count > thresh)
        {
            adds--;
        }
        else
        {
            adds++;
        }
        end = start + (adds << 1);
    }
    result[k] = result[end];
    result[k + 1] = result[end + 1];
}

inline __uint64_t *adjust_limbs(int n, __uint64_t *result)
{
    int first = n - 2;
    int second = n - 1;
    int ptr = n - 1;
    while (first > 0)
    {
        __uint128_t r = (__uint128_t)((__uint128_t)result[first] + (__uint128_t)result[second]);
        if (UNLIKELY(r > 0xFFFFFFFFFFFFFFFF))
        {
            // printf("Carry is not zero\n");
            result[first - 1]++;
            if (result[first - 1] == 0)
            {
                result[first - 3]++;
            }
            r = r & 0xFFFFFFFFFFFFFFFF;
        }
        result[ptr] = r;
        first -= 2;
        second -= 2;
        ptr--;
    }
    if (first < 0)
    {
        result[ptr] = result[second];
    }
    // modify the result to point to result[ptr] while returning
    result = result + ptr;
    return result;
}

// inline void remove_intermediary_zeros(int n, __uint64_t *result)
// {
//     __uint64_t *src = result;
//     __uint64_t *dst = result;

//     for (int i = 0; i < n; i += 4)
//     {
//         *dst++ = *src++;
//         *dst++ = *src++;
//         src += 2; // Skip the next two elements
//     }
// }

inline void remove_intermediary_zeros(int n, __uint64_t *result)
{
    __uint64_t *src = result;
    __uint64_t *dst = result;
    int i = 0;

    // Process 8 elements (2 iterations of the original loop) at a time
    for (; i <= n - 8; i += 8)
    {
        __m128i data1 = _mm_load_si128((__m128i *)src);       // Load first 2 × 64-bit elements
        __m128i data2 = _mm_load_si128((__m128i *)(src + 4)); // Load next valid 2 × 64-bit elements (skip middle 2)

        _mm_store_si128((__m128i *)dst, data1);       // Store first 2 elements
        _mm_store_si128((__m128i *)(dst + 2), data2); // Store next 2 elements

        dst += 4; // Move to the next store position
        src += 8; // Skip 2 extra elements per iteration
    }

    // Handle any remaining elements (4 at max)
    for (; i < n; i += 4)
    {
        __m128i data = _mm_load_si128((__m128i *)src);
        _mm_store_si128((__m128i *)dst, data);

        dst += 2;
        src += 4;
    }
}

void print_array(__uint64_t *arr, int n)
{
    for (int i = 0; i < n; i++)
    {
        // Use PRIx64 macro to ensure portability
        printf("%016" PRIx64 " ", arr[i]);
    }
    printf("\n");
}

// void rearrange(__uint64_t *arr){
//     // rearrange the array according to this mapping:
//     //Mapping:
//     // 0 -> 1
//     // 1 -> 1
//     // 2 -> 3
//     // 3 -> 6
//     // 4 -> 10
//     // 5 -> 15
//     // 6 -> 21
//     // 7 -> 28
//     // 8 -> 2
//     // 9 -> 4
//     // 10 -> 7
//     // 11 -> 11
//     // 12 -> 16
//     // 13 -> 22
//     // 14 -> 29
//     // 15 -> 36
//     // 16 -> 5
//     // 17 -> 8
//     // 18 -> 12
//     // 19 -> 17
//     // 20 -> 23
//     // 21 -> 30
//     // 22 -> 37
//     // 23 -> 43
//     // 24 -> 9
//     // 25 -> 13
//     // 26 -> 18
//     // 27 -> 24
//     // 28 -> 31
//     // 29 -> 38
//     // 30 -> 44
//     // 31 -> 49
//     // 32 -> 14
//     // 33 -> 19
//     // 34 -> 25
//     // 35 -> 32
//     // 36 -> 39
//     // 37 -> 45
//     // 38 -> 50
//     // 39 -> 54
//     // 40 -> 20
//     // 41 -> 26
//     // 42 -> 33
//     // 43 -> 40
//     // 44 -> 46
//     // 45 -> 51
//     // 46 -> 55
//     // 47 -> 58
//     // 48 -> 27
//     // 49 -> 34
//     // 50 -> 41
//     // 51 -> 47
//     // 52 -> 52
//     // 53 -> 56
//     // 54 -> 59
//     // 55 -> 61
//     // 56 -> 35
//     // 57 -> 42
//     // 58 -> 48
//     // 59 -> 53
//     // 60 -> 57
//     // 61 -> 60
//     // 62 -> 62
//     // 63 -> 63
// }

static const uint8_t mapping[64] = {
    0, 1, 3, 6, 10, 15, 21, 28,
    2, 4, 7, 11, 16, 22, 29, 36,
    5, 8, 12, 17, 23, 30, 37, 43,
    9, 13, 18, 24, 31, 38, 44, 49,
    14, 19, 25, 32, 39, 45, 50, 54,
    20, 26, 33, 40, 46, 51, 55, 58,
    27, 34, 41, 47, 52, 56, 59, 61,
    35, 42, 48, 53, 57, 60, 62, 63};

void rearrange(uint64_t *restrict arr1, uint64_t *restrict arr2)
{
    arr1[0] = arr2[0];
    arr1[1] = arr2[1];
    arr1[3] = arr2[2];
    arr1[6] = arr2[3];
    arr1[10] = arr2[4];
    arr1[15] = arr2[5];
    arr1[21] = arr2[6];
    arr1[28] = arr2[7];

    arr1[2] = arr2[8];
    arr1[4] = arr2[9];
    arr1[7] = arr2[10];
    arr1[11] = arr2[11];
    arr1[16] = arr2[12];
    arr1[22] = arr2[13];
    arr1[29] = arr2[14];
    arr1[36] = arr2[15];

    arr1[5] = arr2[16];
    arr1[8] = arr2[17];
    arr1[12] = arr2[18];
    arr1[17] = arr2[19];
    arr1[23] = arr2[20];
    arr1[30] = arr2[21];
    arr1[37] = arr2[22];
    arr1[43] = arr2[23];

    arr1[9] = arr2[24];
    arr1[13] = arr2[25];
    arr1[18] = arr2[26];
    arr1[24] = arr2[27];
    arr1[31] = arr2[28];
    arr1[38] = arr2[29];
    arr1[44] = arr2[30];
    arr1[49] = arr2[31];

    arr1[14] = arr2[32];
    arr1[19] = arr2[33];
    arr1[25] = arr2[34];
    arr1[32] = arr2[35];
    arr1[39] = arr2[36];
    arr1[45] = arr2[37];
    arr1[50] = arr2[38];
    arr1[54] = arr2[39];

    arr1[20] = arr2[40];
    arr1[26] = arr2[41];
    arr1[33] = arr2[42];
    arr1[40] = arr2[43];
    arr1[46] = arr2[44];
    arr1[51] = arr2[45];
    arr1[55] = arr2[46];
    arr1[58] = arr2[47];

    arr1[27] = arr2[48];
    arr1[34] = arr2[49];
    arr1[41] = arr2[50];
    arr1[47] = arr2[51];
    arr1[52] = arr2[52];
    arr1[56] = arr2[53];
    arr1[59] = arr2[54];
    arr1[61] = arr2[55];

    arr1[35] = arr2[56];
    arr1[42] = arr2[57];
    arr1[48] = arr2[58];
    arr1[53] = arr2[59];
    arr1[57] = arr2[60];
    arr1[60] = arr2[61];
    arr1[62] = arr2[62];
    arr1[63] = arr2[63];
}

// void rearrange(uint64_t *arr1, uint64_t *arr2)
// {
//     for (int i = 0; i < 64; i += 8)
//     {
//         arr1[i] = arr2[mapping[i]];
//         arr1[i + 1] = arr2[mapping[i + 1]];
//         arr1[i + 2] = arr2[mapping[i + 2]];
//         arr1[i + 3] = arr2[mapping[i + 3]];
//         arr1[i + 4] = arr2[mapping[i + 4]];
//         arr1[i + 5] = arr2[mapping[i + 5]];
//         arr1[i + 6] = arr2[mapping[i + 6]];
//         arr1[i + 7] = arr2[mapping[i + 7]];
//     }
// }

__uint64_t *temp_result, *result;
__uint64_t *multiply_urdhva(__uint64_t *num1, __uint64_t *num2, int n)
{
    long long a = measure_rdtsc_start();
    multiply_AVX(num1, num2, temp_result);
    long long b = measure_rdtscp_end();
    printf("Time taken for AVX multiplication: %lld\n", b - a);

    print_array(temp_result, 64);

    a = measure_rdtsc_start();
    rearrange(result, temp_result);
    b = measure_rdtscp_end();

    print_array(result, 64);
    printf("Time taken for rearranging: %lld\n", b - a);

    return result;
}

void generate_random_numbers(__uint64_t *num, int n)
{
    for (int i = 0; i < n; i++)
    {
        num[i] = ((uint64_t)rand() << 32) | rand();
    }
}

void test()
{
    for (int test_case = 0; test_case < 1; test_case++)
    {

        int n = 4; // till 16*64 = 1024 bits the AVX multiplication is at least 2x faster than GMP; we need reduce the other utility functions for overall beating GMP
        // best performance is achieved: n = 4; 256 bits
        printf("Number of limbs: %d\n", n);
        printf("Number of bits: %d\n", n * 64);
        __uint64_t *num1 = (__uint64_t *)malloc(n * sizeof(__uint64_t));
        __uint64_t *num2 = (__uint64_t *)malloc(n * sizeof(__uint64_t));
        char *result_str = (char *)malloc(2 * n * 64 + 1);
        memset(result_str, 0, 2 * n * sizeof(char));
        // Check the result with GMP
        mpz_t gmp_num1, gmp_num2, gmp_result, gmp_expected_result;
        mpz_init(gmp_num1);
        mpz_init(gmp_num2);
        mpz_init(gmp_result);
        mpz_init(gmp_expected_result);
        int max_idx = (n * n) << 2;

        result = (__uint64_t *)_mm_malloc(max_idx * sizeof(__uint64_t), 64);
        temp_result = (__uint64_t *)_mm_malloc(max_idx * sizeof(__uint64_t), 64);

        srand(time(NULL));

        generate_random_numbers(num1, n);
        generate_random_numbers(num2, n);

        // Convert num1 and num2 to GMP integers
        for (int i = 0; i < n; i++)
        {
            // Shift gmp_num1 left by 64 bits (equivalent to multiplying by 2^64)
            mpz_mul_2exp(gmp_num1, gmp_num1, 64);
            // Add the current element of num1 to gmp_num1
            mpz_add_ui(gmp_num1, gmp_num1, num1[i]);

            // Shift gmp_num2 left by 64 bits (equivalent to multiplying by 2^64)
            mpz_mul_2exp(gmp_num2, gmp_num2, 64);
            // Add the current element of num2 to gmp_num2
            mpz_add_ui(gmp_num2, gmp_num2, num2[i]);
        }

        printf("*** Test Case %d ***\n", test_case + 1);

        memset(result, 0, max_idx * sizeof(__uint64_t));
        memset(temp_result, 0, max_idx * sizeof(__uint64_t));

        printf("num1: ");
        print_array(num1, n);
        printf("num2: ");
        print_array(num2, n);

        double t;
        // TIME_RUSAGE(t, multiply_urdhva(num1, num2, n));
        // printf("Time taken for Urdhva Tiryakbhyam: %f\n", t);

        // Call multiply_urdhva
        __uint64_t *res = multiply_urdhva(num1, num2, n);

        // convert the result to a string using snprintf
        int idx = 0;
        for (int i = 0; i < 2 * n; i++)
        {
            idx += snprintf(result_str + idx, 17, "%016" PRIx64, res[i]);
        }
        result_str[idx] = '\0';
        // omit leading zeros
        while (*result_str == '0')
        {
            result_str++;
        }
        // printf("result_str:          %s\n", result_str);

        // double t;
        TIME_RUSAGE(t, mpz_mul(gmp_expected_result, gmp_num1, gmp_num2));
        printf("Time taken for GMP multiplication: %f\n", t);

        // Perform multiplication with GMP
        mpz_mul(gmp_expected_result, gmp_num1, gmp_num2);

        // Convert the result to a string
        char *expected_result_str = mpz_get_str(NULL, 16, gmp_expected_result);

        bool flag = true;
        // compare the result with the expected result
        for (int i = 0; i < strlen(expected_result_str); i++)
        {
            if (expected_result_str[i] != result_str[i])
            {
                printf("i: %d, expected: %c, result: %c\n", i, expected_result_str[i], result_str[i]);
                flag = false;
                break;
            }
        }
        printf("Test %s\n", flag ? "passed" : "failed");

        // free(num1);
        // free(num2);
        // free(result_str);
    }
}

int main()
{
    test();
    return 0;
}