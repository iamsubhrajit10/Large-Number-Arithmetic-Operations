#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
// Precomputed memory to be utilized by the Karatsuba algorithm and its helper functions
uint16_t *memory, *add_memory, *sub_memory, *product_memory, *carry_memory;

// Declare the helper functions
uint16_t *add(uint16_t *num1, uint16_t *num2, int length);
uint16_t *sub(uint16_t *num1, uint16_t *num2, int length);
uint16_t *extract_MSB_digits(uint16_t *number, int length);
uint16_t *remove_leading_zeros_16_t(uint16_t *number, int *length);
void urdhva(uint16_t *number1, uint16_t *number2, int n, uint16_t *product, uint16_t *carry);

// function to implement Karatsuba algorithm, with no memory allocation using calloc/malloc involved within the function and called functions
void karatsuba(uint16_t *num1, uint16_t *num2, int length, uint16_t *result, uint16_t *mem)
{
    // Base Case: if length <=32, use Urdhva Tiryagbhyam Multiplication Algorithm
    if (length <= 32)
    {
        uint16_t *urdhva_product = product_memory, *urdhva_carry = carry_memory;
        urdhva(num1, num2, length, urdhva_product, urdhva_carry);
        return;
    }
    // Recursive Case: Karatsuba Algorithm
    int half = length / 2;
    uint16_t *a = mem;
    uint16_t *b = mem + half;
    uint16_t *c = mem + 2 * half;
    uint16_t *d = mem + 3 * half;
    uint16_t *ac = mem + 4 * half;
    uint16_t *bd = mem + 5 * half;
    uint16_t *abcd = mem + 6 * half;
    // Splitting the numbers into two halves
    for (int i = 0; i < half; i++)
    {
        a[i] = num1[i];
        b[i] = num1[i + half];
        c[i] = num2[i];
        d[i] = num2[i + half];
    }
    // Recursively calculating ac, bd, and abcd
    karatsuba(a, c, half, ac, mem + 7 * half);
    karatsuba(b, d, half, bd, mem + 7 * half);
    karatsuba(add(a, b, half), add(c, d, half), half, abcd, mem + 7 * half);
    // Calculating the result
    for (int i = 0; i < length; i++)
    {
        result[i] += ac[i];
        result[i + half] += abcd[i] - ac[i] - bd[i];
        result[i + 2 * half] += bd[i];
    }
    return;
}

// Pre-allocate memory for the Karatsuba's helper function
uint16_t *add_memory, *sub_memory;

// function to add two numbers, also avoid allocation of memory using calloc/malloc, use preallocated memory
uint16_t *add(uint16_t *num1, uint16_t *num2, int length)
{
    uint16_t *result = add_memory;
    for (int i = 0; i < length; i++)
    {
        result[i] = num1[i] + num2[i];
    }
}

// function to subtract two numbers, also avoid allocation of memory using calloc/malloc, use preallocated memory
uint16_t *sub(uint16_t *num1, uint16_t *num2, int length)
{
    uint16_t *result = sub_memory;
    for (int i = 0; i < length; i++)
    {
        result[i] = num1[i] - num2[i];
    }
}

uint16_t *msb_result;
// helper function to extract the most significant digits seperately for urdhva MSB
uint16_t *extract_MSB_digits(uint16_t *number, int length)
{
    int result_length = length;
    if (number[0] > 9)
    {
        // find the number of digits in the most significant digit
        int temp = number[0];
        while (temp > 9)
        {
            temp = temp / 10;
            result_length++;
        }
    }
    else
        return number;
    // extract the most significant digits and store in result
    // adjust msb_result to store the most significant digits
    msb_result = realloc(msb_result, result_length * sizeof(uint16_t));
    int i = result_length - length;
    while (number[0] > 0)
    {
        msb_result[i--] = number[0] % 10;
        number[0] = number[0] / 10;
    }
    // Copy the remaining digits of number to result
    int j;
    for (i = result_length - length + 1, j = 1; j < length; j++, i++)
    {
        msb_result[i] = number[j];
    }
    return msb_result;
}

uint16_t *remove_leading_zeros_16_t(uint16_t *number, int *length)
{
    int i = 0;
    while (i < *length && number[i] == 0)
    {
        i++;
    }
    *length = *length - i;
    return number + i;
}

// Refactored function to perform Urdhva-Tiryagbhyam multiplication on two numbers represented as arrays of digits
uint16_t *urdhva(uint16_t *number1, uint16_t *number2, int n, uint16_t *product, uint16_t *carry, int *result_length)
{
    // printf("Performing Urdhva-Tiryagbhyam multiplication\n");
    // memset(product, 0, 2 * n * sizeof(uint16_t));
    // memset(carry, 0, 2 * n * sizeof(uint16_t));
    int max_index = n << 1;
    uint16_t p; // Use uint16_t for intermediate product calculation
    for (int sum = 0; sum < max_index; sum++)
    {
        p = 0; // Reset p for each sum iteration
        int start = (sum - (n - 1) > 0) ? sum - (n - 1) : 0;
        int end = (sum < n) ? sum : n - 1;

        int n2_index = sum - start; // Initialize n2_index based on the starting value
        for (int n1_index = start; n1_index <= end; n1_index++, n2_index--)
        {
            p += number1[n1_index] * number2[n2_index];
        }
        if (sum != 0)
        {
            carry[sum - 1] = p / 10;
            product[sum] = p % 10;
        }
        else
        {
            product[sum] = p; // For the very first digit, there's no carry to consider
        }
    }
    // Adjust the carry and product in the second loop
    uint16_t c = 0; // Initialize c for carry
    for (int i = max_index - 2; i >= 0; i--)
    {
        if (carry[i] == 0 && c == 0)
            continue;
        p = product[i] + carry[i] + c;
        c = p / 10;
        product[i] = (i != 0) ? p % 10 : p;
    }
    // printf("Performed Urdhva-Tiryagbhyam multiplication\n");
    // Call extract_MSB_digits to extract the most significant digits
    int urdhva_product_len = max_index - 1;
    product = extract_MSB_digits(product, &urdhva_product_len);
    // Remove leading zeros
    product = remove_leading_zeros_16_t(product, &urdhva_product_len);
    *result_length = urdhva_product_len;
    return product;
}
