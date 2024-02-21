#!/bin/bash

# Number of iterations
n=10

# Array to store tick values
declare -a ticks

# Compile the C program
gcc -o intel-thp intel-thp.c -lgmp

# Run the program 'n' times and record tick values
for ((i=0; i<$n; i++))
do
    # Run the C program and extract the tick value
    tick=$(./multiply_program <number_of_bits> | grep "Ticks" | awk '{print $2}')
    
    # Store the tick value in the array
    ticks[$i]=$tick
done

# Calculate average and minimum ticks
total_ticks=0
min_ticks=${ticks[0]}
for tick in "${ticks[@]}"
do
    total_ticks=$((total_ticks + tick))
    if ((tick < min_ticks))
    then
        min_ticks=$tick
    fi
done
average_ticks=$((total_ticks / n))

# Print results
echo "Average ticks: $average_ticks"
echo "Minimum ticks: $min_ticks"
