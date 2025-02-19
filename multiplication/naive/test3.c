/*
    Author: Subhrajit
    Urdhva Tiryakbhyam: A fast AVX multiplication algorithm for 256-bit numbers to be utilized as base case in Karatsuba and other recursive algorithms
    The algorithm is based on the ancient Indian Vedic mathematics sutra

    This is a testing file for the Urdhva Tiryakbhyam algorithm
    The algorithm is tested against GMP's multiplication function

    Assumptions: it does not take in account the preparation of the numbers to be multiplied and read using AVX instructions
    The numbers are assumed to be already prepared and stored in the arrangement order needed for the algorithm

    Future work: to optimize the preparation of the numbers for multiplication and take into account the AVX instructions

    Current speedup for 256-bit numbers: 42x
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
#include "myutils.h"
#define UNLIKELY(expr) __builtin_expect(!!(expr), 0)
#define LIKELY(expr) __builtin_expect(!!(expr), 1)

inline void __prep_limbs_mul(__uint64_t *dest, __uint64_t *src, int n, bool is_multiplier) __attribute__((always_inline));

inline void extract_32bit(__uint32_t *restrict dest, const __uint64_t *restrict src, int n) __attribute__((always_inline));

inline void __prep_limbs_multiplicand(__uint64_t *restrict dest,
                                      const __uint32_t *restrict src,
                                      int n) __attribute__((always_inline));
inline void __prep_limbs_multiplier(__uint64_t *restrict dest,
                                    const __uint32_t *restrict src,
                                    int n) __attribute__((always_inline));
inline void __prep_limbs_mul(__uint64_t *restrict dest,
                             __uint64_t *restrict src,
                             int n,
                             bool is_multiplier) __attribute__((always_inline));
inline int add_limbs(int n, int max_idx, __uint64_t *result) __attribute__((always_inline));
inline void multiply_AVX(__uint64_t *num1, __uint64_t *num2, __uint64_t *res, int n) __attribute__((always_inline));
inline void adjust_limbs(int n, __uint64_t *a) __attribute__((always_inline));
static inline void multiply(__uint64_t *num1_urdhva, __uint64_t *num2_urdhva, __uint64_t *temp_result, int max_idx_urdhva, int n) __attribute__((always_inline));
void print_array(__uint64_t *arr, int n);

inline void extract_32bit(__uint32_t *restrict dest, const __uint64_t *restrict src, int n)
{

    int idx_32 = 0;

    for (int i = 0; i < n; i++)
    {
        dest[idx_32++] = (__uint32_t)(src[i] >> 32);
        dest[idx_32++] = (__uint32_t)src[i];
    }
}
inline void __prep_limbs_multiplicand(__uint64_t *restrict dest,
                                      const __uint32_t *restrict src,
                                      int n)
{
    const int thresh = n - 1;
    const int max_idx = (n << 1) - 1;
    int dest_idx = 0;

    // first phase: prefix
    for (int i = 0; i < n; ++i)
    {
        int start = 0;
        int end = i;
        for (int j = start; j <= end; j++)
        {
            dest[dest_idx++] = (__uint64_t)src[j];
        }
    }

    // second phase: suffix
    for (int i = n; i < max_idx; ++i)
    {
        int start = i - thresh;
        int end = thresh;
        for (int j = start; j <= end; j++)
        {
            dest[dest_idx++] = (__uint64_t)src[j];
        }
    }
}

inline void __prep_limbs_multiplier(__uint64_t *restrict dest,
                                    const __uint32_t *restrict src,
                                    int n)
{
    const int thresh = n - 1;
    const int max_idx = (n << 1) - 1;
    int dest_idx = 0;

    // first phase: prefix
    for (int i = 0; i < n; ++i)
    {
        int start = 0;
        int end = i;
        for (int j = end; j >= start; j--)
        {
            dest[dest_idx++] = (__uint64_t)src[j];
        }
    }

    // second phase: suffix
    for (int i = n; i < max_idx; ++i)
    {
        int start = i - thresh;
        int end = thresh;
        for (int j = end; j >= start; j--)
        {
            dest[dest_idx++] = (__uint64_t)src[j];
        }
    }
}

inline void __prep_limbs_mul(__uint64_t *dest, __uint64_t *src, int n, bool is_multiplier)
{
    const int n_2 = n << 1;
    __uint32_t temp_dest[n_2];
    extract_32bit(temp_dest, src, n);

    is_multiplier ? __prep_limbs_multiplier(dest, temp_dest, n << 1) : __prep_limbs_multiplicand(dest, temp_dest, n << 1);
}

inline void multiply_AVX(__uint64_t *__restrict num1,
                         __uint64_t *__restrict num2,
                         __uint64_t *__restrict res,
                         int n)
{
    int i = 0;
    const int vec_width = 8;
    for (; i < n; i += vec_width)
    {

        __m512i vec1 = _mm512_load_epi64(num1 + i);
        __m512i vec2 = _mm512_load_epi64(num2 + i);
        __m512i vec_res = _mm512_mul_epi32(vec1, vec2);
        _mm512_store_epi64(res + i, vec_res);
    }
}

inline int add_limbs(int n, int max_idx, __uint64_t *result)
{
    int start_idx = 1;
    int start = 1;
    // Use a 128-bit accumulator to capture carry.
    unsigned __int128 sum_acc;

    // Phase 1: Build sums for block sizes 2 to n.
    for (int adds = 1; adds < n; adds++)
    {
        int block_size = adds + 1;
        // Start with any carry from previous block.
        sum_acc = 0;
        const __uint64_t *p = result + start;
        for (int i = 0; i < block_size; i++)
        {
            sum_acc += p[i];
        }
        // Store the low 64 bits as the block’s result.
        result[start_idx++] = (uint64_t)sum_acc;
        start += block_size;
    }

    // Phase 2: Build sums for block sizes decreasing from n-1 down to 2.
    for (int adds = n - 2; adds > 0; adds--)
    {
        int block_size = adds + 1;
        sum_acc = 0;
        const __uint64_t *p = result + start;
        for (int i = 0; i < block_size; i++)
        {
            sum_acc += p[i];
        }
        result[start_idx++] = (uint64_t)sum_acc;
        start += block_size;
    }

    // Final step: Add any remaining carry to the last element.
    result[start_idx] = result[max_idx];
    return start_idx;
}

inline void adjust_limbs(int n, __uint64_t *a)
{
    // Assumes n >= 1 and that a has n+1 elements.
    // Process the very first iteration separately.
    {
        uint64_t s0 = (((uint32_t)a[0] + (uint32_t)(a[1] >> 32)) & 0xFFFFFFFF);
        // Branchless overflow detection (if needed)
        uint64_t overflow = (((uint64_t)s0 - (uint32_t)a[0]) >> 63);
        a[0] = a[0] + (overflow << 32);
        // (Optionally, use 'overflow' if you need to log or handle it)
        a[0] = (a[0] & 0xFFFFFFFF00000000ULL) | s0;
    }

    int out = 1; // next output index (a[0] is already used)
    int i = 1;
    int last_pair = 0; // holds the index of the last “complete pair” output
    uint64_t s_high = 0, s_low = 0;
    uint64_t mask = 0, mask_low = 0;
    // Process pairs of iterations.
    while (i + 1 < n)
    {
        s_high = (((uint32_t)a[i] + (uint32_t)(a[i + 1] >> 32)) & 0xFFFFFFFF);
        // Branchless: if s_high < lower 32 bits of a[i], add 1 to a[last_pair]
        mask = (((uint64_t)s_high - ((uint32_t)a[i]) >> 63));
        a[last_pair] += mask;

        s_low = (((uint32_t)a[i + 1] + (uint32_t)(a[i + 2] >> 32)) & 0xFFFFFFFF);
        // Branchless: if s_low < lower 32 bits of a[i+1], add 1 to s_high
        mask_low = (((uint64_t)s_low - ((uint32_t)a[i + 1]) >> 63));
        s_high += mask_low;

        a[out] = (((__uint64_t)s_high << 32) | s_low);
        last_pair = out;
        out++;
        i += 2;
    }
    // Adjust the ending element's lower half.
    a[last_pair] = ((a[last_pair] - (mask_low << 32)) & 0xFFFFFFFF00000000ULL) | (a[i - 1] & 0xFFFFFFFF);
}

// multiply calls the AVX-based multiplication, then reduces the limbs via add_limbs,
// and finally “adjusts” them. (All pointers are assumed not to alias.)
inline void multiply(__uint64_t *__restrict num1_urdhva,
                     __uint64_t *__restrict num2_urdhva,
                     __uint64_t *__restrict res,
                     int max_idx_urdhva,
                     int n)
{
    multiply_AVX(num1_urdhva, num2_urdhva, res, max_idx_urdhva);
    int i = add_limbs(n, max_idx_urdhva - 1, res);
    adjust_limbs(i + 1, res);
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

void generate_random_numbers(__uint64_t *num, int n)
{
    for (int i = 0; i < n; i++)
    {
        num[i] = ((uint64_t)rand() << 32) | rand();
    }
}

void limb_get_str(__uint64_t *result, int n, char **result_str)
{
    int idx = 0;
    for (int i = 0; i < n; i++)
    {
        idx += snprintf(*result_str + idx, 17, "%016" PRIx64, result[i]);
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
    for (int test_case = 0; test_case < 1000000; test_case++)
    {

        int n = 4; // till 16*64 = 1024 bits the AVX multiplication is at least 2x faster than GMP; we need reduce the other utility functions for overall beating GMP
        // best performance is achieved: n = 4; 256 bits
        int n_2 = n << 1; // 2n
        int max_idx_urdhva = (n * n) << 2;
        double t; // for timing

        __uint64_t *num1 = (__uint64_t *)malloc(n * sizeof(__uint64_t));
        __uint64_t *num2 = (__uint64_t *)malloc(n * sizeof(__uint64_t));

        char *result_str = (char *)malloc(2 * n * 64 + 1);
        memset(result_str, 0, 2 * n * sizeof(char));

        mpz_t gmp_num1, gmp_num2, gmp_result;
        mpz_init(gmp_num1);
        mpz_init(gmp_num2);
        mpz_init(gmp_result);

        uint64_t *result = (__uint64_t *)_mm_malloc(max_idx_urdhva * sizeof(__uint64_t), 64);
        memset(result, 0, max_idx_urdhva * sizeof(__uint64_t));

        __uint64_t *num1_urdhva = (__uint64_t *)_mm_malloc(max_idx_urdhva * sizeof(__uint64_t), 64);
        memset(num1_urdhva, 0, max_idx_urdhva * sizeof(__uint64_t));
        __uint64_t *num2_urdhva = (__uint64_t *)_mm_malloc(max_idx_urdhva * sizeof(__uint64_t), 64);
        memset(num2_urdhva, 0, max_idx_urdhva * sizeof(__uint64_t));

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

        // prepare the limbs for multiplication according to the Urdhva Tiryakbhyam algorithm
        // TIME_RUSAGE(t, __prep_limbs_mul(num1_urdhva, num1, n, false));
        // printf("Time taken for preparing num1: %f\n", t);
        // TIME_RUSAGE(t, __prep_limbs_mul(num2_urdhva, num2, n, true));
        // printf("Time taken for preparing num2: %f\n", t);

        __prep_limbs_mul(num1_urdhva, num1, n, false);
        __prep_limbs_mul(num2_urdhva, num2, n, true);

        multiply(num1_urdhva, num2_urdhva, result, max_idx_urdhva, n_2);

        mpz_mul(gmp_result, gmp_num1, gmp_num2);

        limb_get_str(result, n_2, &result_str);

        char *expected_result_str = mpz_get_str(NULL, 16, gmp_result);

        // TIME_RUSAGE(t, multiply(num1_urdhva, num2_urdhva, result, max_idx_urdhva, n_2));
        // printf("Time taken for multiplication: %f\n", t);

        // TIME_RUSAGE(t, mpz_mul(gmp_result, gmp_num1, gmp_num2));
        // printf("Time taken for GMP multiplication: %f\n", t);

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
        // _mm_free(result);
        // _mm_free(num1_urdhva);
        // _mm_free(num2_urdhva);
        // free(num1);
        // free(num2);
        // free(result_str);
        // mpz_clear(gmp_num1);
        // mpz_clear(gmp_num2);
        // mpz_clear(gmp_result);
    }
}

int main()
{
    test();
    return 0;
}