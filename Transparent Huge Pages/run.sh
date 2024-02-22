#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <input_source_file> <executable_name> <number_of_bits> <number_of_iterations>"
    exit 1
fi

# Extract command-line arguments
input_source_file="$1"
executable_name="$2"
number_of_bits="$3"
number_of_iterations="$4"

# Array to store tick values
declare -a ticks

# Compile the C program
gcc -o "$executable_name" "$input_source_file" -lgmp

# Run the program 'number_of_iterations' times and record tick values
for ((i=1; i<=$number_of_iterations; i++))
do
    echo "Starting iteration $i..."
    # Run the compiled program and extract the tick value
    output=$(./"$executable_name" "$number_of_bits" 2>&1)
    tick=$(echo "$output" | grep "Ticks" | awk '{print $2}')
    
    # Check if there was an error in the output
    if [ -z "$tick" ]; then
        echo "Error in iteration $i: $output"
        continue
    fi
    
    # Store the tick value in the array
    ticks[$i]=$tick
    echo "Done iteration $i."
done

# Calculate average and minimum ticks
if [ ${#ticks[@]} -eq 0 ]; then
    echo "No valid tick values recorded."
    exit 1
fi

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
average_ticks=$((total_ticks / number_of_iterations))

# Print results
echo "Average ticks: $average_ticks"
echo "Minimum ticks: $min_ticks"
