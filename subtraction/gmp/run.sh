#!/bin/bash

# Step 1: Compile the C file
gcc sub.c -o sub -lm -lgmp -lz -mavx512f -O3 -funroll-all-loops -ffast-math -flto -march=native

# Step 2: Create the directory for logs if it doesn't exist
mkdir -p experiments/console_logs

# Step 3: Define an array of bit-sizes
bit_sizes=(256 512 1024 2048 4096 8192 16384 32768 65536)
# bit_sizes=(16384)
# Step 4: Define an array of test-case numbers and their descriptions
test_cases=(0 1 2 3)
# test_cases=(2 3)
test_case_descriptions=("random" "equal" "greater" "smaller")
measure_types=(0 1 2)
measure_types_descriptions=("rdtsc" "timespec" "rusage")

# Determine the number of available CPU cores
num_cores=$(nproc)



# Step 4: Loop through each bit-size and test-case number
for bit_size in "${bit_sizes[@]}"
do
    for test_case in "${test_cases[@]}"
    do
        # Get the description for the current test case
        test_case_description=${test_case_descriptions[$test_case]}

        # Randomly select a core number from the available cores
        core_number=$((RANDOM % num_cores))
        
        for measure_type in "${measure_types[@]}"
        do
            # Get the description for the current measure type
            measure_type_description=${measure_types_descriptions[$measure_type]}
            echo "Running for bit-size: $bit_size, test-case: $test_case_description, measure-type: $measure_type_description"
            # Step 5: Run the executable with the current bit-size and test-case number
            sudo taskset -c $core_number ./sub $bit_size $core_number $test_case $measure_type > experiments/console_logs/${bit_size}_${test_case_description}_${measure_type_description}.txt
        done
    done
done