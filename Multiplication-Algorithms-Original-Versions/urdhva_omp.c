/*
Algorithm: Urdhva Tiryakbhyam (Vertical and Crosswise)
1.	Arrange the numbers vertically. For non-equidigit numbers, prefix as many Zeroes in front.
2.	Consider sets of vertical columns, preferably from left to right, in ascending order, and then in descending order.
3.	Find the sum of the cross-products - of the digits equidistant from the edges, to represent each set.
4.	Re-format the number in Base10 (Normalized) form, if required.
	
    For n-digit set, the Cross-Product is:
1. For even-number of digits: Sum of the cross-wise product of the digits, that are equidistant from the ends.
2. For odd-number of digits: Sum of the cross-wise product of the digits, that are equidistant from the ends - summed with central-digits multiplied with each other.

During computations, it is possible that a number is derived as [1,24,3]. Such numbers are considered aśūddha or impure - because only one digit should take the position of a placeholder. Such numbers are processed using śūddhikaran by retaining the last digit, and carrying forward the additional part. The carried part is added to the next column, and the process is repeated until the number is śuddha or pure.
Example:
  873
× 234
------
 
Clearly, the sets are:
8   87   873   73   3
2 , 23 , 234 , 34 , 4
 
Which means,
[8 × 2, (8 × 3)+(7 × 2), (8 × 4)+(3 × 2)+(7 × 3), (7 × 4)+(3 × 3), (3 × 4)]
= [16, 24+14, 32+21+6, 28+9, 12]
= [16, 38, 59, 37, 12]
By śūddhikaran, we get: = [20,4,2,8,2]
= 204282
 
Thus, 873 × 234 = 204,282
Refer: https://www.upavidhi.com/sutra/urdhva-tiryagbhyam
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <omp.h>
#include <time.h>
#include <sys/time.h>
#include <gmp.h>
#include <unistd.h>

#define NUMBER_OF_BITS 16384

// Function to make the two number strings equidistant by adding zeroes in front of the smaller number, and reallocate space for the smaller number
void make_equidistant(int **num1_base, int **num2_base, int *n_1, int *n_2)
{
    if (*n_1 == *n_2)
        return;
    
    int n1 = *n_1;
    int n2 = *n_2;
    int *num1 = *num1_base;
    int *num2 = *num2_base;

    if (n1 > n2)
    {
        // printf("Num1 is greater\n");
        int *temp = (int *)calloc(n1, sizeof(int));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }
        // copy from the LSB to MSB of num2 into temp
        for (int i = n2 - 1; i >= 0; i--)
        {
            // printf("Copying %d into temp index of %d\n", num2[i], i + n1 - n2);
            temp[i + n1 - n2] = num2[i];
        }
        // fill the remaining MSB with zeroes in temp
        for (int i = 0; i < n1 - n2; i++)
        {
            temp[i] = 0;
        }

        printf("\n");
        // reallocate space for num2 using realloc
        num2 = (int *)realloc(num2, n1 * sizeof(int));
        if (num2 == NULL)
        {
            perror("Memory reallocation failed for num2\n");
            exit(0);
        }
        for (int i = 0; i < n1; i++)
        {
            num2[i] = temp[i];
        }
        // copy the temp into num2
        *n_2 = n1;
        *num2_base = num2;
        free(temp);
    }
    else if (n2 > n1)
    {
        // printf("Num2 is greater\n");
        int *temp = (int *)calloc(n2, sizeof(int));
        if (temp == NULL)
        {
            perror("Memory allocation failed for temp\n");
            exit(0);
        }

        // copy from the LSB to MSB of num1 into temp
        for (int i = n1 - 1; i >= 0; i--)
        {
            //printf("Copying %d into temp index of %d\n", num1[i], i + n2 - n1);
            temp[i + n2 - n1] = num1[i];
        }
        // fill the remaining MSB with zeroes in temp
        for (int i = 0; i < n2 - n1; i++)
        {
            temp[i] = 0;
        }
        // reallocate space for num1 using realloc
        num1 = (int *)realloc(num1, n2 * sizeof(int));
        if (num1 == NULL)
        {
            perror("Memory reallocation failed for num1\n");
            exit(0);
        }
        // copy the temp into num1
        for (int i = 0; i < n2; i++)
        {
            num1[i] = temp[i];
        }
        *n_1 = n2;
        *num1_base = num1;
        free(temp);
    }
}

// Function to perform śūddhikaran
/*
During computations, it is possible that a number is derived as [1,24,3]. Such numbers are considered aśūddha or impure - because only one digit should take the position of a placeholder. Such numbers are processed using śūddhikaran by retaining the last digit, and carrying forward the additional part. The carried part is added to the next column, and the process is repeated until the number is śuddha or pure.
Example:
  873
× 234
------
 
Clearly, the sets are:
8   87   873   73   3
2 , 23 , 234 , 34 , 4
 
Which means,
[8 × 2, (8 × 3)+(7 × 2), (8 × 4)+(3 × 2)+(7 × 3), (7 × 4)+(3 × 3), (3 × 4)]
= [16, 24+14, 32+21+6, 28+9, 12]
= [16, 38, 59, 37, 12]
By śūddhikaran, we get: = [20,4,2,8,2]
= 204282
*/
void suddhikaran(int *arr, int n)
{
    for (int i = n - 1; i > 0; i--)
    {
        if (arr[i] > 9)
        {
            arr[i - 1] += arr[i] / 10;
            arr[i] = arr[i] % 10;
        }
    }
}

// // Function to extract the prefix sets of a number string and insert them into result array from a given index
// // example: extract_prefix([1,2,3,4], 4, 4, [0,0,0,0,0,0,0]) => [1,12,123,1234,0,0,0]
// // Extract the prefix sets
// // num_set is a 2d-array, where each column represents a set of prefixes in terms of number string, and storing starts from store_index_start
// void extract_prefix(int *num, int n, int **num_set, int *num_set_col_size)
// {
//     if (n == 0)
//         return;
//     int available_threads = omp_get_max_threads();
    
//     if (available_threads > n)
//         available_threads = n;
//     int num_rept = n / available_threads;
//     int num_rem = n % available_threads;
//     #pragma omp parallel num_threads(available_threads) shared(num_set, num_set_col_size)
//     {
//         int tid = omp_get_thread_num();
//         int start = 0;
//         for (int i = 0; i < num_rept; i++)
//         {
//             int end = tid + i;
//             int store_index_start = tid + i;
//             int *prefix = (int *)calloc(end+1, sizeof(int));
//             for (int j = 0; j <= end; j++)
//                 prefix[j] = num[j];
//             num_set[store_index_start] = prefix;
//             num_set_col_size[store_index_start] = end+1;
//         }
//         if (tid == available_threads - 1)
//         {
//             int start = 0;
//             for (int i = 0; i < num_rem; i++)
//             {
//                 int end = tid+ 1 + i;
//                 int store_index_start = tid+ 1 + i;
//                 int *prefix = (int *)calloc(end+1, sizeof(int));
//                 for (int j = 0; j <= end; j++)
//                     prefix[j] = num[j];
//                 num_set[store_index_start] = prefix;
//                 num_set_col_size[store_index_start] = end+1;
//             }
//         }
//     }    
// }

// // Function to extract the suffix sets of a number string and insert them into result array from a given index
// // example: extract_suffix([1,2,3,4], 4, 4, [1,12,123,1234,0,0,0]) => [1,12,123,1234,234,34,4]
// // Extract the suffix sets
// // num_set is a 2d-array, where each column represents a set of suffixes in terms of number string, and storing starts from store_index_start
// void extract_suffix(int *num, int n, int **num_set, int *num_set_col_size)
// {
//     if (n == 0)
//         return;
//     int available_threads = omp_get_max_threads();
//     if (available_threads > n - 1)
//         available_threads = n - 1;
//     int num_rept = (n - 1) / available_threads;
//     int num_rem = (n - 1) % available_threads;
//     #pragma omp parallel num_threads(available_threads) shared(num_set, num_set_col_size)
//     {
//         int tid = omp_get_thread_num();
//         int end = n - 1;
//         for (int i = 0; i < num_rept; i++)
//         {
//             int start = 1 + tid + i;
//             int store_index_start = n + tid + i;
//             int *suffix = (int *)calloc(end-start+1, sizeof(int));
//             int k = 0;
//             for (int j = start; j <= end; j++)
//                 suffix[k++] =  num[j];                                    
//             num_set[store_index_start] = suffix;
//             num_set_col_size[store_index_start] = end-start+1;
//         }
//         if (tid == available_threads - 1)
//         {
            
//             int end = n - 1;
//             for (int i = 0; i < num_rem; i++)
//             {
//                 int start = n - 1 + i;
//                 int store_index_start = n + tid + num_rept + i;
//                 int *suffix = (int *)calloc(end - start + 1, sizeof(int));
//                 int k = 0;
//                 for (int j = start; j <= end; j++)
//                     suffix[k++] = num[j];
//                 num_set[store_index_start] = suffix;
//                 num_set_col_size[store_index_start] = end - start + 1;
//             }
//         }
//     }   
// }


// Function to extract the prefix sets of a number string and insert them into result array from a given index
// example: extract_prefix([1,2,3,4], 4, 4, [0,0,0,0,0,0,0]) => [1,12,123,1234,0,0,0]
// Extract the prefix sets
// num_set is a 2d-array, where each column represents a set of prefixes in terms of number string, and storing starts from store_index_start
void extract_prefix(int *num, int n, int **num_set, int *num_set_col_size)
{
    if (n == 0)
        return;
    int store_index_start = 0;
    for (int i =0; i<n; i++)
    {
        int *prefix = (int *)calloc(i+1, sizeof(int));
        for (int j = 0; j <= i; j++)
            prefix[j] = num[j];
        num_set[store_index_start] = prefix;
        num_set_col_size[store_index_start] = i+1;
        store_index_start++;
    }
}

// Function to extract the suffix sets of a number string and insert them into result array from a given index
// example: extract_suffix([1,2,3,4], 4, 4, [1,12,123,1234,0,0,0]) => [1,12,123,1234,234,34,4]
// Extract the suffix sets
// num_set is a 2d-array, where each column represents a set of suffixes in terms of number string, and storing starts from store_index_start
void extract_suffix(int *num, int n, int **num_set, int *num_set_col_size)
{
    int store_index_start = n;
    if (n == 1)
    {
        num_set[store_index_start] = num;
        return;
    }
    for (int i = 1; i<n; i++)
    {
        int *suffix = (int *)calloc(n - i, sizeof(int));
        for (int j = 0; j < n - i; j++)
            suffix[j] = num[j + i];
        num_set[store_index_start] = suffix;
        num_set_col_size[store_index_start] = n - i;
        store_index_start++;

    }
}

// Function to reverse the 2d array of integers, basically reversing the columns
void reverse(int **num_set, int num_set_rows, int *num_set_col_size)
{
    for (int i = 0; i < num_set_rows; i++)
    {
        int n = num_set_col_size[i];
        for (int j = 0; j < n / 2; j++)
        {
            int temp = num_set[i][j];
            num_set[i][j] = num_set[i][n - j - 1];
            num_set[i][n - j - 1] = temp;
        }
    }
}

// Function to perform Urdhva Tiryakbhyam multiplication
int* urdhva_tiryakbhyam(int *num1, int *num2, int num_len)
{
    int n = num_len*2 + 1;
    int **numset1 = (int **)calloc(2*num_len-1, sizeof(int *));
    int *numset1_col_size = (int *)calloc(2*num_len-1, sizeof(int));
   
    int **numset2 = (int **)calloc(2*num_len-1, sizeof(int *));
    int *numset2_col_size = (int *)calloc(2*num_len-1, sizeof(int));

    int *result_set = (int *)calloc(2*num_len-1, sizeof(int));
    
    // linearly extracting the prefix and suffix sets of num1 and num2
    extract_prefix(num1, num_len, numset1, numset1_col_size);
    extract_suffix(num1, num_len, numset1, numset1_col_size);
    extract_prefix(num2, num_len, numset2, numset2_col_size);
    extract_suffix(num2, num_len, numset2, numset2_col_size);

    // reverse the numset2 for cross-multiplication to be cache-friendly
    reverse(numset2, 2*num_len-1, numset2_col_size);

    // Now for each sets in numset1 and numset2, calculate the cross product and store in result_set

    // Approach 1: main omp parallel for loop
    // #pragma omp parallel for
    // for (int i = 0; i < 2*num_len-1; i++) {
    //     // iterate the num2 set in reverse order to avoid cross-multiplication of the same set
    //     int sum = 0;
    //     // printf("Multiplying set %d\n", i);
    //     int num1_index = 0;
    //     int num2_index = 0;
    //     while (num1_index < numset1_col_size[i] && num2_index <= numset2_col_size[i])
    //     {
    //         sum += numset1[i][num1_index] * numset2[i][num2_index];
    //         num1_index++;
    //         num2_index++;
    //     }
    //     // store the sums into result_set
    //     result_set[i] = sum;
    // }

    // Approach 2: omp parallel with manual thread management
    // #pragma omp parallel
    // {
    //     int tid = omp_get_thread_num();
    //     int per_thread = (2*num_len-1)/omp_get_num_threads();
    //     int remainder = (2*num_len-1)%omp_get_num_threads();
    //     int start = tid*per_thread;
    //     int end = (tid+1)*per_thread;
    //     if (tid == omp_get_num_threads()-1)
    //         end += remainder;
    //     for (int i = start; i < end; i++) {
    //         // iterate the num2 set in reverse order to avoid cross-multiplication of the same set
    //         int sum = 0;
    //         // printf("Multiplying set %d\n", i);
    //         int num1_index = 0;
    //         int num2_index = 0;
    //         while (num1_index < numset1_col_size[i] && num2_index <= numset2_col_size[i])
    //         {
    //             sum += numset1[i][num1_index] * numset2[i][num2_index];
    //             num1_index++;
    //             num2_index++;
    //         }
    //         // store the sums into result_set
    //         result_set[i] = sum;
    //     }
    // }

    // Approach 3: omp parallel for with reduction
    #pragma omp parallel for
    for (int i = 0; i < 2*num_len-1; i++) {
        // iterate the num2 set in reverse order to avoid cross-multiplication of the same set
        int sum = 0;
        // printf("Multiplying set %d\n", i);

        #pragma omp parallel for reduction(+:sum)
        for(int j = 0; j < numset1_col_size[i]; j++)
        {
            sum += numset1[i][j] * numset2[i][j];
        }
        // store the sums into result_set
        result_set[i] = sum;
    }




    

    // Perform śūddhikaran
    suddhikaran(result_set, 2*num_len-1);
    return result_set;
}

char* generateRandomNumber(int seed) {
    gmp_randstate_t state;
    mpz_t random_number;

    // Initialize random number state
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL) + seed);

    // Initialize big number
    mpz_init(random_number);

    // Generate a random number of NUMBER_OF_BITS bits
    mpz_urandomb(random_number, state, NUMBER_OF_BITS);

    // Convert the number to a string
    char* resultString = mpz_get_str(NULL, 10, random_number);

    // Clean up
    mpz_clear(random_number);
    gmp_randclear(state);

    return resultString;
}

void generate_seed() {
    // Get the current time in microseconds
    struct timeval time;
    gettimeofday(&time, NULL);
    unsigned long long now = time.tv_sec * 1e6 + time.tv_usec;

    // Get the process ID
    pid_t pid = getpid();

    // Combine the current time and the process ID to create a seed
    unsigned int seed = now ^ pid;

    // Set the seed for the rand() function
    srand(seed);
}

void main()
{
    // call and test the urdhva_tiryakbhyam function
    generate_seed();
    int randomNumber = (rand() % 100) + 1;
    char* randomString = generateRandomNumber(randomNumber);
    char *num1_str = randomString;
    generate_seed();
    randomNumber = (rand() % 100) + 1;
    randomString = generateRandomNumber(randomNumber);
    char *num2_str = randomString;
    int n1 = strlen(num1_str);
    int n2 = strlen(num2_str);
    int *num1 = (int *)calloc(n1, sizeof(int));
    if (num1 == NULL)
    {
        perror("Memory allocation failed for num1\n");
        exit(0);
    }
    // Copy the number string into the integer array
    printf("Num1: ");
    for (int i = 0; i < n1; i++)
    {
        num1[i] = num1_str[i] - '0';
        printf("%d", num1[i]);
    }
    int *num2 = (int *)calloc(n2, sizeof(int));

    if (num2 == NULL)
    {
        perror("Memory allocation failed for num2\n");
        exit(0);
    }
    // Copy the number string into the integer array
    printf("\nNum2: ");
    for (int i = 0; i < n2; i++)
    {
        num2[i] = num2_str[i] - '0';
        printf("%d", num2[i]);
    }
    printf("\n");
    // make the two numbers equidistant
    make_equidistant(&num1, &num2, &n1, &n2);

    int n = (n1 > n2) ? n1 : n2;
    // measure elapsed time with high precision
    struct timespec start, end;
    clock_gettime(CLOCK_REALTIME, &start);
    int *result = urdhva_tiryakbhyam(num1, num2, n);
    clock_gettime(CLOCK_REALTIME, &end);
    printf("Result: ");
    for (int i = 0; i < 2*n-1; i++)
    {
        printf("%d", result[i]);
    }
    printf("\n");
    printf("Time taken: %lf\n", (end.tv_sec - start.tv_sec) + 1e-9 * (end.tv_nsec - start.tv_nsec));

}