#!/bin/bash

# Define the bit sizes and core numbers
bit_sizes=(256 512 1024 2048 4096 8192 16384 32768 65536)
core_numbers=(0 1 2 3 4 5 6 7 8 9)

# Iterate over each bit size
for bit_size in "${bit_sizes[@]}"; do
  # Iterate over each core number
  for core_number in "${core_numbers[@]}"; do
    # Construct the filenames
    gmp_file="gmp_time_${bit_size}_${core_number}.csv"
    my_file="my_time_${bit_size}_${core_number}.csv"
    

    # Run the Python script
    python3 cdf_script.py "$gmp_file" "$my_file" "$bit_size" "$core_number"
    # print the bit size and core number
    echo "Bit size: $bit_size, Core number: $core_number Done"
  done
done