import os
import gzip
import numpy as np
import matplotlib.pyplot as plt
from adjustText import adjust_text

def extract_data(file_path):
    with gzip.open(file_path, 'rt') as f:
        data = [int(line.strip()) for line in f if line.strip()]
    return np.array(data)

def calculate_average(data):
    return np.mean(data)

def plot_linear_curve(averages, labels, output_path, test_case):
    plt.figure()
    texts = []
    for avg, label in zip(averages, labels):
        if avg:  # Only plot if there are averages
            bit_sizes = sorted(avg.keys(), key=int)
            avg_values = [avg[bit_size] for bit_size in bit_sizes]
            plt.plot(bit_sizes, avg_values, marker='o', label=label)
            for bit_size, avg_value in zip(bit_sizes, avg_values):
                texts.append(plt.text(bit_size, avg_value, f'{avg_value:.2f}', ha='center', va='bottom'))
    
    adjust_text(texts, arrowprops=dict(arrowstyle='->', color='red'))
    
    plt.xlabel('Bit Size')
    plt.ylabel('Average Timespec Value')
    plt.legend(loc='best')
    plt.grid(True)
    plt.title(f'Average Values of {test_case.capitalize()} Test-Case Across Bit Sizes')
    
    # Ensure the output directory exists
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    
    # Save the plot
    plt.savefig(output_path)
    plt.close()

def process_directory(subdir, gmp_dir, averages, test_case):
    current_path = os.getcwd()
    input_dir = os.path.join(current_path, subdir, 'experiments/results/timespec_measurements/')
    gmp_input_dir = os.path.join(current_path, gmp_dir, 'experiments/results/timespec_measurements/')
    
    print(f"Processing directory: {input_dir}")
    # Check if the input directory exists
    if not os.path.isdir(input_dir):
        print(f"Input directory does not exist: {input_dir}")
        return
    
    # Collect all files in the input and GMP directories
    files = [f for f in os.listdir(input_dir) if f.endswith('.csv.gz')]
    gmp_files = [f for f in os.listdir(gmp_input_dir) if f.endswith('.csv.gz')]
    
    # Group files by bit size
    grouped_files = {}
    for file_name in files:
        parts = file_name.split('_')
        if len(parts) == 3 and parts[0] == test_case:
            bit_size = parts[1]
            core_number = parts[2].replace('.csv.gz', '')
            if bit_size not in grouped_files:
                grouped_files[bit_size] = {'gmp': None, 'others': []}
            grouped_files[bit_size]['others'].append((file_name, core_number))
    
    for file_name in gmp_files:
        parts = file_name.split('_')
        if len(parts) == 3 and parts[0] == test_case:
            bit_size = parts[1]
            core_number = parts[2].replace('.csv.gz', '')
            if bit_size not in grouped_files:
                grouped_files[bit_size] = {'gmp': None, 'others': []}
            grouped_files[bit_size]['gmp'] = file_name
    
    # Calculate averages for each bit size
    for bit_size, file_dict in grouped_files.items():
        gmp_file = file_dict['gmp']
        other_files = file_dict['others']
        
        if gmp_file:
            gmp_data = extract_data(os.path.join(gmp_input_dir, gmp_file))
            averages['gmp'][bit_size] = calculate_average(gmp_data)
            
            for other_file, core_number in other_files:
                other_data = extract_data(os.path.join(input_dir, other_file))
                averages[subdir][bit_size] = calculate_average(other_data)

def main():
    subdirectories = ["baseline", "auto-vectorized", "explicit-vectorized"]
    gmp_dir = "gmp"
    test_cases = ["random", "equal", "greater", "smaller"]
    
    for test_case in test_cases:
        averages = {subdir: {} for subdir in subdirectories + ["gmp"]}
        
        for subdir in subdirectories:
            process_directory(subdir, gmp_dir, averages, test_case)
        
        # Plot linear curves
        labels = [subdir for subdir in subdirectories if averages[subdir]] + ["gmp"]
        output_path = os.path.join(os.getcwd(), 'linear-curves', 'timespec', f'average_values_comparison_{test_case}.png')
        plot_linear_curve([averages[label] for label in labels], labels, output_path, test_case)

if __name__ == "__main__":
    main()