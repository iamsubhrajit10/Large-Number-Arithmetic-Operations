#!/bin/bash

# Define the directories to process
directories=("test" "baseline" "auto-vectorized" "explicit-vectorized" "gmp")

# Loop through each directory and run the script if it exists
for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        cd "$dir"
        if [ -f "run.sh" ]; then
            echo "Running sudo ./run.sh in $dir"
            sudo ./run.sh
            if [$? -ne 0]; then
                echo "Error running sudo ./run.sh in $dir"
            fi
        else
            echo "run.sh not found in $dir"
        fi
        cd ..
    else
        echo "$dir directory not found"
    fi
done