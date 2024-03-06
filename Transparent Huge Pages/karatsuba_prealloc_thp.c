#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BASE 10 

// Splits a number into two parts, handling numbers with odd lengths.
void split_number(const char *num, char **first, char **second, int n) {
    int half_size = n / 2;

    *first = malloc(half_size + 1);
    *second = malloc(n - half_size + 1);

    strncpy(*first, num, half_size);
    (*first)[half_size] = '\0'; 

    strncpy(*second, num + half_size, n - half_size);
    (*second)[n - half_size] = '\0'; 
}


// Adds two large numbers represented as strings
char *sum(const char *x, const char *y) {
    printf("Adding %s + %s\n", x, y);
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
        result[max_len + 1] = '\0';
    } else {
        memmove(result, result + 1, max_len); // Shift left to remove leading '0'
        result[max_len] = '\0';
    }

    printf("Result: %s\n", result);
    return result;
}

// Subtracts two large numbers represented as strings (assumes x >= y)
char *subtract(const char *x, const char *y) {
    printf("Subtracting %s - %s\n", x, y);
    int swap = 0;
    // If y > x, swap x and y
    if (strcmp(y, x) > 0) {
        const char *temp = x;
        x = y;
        y = temp;
        swap = 1;
    }
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
     // If the result is an empty string, set it to "0"
    if (result[0] == '\0') {
        result[0] = '0';
        result[1] = '\0';
    }
    // If we swapped x and y, add a '-' sign to the result
    if (swap) {
        memmove(result + 1, result, strlen(result) + 1);
        result[0] = '-';
    }

    printf("Result: %s\n", result);
    return result;
}


// Karatsuba multiplication
char* karatsuba(const char *x, const char *y) {
    printf("Multiplying %s * %s\n", x, y);
    int x_len = strlen(x);
    int y_len = strlen(y);

    // Base case: Switch to simple multiplication if small numbers
    if (strlen(x) < 2 && strlen(y) < 2) {
        int result = (x[0] - '0') * (y[0] - '0');
        char *result_str = malloc(3); // Allocate space for result and null terminator
        sprintf(result_str, "%d", result);
        return result_str;
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
    strcpy(P1_shifted, P1);
    memset(P1_shifted + strlen(P1), '0', 2 * half_size);
    P1_shifted[strlen(P1) + 2 * half_size] = '\0';

    char *temp = subtract(P3, P1);  
    temp = subtract(temp, P2);
    char *temp_shifted = malloc(strlen(temp) + half_size + 1); // Shifts (P3-P1-P2)
    strcpy(temp_shifted, temp);
    memset(temp_shifted + strlen(temp), '0', half_size);
    temp_shifted[strlen(temp) + half_size] = '\0';

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
    char *num2 = "567";
    char *result = karatsuba(num1, num2);
    printf("Karatsuba Result: %s\n", result);
    return 0;
}
