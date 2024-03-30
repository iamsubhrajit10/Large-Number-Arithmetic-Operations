#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>


typedef struct {
    double real;
    double imag;
} Complex;

Complex *x_one,*x_two, *y_one,*y_two,*y_three;
int N, *result;

void fft(Complex* x, Complex *y, int N, int inverse) {
    int i, j, k;
    double pi = 3.14159265358979323846;
    double angle;
    Complex w, w_N;
    int step = 1;
    for (i = 0; i < N; i++) {
        y[i] = x[i];
    }
    for (i = 0; i < N; i++) {
        j = 0;
        int temp = i;
        for (k = 0; k < log2(N); k++) {
            j = (j << 1) | (temp & 1);
            temp >>= 1;
        }
        if (j < N) {
            x[j] = y[i];
        }
    }
    for (i = 1; i <= log2(N); i++) {
        step *= 2;
        for (j = 0; j < N; j += step) {
            angle = 2 * pi / step;
            w.real = cos(angle);
            w.imag = sin(angle);
            if (inverse) {
                w.imag = -w.imag;
            }
            w_N.real = 1;
            w_N.imag = 0;
            for (k = 0; k < step / 2; k++) {
                Complex u = x[j + k];
                Complex v = x[j + k + step / 2];
                x[j + k].real = u.real + w_N.real * v.real - w_N.imag * v.imag;
                x[j + k].imag = u.imag + w_N.real * v.imag + w_N.imag * v.real;
                x[j + k + step / 2].real = u.real - w_N.real * v.real + w_N.imag * v.imag;
                x[j + k + step / 2].imag = u.imag - w_N.real * v.imag - w_N.imag * v.real;
                Complex temp = w_N;
                w_N.real = temp.real * w.real - temp.imag * w.imag;
                w_N.imag = temp.real * w.imag + temp.imag * w.real;
            }
        }
    }
    if (inverse) {
        for (i = 0; i < N; i++) {
            x[i].real /= N;
            x[i].imag /= N;
        }
    }
}

void multiply(const char* num1, const char* num2, int len1, int len2) {
    // Convert the input numbers to Complex arrays

    for (int i = 0; i < len1; i++) {
        x_one[i].real = num1[len1 - i - 1] - '0';
    }

    for (int i = 0; i < len2; i++) {
        x_two[i].real = num2[len2 - i - 1] - '0';
    }

    // Perform FFT on the input numbers
    fft(x_one, y_one, N, 0);
    fft(x_two, y_two, N, 0);

    // Multiply the transformed numbers
    for (int i = 0; i < N; i++) {
        double real = x_one[i].real * x_two[i].real - x_one[i].imag * x_two[i].imag;
        double imag = x_one[i].real * x_two[i].imag + x_one[i].imag * x_two[i].real;
        x_one[i].real = real;
        x_one[i].imag = imag;
    }

    // Perform inverse FFT to get the result
    fft(x_one, y_three, N, 1);

    // Convert the result back to the time domain and handle carry
    
    for (int i = 0; i < N; i++) {
        result[i] = round(x_one[i].real);
    }
    for (int i = 0; i < N; i++) {
        if (result[i] >= 10) {
            int carry = result[i] / 10;
            result[i] %= 10;
            int j = i + 1;
            while (carry > 0) {
                result[j] += carry;
                carry = result[j] / 10;
                result[j] %= 10;
                j++;
            }
        }
    }
}

int main() {
    char num1[] = "12345678";
    char num2[] = "98765432";

    int len1 = strlen(num1);
    int len2 = strlen(num2);
    N = 2 * (int)pow(2, ceil(log2(2 * (len1 + len2))));
    x_one =(Complex*)calloc(N, sizeof(Complex));
    x_two =(Complex*)calloc(N,sizeof(Complex));
    y_one =(Complex*)calloc(N, sizeof(Complex));
    y_two =(Complex*)calloc(N,sizeof(Complex));
    y_three =(Complex*)calloc(N,sizeof(Complex));
    result = (int*)calloc(N, sizeof(int));
    multiply(num1, num2,len1,len2);
    // Print the result
    printf("Result: ");
    int start = N - 1;
    while (start > 0 && result[start] == 0) start--;
    for (int i = start; i >= 0; i--) {
        printf("%d", result[i]);
    }
    printf("\n");

    // Free memory
    free(x_one);
    free(x_two);
    free(y_one);
    free(y_two);
    free(y_three);
    free(result);
    return 0;
}