#!/bin/bash

# Define the bit sizes and core number
bit_sizes=(256 512 1024 2048 4096 8192 16384 32768 65536)
core_number=7

# Iterate over each bit size
for bit_size in "${bit_sizes[@]}"; do
  # Construct the filenames
  gmp_file="gmp_time_${bit_size}_${core_number}.csv"
  my_file="my_time_${bit_size}_${core_number}.csv"
  
  # Check if both files exist
  if [[ -f "$gmp_file" && -f "$my_file" ]]; then
    # Run the linear plot script
    python3 linear_plot.py "$gmp_file" "$my_file" "$bit_size" "$core_number"
    # Print the bit size and core number
    echo "Bit size: $bit_size, Core number: $core_number Done"
  else
    # Print a warning if files do not exist
    echo "Warning: Files for bit size $bit_size and core number $core_number do not exist."
  fi
done