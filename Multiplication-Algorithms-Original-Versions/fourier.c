#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>


typedef struct {
    double real;
    double imag;
} Complex;

void fft(Complex* x, int N, int inverse) {
    int i, j, k;
    Complex* y = (Complex*)calloc(N, sizeof(Complex));
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
    free(y);
}

void multiply(const char* num1, const char* num2) {
    // Convert the input numbers to Complex arrays
    int len1 = strlen(num1);
    int len2 = strlen(num2);
    int N = 2 * (int)pow(2, ceil(log2(2 * (len1 + len2))));

    Complex* x1 = (Complex*)calloc(N, sizeof(Complex));
    Complex* x2 = (Complex*)calloc(N, sizeof(Complex));

    for (int i = 0; i < len1; i++) {
        x1[i].real = num1[len1 - i - 1] - '0';
    }

    for (int i = 0; i < len2; i++) {
        x2[i].real = num2[len2 - i - 1] - '0';
    }

    // Perform FFT on the input numbers
    fft(x1, N, 0);
    fft(x2, N, 0);

    // Multiply the transformed numbers
    for (int i = 0; i < N; i++) {
        double real = x1[i].real * x2[i].real - x1[i].imag * x2[i].imag;
        double imag = x1[i].real * x2[i].imag + x1[i].imag * x2[i].real;
        x1[i].real = real;
        x1[i].imag = imag;
    }

    // Perform inverse FFT to get the result
    fft(x1, N, 1);

    // Convert the result back to the time domain and handle carry
    int* result = (int*)calloc(N, sizeof(int));
    for (int i = 0; i < N; i++) {
        result[i] = round(x1[i].real);
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

    // Print the result
    printf("Result: ");
    int start = N - 1;
    while (start > 0 && result[start] == 0) start--;
    for (int i = start; i >= 0; i--) {
        printf("%d", result[i]);
    }
    printf("\n");

    // Free memory
    free(x1);
    free(x2);
    free(result);
}

int main() {
    char num1[] = "12345678";
    char num2[] = "98765432";

    multiply(num1, num2);

    return 0;
}