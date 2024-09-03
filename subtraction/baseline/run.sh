#!/bin/bash

# Step 1: Compile the C file
gcc sub_64_aligned.c -o baseline_sub -lm -lgmp -O3 -funroll-all-loops -ffast-math

# Step 2: Create the directory for logs if it doesn't exist
mkdir -p experiments/console_logs

# Step 3: Define an array of bit-sizes
bit_sizes=(512 1024 2048 4096 8192 16384 32768)

# Step 4: Loop through each bit-size and run the compiled file
for bit_size in "${bit_sizes[@]}"; do
    sudo taskset -c 1 ./baseline_sub $bit_size 1 > "experiments/console_logs/${bit_size}.txt"
done