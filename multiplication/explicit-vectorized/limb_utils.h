#ifndef LIMB_UTILS_H
#define LIMB_UTILS_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <immintrin.h>
#include <inttypes.h>
#include <errno.h>

#define LIMB_SIZE 18 // Number of digits in each limb

// Define the aligned data types
typedef uint64_t aligned_uint64 __attribute__((aligned(64)));      // Define an aligned uint64_t
typedef uint64_t *aligned_uint64_ptr __attribute__((aligned(64))); // Define an aligned pointer to uint64_t
// Declare threshold for borrow propagation and limb digits
aligned_uint64 LIMB_DIGITS = 1000000000000000000ULL; // 10^18, used for carry/borrow-propagation, as we're using 64-bit integers; mostly saturated

// A structure to store the limbs
typedef struct
{
    aligned_uint64_ptr limbs; // Pointer to the limbs
    bool sign;                // Sign of the number
    size_t size;              // Size of the limbs
} limb_t;

// Declare the SIMD constants
__m512i AVX512_ZEROS;       // 0 as chunk of 8 64-bit integers
__m512i AVX512_ONES;        // 1 as chunk of 8 64-bit integers
__m512i AVX512_LIMB_DIGITS; // 10^18 as chunk of 8 64-bit integers

#define unlikely(expr) __builtin_expect(!!(expr), 0) // unlikely branch
#define likely(expr) __builtin_expect(!!(expr), 1)   // likely branch

/**
 * @brief Allocates limb_t structure, with fixed alignment of 64
 *
 * @param size The number of limbs to allocate
 * @return limb_t* The pointer to the allocated memory
 * @note The memory should be freed using aligned_free
 */
limb_t *limb_t_alloc(size_t size)
{
    // check if the size is 0
    if (size == 0)
    {
        return NULL;
    }

    limb_t *limb = (limb_t *)malloc(sizeof(limb_t));
    // check if the memory allocation failed
    if (limb == NULL)
    {
        perror("Memory allocation failed for limb_t structure\n");
        exit(0);
    }

    // Allocate memory with fixed alignment of 64
    limb->limbs = (uint64_t *)_mm_malloc(size * sizeof(uint64_t), 64);
    // check if the memory allocation failed
    if (limb->limbs == NULL)
    {
        perror("Memory allocation failed for limb_t_alloc\n");
        free(limb);
        exit(0);
    }

    limb->size = size;
    limb->sign = false; // Initialize sign to false (positive)

    return limb;
}

/**
 * @brief Reallocates memory with fixed alignment of 64
 *
 * @param limb The pointer to the memory to reallocate
 * @param new_size The new size of the memory
 * @return limb_t* The pointer to the reallocated memory
 * @note The old memory is freed
 */
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
        _mm_free(limb->limbs);
        limb->limbs = NULL;
        limb->size = 0;
        return limb;
    }

    // Allocate new memory with fixed alignment of 64
    uint64_t *new_limbs = (uint64_t *)_mm_malloc(new_size * sizeof(uint64_t), 64);
    if (new_limbs == NULL)
    {
        return NULL;
    }

    // Copy old data to new memory
    size_t copy_size = limb->size < new_size ? limb->size : new_size;
    memcpy(new_limbs, limb->limbs, copy_size * sizeof(uint64_t));

    // Free old memory
    _mm_free(limb->limbs);

    // Update limb structure
    limb->limbs = new_limbs;
    limb->size = new_size;

    return limb;
}

/**
 * @brief Frees memory allocated by limb_t_alloc
 *
 * @param limb The pointer to the limb_t structure to free
 * @return void
 */
void limb_t_free(limb_t *limb)
{
    if (limb != NULL)
    {
        if (limb->limbs != NULL)
        {
            _mm_free(limb->limbs);
        }
        free(limb);
    }
}

/**
 * @brief Converts a large number represented by a limb_t structure into a string
 *
 * @param num The number to convert
 * @return char* The string representation of the number
 */
char *limb_get_str(const limb_t *num)
{
    // Remove leading zeros
    size_t i = 0;
    while (i < num->size && num->limbs[i] == 0)
    {
        i++;
    }

    size_t result_length = num->size - i;
    const uint64_t *result = num->limbs + i;

    if (result_length == 0)
    {
        char *temp = (char *)calloc(2, sizeof(char));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }
        temp[0] = '0';
        temp[1] = '\0';
        return temp;
    }

    // Calculate the required size for the result string
    size_t alloc_size = result_length * 20 + 2; // 20 digits per number + sign + null terminator
    char *result_str = (char *)calloc(alloc_size, sizeof(char));
    if (result_str == NULL)
    {
        perror("Memory allocation failed for result_str\n");
        exit(0);
    }

    // Format the first element separately (without leading zeros)
    char *ptr = result_str;
    if (num->sign)
    {
        ptr += sprintf(ptr, "-");
    }
    if (result[0] > LIMB_DIGITS)
    {
        ptr += sprintf(ptr, "%" PRId64, (int64_t)result[0]); // Print as signed
    }
    else
    {
        ptr += sprintf(ptr, "%" PRIu64, result[0]); // Print as unsigned
    }

    // Handle the rest of the elements (with leading zeros)
    for (size_t j = 1; j < result_length; j++)
    {
        ptr += sprintf(ptr, "%018" PRIu64, result[j]); // Print with leading zeros
    }

    // Remove leading zeros from the final result
    ptr = result_str;
    while (*ptr == '0')
    {
        ptr++;
    }

    if (*ptr == '\0')
    {
        free(result_str);
        char *temp = (char *)calloc(2, sizeof(char));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }
        temp[0] = '0';
        temp[1] = '\0';
        return temp;
    }

    char *final_result = strdup(ptr);
    if (final_result == NULL)
    {
        perror("Memory allocation failed for final_result\n");
        exit(0);
    }

    free(result_str);
    return final_result;
}

/**
 * @brief Converts a string representing a large number into a limb_t structure.
 *
 * This function takes a string representing a large number and converts it into a limb_t structure.
 * The limbs are allocated with a fixed alignment of 64 bytes.
 *
 * @param str The number as a string.
 * @return A pointer to the limb_t structure representing the large number.
 */
limb_t *limb_set_str(const char *str)
{
    int len = strlen(str);
    int num_limbs = (len + LIMB_SIZE - 1) / LIMB_SIZE;

    // Allocate memory for the limb_t structure
    limb_t *num = limb_t_alloc(num_limbs);

    // Populate limbs
    int i, k;
    for (i = len - 1, k = num_limbs - 1; k >= 0; k--)
    {
        uint64_t limb = 0;
        uint64_t power = 1;
        int digits_in_limb = LIMB_SIZE < (i + 1) ? LIMB_SIZE : (i + 1);
        for (int j = 0; j < digits_in_limb; j++, i--)
        {
            limb += (str[i] - '0') * power;
            power = (power << 3) + (power << 1); // power *= 10
        }
        num->limbs[k] = limb;
    }

    return num;
}

/**
 * @brief Converts a string representing a large number into a limb_t structure.
 *
 * This function takes a string representing a large number and converts it into a limb_t structure.
 * The limbs are allocated with a fixed alignment of 64 bytes.
 *
 * @param str The number as a string.
 * @return A pointer to the limb_t structure representing the large number.
 */
limb_t *limb_set_str(const char *str)
{
    int len = strlen(str);
    int num_limbs = (len + LIMB_SIZE - 1) / LIMB_SIZE;

    // Allocate memory for the limb_t structure
    limb_t *num = limb_t_alloc(num_limbs);

    if (num == NULL || num->limbs == NULL)
    {
        perror("Memory allocation failed for num\n");
        exit(1);
    }

    // Populate limbs
    int i, k;
    for (i = len - 1, k = num_limbs - 1; k >= 0; k--)
    {
        uint64_t limb = 0;
        uint64_t power = 1;
        int digits_in_limb = LIMB_SIZE < (i + 1) ? LIMB_SIZE : (i + 1);
        for (int j = 0; j < digits_in_limb; j++, i--)
        {
            limb += (str[i] - '0') * power;
            power = (power << 3) + (power << 1); // power *= 10
        }
        num->limbs[k] = limb;
    }

    return num;
}

/**
 * @brief Adjusts the sizes of two limb_t structures to be equal.
 *
 * This function takes two limb_t structures and adjusts their sizes to be equal by reallocating memory
 * and padding with zeros if necessary.
 *
 * @param num1 A pointer to the first limb_t structure.
 * @param num2 A pointer to the second limb_t structure.
 */
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
        memset(num1->limbs + num1->size, 0, (max_size - num1->size) * sizeof(uint64_t));
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
        memset(num2->limbs + num2->size, 0, (max_size - num2->size) * sizeof(uint64_t));
        num2->size = max_size;
    }
}

#endif // LIMB_UTILS_H