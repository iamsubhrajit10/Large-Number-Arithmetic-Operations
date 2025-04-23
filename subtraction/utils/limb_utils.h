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

#define LIMB_SIZE 18             // Number of digits in each limb
#define MEMORY_POOL_SIZE 1 << 25 // 1 GB memory pool

// Define the aligned data types
typedef uint64_t aligned_uint64 __attribute__((aligned(64)));      // Define an aligned uint64_t
typedef uint64_t *aligned_uint64_ptr __attribute__((aligned(64))); // Define an aligned pointer to uint64_t

// Declare threshold for borrow propagation and limb digits
extern aligned_uint64 LIMB_DIGITS; // 10^18, used for carry/borrow-propagation, as we're using 64-bit integers; mostly saturated

// A structure to store the limbs
typedef struct
{
    aligned_uint64_ptr limbs; // Pointer to the limbs
    bool sign;                // Sign of the number
    size_t size;              // Size of the limbs
} limb_t;

// Declare the SIMD constants
extern __m512i AVX512_ZEROS;       // 0 as chunk of 8 64-bit integers
extern __m512i AVX512_ONES;        // 1 as chunk of 8 64-bit integers
extern __m512i AVX512_LIMB_DIGITS; // 10^18 as chunk of 8 64-bit integers

#define unlikely(expr) __builtin_expect(!!(expr), 0) // unlikely branch
#define likely(expr) __builtin_expect(!!(expr), 1)   // likely branch

// Memory pool functions
void init_memory_pool();
void *memory_pool_alloc(size_t size);
void memory_pool_free(void *ptr);
void destroy_memory_pool();

/**
 * @brief Allocates limb_t structure, with fixed alignment of 64
 *
 * @param size The number of limbs to allocate
 * @return limb_t* The pointer to the allocated memory
 * @note The memory should be freed using memory_pool_free
 */
limb_t *limb_t_alloc(size_t size);

/**
 * @brief Reallocates memory with fixed alignment of 64
 *
 * @param limb The pointer to the memory to reallocate
 * @param new_size The new size of the memory
 * @return limb_t* The pointer to the reallocated memory
 * @note The old memory is freed
 */
limb_t *limb_t_realloc(limb_t *limb, size_t new_size);

/**
 * @brief Frees memory allocated by limb_t_alloc
 *
 * @param limb The pointer to the limb_t structure to free
 * @return void
 */
void limb_t_free(limb_t *limb);

/**
 * @brief Converts a large number represented by a limb_t structure into a hex-string.
 *
 * @param num The number to convert
 * @return char* The string representation of the number
 */
char *limb_get_str(const limb_t *num);

/**
 * @biref Internal function to convert a limb_t structure into a hex-string, usually called by limb_get_str
 *
 * @param num The number to convert
 * @param str The string to store the result
 * @return void
 */
void __get_str(const limb_t *num, char *str);

/**
 * @brief Converts a hex-string representing a large number into a limb_t structure.
 *
 * This function takes a hex-string representing a large number and converts it into a limb_t structure.
 * The limbs are allocated with a fixed alignment of 64 bytes.
 *
 * @param str The number as a string.
 * @return A pointer to the limb_t structure representing the large number.
 */
limb_t *limb_set_str(const char *str);

/**
 * @brief Internal function to convert a hex-string into a limb_t structure, usually called by limb_set_str
 *
 * @param aligned_uint64_ptr digits The digits of the number
 * @param size_t n The number of digits
 * @param limb_t *num The number to convert
 *
 * @return void
 */
void __set_str(aligned_uint64_ptr digits, size_t n, limb_t *num);

/**
 * @brief Adjusts the sizes of two limb_t structures to be equal.
 *
 * This function takes two limb_t structures and adjusts their sizes to be equal by reallocating memory
 * and padding with zeros if necessary.
 *
 * @param num1 A pointer to the first limb_t structure.
 * @param num2 A pointer to the second limb_t structure.
 */
void limb_t_adjust_limb_sizes(limb_t *num1, limb_t *num2);

#endif // LIMB_UTILS_H