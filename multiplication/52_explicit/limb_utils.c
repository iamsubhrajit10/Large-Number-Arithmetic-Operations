#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <immintrin.h>
#include <inttypes.h>
#include <errno.h>
#include <gmp.h>
#include <time.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/syscall.h>
#include <ctype.h>
#include "limb_utils.h"

#define LIMB_BITS 52             // Number of hex bits in each limb
#define bits 4                   // Number of bits in each hex digit
#define MEMORY_POOL_SIZE 1 << 30 // 1 GB memory pool

// Define the aligned data types
typedef uint64_t aligned_uint64 __attribute__((aligned(64)));      // Define an aligned uint64_t
typedef uint64_t *aligned_uint64_ptr __attribute__((aligned(64))); // Define an aligned pointer to uint64_t

#define unlikely(expr) __builtin_expect(!!(expr), 0) // unlikely branch
#define likely(expr) __builtin_expect(!!(expr), 1)   // likely branch

// Memory pool variables
static uint8_t *memory_pool = NULL;
static size_t memory_pool_offset = 0;
static size_t memory_pool_free_count = 0;
__m512i AVX512_ZEROS;
__m512i a_vec_0_perm_idx;
__m512i a_vec_1_perm_idx;
__m512i b_vec_1_perm_idx;
__m512i b_vec_0_perm_idx;
__m512i a_vec_2_perm_idx;
__m512i b_vec_2_perm_idx;
__m512i hi_0_perm_0_idx;
__m512i hi_1_perm_0_idx;
__m512i hi_1_perm_1_idx;
__m512i hi_2_perm_0_idx;
__m512i hi_2_perm_1_idx;

void init_utils()
{
    memory_pool = (uint8_t *)_mm_malloc(MEMORY_POOL_SIZE, 64);
    if (memory_pool == NULL)
    {
        perror("Memory allocation failed for memory pool\n");
        exit(EXIT_FAILURE);
    }
    memory_pool_offset = 0;
    a_vec_0_perm_idx = _mm512_set_epi64(1, 0, 2, 1, 0, 1, 0, 0);
    a_vec_1_perm_idx = _mm512_set_epi64(1, 4, 3, 2, 1, 0, 3, 2);
    b_vec_1_perm_idx = _mm512_set_epi64(4, 0, 1, 2, 3, 4, 0, 1);
    b_vec_0_perm_idx = _mm512_set_epi64(2, 3, 0, 1, 2, 0, 1, 0);
    a_vec_2_perm_idx = _mm512_set_epi64(4, 3, 4, 3, 2, 4, 3, 2);
    b_vec_2_perm_idx = _mm512_set_epi64(3, 4, 2, 3, 4, 1, 2, 3);
    hi_0_perm_0_idx = _mm512_set_epi64(0, 0, 0, 7, 6, 4, 3, 1);
    hi_1_perm_0_idx = _mm512_set_epi64(3, 2, 0, 0, 0, 0, 0, 0);
    hi_1_perm_1_idx = _mm512_set_epi64(0, 0, 0, 0, 0, 7, 5, 4);
    hi_2_perm_0_idx = _mm512_set_epi64(3, 0, 2, 1, 0, 0, 0, 0);
    hi_2_perm_1_idx = _mm512_set_epi64(0, 0, 0, 7, 6, 0, 5, 4);
}

void *__memory_pool_alloc(size_t size)
{
    // Align the memory offset to 64 bytes
    size_t aligned_offset = (memory_pool_offset + 63) & ~((size_t)63);

    if (aligned_offset + size > MEMORY_POOL_SIZE)
    {
        perror("Memory pool exhausted\n");
        exit(EXIT_FAILURE);
    }

    void *ptr = memory_pool + aligned_offset;
    memory_pool_offset = aligned_offset + size;
    return ptr;
}

void __memory_pool_free(void *ptr)
{
    // if the offset is greater than 512MB, reset the memory pool
    if (memory_pool_offset > (MEMORY_POOL_SIZE >> 1))
    {
        memory_pool_offset = 0;
        memory_pool_free_count++;
        memset(memory_pool, 0, MEMORY_POOL_SIZE);
    }
}

void clear_utils()
{
    if (memory_pool != NULL)
    {
        _mm_free(memory_pool);
        memory_pool = NULL;
        memory_pool_offset = 0;
    }
}

limb_t *limb_t_alloc(size_t size)
{
    // check if the size is 0
    if (size == 0)
    {
        return NULL;
    }

    limb_t *limb = (limb_t *)__memory_pool_alloc(sizeof(limb_t));
    // check if the memory allocation failed
    if (limb == NULL)
    {
        perror("Memory allocation failed for limb_t structure\n");
        exit(EXIT_FAILURE);
    }

    // Allocate memory with fixed alignment of 64
    limb->limbs = (uint64_t *)__memory_pool_alloc(size * sizeof(uint64_t));
    // check if the memory allocation failed
    if (limb->limbs == NULL)
    {
        perror("Memory allocation failed for limb_t_alloc\n");
        exit(EXIT_FAILURE);
    }

    limb->size = size;
    limb->sign = false; // Initialize sign to false (positive)

    return limb;
}

limb_t *limb_t_realloc(limb_t *limb, size_t new_size)
{
    // Check if the size is the same
    if (limb->size == new_size)
    {
        return limb;
    }
    // Check if the new size is 0
    if (new_size == 0)
    {
        __memory_pool_free(limb->limbs);
        limb->limbs = NULL;
        limb->size = 0;
        return limb;
    }

    // Allocate new memory with fixed alignment of 64
    uint64_t *new_limbs = (uint64_t *)__memory_pool_alloc(new_size * sizeof(uint64_t));
    if (new_limbs == NULL)
    {
        return NULL;
    }

    // Copy old data to new memory, while prepending zeros
    size_t copy_size = limb->size < new_size ? limb->size : new_size;
    memcpy(new_limbs + (new_size - copy_size), limb->limbs, copy_size * sizeof(uint64_t));
    memset(new_limbs, 0, (new_size - copy_size) * sizeof(uint64_t));

    // Update limb structure
    limb->limbs = new_limbs;
    limb->size = new_size;

    return limb;
}

void limb_t_free(limb_t *limb)
{
    if (limb != NULL)
    {
        if (limb->limbs != NULL)
        {
            __memory_pool_free(limb->limbs);
        }
        __memory_pool_free(limb);
    }
    limb = NULL;
}

void __get_str(const limb_t *num, char *str)
{
    char *sp = str;
    const char *digits = "0123456789ABCDEF";
    if (num->sign)
    {
        *sp++ = '-';
    }
    size_t num_limbs = num->size;

    // unsigned char mask = (1U << bits) - 1; // 0xF
    unsigned char mask = 0xF;
    signed shift = 0;
    for (int i = 0; i < num_limbs; i++)
    {
        for (shift = LIMB_BITS - bits; shift >= 0; shift -= bits)
        {
            unsigned char digit = (num->limbs[i] >> shift) & mask;
            *sp++ = digits[digit];
        }
    }
    *sp = '\0';
    // remove leading zeros before returning
    while (*str == '0' && *(str + 1) != '\0')
    {
        str++;
    }
}

char *limb_get_str(const limb_t *num)
{

    size_t num_limbs = num->size;
    if (num_limbs == 0)
    {
        return NULL;
    }
    if (num->limbs == NULL || num->size == 0)
    {
        return NULL;
    }

    if (num->size == 1 && num->limbs[0] == 0)
    {
        return "0";
    }

    size_t hex_len = (num_limbs * LIMB_BITS + bits - 1) / bits + 1; // ceil(num_limbs * LIMB_BITS / bits) + 1

    char *str = (char *)__memory_pool_alloc(hex_len);
    if (str == NULL)
    {
        perror("Memory allocation failed for string\n");
        exit(EXIT_FAILURE);
    }
    __get_str(num, str);
    return str;
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

void __set_str(aligned_uint64_ptr digits, size_t n, limb_t *num)
{
    // Convert the digits to limbs
    size_t num_limbs = num->size;
    aligned_uint64 limb = 0;
    unsigned shift = 0;
    int limb_index = num_limbs - 1;
    for (int i = n - 1; i >= 0;)
    {
        for (shift = 0; shift < LIMB_BITS; shift += bits)
        {
            if (i < 0)
            {
                break;
            }
            limb |= digits[i] << shift;
            i--;
        }
        num->limbs[limb_index--] = limb;
        limb = 0;
    }
    if (limb != 0)
    {
        num->limbs[limb_index--] = limb;
    }
    num->size = num_limbs;
}

limb_t *limb_set_str(const char *str)
{
    // check if the string is NULL or empty
    if (str == NULL || strlen(str) == 0)
    {
        return NULL;
    }

    // allocate temporary memory for hex-string to digit conversion
    size_t hex_len = strlen(str);

    aligned_uint64_ptr digits = (uint64_t *)__memory_pool_alloc(hex_len * sizeof(uint64_t));
    if (digits == NULL)
    {
        perror("Memory allocation failed for digits\n");
        exit(EXIT_FAILURE);
    }

    // extract sign and omit any whitespace
    bool sign = false;
    if (str[0] == '-')
    {
        sign = true;
    }

    const char *sp = str + (sign ? 1 : 0);
    while (isspace(*sp))
    {
        sp++;
    }

    // Convert the hex-string to digits
    for (size_t i = 0; i < hex_len; i++)
    {
        // if the character is between 0-9
        if (sp[i] >= '0' && sp[i] <= '9')
        {
            digits[i] = sp[i] - '0';
        }
        // if the character is between A-F
        else if (sp[i] >= 'A' && sp[i] <= 'F')
        {
            digits[i] = sp[i] - 'A' + 10;
        }
        // if the character is between a-f
        else if (sp[i] >= 'a' && sp[i] <= 'f')
        {
            digits[i] = sp[i] - 'a' + 10;
        }
        else
        {
            perror("Invalid character in hex-string\n");
            exit(EXIT_FAILURE);
        }
    }
    size_t num_limbs = (hex_len * bits + LIMB_BITS - 1) / LIMB_BITS; // ceil(hex_len * bits / LIMB_BITS)
    limb_t *num = limb_t_alloc(num_limbs);
    if (num == NULL)
    {
        perror("Memory allocation failed for num\n");
        exit(EXIT_FAILURE);
    }
    num->size = num_limbs;
    num->sign = sign;

    __set_str(digits, hex_len, num);
    return num;
}

void limb_t_adjust_limb_sizes(limb_t *num1, limb_t *num2)
{
    if (num1->size == num2->size)
    {
        return;
    }

    size_t max_size = num1->size > num2->size ? num1->size : num2->size;

    if (num1->size < max_size)
    {
        num1 = limb_t_realloc(num1, max_size);
        if (num1->limbs == NULL)
        {
            perror("Memory reallocation failed for num1\n");
            exit(1);
        }
        num1->size = max_size;
    }

    if (num2->size < max_size)
    {
        num2 = limb_t_realloc(num2, max_size);
        if (num2->limbs == NULL)
        {
            perror("Memory reallocation failed for num2\n");
            exit(1);
        }
        num2->size = max_size;
    }
}
