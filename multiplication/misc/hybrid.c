#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <float.h>
#include <fcntl.h> // For file opening
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <linux/hw_breakpoint.h>
#include <sys/syscall.h> // For syscall()
#include <asm/unistd.h>  // For __NR_perf_event_open
#define _GNU_SOURCE
#include <x86intrin.h>

#define BASE_CASE_SIZE 2

/*
    Pseudo-Code:
       Algo 1: Hybrid Multiplication Algorithm: Karatsuba and Urdhva Tiryagbhyam
         Input: Two n-digit numbers x and y, represented as arrays of n digits
            Output: The product of x and y
            if n<=32 then
               return urdhva(x,y)
            else
               m = ceil(n/2)
               a = x[0..m-1], b = x[m..n-1]
               c = y[0..m-1], d = y[m..n-1]
               p = a+b, q = c+d
               ac = HybridMultiplication(a,c)
               bd = HybridMultiplication(b,d)
               pq = HybridMultiplication(p,q)
               adbc = pq-ac-bd
               return 10^(2m)ac + 10^m(adbc) + bd
*/

// Helper functions for the Hybrid Multiplication Algorithm
uint16_t *karatsuba(uint16_t *number1, uint16_t *number2, int n, uint16_t *product, int *result_length);
uint16_t *urdhva(uint16_t *number1, uint16_t *number2, int n, uint16_t *product, uint16_t *carry, int *result_length);

// Helper functions for Urdhva Tiryagbhyam multiplication
uint16_t *extract_MSB_digits(uint16_t *number, int *n);
uint16_t *remove_leading_zeros_16_t(uint16_t *number, int *n);
void make_equidistant(uint16_t **num1_base, uint16_t **num2_base, int *n_1, int *n_2);
void initalize_urdhva_variables(int n);

// Helper variables for Urdhva Tiryagbhyam multiplication
uint16_t *urdhva_product, *urdhva_carry;

// Pre-allocated Memories for Karatsuba Multiplication
uint16_t *p_memory, *q_memory, *ac_memory, *bd_memory, *pq_memory, *adbc_memory, *temp_memory, *product_memory;

// Helper functions for the Hybrid Multiplication Algorithm
uint16_t *hybrid_multiplication(uint16_t *number1, uint16_t *number2, int length, int *result_length, int call_count);
void initialize_hybrid_variables();

// Hybrid Multiplication Algorithm: Karatsuba and Urdhva Tiryagbhyam
uint16_t *hybrid_multiplication(uint16_t *number1, uint16_t *number2, int length, int *result_length, int call_count)
{
    printf("Performing Hybrid Multiplication Algorithm, on numbers of length: %d\n", length);
    printf("Call Count: %d\n", call_count);
    printf("Number 1: ");
    for (int i = 0; i < length; i++)
    {
        printf("%d", number1[i]);
    }
    printf("\n");
    printf("Number 2: ");
    for (int i = 0; i < length; i++)
    {
        printf("%d", number2[i]);
    }
    printf("\n");
    int half_length = length >> 1;
    // Base Case: if n<=32 then return urdhva(x,y)
    if (length <= BASE_CASE_SIZE)
    {
        int product_length = BASE_CASE_SIZE << 1;
        uint16_t *product = urdhva(number1, number2, length, urdhva_product, urdhva_carry, &product_length);
        *result_length = product_length;
        return product;
    }
    // Recursive Case: if n>32 then
    else
    {
        uint16_t *a = number1;
        uint16_t *b = number1 + half_length;
        uint16_t *c = number2;
        uint16_t *d = number2 + half_length;
        // There should two different half lengths, one for a, b and the other for c, d, depending on the length of the numbers i.e. odd or even
        int a_length = half_length;
        int b_length = (length % 2 == 0) ? half_length : half_length + 1;
        int c_length = half_length;
        int d_length = (length % 2 == 0) ? half_length : half_length + 1;
        printf("Splitting the numbers into a, b, c, d\n");
        printf("a: ");
        for (int i = 0; i < a_length; i++)
        {
            printf("%d", a[i]);
        }
        printf("\n");
        printf("b: ");
        for (int i = 0; i < b_length; i++)
        {
            printf("%d", b[i]);
        }
        printf("\n");
        printf("c: ");
        for (int i = 0; i < c_length; i++)
        {
            printf("%d", c[i]);
        }
        printf("\n");
        printf("d: ");
        for (int i = 0; i < d_length; i++)
        {
            printf("%d", d[i]);
        }
        printf("\n");

        // Take memory from the pre-allocated memory for p, q, ac, bd, pq, adbc, and product with respect to the call_count
        uint16_t *p = p_memory + (call_count * (half_length + 1));
        memset(p, 0, (half_length + 1) * sizeof(uint16_t));
        uint16_t *q = q_memory + (call_count * (half_length + 1));
        memset(q, 0, (half_length + 1) * sizeof(uint16_t));
        uint16_t *ac = ac_memory + (call_count * length);
        memset(ac, 0, length * sizeof(uint16_t));
        uint16_t *bd = bd_memory + (call_count * length);
        memset(bd, 0, length * sizeof(uint16_t));
        uint16_t *pq = pq_memory + (call_count * length);
        memset(pq, 0, length * sizeof(uint16_t));
        uint16_t *adbc = adbc_memory + (call_count * length);
        memset(adbc, 0, length * sizeof(uint16_t));
        uint16_t *temp = temp_memory + (call_count * length);
        memset(temp, 0, length * sizeof(uint16_t));
        uint16_t *product = product_memory + (call_count * (length << 1));
        memset(product, 0, (length << 1) * sizeof(uint16_t));

        // Calculate p = a + b and q = c + d, adjust carry if necessary
        uint16_t p_carry = 0, q_carry = 0;
        // consider equal length of a, b and c, d i.e. in some cases a is of length m and b is of length m+1
        // If a and b are of different lengths, then start from the right most digit, add until left end is reached for a/b, and then simply copy the remaining digit with carry adjustment
        // Note, the length difference will be at max of 1
        int a_index = a_length - 1;
        int b_index = b_length - 1;
        int p_length = (a_length > b_length) ? a_length : b_length;
        if (a_length == b_length)
        {
            p_length++;
        }

        int p_index = p_length - 1;
        int c_index = c_length - 1;
        int d_index = d_length - 1;
        int q_length = (c_length > d_length) ? c_length : d_length;
        if (c_length == d_length)
        {
            q_length++;
        }
        int q_index = q_length - 1;
        // Calculate p = a + b
        uint16_t p_temp = 0;
        while (a_index >= 0 && b_index >= 0)
        {
            p_temp = a[a_index] + b[b_index] + p_carry;
            p[p_index--] = p_temp % 10;
            p_carry = p_temp / 10;
            a_index--;
            b_index--;
        }
        if (a_length == b_length)
        {
            if (p_carry > 0)
            {
                p[p_index--] = p_carry;
            }
        }
        else if (a_length > b_length)
        {
            while (a_index >= 0)
            {
                p_temp = a[a_index] + p_carry;
                p[p_index--] = p_temp % 10;
                p_carry = p_temp / 10;
                a_index--;
            }
            if (p_carry > 0)
            {
                p[p_index--] = p_carry;
            }
        }
        else
        {
            while (b_index >= 0)
            {
                p_temp = b[b_index] + p_carry;
                p[p_index--] = p_temp % 10;
                p_carry = p_temp / 10;
                b_index--;
            }
            if (p_carry > 0)
            {
                p[p_index--] = p_carry;
            }
        }

        // Calculate q = c + d
        uint16_t q_temp = 0;
        while (c_index >= 0 && d_index >= 0)
        {
            q_temp = c[c_index] + d[d_index] + q_carry;
            q[q_index--] = q_temp % 10;
            q_carry = q_temp / 10;
            c_index--;
            d_index--;
        }
        if (c_length == d_length)
        {
            if (q_carry > 0)
            {
                q[q_index--] = q_carry;
            }
        }
        else if (c_length > d_length)
        {
            while (c_index >= 0)
            {
                q_temp = c[c_index] + q_carry;
                q[q_index--] = q_temp % 10;
                q_carry = q_temp / 10;
                c_index--;
            }
            if (q_carry > 0)
            {
                q[q_index--] = q_carry;
            }
        }
        else
        {
            while (d_index >= 0)
            {
                q_temp = d[d_index] + q_carry;
                q[q_index--] = q_temp % 10;
                q_carry = q_temp / 10;
                d_index--;
            }
            if (q_carry > 0)
            {
                q[q_index--] = q_carry;
            }
        }

        // Calculate ac = HybridMultiplication(a,c)
        int ac_length;
        int temp_length = (a_length > c_length) ? a_length : c_length;
        ac = hybrid_multiplication(a, c, temp_length, &ac_length, call_count++);

        // Calculate bd = HybridMultiplication(b,d)
        int bd_length;
        temp_length = (b_length > d_length) ? b_length : d_length;
        bd = hybrid_multiplication(b, d, temp_length, &bd_length, call_count++);

        // Calculate pq = HybridMultiplication(p,q)
        int pq_length;
        temp_length = (p_length > q_length) ? p_length : q_length;
        pq = hybrid_multiplication(p, q, temp_length, &pq_length, call_count++);

        // Calculate adbc = pq - ac - bd
        int adbc_length = (pq_length > ac_length) ? (pq_length > bd_length) ? pq_length : bd_length : (ac_length > bd_length) ? ac_length
                                                                                                                              : bd_length;
        // Append 0's to ac and bd, if necessary
        if (ac_length < adbc_length)
        {
            int diff = adbc_length - ac_length;
            for (int i = adbc_length - 1; i >= diff; i--)
            {
                ac[i] = ac[i - diff];
            }
            for (int i = 0; i < diff; i++)
            {
                ac[i] = 0;
            }
        }
        if (bd_length < adbc_length)
        {
            int diff = adbc_length - bd_length;
            for (int i = adbc_length - 1; i >= diff; i--)
            {
                bd[i] = bd[i - diff];
            }
            for (int i = 0; i < diff; i++)
            {
                bd[i] = 0;
            }
        }
        // Calculate adbc
        for (int i = 0; i < half_length; i++)
        {
            adbc[i] = pq[i] - ac[i] - bd[i];
        }
        printf("Calculated ac, bd, pq, adbc\n");
        printf("For Numbers: \n");
        printf("num1: ");
        for (int i = 0; i < length; i++)
        {
            printf("%d", number1[i]);
        }
        printf("\n");
        printf("num2: ");
        for (int i = 0; i < length; i++)
        {
            printf("%d", number2[i]);
        }
        printf("\n");
        printf("ac: ");
        for (int i = 0; i < ac_length; i++)
        {
            printf("%d", ac[i]);
        }
        printf("\n");
        printf("bd: ");
        for (int i = 0; i < bd_length; i++)
        {
            printf("%d", bd[i]);
        }
        printf("\n");
        printf("pq: ");
        for (int i = 0; i < pq_length; i++)
        {
            printf("%d", pq[i]);
        }
        printf("\n");
        printf("adbc: ");
        for (int i = 0; i < adbc_length; i++)
        {
            printf("%d", adbc[i]);
        }
        printf("\n");

        // Now, to calculate the final product, we need to calculate 10^(2m)ac, 10^m(adbc) and bd
        // Final product = 10^(2m)ac + 10^m(adbc) + bd
        // Length of product will be at max length << 1
        int product_length = length << 1;
        memset(product, 0, product_length * sizeof(uint16_t));

        // Calculate 10^(2m)ac, means, shift ac by 2m
        // length of ac is m, so, shift ac by 2m
        for (int i = 0; i < ac_length; i++)
        {
            product[i + (half_length << 1)] = ac[i];
        }

        // Calculate 10^m(adbc), means, shift adbc by m
        // length of adbc is m, so, shift adbc by m
        for (int i = 0; i < adbc_length; i++)
        {
            product[i + half_length] += adbc[i];
        }

        // Calculate bd
        for (int i = 0; i < bd_length; i++)
        {
            product[i] += bd[i];
        }

        // Adjust the array for carry
        uint16_t c_ = 0;
        for (int i = product_length - 1; i >= 0; i--)
        {
            if (product[i] == 0 && c_ == 0)
                continue;
            uint16_t p = product[i] + c_;
            c_ = p / 10;
            product[i] = (i != 0) ? p % 10 : p;
        }

        // Call extract_MSB_digits to extract the most significant digits
        product = extract_MSB_digits(product, &product_length);
        // Remove leading zeros
        product = remove_leading_zeros_16_t(product, &product_length);
        *result_length = product_length;
        return product;
    }
}

// Implementation of the Urdhva Tiryagbhyam algorithm
uint16_t *urdhva(uint16_t *number1, uint16_t *number2, int n, uint16_t *product, uint16_t *carry, int *result_length)
{
    // printf("Performing Urdhva-Tiryagbhyam multiplication\n");
    int max_index = n << 1;
    memset(product, 0, max_index * sizeof(uint16_t));
    memset(carry, 0, max_index * sizeof(uint16_t));
    // #pragma omp parallel for shared(product, carry) num_threads(8)
    for (int sum = 0; sum < max_index; sum++)
    {
        register uint16_t p = 0; // Use uint16_t for intermediate product calculation
        int start = (sum - (n - 1) > 0) ? sum - (n - 1) : 0;
        int end = (sum < n) ? sum : n - 1;

        int n2_index = sum - start; // Initialize n2_index based on the starting value
        uint16_t *ptr1 = &number1[start];
        uint16_t *ptr2 = &number2[end];
        // Calculate the number of iterations outside the loop
        int iterations = &number1[end] - ptr1 + 1;

        for (int i = 0; i < iterations; ++ptr1, --ptr2, ++i)
        {
            p += (*ptr1) * (*ptr2);
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
    // #pragma omp barrier

    // Adjust the carry and product in the second loop
    uint16_t c = 0; // Initialize c for carry
    for (int i = max_index - 2; i >= 0; i--)
    {
        if (carry[i] == 0 && c == 0)
            continue;
        uint16_t p = product[i] + carry[i] + c;
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

// Function to make the two number strings equidistant by adding zeroes in front of the smaller number, and reallocate space for the smaller number
void make_equidistant(uint16_t **num1_base, uint16_t **num2_base, int *n_1, int *n_2)
{
    if (*n_1 == *n_2)
        return;

    int n1 = *n_1;
    int n2 = *n_2;
    uint16_t *num1 = *num1_base;
    uint16_t *num2 = *num2_base;

    if (n1 > n2)
    {
        uint16_t *temp = (uint16_t *)calloc(n1, sizeof(uint16_t));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }
        // copy from the LSB to MSB of num2 into temp
        for (int i = n2 - 1; i >= 0; i--)
        {
            temp[i + n1 - n2] = num2[i];
        }
        // fill the remaining MSB with zeroes in temp
        for (int i = 0; i < n1 - n2; i++)
        {
            temp[i] = 0;
        }

        // reallocate space for num2 using realloc
        num2 = (uint16_t *)realloc(num2, n1 * sizeof(uint16_t));
        if (num2 == NULL)
        {
            perror("Memory reallocation failed for num2\n");
            exit(0);
        }
        for (int i = 0; i < n1; i++)
        {
            num2[i] = temp[i];
        }
        *n_2 = n1;
        *num2_base = num2;
        free(temp);
    }
    else if (n2 > n1)
    {
        uint16_t *temp = (uint16_t *)calloc(n2, sizeof(uint16_t));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }

        // copy from the LSB to MSB of num1 into temp
        for (int i = n1 - 1; i >= 0; i--)
        {
            temp[i + n2 - n1] = num1[i];
        }
        // fill the remaining MSB with zeroes in temp
        for (int i = 0; i < n2 - n1; i++)
        {
            temp[i] = 0;
        }
        // reallocate space for num1 using realloc
        num1 = (uint16_t *)realloc(num1, n2 * sizeof(uint16_t));
        if (num1 == NULL)
        {
            perror("Memory reallocation failed for num1\n");
            exit(0);
        }
        for (int i = 0; i < n2; i++)
        {
            num1[i] = temp[i];
        }
        *n_1 = n2;
        *num1_base = num1;
        free(temp);
    }
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

uint16_t *msb_result;
// helper function to extract the most significant digits seperately for urdhva MSB
uint16_t *extract_MSB_digits(uint16_t *number, int *length)
{
    int result_length = *length;
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
    int i = result_length - *length;
    while (number[0] > 0)
    {
        msb_result[i--] = number[0] % 10;
        number[0] = number[0] / 10;
    }
    // Copy the remaining digits of number to result
    int j;
    for (i = result_length - *length + 1, j = 1; j < *length; j++, i++)
    {
        msb_result[i] = number[j];
    }
    *length = result_length;
    return msb_result;
}

void initalize_urdhva_variables(int n)
{
    urdhva_product = (uint16_t *)calloc(2 * n - 1, sizeof(uint16_t));
    if (urdhva_product == NULL)
    {
        perror("Memory allocation failed for urdhva_product\n");
        exit(0);
    }
    urdhva_carry = (uint16_t *)calloc(2 * n - 1, sizeof(uint16_t));
    if (urdhva_carry == NULL)
    {
        perror("Memory allocation failed for urdhva_carry\n");
        exit(0);
    }
    msb_result = (uint16_t *)calloc(64, sizeof(uint16_t));
    if (msb_result == NULL)
    {
        perror("Memory allocation failed for msb_result\n");
        exit(0);
    }
}

void initialize_hybrid_variables()
{
    // allocate huge chunk of memory for the pre-allocated memories, 500 MB for each
    int chunk_size = 500 * 1024 * 1024;
    p_memory = (uint16_t *)malloc(chunk_size);
    if (p_memory == NULL)
    {
        perror("Memory allocation failed for p_memory\n");
        exit(0);
    }
    // touch the memory to ensure that the memory is allocated
    memset(p_memory, 0, chunk_size);
    q_memory = (uint16_t *)malloc(chunk_size);
    if (q_memory == NULL)
    {
        perror("Memory allocation failed for q_memory\n");
        exit(0);
    }
    // touch the memory to ensure that the memory is allocated
    memset(q_memory, 0, chunk_size);
    ac_memory = (uint16_t *)malloc(chunk_size);
    if (ac_memory == NULL)
    {
        perror("Memory allocation failed for ac_memory\n");
        exit(0);
    }
    // touch the memory to ensure that the memory is allocated
    memset(ac_memory, 0, chunk_size);
    bd_memory = (uint16_t *)malloc(chunk_size);
    if (bd_memory == NULL)
    {
        perror("Memory allocation failed for bd_memory\n");
        exit(0);
    }
    // touch the memory to ensure that the memory is allocated
    memset(bd_memory, 0, chunk_size);
    pq_memory = (uint16_t *)malloc(chunk_size);
    if (pq_memory == NULL)
    {
        perror("Memory allocation failed for pq_memory\n");
        exit(0);
    }
    // touch the memory to ensure that the memory is allocated
    memset(pq_memory, 0, chunk_size);
    adbc_memory = (uint16_t *)malloc(chunk_size);
    if (adbc_memory == NULL)
    {
        perror("Memory allocation failed for adbc_memory\n");
        exit(0);
    }
    // touch the memory to ensure that the memory is allocated
    memset(adbc_memory, 0, chunk_size);
    temp_memory = (uint16_t *)malloc(chunk_size);
    if (temp_memory == NULL)
    {
        perror("Memory allocation failed for temp_memory\n");
        exit(0);
    }
    // touch the memory to ensure that the memory is allocated
    memset(temp_memory, 0, chunk_size);
    product_memory = (uint16_t *)malloc(chunk_size);
    if (product_memory == NULL)
    {
        perror("Memory allocation failed for product_memory\n");
        exit(0);
    }
    // touch the memory to ensure that the memory is allocated
    memset(product_memory, 0, chunk_size);

    initalize_urdhva_variables(BASE_CASE_SIZE);
}

int main()
{
    // Initialize the variables for the Hybrid Multiplication Algorithm
    initialize_hybrid_variables();

    // Test the Hybrid Multiplication Algorithm
    uint16_t number1[4] = {1, 2, 3, 4};
    uint16_t number2[4] = {5, 6, 7, 8};

    // First testing Urdhva
    int urdhva_result_length;
    uint16_t *urdhva_result = urdhva(number1, number2, 4, urdhva_product, urdhva_carry, &urdhva_result_length);
    printf("Urdhva Product: ");
    for (int i = 0; i < urdhva_result_length; i++)
    {
        printf("%d", urdhva_result[i]);
    }
    printf("\n");

    int result_length;
    uint16_t *product = hybrid_multiplication(number1, number2, 4, &result_length, 0);
    printf("Hybrid Product: ");
    for (int i = 0; i < result_length; i++)
    {
        printf("%d", product[i]);
    }
    printf("\n");

    // // Free the allocated memories
    // free(p_memory);
    // free(q_memory);
    // free(ac_memory);
    // free(bd_memory);
    // free(pq_memory);
    // free(adbc_memory);
    // free(temp_memory);
    // free(product_memory);
    // free(urdhva_product);
    // free(urdhva_carry);
    // free(msb_result);
    return 0;
}
