#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void split_number(const char *num, char **first, char **second, int n);
char *subtract(const char *x, const char *y);
char *sum(const char *x, const char *y);

char *remove_leading_zeros(char *str) {
    while (*str == '0') {
        str++;
    }
    return str;
}


void split_number(const char *num, char **first, char **second, int n) {
    int half_size = n / 2;
    int remainder = n % 2; 

    *first = malloc(half_size + 1);
    *second = malloc(half_size + remainder + 1);

    // Copy the first half of the number
    memcpy(*first, num, half_size);
    (*first)[half_size] = '\0'; 

    // If the first half is an empty string, make it "0"
    if ((*first)[0] == '\0') {
        (*first)[0] = '0';
    }

    // Copy the second half of the number
    memcpy(*second, num + half_size, half_size + remainder);
    (*second)[half_size + remainder] = '\0'; 

    // If the second half is an empty string, make it "0"
    if ((*second)[0] == '\0') {
        (*second)[0] = '0';
    }
}

char *subtract(const char *x, const char *y) {
    printf("Subtracting x: %s, y: %s\n", x, y);

    int is_x_negative = (x[0] == '-');
    int is_y_negative = (y[0] == '-');

    if (is_x_negative && !is_y_negative) {
        // If x is negative and y is positive, add |x| and y and return the result with a '-' sign
        char *result = sum(x + 1, y);
        memmove(result + 1, result, strlen(result) + 1);
        result[0] = '-';
        printf("Result: %s\n", result);
        return result;
    } else if (!is_x_negative && is_y_negative) {
        // If x is positive and y is negative, add x and |y|
        char *result = sum(x, y + 1);
        printf("Result: %s\n", result);
        return result;
    } else if (is_x_negative && is_y_negative) {
        // If both x and y are negative, subtract |y| from |x|
        char *result = subtract(y + 1, x + 1);
        printf("Result: %s\n", result);
        return result;
    } else {
        // If both x and y are positive, subtract y from x
        int len_x = strlen(x);
        int len_y = strlen(y);
        int swap = 0;
        if (len_x < len_y || (len_x == len_y && strcmp(x, y) < 0)) {
            const char *temp = x;
            x = y;
            y = temp;
            swap = 1;
            printf("x: %s, y: %s\n",x,y);
            len_x = strlen(x);
            len_y = strlen(y);
        }
    
        char *result = malloc(len_x + 1); 
        int i = len_x - 1, j = len_y - 1, k = len_x - 1;
        int borrow = 0;

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

            result[k] = digit_x - digit_y + '0';

            i--;
            j--;
            k--;
        }

        result[len_x] = '\0';
        int leading_zero = 0;
        while (result[leading_zero] == '0') {
            leading_zero++;
        }
        memmove(result, result + leading_zero, len_x - leading_zero + 1);
    
        if (result[0] == '\0') {
            result[0] = '0';
            result[1] = '\0';
        }
        
        if (swap) {
            memmove(result + 1, result, strlen(result) + 1);
            result[0] = '-';
        }
        printf("Result: %s\n", result);
        return result;
    }
}


char *sum(const char *x, const char *y) {
    printf("Adding x: %s, y: %s\n", x, y);

    int is_x_negative = (x[0] == '-');
    int is_y_negative = (y[0] == '-');

    if (is_x_negative && is_y_negative) {
        // If both numbers are negative, remove the '-' sign and add the numbers
        char *result = sum(x + 1, y + 1);
        // Add a '-' sign to the result
        memmove(result + 1, result, strlen(result) + 1);
        result[0] = '-';
        printf("Result: %s\n", result);
        return result;
    } else if (is_x_negative) {
        // If x is negative and y is positive, subtract y from |x|
        char *result = subtract(y, x + 1);
        printf("Result: %s\n", result);
        return result;
    } else if (is_y_negative) {
        // If y is negative and x is positive, subtract |y| from x
        char *result = subtract(x, y + 1);
        printf("Result: %s\n", result);
        return result;
    }
    int len_x = strlen(x);
    int len_y = strlen(y);
    int max_len = (len_x > len_y) ? len_x : len_y;

    char *result = malloc(max_len + 2); 

    int carry = 0;
    int i = len_x - 1, j = len_y - 1, k = max_len;

    while (i >= 0 || j >= 0 || carry > 0) {
        int digit_x = (i >= 0) ? x[i] - '0' : 0;
        int digit_y = (j >= 0) ? y[j] - '0' : 0;

        int sum = digit_x + digit_y + carry;
        result[k] = (sum % 10) + '0';
        carry = sum / 10;

        i--; j--; k--;
    }

    if (carry > 0) {
        result[0] = carry + '0';
        result[max_len + 1] = '\0';
    } else {
        memmove(result, result + 1, max_len);
        result[max_len] = '\0';
    }
     // Remove leading zeros from the result
    char *result_without_leading_zeros = remove_leading_zeros(result);
    return result_without_leading_zeros;
    printf("Result: %s\n", result_without_leading_zeros);
    return result;
}


char* karatsuba(const char *x, const char *y) {
    printf("Multiplying: x: %s, y: %s\n", x, y);
    int x_len = strlen(x);
    int y_len = strlen(y);

    // Base case: Switch to simple multiplication if small numbers
    if (x_len < 2 || y_len < 2) {
        int result = atoi(x) * atoi(y);
        printf("Base: (%d,%d): Result:%d\n",atoi(x),atoi(y),result);

        // Calculate the number of digits in the result
        int num_digits = (result == 0) ? 1 : (int)log10(result) + 1;

        // Allocate space for result and null terminator
        char *result_str = malloc(num_digits + 1); 
        if (result_str == NULL) {
            printf("Memory allocation failed\n");
            exit(1);
        }

        // Use snprintf instead of sprintf
        snprintf(result_str, num_digits + 1, "%d", result);
        result_str[num_digits] = '\0'; // Ensure the string is null-terminated
        printf("Base case: %s\n", result_str);
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
    int P1_shifted_len = strlen(P1) + 2 * half_size + 1;
    char *P1_shifted = malloc(P1_shifted_len); // Shifts P1
    if (P1_shifted == NULL) {
        printf("Memory allocation failed\n");
        exit(1);
    }

    snprintf(P1_shifted, P1_shifted_len, "%s%0*d", P1, 2 * half_size, 0);

    char *temp = subtract(P3, P1);  
    temp = subtract(temp, P2);
    int temp_shifted_len = strlen(temp) + half_size + 1;
    char *temp_shifted = malloc(temp_shifted_len); // Shifts (P3-P1-P2)
    if (temp_shifted == NULL) {
        printf("Memory allocation failed\n");
        exit(1);
    }

    snprintf(temp_shifted, temp_shifted_len, "%s%0*d", temp, half_size, 0);

    char *result = sum(P1_shifted, temp_shifted);
    result = sum(result, P2);

    printf("End: %s\n", result);
    return result;
}


int main() {
    char *num1 = "123";
    char *num2 = "10";
    char *result = karatsuba(num1, num2);
    printf("Karatsuba Result: %s\n", result);
    return 0;
}
