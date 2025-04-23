#include <immintrin.h>
#include <stdint.h>

inline void accumulate_multiply_AVX(__uint32_t *num1,
                                    __uint32_t *num2,
                                    __uint64_t *__restrict res,
                                    int n)
{ // prefetch the whole data into all levels of cache
    // _mm_prefetch((char *)num1, _MM_HINT_T0); // Prefetch into all cache levels
    // _mm_prefetch((char *)num2, _MM_HINT_T0); // Prefetch into all cache levels

    // set 0,0,1,0,1,2,0,1 th elements into a_vecin 32-bit zero extended reverse form
    __m512i a_vec_1 = _mm512_set_epi32(0, num1[1], 0, num1[0], 0, num1[2], 0, num1[1], 0, num1[0], 0, num1[1], 0, num1[0], 0, num1[0]); // in reverse order

    // set 0,1,0,2,1,0,3,2 th elements into b_vec in 32-bit zero extended reverse form
    __m512i b_vec_1 = _mm512_set_epi32(0, num2[2], 0, num2[3], 0, num2[0], 0, num2[1], 0, num2[2], 0, num2[0], 0, num2[1], 0, num2[0]);

    // multiply
    __m512i res_1 = _mm512_mul_epi32(a_vec_1, b_vec_1);
    _mm512_store_epi64(res, res_1);

    // set 2,3,0,1,2,3,4,0 th elements into a_vec in 32-bit zero extended reverse form
    __m512i a_vec_2 = _mm512_set_epi32(0, num1[0], 0, num1[4], 0, num1[3], 0, num1[2], 0, num1[1], 0, num1[0], 0, num1[3], 0, num1[2]);

    // set 1,0,4,3,2,1,0,5 th elements into b_vec in 32-bit zero extended reverse form
    __m512i b_vec_2 = _mm512_set_epi32(0, num2[5], 0, num2[0], 0, num2[1], 0, num2[2], 0, num2[3], 0, num2[4], 0, num2[0], 0, num2[1]);

    // multiply
    __m512i res_2 = _mm512_mul_epi32(a_vec_2, b_vec_2);
    _mm512_store_epi64(res + 8, res_2);

    // set 1,2,3,4,5,0,1,2 th elements into a_vec in 32-bit zero extended reverse form
    __m512i a_vec_3 = _mm512_set_epi32(0, num1[2], 0, num1[1], 0, num1[0], 0, num1[5], 0, num1[4], 0, num1[3], 0, num1[2], 0, num1[1]);

    // set 4,3,2,1,0,6,5,4 th elements into b_vec in 32-bit zero extended reverse form
    __m512i b_vec_3 = _mm512_set_epi32(0, num2[4], 0, num2[5], 0, num2[6], 0, num2[0], 0, num2[1], 0, num2[2], 0, num2[3], 0, num2[4]);

    // multiply
    __m512i res_3 = _mm512_mul_epi32(a_vec_3, b_vec_3);
    _mm512_store_epi64(res + 16, res_3);

    // set 3,4,5,6,0,1,2,3 th elements into a_vec in 32-bit zero extended reverse form
    __m512i a_vec_4 = _mm512_set_epi32(0, num1[3], 0, num1[2], 0, num1[1], 0, num1[0], 0, num1[6], 0, num1[5], 0, num1[4], 0, num1[3]);

    // set 3,2,1,0,7,6,5,4 th elements into b_vec in 32-bit zero extended reverse form
    __m512i b_vec_4 = _mm512_set_epi32(0, num2[4], 0, num2[5], 0, num2[6], 0, num2[7], 0, num2[0], 0, num2[1], 0, num2[2], 0, num2[3]);

    // multiply
    __m512i res_4 = _mm512_mul_epi32(a_vec_4, b_vec_4);
    _mm512_store_epi64(res + 24, res_4);

    // set 4,5,6,7,1,2,3,4 th elements into a_vec in 32-bit zero extended reverse form
    __m512i a_vec_5 = _mm512_set_epi32(0, num1[4], 0, num1[3], 0, num1[2], 0, num1[1], 0, num1[7], 0, num1[6], 0, num1[5], 0, num1[4]);

    // set 3,2,1,0,7,6,5,4 th elements into b_vec in 32-bit zero extended reverse form
    __m512i b_vec_5 = _mm512_set_epi32(0, num2[4], 0, num2[5], 0, num2[6], 0, num2[7], 0, num2[0], 0, num2[1], 0, num2[2], 0, num2[3]);

    // multiply
    __m512i res_5 = _mm512_mul_epi32(a_vec_5, b_vec_5);
    _mm512_store_epi64(res + 32, res_5);

    // set 5,6,7,2,3,4,5,6 th elements into a_vec in 32-bit zero extended reverse form
    __m512i a_vec_6 = _mm512_set_epi32(0, num1[6], 0, num1[5], 0, num1[4], 0, num1[3], 0, num1[2], 0, num1[7], 0, num1[6], 0, num1[5]);

    // set 3,2,1,7,6,5,4,3 th elements into b_vec in 32-bit zero extended reverse form
    __m512i b_vec_6 = _mm512_set_epi32(0, num2[3], 0, num2[4], 0, num2[5], 0, num2[6], 0, num2[7], 0, num2[1], 0, num2[2], 0, num2[3]);

    // multiply
    __m512i res_6 = _mm512_mul_epi32(a_vec_6, b_vec_6);
    _mm512_store_epi64(res + 40, res_6);

    // set 7,3,4,5,6,7,4,5 th elements into a_vec in 32-bit zero extended reverse form
    __m512i a_vec_7 = _mm512_set_epi32(0, num1[5], 0, num1[4], 0, num1[7], 0, num1[6], 0, num1[5], 0, num1[4], 0, num1[3], 0, num1[7]);

    // set 2,7,6,5,4,3,7,6 th elements into b_vec in 32-bit zero extended reverse form
    __m512i b_vec_7 = _mm512_set_epi32(0, num2[6], 0, num2[7], 0, num2[3], 0, num2[4], 0, num2[5], 0, num2[6], 0, num2[7], 0, num2[2]);

    // multiply
    __m512i res_7 = _mm512_mul_epi32(a_vec_7, b_vec_7);
    _mm512_store_epi64(res + 48, res_7);

    // set 6,7,5,6,7,6,7,7 th elements into a_vec in 32-bit zero extended reverse form
    __m512i a_vec_8 = _mm512_set_epi32(0, num1[7], 0, num1[7], 0, num1[6], 0, num1[7], 0, num1[6], 0, num1[5], 0, num1[7], 0, num1[6]);

    // set 5,4,7,6,5,7,6,7 th elements into b_vec in 32-bit zero extended reverse form
    __m512i b_vec_8 = _mm512_set_epi32(0, num2[7], 0, num2[6], 0, num2[7], 0, num2[5], 0, num2[6], 0, num2[7], 0, num2[4], 0, num2[5]);

    // multiply
    __m512i res_8 = _mm512_mul_epi32(a_vec_8, b_vec_8);
    _mm512_store_epi64(res + 56, res_8);
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
        // Branchless overflow detection
        uint64_t overflow = (((uint64_t)s0 - (uint32_t)a[0]) >> 63);
        a[0] = a[0] + (overflow << 32);
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

/*
    Function to multiply two numbers using the Urdhva Tiryakbhyam algorithm
    num1: First number to be multiplied
    num2: Second number to be multiplied
    res: Result of the multiplication
    max_idx: Maximum index of the result array: n*n
    n: Number of limbs in each number
*/
#define multiply(num1, num2, res, max_idx, n)                   \
    do                                                          \
    {                                                           \
        accumulate_multiply_AVX((num1), (num2), (res), (n));    \
        int __tmp_idx = add_limbs((n), ((max_idx) - 1), (res)); \
        adjust_limbs(__tmp_idx + 1, (res));                     \
    } while (0)
