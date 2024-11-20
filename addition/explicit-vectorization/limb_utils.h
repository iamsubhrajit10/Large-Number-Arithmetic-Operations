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

// Declare the SIMD constants
__m512i zeros;       // 0 as chunk of 8 64-bit integers
__m512i ones;        // 1 as chunk of 8 64-bit integers
__m512i limb_digits; // 10^18 as chunk of 8 64-bit integers

#define unlikely(expr) __builtin_expect(!!(expr), 0) // unlikely branch
#define likely(expr) __builtin_expect(!!(expr), 1)   // likely branch

void limb_set_str(char *, char *, aligned_uint64_ptr *, aligned_uint64_ptr *, int *, int *); // Function to set the limbs from the string
char *limb_get_str(uint64_t *result, size_t *result_length, bool sign);                      // Function to get the string from the limbs

aligned_uint64_ptr aligned_realloc(aligned_uint64_ptr ptr, size_t old_size, size_t new_size, size_t alignment)
{
    aligned_uint64_ptr new_ptr = (aligned_uint64_ptr)_mm_malloc(new_size, alignment);
    if (new_ptr == NULL)
    {
        return NULL;
    }
    memcpy(new_ptr, ptr, old_size);
    _mm_free(ptr);
    return new_ptr;
}

char *limb_get_str(uint64_t *result, size_t *result_length, bool sign)
{
    // Remove leading zeros
    size_t i = 0;
    while (i < *result_length && result[i] == 0)
    {
        i++;
    }

    *result_length -= i;
    result += i;

    if (*result_length == 0)
    {
        char *temp = (char *)calloc(2, sizeof(char));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }
        temp[0] = '0';
        temp[1] = '\0';
        *result_length = 1;
        return temp;
    }

    if (sign)
    {
        result[0] = -result[0];
    }

    // Calculate the required size for the result string
    size_t alloc_size = (*result_length) * 20 + 2; // 20 digits per number + sign + null terminator
    char *result_str = (char *)calloc(alloc_size, sizeof(char));
    if (result_str == NULL)
    {
        perror("Memory allocation failed for result_str\n");
        exit(0);
    }

    // Format the first element separately (without leading zeros)
    char *ptr = result_str;
    if (result[0] > LIMB_DIGITS)
    {
        ptr += sprintf(ptr, "%" PRId64, (int64_t)result[0]); // Print as signed
    }
    else
    {
        ptr += sprintf(ptr, "%" PRIu64, result[0]); // Print as unsigned
    }

    // Handle the rest of the elements (with leading zeros)
    for (size_t j = 1; j < *result_length; j++)
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
        *result_length = 1;
        return temp;
    }

    char *final_result = strdup(ptr);
    if (final_result == NULL)
    {
        perror("Memory allocation failed for final_result\n");
        exit(0);
    }

    free(result_str);
    *result_length = strlen(final_result);
    return final_result;
}

void limb_set_str(char *str1, char *str2, aligned_uint64_ptr *limbs1_base, aligned_uint64_ptr *limbs2_base, int *n_1, int *n_2)
{
    int len1 = strlen(str1);
    int len2 = strlen(str2);

    *n_1 = len1;
    *n_2 = len2;

    // Calculate number of limbs required for both numbers
    int num_limbs_1 = (len1 + LIMB_SIZE - 1) / LIMB_SIZE;
    int num_limbs_2 = (len2 + LIMB_SIZE - 1) / LIMB_SIZE;
    int max_limbs = num_limbs_1 > num_limbs_2 ? num_limbs_1 : num_limbs_2;

    // Allocate memory for the limbs
    aligned_uint64_ptr limbs1 = (aligned_uint64_ptr)_mm_malloc(max_limbs * sizeof(uint64_t), 64);
    aligned_uint64_ptr limbs2 = (aligned_uint64_ptr)_mm_malloc(max_limbs * sizeof(uint64_t), 64);

    if (limbs1 == NULL || limbs2 == NULL)
    {
        perror("Memory allocation failed for limbs");
        exit(1);
    }

    memset(limbs1, 0, max_limbs * sizeof(uint64_t));
    memset(limbs2, 0, max_limbs * sizeof(uint64_t));

    // Populate limbs for num1
    int i, k;
    int limbs_offset_1 = max_limbs - num_limbs_1;
    int limbs_offset_2 = max_limbs - num_limbs_2;

    // Populate limbs for num1
    for (i = len1 - 1, k = num_limbs_1 - 1; k >= 0; k--)
    {
        uint64_t limb = 0;
        uint64_t power = 1;
        int digits_in_limb = LIMB_SIZE < (i + 1) ? LIMB_SIZE : (i + 1);
        for (int j = 0; j < digits_in_limb; j++, i--)
        {
            limb += (str1[i] - '0') * power;
            power = (power << 3) + (power << 1); // power *= 10
        }
        limbs1[limbs_offset_1 + k] = limb;
    }

    // Populate limbs for num2
    for (i = len2 - 1, k = num_limbs_2 - 1; k >= 0; k--)
    {
        uint64_t limb = 0;
        uint64_t power = 1;
        int digits_in_limb = LIMB_SIZE < (i + 1) ? LIMB_SIZE : (i + 1);
        for (int j = 0; j < digits_in_limb; j++, i--)
        {
            limb += (str2[i] - '0') * power;
            power = (power << 3) + (power << 1); // power *= 10
        }
        limbs2[limbs_offset_2 + k] = limb;
    }
    // Set the updated arrays and their new lengths
    *limbs1_base = limbs1;
    *limbs2_base = limbs2;
    *n_1 = max_limbs;
    *n_2 = max_limbs;
}

#endif // LIMB_UTILS_H