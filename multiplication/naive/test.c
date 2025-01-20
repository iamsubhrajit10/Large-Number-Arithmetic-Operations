#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <gmp.h>
#include <stdbool.h>

void print_array(__uint16_t *arr, int n);

inline void scatter(__uint16_t *num1, __uint16_t *num2, int start, int end, __uint16_t *mul_tmp_1, __uint16_t *mul_tmp_2, unsigned *idx)
{
    __uint16_t *ptr1 = mul_tmp_1 + *idx;
    __uint16_t *ptr2 = mul_tmp_2 + *idx;

    for (int i = start, j = end; i <= end; i++, j--)
    {
        __uint16_t n1 = num1[i];
        __uint16_t n2 = num2[j];
        __uint16_t n1_high = (n1 >> 8) & 0xFF;
        __uint16_t n1_low = n1 & 0xFF;
        __uint16_t n2_high = (n2 >> 8) & 0xFF;
        __uint16_t n2_low = n2 & 0xFF;

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

void accumulate_muls(__uint16_t *num1, __uint16_t *num2, int n, __uint16_t *mul_tmp_1, __uint16_t *mul_tmp_2)
{
    unsigned idx = 0;
    unsigned max_idx = (n << 1) - 1;
    unsigned threshold = n - 1;
    for (unsigned set_idx = 0; set_idx < max_idx; set_idx++)
    {
        int start = (set_idx >= threshold) ? (set_idx - threshold) : 0;
        int end = (set_idx < n) ? set_idx : threshold;
        scatter(num1, num2, start, end, mul_tmp_1, mul_tmp_2, &idx);
    }
}

void multiply_AVX(int n, __uint16_t *mul_tmp_1, __uint16_t *mul_tmp_2, __uint16_t *result)
{
    __uint16_t *ptr1 = mul_tmp_1;
    __uint16_t *ptr2 = mul_tmp_2;
    __uint16_t *res_ptr = result;
    for (int i = 0; i < n; ++i)
    {
        *res_ptr++ = *ptr1++ * *ptr2++;
    }
}

void add_within_limbs(int n, __uint16_t *result)
{
    for (int i = 1; i < n; i += 4)
    {
        __uint32_t res = result[i] + result[i + 1];
        if (res > 0xFFFF)
        {
            result[i - 1] = result[i - 1] + 0x100;
        }
        result[i] = res & 0xFFFF;
        result[i + 1] = 0;
    }
}

void adjust_inner_limbs(int n, __uint16_t *result)
{
    int size = 4;
    int start = 0;
    int end = start + size - 1;

    while (end < n)
    {
        int second = start + 1;
        int c1 = 0, c2 = 0;
        unsigned p = (result[end] >> 8) + (result[second] & 0xFF);
        if (p > 0xFF)
        {
            c1 = 1;
            p = p & 0xFF;
        }
        unsigned q = (result[second] >> 8) + (result[start] & 0xFF);
        if (q > 0xFF)
        {
            c2 = 1;
            q = q & 0xFF;
        }
        result[second] = (result[end] & 0xFF) | (p << 8);

        if (c1 == 1)
        {
            q = (q + 1) & 0xFF;
            if (q == 0)
            {
                result[start] = result[start] + 0x100;
            }
        }
        if (c2 == 1)
        {
            result[start] = result[start] + 0x100;
        }
        result[start] = (result[start] & 0xFF00) | q;
        result[end] = 0x0000;
        start += size;
        end += size;
    }
}

inline __uint32_t custom_add(__uint16_t a_high, __uint16_t a_low, __uint16_t b_high, __uint16_t b_low, int *carry)
{
    // Combine low parts and carry
    __uint32_t r = (__uint32_t)a_low + b_low + *carry;
    *carry = r >> 16; // Extract carry for the next addition
    r &= 0xFFFF;      // Mask to keep only the lower 16 bits

    // Combine high parts and carry
    __uint32_t q = (__uint32_t)a_high + b_high + *carry;
    *carry = q >> 16; // Extract carry for the next addition
    q &= 0xFFFF;      // Mask to keep only the lower 16 bits

    return (q << 16) | r;
}

void add_limbs(int n, int max_idx, __uint16_t *result)
{
    int add_count = 1, adds = 1;
    int thresh = n - 1;
    int start = 2, end = 4;
    int k = 2;
    while (end + 2 < max_idx)
    {
        __uint32_t r = ((result[start] << 16) | (result[start + 1]));
        int i = start + 2;
        int m = 0;
        while (m < adds)
        {
            __uint16_t a_high = (r >> 16);
            __uint16_t a_low = r;
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
        result[k] = r >> 16;
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

__uint16_t *adjust_limbs(int n, __uint16_t *result)
{
    int first = n - 2;
    int second = n - 1;
    int ptr = n - 1;
    while (first > 0)
    {
        __uint32_t r = result[first] + result[second];
        if (r > 0xFFFF)
        {
            result[first - 1]++;
            if (result[first - 1] == 0)
            {
                result[first - 3]++;
            }
            // r = r & 0xFFFF;
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

void remove_intermediary_zeros(int n, __uint16_t *result)
{
    __uint16_t *src = result;
    __uint16_t *dst = result;

    for (int i = 0; i < n; i += 4)
    {
        *dst++ = *src++;
        *dst++ = *src++;
        src += 2; // Skip the next two elements
    }
}

void print_array(__uint16_t *arr, int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("%02x ", arr[i]);
    }
    printf("\n");
}

__uint16_t *multiply_urdhva(__uint16_t *num1, __uint16_t *num2, int n)
{
    int max_idx = (n * n) << 2;
    __uint16_t *mul_tmp_1 = (__uint16_t *)malloc(max_idx * sizeof(__uint16_t));
    __uint16_t *mul_tmp_2 = (__uint16_t *)malloc(max_idx * sizeof(__uint16_t));
    __uint16_t *result = (__uint16_t *)malloc(max_idx * sizeof(__uint16_t));

    memset(result, 0, max_idx * sizeof(__uint16_t));
    memset(mul_tmp_1, 0, max_idx * sizeof(__uint16_t));
    memset(mul_tmp_2, 0, max_idx * sizeof(__uint16_t));

    accumulate_muls(num1, num2, n, mul_tmp_1, mul_tmp_2);

    multiply_AVX(max_idx, mul_tmp_1, mul_tmp_2, result);

    add_within_limbs(max_idx, result);

    adjust_inner_limbs(max_idx, result);

    remove_intermediary_zeros(max_idx, result);

    add_limbs(n, max_idx >> 1, result);

    __uint16_t *final_result = adjust_limbs((((n << 1) - 1) << 1) - 1, result);

    free(mul_tmp_1);
    free(mul_tmp_2);
    return final_result;
}

void generate_random_numbers(__uint16_t *num, int n)
{
    for (int i = 0; i < n; i++)
    {
        num[i] = rand() % 0xFFFF;
    }
}

void test()
{
    for (int test_case = 0; test_case < 100; test_case++)
    {

        int n = 4096;

        __uint16_t *num1 = (__uint16_t *)malloc(n * sizeof(__uint16_t));
        __uint16_t *num2 = (__uint16_t *)malloc(n * sizeof(__uint16_t));
        char *result_str = (char *)malloc(2 * n * 64);
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

        printf("*** Test Case %d ***\n", test_case + 1);

        // Call multiply_urdhva
        __uint16_t *res = multiply_urdhva(num1, num2, n);

        // convert the result to a string using snprintf
        int idx = 0;
        for (int i = 0; i < 2 * n; i++)
        {
            idx += snprintf(result_str + idx, 5, "%04x", res[i]);
        }
        result_str[idx] = '\0';
        // omit leading zeros
        while (*result_str == '0')
        {
            result_str++;
        }
        // printf("result_str:          %s\n", result_str);

        // printf("result: ");
        // print_array(res, n << 1);

        // Convert num1 and num2 to GMP integers
        for (int i = 0; i < n; i++)
        {
            mpz_mul_2exp(gmp_num1, gmp_num1, 16);
            mpz_add_ui(gmp_num1, gmp_num1, num1[i]);
            mpz_mul_2exp(gmp_num2, gmp_num2, 16);
            mpz_add_ui(gmp_num2, gmp_num2, num2[i]);
        }

        // Perform multiplication with GMP
        mpz_mul(gmp_expected_result, gmp_num1, gmp_num2);

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
                // printf("result_str:          %s\n", result_str);
                // printf("expected_result_str: %s\n", expected_result_str);

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

        free(num1);
        free(num2);
        // free(result_str);
    }
}

int main()
{
    test();
    return 0;
}