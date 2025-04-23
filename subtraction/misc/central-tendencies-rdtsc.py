import os
import gzip
import numpy as np

def extract_central_tendencies(file_path):
    # print(f"Processing file: {file_path}")
    with gzip.open(file_path, 'rt') as f:
        data = [int(line.strip()) for line in f if line.strip()]
    
    data = np.array(data)
    
    # Calculate min, avg, max for the tick values
    min_value = np.min(data)
    avg_value = np.mean(data)
    max_value = np.max(data)
    
    return min_value, avg_value, max_value

def save_central_tendencies(output_dir, file_name, min_value, avg_value, max_value):
    output_path = os.path.join(output_dir, file_name)
    
    with open(output_path, 'w') as f:
        f.write("Central Tendencies:\n")
        f.write(f"Min = {min_value}\n")
        f.write(f"Avg = {avg_value:.2f}\n")
        f.write(f"Max = {max_value}\n")
    
    # print(f"Saved central tendencies to: {output_path}")

def process_directory(subdir):
    current_path = os.getcwd()
    input_dir = os.path.join(current_path, subdir, 'experiments/results/rdtsc_measurements/')
    output_base_dir = os.path.join(current_path, 'central-tendencies','rdtsc', subdir)
    
    # Ensure the output base directory exists
    os.makedirs(output_base_dir, exist_ok=True)
    
    print(f"Processing directory: {input_dir}")
    # Check if the input directory exists
    if not os.path.isdir(input_dir):
        print(f"Input directory does not exist: {input_dir}")
        return
    
    # Iterate over all files in the input directory
    for file_name in os.listdir(input_dir):
        if not os.path.isdir(input_dir):
            continue
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
                min_value, avg_value, max_value = extract_central_tendencies(input_file_path)
                
                # Construct the output directory and file path
                output_dir = os.path.join(output_base_dir, bit_size)
                os.makedirs(output_dir, exist_ok=True)
                output_file_name = f"{test_case}_{core_number}.txt"
                
                # Save the central tendencies
                save_central_tendencies(output_dir, output_file_name, min_value, avg_value, max_value)

def main():
    subdirectories = ["baseline", "auto-vectorized", "explicit-vectorized", "gmp"]
    
    for subdir in subdirectories:
        process_directory(subdir)

if __name__ == "__main__":
    main()