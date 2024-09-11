import gzip
import csv
import numpy as np
import os

def extract_central_tendencies(file_path):
    # print(f"Processing file: {file_path}")
    with gzip.open(file_path, 'rt') as f:
        reader = csv.reader(f)
        data = []
        for row in reader:
            # Filter out empty strings and convert to integers
            filtered_row = [int(value) for value in row if value]
            if filtered_row:
                data.append(filtered_row)
        data = np.array(data)
    
    # Calculate min, avg, max for each column
    min_values = np.min(data, axis=0)
    avg_values = np.mean(data, axis=0)
    max_values = np.max(data, axis=0)
    
    return min_values, avg_values, max_values

def save_central_tendencies(output_dir, file_name, min_values, avg_values, max_values):
    columns = ["Cycles", "User Ins.", "Kernel Ins.", "Page-Faults", "L1D-Access", "L1D-Misses"]
    output_path = os.path.join(output_dir, file_name)
    
    with open(output_path, 'w') as f:
        f.write("Central Tendencies:\n")
        for i, col in enumerate(columns):
            f.write(f"{col}: Min = {min_values[i]}, Avg = {avg_values[i]:.2f}, Max = {max_values[i]}\n")
    
    # print(f"Saved central tendencies to: {output_path}")

def process_directory(subdir):
    current_path = os.getcwd()
    input_dir = os.path.join(current_path, subdir, 'experiments/results/perf_measurements/')
    output_base_dir = os.path.join(current_path, 'central-tendencies', 'perf', subdir)
    
    # Ensure the output base directory exists
    os.makedirs(output_base_dir, exist_ok=True)
    
    print(f"Processing directory: {input_dir}")
    
    # Iterate over all files in the input directory
    for file_name in os.listdir(input_dir):
        if file_name.endswith('.csv.gz'):
            # Parse the file name to extract test-case, bit-size, and core-number
            parts = file_name.split('_')
            if len(parts) == 3:
                test_case = parts[0]
                bit_size = parts[1]
                core_number = parts[2].replace('.csv.gz', '')
                
                # Construct the input file path
                input_file_path = os.path.join(input_dir, file_name)
                
                # Extract central tendencies
                min_values, avg_values, max_values = extract_central_tendencies(input_file_path)
                
                # Construct the output directory and file path
                output_dir = os.path.join(output_base_dir, bit_size)
                os.makedirs(output_dir, exist_ok=True)
                output_file_name = f"{test_case}_{core_number}.txt"
                
                # Save the central tendencies
                save_central_tendencies(output_dir, output_file_name, min_values, avg_values, max_values)

def main():
    subdirectories = ["baseline", "auto-vectorized", "explicit-vectorized", "gmp"]
    
    for subdir in subdirectories:
        process_directory(subdir)

if __name__ == "__main__":
    main()