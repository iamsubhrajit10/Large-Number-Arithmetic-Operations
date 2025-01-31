#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <gmp.h>
#include <inttypes.h>
#include <stdbool.h>
#include <immintrin.h>
#include "myutils.h"

void print_array(__uint64_t *arr, int n);
void scatter(__uint64_t *num1, __uint64_t *num2, int start, int end, __uint64_t *mul_tmp_1, __uint64_t *mul_tmp_2, unsigned *idx);
void accumulate_muls(__uint64_t *num1, __uint64_t *num2, int n, __uint64_t *mul_tmp_1, __uint64_t *mul_tmp_2);

inline void scatter(__uint64_t *num1, __uint64_t *num2, int start, int end, __uint64_t *mul_tmp_1, __uint64_t *mul_tmp_2, unsigned *idx)
{
    __uint64_t *ptr1 = mul_tmp_1 + *idx;
    __uint64_t *ptr2 = mul_tmp_2 + *idx;
    for (int i = start, j = end; i <= end; i++, j--)
    {
        __uint64_t n1 = num1[i];
        __uint64_t n2 = num2[j];
        __uint64_t n1_high = (n1 >> 32) & 0xFFFFFFFF;
        __uint64_t n1_low = n1 & 0xFFFFFFFF;
        __uint64_t n2_high = (n2 >> 32) & 0xFFFFFFFF;
        __uint64_t n2_low = n2 & 0xFFFFFFFF;

        *ptr1++ = n1_high;
        *ptr1++ = n1_high;
        *ptr1++ = n1_low;
        *ptr1++ = n1_low;

        *ptr2++ = n2_high;
        *ptr2++ = n2_low;
        *ptr2++ = n2_high;
        *ptr2++ = n2_low;
    }

    *idx += 4 * (end - start + 1);
}

inline void accumulate_muls(__uint64_t *num1, __uint64_t *num2, int n, __uint64_t *mul_tmp_1, __uint64_t *mul_tmp_2)
{
    unsigned idx = 0;
    unsigned max_idx = (n << 1) - 1;
    unsigned threshold = n - 1;
    for (unsigned set_idx = 0; set_idx < max_idx; set_idx++)
    {
        int start = (set_idx >= threshold) ? (set_idx - threshold) : 0;
        int end = (set_idx < n) ? set_idx : threshold;
        if (set_idx == max_idx - 1)
        {
            long long to = measure_rdtsc_start();
            scatter(num1, num2, start, end, mul_tmp_1, mul_tmp_2, &idx);
            long long t1 = measure_rdtscp_end();
            printf("Time taken for scatter: %lld\n", t1 - to);
            continue;
        }
        scatter(num1, num2, start, end, mul_tmp_1, mul_tmp_2, &idx);
    }
}

// inline void multiply_AVX(int n, __uint64_t *mul_tmp_1, __uint64_t *mul_tmp_2, __uint64_t *result)
// {
//     __uint64_t *ptr1 = mul_tmp_1;
//     __uint64_t *ptr2 = mul_tmp_2;
//     __uint64_t *res_ptr = result;
//     for (int i = 0; i < n; ++i)
//     {
//         *res_ptr++ = *ptr1++ * *ptr2++;
//     }
// }

inline void multiply_AVX(int n, __uint64_t *mul_tmp_1, __uint64_t *mul_tmp_2, __uint64_t *result)
{
    int i;
    for (i = 0; i <= n; i += 8)
    {
        // Load 8 64-bit integers from mul_tmp_1 and mul_tmp_2
        __m512i vec1 = _mm512_load_epi64(mul_tmp_1 + i);
        __m512i vec2 = _mm512_load_epi64(mul_tmp_2 + i);

        // Perform 64-bit integer multiplication
        __m512i vec_res = _mm512_mul_epu32(vec1, vec2);

        // Store the result
        _mm512_store_epi64(result + i, vec_res);
    }
}

inline void add_within_limbs(int n, __uint64_t *result)
{
    for (int i = 1; i < n; i += 4)
    {
        __uint128_t res = (__uint128_t)((__uint128_t)result[i] + (__uint128_t)result[i + 1]);
        // if (res > 0xFFFFFFFFFFFFFFFF)
        // {
        //     printf("Carry is not zero\n");
        //     result[i - 1] = result[i - 1] + 0x100000000;
        // }
        // result[i] = res & 0xFFFFFFFFFFFFFFFF;
        // result[i + 1] = 0;
        result[i] = res & 0xFFFFFFFFFFFFFFFF;
        result[i + 1] = 0;
    }
}

inline void adjust_inner_limbs(int n, __uint64_t *result)
{
    int size = 4;
    int start = 0;
    int end = start + size - 1;

    while (end < n)
    {
        int second = start + 1;
        int c1 = 0, c2 = 0;
        __uint64_t p = (result[end] >> 32) + (result[second] & 0xFFFFFFFF);
        if (p > 0xFFFFFFFF)
        {
            c1 = 1;
            p = p & 0xFFFFFFFF;
        }
        __uint64_t q = (result[second] >> 32) + (result[start] & 0xFFFFFFFF);
        if (q > 0xFFFFFFFF)
        {
            c2 = 1;
            q = q & 0xFFFFFFFF;
        }
        result[second] = (result[end] & 0xFFFFFFFF) | (p << 32);

        if (c1 == 1)
        {
            q = (q + 1) & 0xFFFFFFFF;
            if (q == 0)
            {
                result[start] = result[start] + 0x100000000;
            }
        }
        if (c2 == 1)
        {
            result[start] = result[start] + 0x100000000;
        }
        result[start] = (result[start] & 0xFFFFFFFF00000000) | q;
        result[end] = 0;
        start += size;
        end += size;
    }
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
            if (carry)
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
        if (r > 0xFFFFFFFFFFFFFFFF)
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

inline void remove_intermediary_zeros(int n, __uint64_t *result)
{
    __uint64_t *src = result;
    __uint64_t *dst = result;

    for (int i = 0; i < n; i += 4)
    {
        *dst++ = *src++;
        *dst++ = *src++;
        src += 2; // Skip the next two elements
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
__uint64_t *mul_tmp_1, *mul_tmp_2, *result;
__uint64_t *multiply_urdhva(__uint64_t *num1, __uint64_t *num2, int n)
{
    int max_idx = (n * n) << 2;
    long long t0 = measure_rdtsc_start();
    accumulate_muls(num1, num2, n, mul_tmp_1, mul_tmp_2);
    long long t1 = measure_rdtscp_end();
    printf("Time taken for accumulate_muls: %lld\n", t1 - t0);

    t0 = measure_rdtsc_start();
    multiply_AVX(max_idx, mul_tmp_1, mul_tmp_2, result);
    t1 = measure_rdtscp_end();
    printf("Time taken for multiply_AVX: %lld\n", t1 - t0);

    t0 = measure_rdtsc_start();
    add_within_limbs(max_idx, result);
    t1 = measure_rdtscp_end();
    printf("Time taken for add_within_limbs: %lld\n", t1 - t0);

    t0 = measure_rdtsc_start();
    adjust_inner_limbs(max_idx, result);
    t1 = measure_rdtscp_end();
    printf("Time taken for adjust_inner_limbs: %lld\n", t1 - t0);

    t0 = measure_rdtsc_start();
    remove_intermediary_zeros(max_idx, result);
    t1 = measure_rdtscp_end();
    printf("Time taken for remove_intermediary_zeros: %lld\n", t1 - t0);

    t0 = measure_rdtsc_start();
    add_limbs(n, max_idx >> 1, result);
    t1 = measure_rdtscp_end();
    printf("Time taken for add_limbs: %lld\n", t1 - t0);

    t0 = measure_rdtsc_start();
    __uint64_t *final_result = adjust_limbs((((n << 1) - 1) << 1) - 1, result);
    t1 = measure_rdtscp_end();
    printf("Time taken for adjust_limbs: %lld\n", t1 - t0);

    // free(mul_tmp_1);
    // free(mul_tmp_2);
    return final_result;
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
    for (int test_case = 0; test_case < 100; test_case++)
    {

        int n = 256;

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

        srand(time(NULL));

        generate_random_numbers(num1, n);
        generate_random_numbers(num2, n);

        // printf("num1: ");
        // print_array(num1, n);
        // printf("num2: ");
        // print_array(num2, n);

        printf("*** Test Case %d ***\n", test_case + 1);
        int max_idx = (n * n) << 2;

        // mul_tmp_1 = (__uint64_t *)malloc(max_idx * sizeof(__uint64_t));
        mul_tmp_1 = (__uint64_t *)_mm_malloc(max_idx * sizeof(__uint64_t), 64);
        // mul_tmp_2 = (__uint64_t *)malloc(max_idx * sizeof(__uint64_t));
        mul_tmp_2 = (__uint64_t *)_mm_malloc(max_idx * sizeof(__uint64_t), 64);
        // result = (__uint64_t *)malloc(max_idx * sizeof(__uint64_t));
        result = (__uint64_t *)_mm_malloc(max_idx * sizeof(__uint64_t), 64);

        memset(result, 0, max_idx * sizeof(__uint64_t));
        memset(mul_tmp_1, 0, max_idx * sizeof(__uint64_t));
        memset(mul_tmp_2, 0, max_idx * sizeof(__uint64_t));

        // Call multiply_urdhva
        long long t0 = measure_rdtsc_start();
        __uint64_t *res = multiply_urdhva(num1, num2, n);
        long long t1 = measure_rdtscp_end();
        printf("Time taken: %lld\n", t1 - t0);
        // printf("res: ");
        // print_array(res, n << 1);

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

        // Convert num1 and num2 to GMP integers
        for (int i = 0; i < n; i++)
        {
            mpz_mul_2exp(gmp_num1, gmp_num1, 64);
            mpz_add_ui(gmp_num1, gmp_num1, num1[i]);
            mpz_mul_2exp(gmp_num2, gmp_num2, 64);
            mpz_add_ui(gmp_num2, gmp_num2, num2[i]);
        }

        // Perform multiplication with GMP
        t0 = measure_rdtsc_start();
        mpz_mul(gmp_expected_result, gmp_num1, gmp_num2);
        t1 = measure_rdtscp_end();
        printf("GMP Time taken: %lld\n", t1 - t0);

        // Convert the result to a string
        char *expected_result_str = mpz_get_str(NULL, 16, gmp_expected_result);
        // printf("expected_result_str: %s\n", expected_result_str);
        bool flag = true;
        // compare the result with the expected result
        for (int i = 0; i < strlen(expected_result_str); i++)
        {
            if (expected_result_str[i] != result_str[i])
            {
                printf("Test failed\n");
                printf("i: %d, expected: %c, result: %c\n", i, expected_result_str[i], result_str[i]);
                flag = false;
            }
        }
        if (flag)
            printf("Test passed\n");
        else
        {
            printf("Test failed\n");
            return;
        }

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