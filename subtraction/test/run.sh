#!/bin/bash

# Step 1: Create directories for each bit-size
# bit_sizes=(256 512 1024 2048 4096 8192 16384 32768 65536 131072)
bit_sizes=(512 1024 2048 4096 8192 16384 32768 65536 131072)
for bit_size in "${bit_sizes[@]}"; do
    mkdir -p "cases/${bit_size}"
done

# Step 2: Loop through each bit-size and run the Python script
for bit_size in "${bit_sizes[@]}"; do
    python3 gen_testcases.py $bit_size 100000 0
done