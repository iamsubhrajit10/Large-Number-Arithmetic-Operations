#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BASE 10 

// Splits a number into two parts, handling numbers with odd lengths.
void split_number(const char *num, char **first, char **second, int n) {
    int half_size = n / 2;
    int remainder = n % 2; 

    *first = malloc(half_size + 1);
    *second = malloc(half_size + remainder + 1);

    memcpy(*first, num, half_size);
    (*first)[half_size] = '\0'; 

    memcpy(*second, num + half_size, half_size + remainder);
    (*second)[half_size + remainder] = '\0'; 
}

// Adds two large numbers represented as strings
char *sum(const char *x, const char *y) {
    int len_x = strlen(x);
    int len_y = strlen(y);
    int max_len = (len_x > len_y) ? len_x : len_y;

    // Allocate space for the result, considering the potential carry
    char *result = malloc(max_len + 2); 

    int carry = 0;
    int i = len_x - 1, j = len_y - 1, k = max_len;

    // Perform digit-by-digit addition with carry
    while (i >= 0 || j >= 0 || carry > 0) {
        int digit_x = (i >= 0) ? x[i] - '0' : 0;
        int digit_y = (j >= 0) ? y[j] - '0' : 0;

        int sum = digit_x + digit_y + carry;
        result[k] = (sum % 10) + '0';
        carry = sum / 10;

        i--; j--; k--;
    }

    // Handle potential leading zero and add null terminator
    if (carry > 0) {
        result[0] = carry + '0';
    } else {
        memmove(result, result + 1, max_len + 1); // Shift left to remove leading '0'
    }
    result[max_len + 1] = '\0';

    return result;
}

// Subtracts two large numbers represented as strings (assumes x >= y)
char *subtract(const char *x, const char *y) {
    int len_x = strlen(x);
    int len_y = strlen(y);

    // Allocate space for the result
    char *result = malloc(len_x + 1); 

    int i = len_x - 1, j = len_y - 1, k = len_x - 1;
    int borrow = 0;

    // Perform digit-by-digit subtraction with borrowing
    while (i >= 0) {
        int digit_x = x[i] - '0';
        int digit_y = (j >= 0) ? y[j] - '0' : 0;

        digit_x -= borrow; 

        if (digit_x < digit_y) {
            digit_x += 10;
            borrow = 1;
        } else {
            borrow = 0;
        }

        result[k] = (digit_x - digit_y) + '0'; 

        i--; j--; k--;
    }

    result[len_x] = '\0'; 

    // Trim leading zeros
    int leading_zero = 0;
    while (result[leading_zero] == '0') {
        leading_zero++;
    }
    memmove(result, result + leading_zero, len_x - leading_zero + 1);

    return result;
}


// Karatsuba multiplication
char* karatsuba(const char *x, const char *y) {
    int x_len = strlen(x);
    int y_len = strlen(y);

    // Base case: Switch to simple multiplication if small numbers
    if (x_len == 1 || y_len == 1) {
        long long result = atoll(x) * atoll(y);
        // Calculate required space for the string representation
        int required_space = snprintf(NULL, 0, "%lld", result) + 1; 

        // Allocate memory
        char* str_result = malloc(sizeof(char) * required_space); 

        // Format the number into the allocated string
        sprintf(str_result, "%lld", result);
        return str_result;
    }

    int max_len = (x_len > y_len) ? x_len : y_len;
    int half_size = max_len / 2 + (max_len % 2);

    char *x1, *x0, *y1, *y0;
    split_number(x, &x1, &x0, x_len);
    split_number(y, &y1, &y0, y_len);

    char *P1 = karatsuba(x1, y1);
    char *P2 = karatsuba(x0, y0);
    char *P3 = karatsuba(sum(x1, x0), sum(y1, y0)); 

    // Reconstruct the result
    char *P1_shifted = malloc(strlen(P1) + 2 * half_size + 1); // Shifts P1
    memset(P1_shifted, '0', 2 * half_size);
    strcpy(P1_shifted + 2 * half_size, P1); 

    char *temp = subtract(P3, P1);  
    temp = subtract(temp, P2);
    char *temp_shifted = malloc(strlen(temp) + half_size + 1); // Shifts (P3-P1-P2)
    memset(temp_shifted, '0', half_size); 
    strcpy(temp_shifted + half_size, temp);

    char *result = sum(P1_shifted, temp_shifted);
    result = sum(result, P2);

    // Free memory 
    free(x1); free(x0); free(y1); free(y0); 
    free(P1); free(P2); free(P3); 
    free(P1_shifted); free(temp); free(temp_shifted);

    return result;
}
int main() {
    char *num1 = "1234";
    char *num2 = "10";
    char *result = karatsuba(num1, num2);
    printf("Karatsuba Result: %s\n", result);
    return 0;
}
