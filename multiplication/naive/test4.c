/*
    Author: Subhrajit
    Urdhva Tiryakbhyam: A fast AVX multiplication algorithm for 256-bit numbers to be utilized as base case in Karatsuba and other recursive algorithms
    The algorithm is based on the ancient Indian Vedic mathematics sutra

    This is a testing file for the Urdhva Tiryakbhyam algorithm
    The algorithm is tested against GMP's multiplication function

    Assumptions: it does not take in account the preparation of the numbers to be multiplied and read using AVX instructions
    The numbers are assumed to be already prepared and stored in the arrangement order needed for the algorithm

    Current speedup: 10%
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <gmp.h>
#include <inttypes.h>
#include <stdbool.h>
#include <immintrin.h>
#include <mm_malloc.h>
#include <omp.h>
#include "myutils.h"
#include "perf_utils.h"

// Function declarations

void accumulate_multiply_AVX(uint32_t *num1, uint32_t *num2, uint64_t *__restrict res)
{

    // Load and convert in cache-friendly 64-byte chunks
    __m512i base_1 = _mm512_cvtepu32_epi64(_mm256_load_si256((__m256i *)num1));
    __m512i base_2 = _mm512_cvtepu32_epi64(_mm256_load_si256((__m256i *)num2));

    // Group 1
    __m512i perm_idx_11 = _mm512_set_epi64(1, 0, 2, 1, 0, 1, 0, 0);
    __m512i a_vec_1 = _mm512_permutexvar_epi64(perm_idx_11, base_1);
    __m512i perm_idx_21 = _mm512_set_epi64(2, 3, 0, 1, 2, 0, 1, 0);
    __m512i b_vec_1 = _mm512_permutexvar_epi64(perm_idx_21, base_2);
    __m512i res_1 = _mm512_mul_epu32(a_vec_1, b_vec_1);
    _mm512_store_si512(res, res_1);

    // Group 2
    __m512i perm_idx_12 = _mm512_set_epi64(0, 4, 3, 2, 1, 0, 3, 2);
    __m512i a_vec_2 = _mm512_permutexvar_epi64(perm_idx_12, base_1);
    __m512i perm_idx_22 = _mm512_set_epi64(5, 0, 1, 2, 3, 4, 0, 1);
    __m512i b_vec_2 = _mm512_permutexvar_epi64(perm_idx_22, base_2);
    __m512i res_2 = _mm512_mul_epu32(a_vec_2, b_vec_2);
    _mm512_store_si512(res + 8, res_2);

    // Group 3
    __m512i perm_idx_13 = _mm512_set_epi64(2, 1, 0, 5, 4, 3, 2, 1);
    __m512i a_vec_3 = _mm512_permutexvar_epi64(perm_idx_13, base_1);
    __m512i perm_idx_23 = _mm512_set_epi64(4, 5, 6, 0, 1, 2, 3, 4);
    __m512i b_vec_3 = _mm512_permutexvar_epi64(perm_idx_23, base_2);
    __m512i res_3 = _mm512_mul_epu32(a_vec_3, b_vec_3);
    _mm512_store_si512(res + 16, res_3);

    // Group 4
    __m512i perm_idx_14 = _mm512_set_epi64(3, 2, 1, 0, 6, 5, 4, 3);
    __m512i a_vec_4 = _mm512_permutexvar_epi64(perm_idx_14, base_1);
    __m512i perm_idx_24 = _mm512_set_epi64(4, 5, 6, 7, 0, 1, 2, 3);
    __m512i b_vec_4 = _mm512_permutexvar_epi64(perm_idx_24, base_2);
    __m512i res_4 = _mm512_mul_epu32(a_vec_4, b_vec_4);
    _mm512_store_si512(res + 24, res_4);

    // Group 5
    __m512i perm_idx_15 = _mm512_set_epi64(4, 3, 2, 1, 7, 6, 5, 4);
    __m512i a_vec_5 = _mm512_permutexvar_epi64(perm_idx_15, base_1);
    __m512i perm_idx_25 = _mm512_set_epi64(4, 5, 6, 7, 0, 1, 2, 3);
    __m512i b_vec_5 = _mm512_permutexvar_epi64(perm_idx_25, base_2);
    __m512i res_5 = _mm512_mul_epu32(a_vec_5, b_vec_5);
    _mm512_store_si512(res + 32, res_5);

    // Group 6
    __m512i perm_idx_16 = _mm512_set_epi64(6, 5, 4, 3, 2, 7, 6, 5);
    __m512i a_vec_6 = _mm512_permutexvar_epi64(perm_idx_16, base_1);
    __m512i perm_idx_26 = _mm512_set_epi64(3, 4, 5, 6, 7, 1, 2, 3);
    __m512i b_vec_6 = _mm512_permutexvar_epi64(perm_idx_26, base_2);
    __m512i res_6 = _mm512_mul_epu32(a_vec_6, b_vec_6);
    _mm512_store_si512(res + 40, res_6);

    // Group 7
    __m512i perm_idx_17 = _mm512_set_epi64(5, 4, 7, 6, 5, 4, 3, 7);
    __m512i a_vec_7 = _mm512_permutexvar_epi64(perm_idx_17, base_1);
    __m512i perm_idx_27 = _mm512_set_epi64(6, 7, 3, 4, 5, 6, 7, 2);
    __m512i b_vec_7 = _mm512_permutexvar_epi64(perm_idx_27, base_2);
    __m512i res_7 = _mm512_mul_epu32(a_vec_7, b_vec_7);
    _mm512_store_si512(res + 48, res_7);

    // Group 8
    __m512i perm_idx_18 = _mm512_set_epi64(7, 7, 6, 7, 6, 5, 7, 6);
    __m512i a_vec_8 = _mm512_permutexvar_epi64(perm_idx_18, base_1);
    __m512i perm_idx_28 = _mm512_set_epi64(7, 6, 7, 5, 6, 7, 4, 5);
    __m512i b_vec_8 = _mm512_permutexvar_epi64(perm_idx_28, base_2);
    __m512i res_8 = _mm512_mul_epu32(a_vec_8, b_vec_8);
    _mm512_store_si512(res + 56, res_8);
}

// Helper: Horizontally sum two 64-bit integers in a 128-bit vector.
uint64_t horizontal_sum_128(__m128i v)
{
    // Extract the lower 64 bits.
    uint64_t lo = _mm_cvtsi128_si64x(v);
    // Move the upper 64 bits to the lower 64-bit position.
    uint64_t hi = _mm_cvtsi128_si64x(_mm_unpackhi_epi64(v, v));
    return lo + hi;
}

void add_limbs(uint64_t *result)
{
    // Phase 1: block sizes 2,3,4,5,6,7,8.

    // Block size 2: result[1] = result[1] + result[2]
    {
        __m128i v = _mm_loadu_si128((__m128i *)&result[1]); // loads result[1] and result[2]
        result[1] = horizontal_sum_128(v);
    }

    // Block size 3: result[2] = result[3] + result[4] + result[5]
    {
        __m128i v = _mm_loadu_si128((__m128i *)&result[3]); // loads result[3] and result[4]
        result[2] = horizontal_sum_128(v) + result[5];
    }

    // Block size 4: result[3] = result[6] + result[7] + result[8] + result[9]
    {
        __m128i v1 = _mm_loadu_si128((__m128i *)&result[6]); // loads result[6], result[7]
        __m128i v2 = _mm_loadu_si128((__m128i *)&result[8]); // loads result[8], result[9]
        __m128i sum_v = _mm_add_epi64(v1, v2);
        result[3] = horizontal_sum_128(sum_v);
    }

    // Block size 5: result[4] = result[10] + result[11] + result[12] + result[13] + result[14]
    {
        __m128i v1 = _mm_loadu_si128((__m128i *)&result[10]); // loads result[10], result[11]
        __m128i v2 = _mm_loadu_si128((__m128i *)&result[12]); // loads result[12], result[13]
        __m128i sum_v = _mm_add_epi64(v1, v2);
        result[4] = horizontal_sum_128(sum_v) + result[14];
    }

    // Block size 6: result[5] = result[15] + result[16] + result[17] + result[18] + result[19] + result[20]
    {
        __m128i v1 = _mm_loadu_si128((__m128i *)&result[15]); // loads result[15], result[16]
        __m128i v2 = _mm_loadu_si128((__m128i *)&result[17]); // loads result[17], result[18]
        __m128i v3 = _mm_loadu_si128((__m128i *)&result[19]); // loads result[19], result[20]
        __m128i sum_v = _mm_add_epi64(_mm_add_epi64(v1, v2), v3);
        result[5] = horizontal_sum_128(sum_v);
    }

    // Block size 7: result[6] = result[21] + result[22] + result[23] + result[24] + result[25] + result[26] + result[27]
    {
        __m128i v1 = _mm_loadu_si128((__m128i *)&result[21]); // loads result[21], result[22]
        __m128i v2 = _mm_loadu_si128((__m128i *)&result[23]); // loads result[23], result[24]
        __m128i v3 = _mm_loadu_si128((__m128i *)&result[25]); // loads result[25], result[26]
        uint64_t tail = result[27];
        __m128i sum_v = _mm_add_epi64(_mm_add_epi64(v1, v2), v3);
        result[6] = horizontal_sum_128(sum_v) + tail;
    }

    // Block size 8: result[7] = result[28] + result[29] + result[30] + result[31] + result[32] + result[33] + result[34] + result[35]
    {
        __m128i v1 = _mm_loadu_si128((__m128i *)&result[28]); // loads result[28], result[29]
        __m128i v2 = _mm_loadu_si128((__m128i *)&result[30]); // loads result[30], result[31]
        __m128i v3 = _mm_loadu_si128((__m128i *)&result[32]); // loads result[32], result[33]
        __m128i v4 = _mm_loadu_si128((__m128i *)&result[34]); // loads result[34], result[35]
        __m128i sum_v = _mm_add_epi64(_mm_add_epi64(v1, v2), _mm_add_epi64(v3, v4));
        result[7] = horizontal_sum_128(sum_v);
    }

    // Phase 2: block sizes 7,6,5,4,3,2.

    // Block size 7: result[8] = result[36] + result[37] + result[38] + result[39] + result[40] + result[41] + result[42]
    {
        __m128i v1 = _mm_loadu_si128((__m128i *)&result[36]); // loads result[36], result[37]
        __m128i v2 = _mm_loadu_si128((__m128i *)&result[38]); // loads result[38], result[39]
        __m128i v3 = _mm_loadu_si128((__m128i *)&result[40]); // loads result[40], result[41]
        uint64_t tail = result[42];
        __m128i sum_v = _mm_add_epi64(_mm_add_epi64(v1, v2), v3);
        result[8] = horizontal_sum_128(sum_v) + tail;
    }

    // Block size 6: result[9] = result[43] + result[44] + result[45] + result[46] + result[47] + result[48]
    {
        __m128i v1 = _mm_loadu_si128((__m128i *)&result[43]); // loads result[43], result[44]
        __m128i v2 = _mm_loadu_si128((__m128i *)&result[45]); // loads result[45], result[46]
        __m128i v3 = _mm_loadu_si128((__m128i *)&result[47]); // loads result[47], result[48]
        __m128i sum_v = _mm_add_epi64(_mm_add_epi64(v1, v2), v3);
        result[9] = horizontal_sum_128(sum_v);
    }

    // Block size 5: result[10] = result[49] + result[50] + result[51] + result[52] + result[53]
    {
        __m128i v1 = _mm_loadu_si128((__m128i *)&result[49]); // loads result[49], result[50]
        __m128i v2 = _mm_loadu_si128((__m128i *)&result[51]); // loads result[51], result[52]
        uint64_t tail = result[53];
        __m128i sum_v = _mm_add_epi64(v1, v2);
        result[10] = horizontal_sum_128(sum_v) + tail;
    }

    // Block size 4: result[11] = result[54] + result[55] + result[56] + result[57]
    {
        __m128i v1 = _mm_loadu_si128((__m128i *)&result[54]); // loads result[54], result[55]
        __m128i v2 = _mm_loadu_si128((__m128i *)&result[56]); // loads result[56], result[57]
        __m128i sum_v = _mm_add_epi64(v1, v2);
        result[11] = horizontal_sum_128(sum_v);
    }

    // Block size 3: result[12] = result[58] + result[59] + result[60]
    {
        __m128i v = _mm_loadu_si128((__m128i *)&result[58]); // loads result[58], result[59]
        result[12] = horizontal_sum_128(v) + result[60];
    }

    // Block size 2: result[13] = result[61] + result[62]
    {
        __m128i v = _mm_loadu_si128((__m128i *)&result[61]); // loads result[61], result[62]
        result[13] = horizontal_sum_128(v);
    }

    // Final step: Copy the last limb.
    result[14] = result[63];
}

/*
    Function to adjust the limbs of the result after addition
    a: Result of the addition
    Note: The function writes the result back as per 32-bit format
*/
void adjust_limbs(__uint64_t *a)
{
    // Assumes n >= 1 and that a has n+1 elements.

    // Process the very first iteration separately.
    {
        uint64_t s0 = (((uint32_t)a[0] + (uint32_t)(a[1] >> 32)) & 0xFFFFFFFF);
        uint64_t overflow = (s0 < (uint32_t)a[0]);
        a[0] = ((s0 << 32) & 0xFFFFFFFF00000000ULL) | ((uint32_t)(a[0] >> 32) + overflow);
    }

    int out = 1; // next output index (a[0] is already used)
    int i = 1;
    int last_pair = 0; // holds the index of the last “complete pair” output
    uint64_t s_high = 0, s_low = 0;
    uint64_t mask = 0, mask_low = 0;
    // Process pairs of iterations.
    while (i + 1 < 15)
    {
        s_high = (((uint32_t)a[i] + (uint32_t)(a[i + 1] >> 32)) & 0xFFFFFFFF);
        mask = (s_high < (uint32_t)a[i]);
        a[last_pair] += (mask << 32);

        s_low = (((uint32_t)a[i + 1] + (uint32_t)(a[i + 2] >> 32)) & 0xFFFFFFFF);
        mask_low = (s_low < (uint32_t)a[i + 1]);
        s_high += mask_low;

        a[out] = ((s_low << 32) & 0xFFFFFFFF00000000ULL) | (uint32_t)s_high;
        last_pair = out;
        out++;
        i += 2;
    }
    // Adjust the ending element's lower half.
    a[last_pair] = (((a[i - 1]) << 32) & 0xFFFFFFFF00000000ULL) | (uint32_t)((a[last_pair] - (mask_low << 32)));
}

/*
    Function to multiply two numbers using the Urdhva Tiryakbhyam algorithm
    num1: First number to be multiplied
    num2: Second number to be multiplied
    res: Result of the multiplication
    max_idx: Maximum index of the result array: n*n
    n: Number of limbs in each number
*/
void multiply(__uint32_t *num1, __uint32_t *num2, __uint64_t *res)
{
    accumulate_multiply_AVX(num1, num2, res);
    add_limbs(res);
    adjust_limbs(res);
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

void generate_random_numbers(__uint32_t *num, int n)
{
    for (int i = 0; i < n; i++)
    {
        num[i] = (__uint32_t)rand();
    }
}

void limb_get_str32(__uint32_t *result, int n, char **result_str)
{
    int idx = 0;
    for (int i = 0; i < n; i++)
    {
        idx += snprintf(*result_str + idx, 9, "%08" PRIx32, result[i]);
    }
    (*result_str)[idx] = '\0';
    // Omit leading zeros
    while (**result_str == '0')
    {
        (*result_str)++;
    }
}

void test()
{
    int n = 8; // 256-bits
    int max_idx_urdhva = n * n;

    for (int test_case = 0; test_case < 1; test_case++)
    {
        __uint32_t *num1 = (__uint32_t *)_mm_malloc(n * sizeof(__uint32_t), 64);
        __uint32_t *num2 = (__uint32_t *)_mm_malloc(n * sizeof(__uint32_t), 64);
        uint64_t *result = (__uint64_t *)_mm_malloc(2 * n * sizeof(__uint64_t), 64);
        double t; // for timing
        mpz_t gmp_num1, gmp_num2, gmp_result;
        mpz_init(gmp_num1);
        mpz_init(gmp_num2);
        mpz_init(gmp_result);
        char *result_str = (char *)malloc(n * sizeof(__uint64_t) + 1);
        long long values[MAX_EVENTS];
        initialize_perf();
        perf_event_open(pe, 0, -1, 0, 0);
        memset(num1, 0, n * sizeof(__uint32_t));
        memset(num2, 0, n * sizeof(__uint32_t));
        memset(result, 0, 2 * n * sizeof(__uint64_t));
        memset(result_str, 0, n * sizeof(__uint64_t) + 1);

        srand(time(NULL));

        generate_random_numbers(num1, n);
        generate_random_numbers(num2, n);

        // Convert num1 and num2 to GMP integers
        for (int i = 0; i < n; i++)
        {
            mpz_mul_2exp(gmp_num1, gmp_num1, 32);
            mpz_add_ui(gmp_num1, gmp_num1, num1[i]);
            mpz_mul_2exp(gmp_num2, gmp_num2, 32);
            mpz_add_ui(gmp_num2, gmp_num2, num2[i]);
        }

        printf("*** Test Case %d ***\n", test_case + 1);

        mpz_mul(gmp_result, gmp_num1, gmp_num2);

        char *expected_result_str = mpz_get_str(NULL, 16, gmp_result);

        // memfence & cpuid to make sure all previous instructions have been completed
        asm volatile("mfence" ::
                         : "memory");

        start_perf();
        multiply(num1, num2, result);
        stop_perf();

        read_perf(values);
        write_perf(stdout, values);

        // limb_get_str(result, n, &result_str);
        limb_get_str32((uint32_t *)result, 2 * n, &result_str);

        // limb_get_str32(result_32, 2 * n, &result_str);

        // // memfence & cpuid to make sure all previous instructions have been completed
        asm volatile("mfence" ::
                         : "memory");
        start_perf();
        TIME_TIMESPEC(t, multiply(num1, num2, result));
        stop_perf();
        printf("Time taken by Urdhva Tiryakbhyam: %f microseconds\n", t);
        read_perf(values);
        write_perf(stdout, values);

        asm volatile("mfence" ::
                         : "memory");

        TIME_TIMESPEC(t, mpz_mul(gmp_result, gmp_num1, gmp_num2));
        printf("Time taken by GMP: %f microseconds\n", t);

        bool flag = true;
        // compare the result with the expected result
        for (int i = 0; i < strlen(expected_result_str); i++)
        {
            if (expected_result_str[i] != result_str[i])
            {
                printf("Test failed\n");
                printf("i: %d, expected: %c, result: %c\n", i, expected_result_str[i], result_str[i]);
                printf("result: %s\n", result_str);
                printf("expected: %s\n", expected_result_str);
                flag = false;
                exit(1);
            }
        }

        printf("Test %s\n", flag ? "passed" : "failed");
    }
}

int main()
{
    test();
    return 0;
}