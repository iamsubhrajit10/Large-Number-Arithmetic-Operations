import os
import gzip
import numpy as np
import matplotlib.pyplot as plt

def extract_data(file_path):
    with gzip.open(file_path, 'rt') as f:
        data = [int(line.strip()) for line in f if line.strip()]
    return np.array(data)

def plot_cdf(data1, label1, data2, label2, output_path, test_case, bit_size):
    # Sort data
    data1_sorted = np.sort(data1)
    data2_sorted = np.sort(data2)
    
    # Calculate CDF values
    cdf1 = np.arange(1, len(data1_sorted) + 1) / len(data1_sorted)
    cdf2 = np.arange(1, len(data2_sorted) + 1) / len(data2_sorted)
    
    # Calculate central tendencies
    min1, avg1, max1 = np.min(data1), np.mean(data1), np.max(data1)
    min2, avg2, max2 = np.min(data2), np.mean(data2), np.max(data2)
    
    # Plot CDFs
    plt.figure()
    plt.plot(data1_sorted, cdf1, label=f"{label1} (min: {min1}, avg: {avg1}, max: {max1})")
    plt.plot(data2_sorted, cdf2, label=f"{label2} (min: {min2}, avg: {avg2}, max: {max2})")
    plt.xlabel('Timespec Value')
    plt.ylabel('CDF')
    plt.xscale('log')  # Use log scale for x-axis
    plt.legend(loc='best')
    plt.grid(True)
    plt.title(f'CDF Comparison: {label1} vs {label2}\nTest Case: {test_case}, Bit Size: {bit_size}')
    
    # Save the plot
    plt.savefig(output_path)
    plt.close()

def process_directory(subdir, gmp_dir):
    current_path = os.getcwd()
    input_dir = os.path.join(current_path, subdir, 'experiments/results/timespec_measurements/')
    gmp_input_dir = os.path.join(current_path, gmp_dir, 'experiments/results/timespec_measurements/')
    output_base_dir = os.path.join(current_path, 'cdf-charts', 'timespec', subdir)
    
    # Ensure the output base directory exists
    os.makedirs(output_base_dir, exist_ok=True)
    
    print(f"Processing directory: {input_dir}")
    # Check if the input directory exists
    if not os.path.isdir(input_dir):
        print(f"Input directory does not exist: {input_dir}")
        return
    
    # Collect all files in the input and GMP directories
    files = [f for f in os.listdir(input_dir) if f.endswith('.csv.gz')]
    gmp_files = [f for f in os.listdir(gmp_input_dir) if f.endswith('.csv.gz')]
    
    # Group files by test case and bit size
    grouped_files = {}
    for file_name in files:
        parts = file_name.split('_')
        if len(parts) == 3:
            test_case = parts[0]
            bit_size = parts[1]
            core_number = parts[2].replace('.csv.gz', '')
            key = (test_case, bit_size)
            if key not in grouped_files:
                grouped_files[key] = {'gmp': None, 'others': []}
            grouped_files[key]['others'].append((file_name, core_number))
    
    for file_name in gmp_files:
        parts = file_name.split('_')
        if len(parts) == 3:
            test_case = parts[0]
            bit_size = parts[1]
            core_number = parts[2].replace('.csv.gz', '')
            key = (test_case, bit_size)
            if key not in grouped_files:
                grouped_files[key] = {'gmp': None, 'others': []}
            grouped_files[key]['gmp'] = file_name
    
    # Process each group
    for (test_case, bit_size), file_dict in grouped_files.items():
        gmp_file = file_dict['gmp']
        other_files = file_dict['others']
        
        if gmp_file:
            gmp_data = extract_data(os.path.join(gmp_input_dir, gmp_file))
            
            for other_file, core_number in other_files:
                other_data = extract_data(os.path.join(input_dir, other_file))
                output_file_name = f"{bit_size}_{test_case}.png"
                output_path = os.path.join(output_base_dir, output_file_name)
                plot_cdf(other_data, subdir, gmp_data, 'GMP', output_path, test_case, bit_size)

def main():
    subdirectories = ["baseline", "auto-vectorized", "explicit-vectorized"]
    gmp_dir = "gmp"
    
    for subdir in subdirectories:
        process_directory(subdir, gmp_dir)

if __name__ == "__main__":
    main()