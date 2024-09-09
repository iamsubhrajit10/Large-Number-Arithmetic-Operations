#!/bin/bash

# Step 1: Compile the C file
gcc sub.c -o sub -lm -lgmp -lz -O3 -funroll-all-loops -ffast-math

# Step 2: Create the directory for logs if it doesn't exist
mkdir -p experiments/console_logs

# Step 3: Define an array of bit-sizes
bit_sizes=(256 512 1024 2048 4096 8192 16384 32768 65536)
# Step 4: Define an array of test-case numbers and their descriptions
test_cases=(0 1 2 3)
test_case_descriptions=("random" "equal" "greater" "smaller")

# Step 4: Loop through each bit-size and test-case number
for bit_size in "${bit_sizes[@]}"
do
    for test_case in "${test_cases[@]}"
    do
        # Get the description for the current test case
        test_case_description=${test_case_descriptions[$test_case]}
        
        # Step 5: Run the executable with the current bit-size and test-case number
        sudo taskset -c 0 ./sub $bit_size 0 $test_case > experiments/console_logs/${bit_size}_${test_case_description}.txt
    done
done
    done
done