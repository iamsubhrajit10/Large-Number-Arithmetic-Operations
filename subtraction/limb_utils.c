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

#define LIMB_BITS 64             // Number of hex digits in each limb
#define bits 4                   // Number of bits in each hex digit
#define MEMORY_POOL_SIZE 1 << 25 // 1 GB memory pool

// Define the aligned data types
typedef uint64_t aligned_uint64 __attribute__((aligned(64)));      // Define an aligned uint64_t
typedef uint64_t *aligned_uint64_ptr __attribute__((aligned(64))); // Define an aligned pointer to uint64_t

// Declare the SIMD constants
__m512i AVX512_ZEROS; // AVX512 vector of zeros
__m256i AVX256_ZEROS; // AVX256 vector of zeros
__m128i AVX128_ZEROS; // AVX128 vector of zeros
__m512i AVX512_MASK;  // AVX512 vector of 52-bit mask
__m256i AVX256_MASK;  // AVX256 vector of 52-bit mask
__m128i AVX128_MASK;  // AVX128 vector of 52-bit mask

// Memory pool variables
static uint8_t *memory_pool = NULL;
static size_t memory_pool_offset = 0;
static size_t memory_pool_free_count = 0;

void init_memory_pool()
{
    memory_pool = (uint8_t *)_mm_malloc(MEMORY_POOL_SIZE, 64);
    if (memory_pool == NULL)
    {
        perror("Memory allocation failed for memory pool\n");
        exit(EXIT_FAILURE);
    }
    memory_pool_offset = 0;
    AVX512_ZEROS = _mm512_setzero_si512();
    AVX256_ZEROS = _mm256_setzero_si256();
    AVX128_ZEROS = _mm_setzero_si128();

    AVX512_MASK = _mm512_set1_epi64(0xFFFFFFFFFFFFFFFF);
    AVX256_MASK = _mm256_set1_epi64x(0xFFFFFFFFFFFFFFFF);
    AVX128_MASK = _mm_set1_epi64x(0xFFFFFFFFFFFFFFFF);
}

void *memory_pool_alloc(size_t size)
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

void memory_pool_free(void *ptr)
{
    // if the offset is greater than 512MB, reset the memory pool
    if (memory_pool_offset > (MEMORY_POOL_SIZE >> 1))
    {
        memory_pool_offset = 0;
        memory_pool_free_count++;
        memset(memory_pool, 0, MEMORY_POOL_SIZE);
    }
}

void destroy_memory_pool()
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

    limb_t *limb = (limb_t *)memory_pool_alloc(sizeof(limb_t));
    // check if the memory allocation failed
    if (limb == NULL)
    {
        perror("Memory allocation failed for limb_t structure\n");
        exit(EXIT_FAILURE);
    }

    // Allocate memory with fixed alignment of 64
    limb->limbs = (uint64_t *)memory_pool_alloc(size * sizeof(uint64_t));
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
    // Check if the limb is NULL
    if (limb == NULL)
    {
        return NULL;
    }

    // Check if the size is the same
    if (limb->size == new_size)
    {
        return limb;
    }

    // Check if the new size is 0
    if (new_size == 0)
    {
        memory_pool_free(limb->limbs);
        limb->limbs = NULL;
        limb->size = 0;
        return limb;
    }

    // Allocate new memory with fixed alignment of 64
    uint64_t *new_limbs = (uint64_t *)memory_pool_alloc(new_size * sizeof(uint64_t));
    if (new_limbs == NULL)
    {
        return NULL;
    }

    // Copy old data to new memory, preserving least significant digits at lower indices
    size_t copy_size = limb->size < new_size ? limb->size : new_size;
    memcpy(new_limbs, limb->limbs, copy_size * sizeof(uint64_t));

    // If growing, append zeros at the end (higher indices)
    if (new_size > limb->size)
    {
        memset(new_limbs + copy_size, 0, (new_size - copy_size) * sizeof(uint64_t));
    }

    // Free the old memory and update limb structure
    memory_pool_free(limb->limbs);
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
            memory_pool_free(limb->limbs);
        }
        memory_pool_free(limb);
    }
    limb = NULL;
}

void __get_str(const limb_t *num, char *str)
{
    char *sp = str;
    const char *digits = "0123456789abcdef";
    if (num->sign)
    {
        *sp++ = '-';
    }
    size_t num_limbs = num->size;
    unsigned char mask = 0xF; // Assuming 4 bits per digit (hex)
    bool leading_zeros = true;

    // Start from the most significant limb (highest index)
    for (int i = num_limbs - 1; i >= 0; i--)
    {
        for (int shift = LIMB_BITS - bits; shift >= 0; shift -= bits)
        {
            unsigned char digit = (num->limbs[i] >> shift) & mask;
            // Skip leading zeros until we find a non-zero digit
            if (digit != 0 || !leading_zeros)
            {
                *sp++ = digits[digit];
                leading_zeros = false;
            }
        }
    }
    // If all digits were zero, output a single '0'
    if (leading_zeros)
    {
        *sp++ = '0';
    }
    *sp = '\0';
}

char *limb_get_str(const limb_t *num)
{
    if (num == NULL || num->size == 0 || num->limbs == NULL)
    {
        return NULL;
    }

    if (num->size == 1 && num->limbs[0] == 0)
    {
        char *zero = (char *)memory_pool_alloc(2); // Allocate for "0\0"
        if (zero == NULL)
        {
            perror("Memory allocation failed for string\n");
            exit(EXIT_FAILURE);
        }
        strcpy(zero, "0");
        return zero;
    }
    // Calculate string length: each limb produces LIMB_BITS/bits digits, plus sign and null terminator
    size_t hex_len = (num->size * LIMB_BITS + bits - 1) / bits + 2; // +2 for sign and '\0'

    char *str = (char *)memory_pool_alloc(hex_len);
    if (str == NULL)
    {
        perror("Memory allocation failed for string\n");
        exit(EXIT_FAILURE);
    }

    __get_str(num, str);

    // If the string is just a negative sign, add a zero
    if (str[0] == '-' && str[1] == '\0')
    {
        str[1] = '0';
        str[2] = '\0';
    }

    return str;
}

void __set_str(aligned_uint64_ptr digits, size_t n, limb_t *num)
{
    // Convert the digits to limbs, working from least significant to most significant
    size_t num_limbs = num->size;
    aligned_uint64 limb = 0;
    unsigned shift = 0;
    int limb_index = 0; // Start from index 0 instead of num_limbs-1

    // Iterate from start (least significant digit) to end
    for (size_t i = 0; i < n;)
    {
        for (shift = 0; shift < LIMB_BITS && i < n; shift += bits)
        {
            limb |= (aligned_uint64)digits[i] << shift;
            i++;
        }
        num->limbs[limb_index++] = limb;
        limb = 0;
    }
    // Fill remaining limbs with zero if any
    while (limb_index < num_limbs)
    {
        num->limbs[limb_index++] = 0;
    }
    num->size = num_limbs;
}

limb_t *limb_set_str(const char *str)
{
    // Check if the string is NULL or empty
    if (str == NULL || strlen(str) == 0)
    {
        return NULL;
    }

    // Allocate temporary memory for hex-string to digit conversion
    size_t hex_len = strlen(str);
    aligned_uint64_ptr digits = (uint64_t *)memory_pool_alloc(hex_len * sizeof(uint64_t));
    if (digits == NULL)
    {
        perror("Memory allocation failed for digits\n");
        exit(EXIT_FAILURE);
    }

    // Extract sign and omit any whitespace
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

    // Calculate actual length after skipping sign and whitespace
    size_t actual_len = strlen(sp);

    // Convert the hex-string to digits in reverse order
    for (size_t i = 0; i < actual_len; i++)
    {
        char c = sp[actual_len - 1 - i]; // Read characters from end to start
        // If the character is between 0-9
        if (c >= '0' && c <= '9')
        {
            digits[i] = c - '0';
        }
        // If the character is between A-F
        else if (c >= 'A' && c <= 'F')
        {
            digits[i] = c - 'A' + 10;
        }
        // If the character is between a-f
        else if (c >= 'a' && c <= 'f')
        {
            digits[i] = c - 'a' + 10;
        }
        else
        {
            perror("Invalid character in hex-string\n");
            exit(EXIT_FAILURE);
        }
    }

    size_t num_limbs = (actual_len * bits + LIMB_BITS - 1) / LIMB_BITS; // ceil(actual_len * bits / LIMB_BITS)
    limb_t *num = limb_t_alloc(num_limbs);
    if (num == NULL)
    {
        perror("Memory allocation failed for num\n");
        exit(EXIT_FAILURE);
    }
    num->size = num_limbs;
    num->sign = sign;

    __set_str(digits, actual_len, num);
    memory_pool_free(digits); // Free the temporary digits array
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