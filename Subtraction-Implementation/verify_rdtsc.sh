#!/bin/bash

# Check if the file is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

# Initialize variables
total=0
count=0

echo "Starting to process the file..."

# Read the file line by line
while IFS= read -r line; do
    # Add the value to the total
    total=$(echo "$total + $line" | bc)
    # Increment the count
    count=$((count + 1))
    # Print debug information
    # echo "Processed line $count: $line"
    # echo "Current total: $total"
done < "$filename"

echo "Finished processing the file."

# Calculate the average
if [ $count -ne 0 ]; then
    average=$(echo "scale=2; $total / $count" | bc)
else
    average=0
fi

# Print the results
echo "Total: $total"
echo "Average: $average"