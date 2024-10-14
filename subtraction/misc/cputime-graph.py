import os
import gzip
import csv
import glob
import matplotlib.pyplot as plt

# Constants
measure_types = ['cputime', 'rdtsc', 'timespec']
test_cases = ['random', 'equal', 'greater', 'smaller']
bit_sizes = [65536, 32768, 16384, 8192, 4096, 2048, 1024, 512, 256]

def read_data(file_path):
    with gzip.open(file_path, mode='rt') as file:
        reader = csv.reader(file)
        data = [float(row[0]) for row in reader]
    return data

def calculate_ops_per_second(times_ns):
    # return [1e9 / time_ns for time_ns in times_ns]
    return times_ns

def plot_graph(bit_sizes, test_case, measure_type, gmp_ops, explicit_avx_ops, speedups):
    plt.figure(figsize=(10, 6))
    plt.plot(bit_sizes, gmp_ops, marker='o', label='GMP')
    plt.plot(bit_sizes, explicit_avx_ops, marker='s', label='EXPLICIT-AVX')

    plt.xlabel('Number of Bits')
    plt.ylabel('Number of Ops/s')
    plt.title(f'Performance Comparison: GMP vs EXPLICIT-AVX ({measure_type}, {test_case})')
    plt.xscale('log')
    plt.yscale('log')
    plt.legend(loc='upper left')
    plt.grid(True, which='both', linestyle='--', linewidth=0.5)
    plt.xticks(bit_sizes, [str(bit) for bit in bit_sizes])

    for i, txt in enumerate(gmp_ops):
        plt.annotate(f'{txt:.2e}', (bit_sizes[i], gmp_ops[i]), textcoords="offset points", xytext=(0,10), ha='center')
    for i, txt in enumerate(explicit_avx_ops):
        plt.annotate(f'{txt:.2e}', (bit_sizes[i], explicit_avx_ops[i]), textcoords="offset points", xytext=(0,10), ha='center')

    # Add speedup information to the legend
    speedup_text = 'Speedup\n' + '\n'.join([f'{bit_size} bits: {speedup:.2f}x' for bit_size, speedup in zip(bit_sizes, speedups)])
    plt.gcf().text(0.95, 0.5, speedup_text, fontsize=10, verticalalignment='center', transform=plt.gca().transAxes)

    output_dir = f'linear-graphs/{measure_type}'
    os.makedirs(output_dir, exist_ok=True)
    plt.savefig(f'{output_dir}/{test_case}.png', bbox_inches='tight')
    plt.close()

for measure_type in measure_types:
    for test_case in test_cases:
        gmp_ops_all = []
        explicit_avx_ops_all = []
        speedups = []

        for bit_size in bit_sizes:
            gmp_file_pattern = f'../gmp/experiments/results/{measure_type}_measurements/{test_case}_{bit_size}_*.csv.gz'
            explicit_avx_file_pattern = f'../explicit-vectorized/experiments/results/{measure_type}_measurements/{test_case}_{bit_size}_*.csv.gz'

            gmp_files = glob.glob(gmp_file_pattern)
            explicit_avx_files = glob.glob(explicit_avx_file_pattern)

            if not gmp_files or not explicit_avx_files:
                print(f"No files found for {measure_type}, {test_case}, {bit_size}")
                gmp_ops_all.append(None)
                explicit_avx_ops_all.append(None)
                speedups.append(None)
                continue

            gmp_times_ns = read_data(gmp_files[0])
            explicit_avx_times_ns = read_data(explicit_avx_files[0])

            gmp_ops = calculate_ops_per_second(gmp_times_ns)
            explicit_avx_ops = calculate_ops_per_second(explicit_avx_times_ns)

            gmp_ops_all.append(gmp_ops[0] if gmp_ops else None)
            explicit_avx_ops_all.append(explicit_avx_ops[0] if explicit_avx_ops else None)

            if gmp_ops and explicit_avx_ops:
                speedup = explicit_avx_ops[0] / gmp_ops[0]
                speedups.append(speedup)
            else:
                speedups.append(None)

        # Filter out None values
        valid_bit_sizes = [bit_size for bit_size, gmp_op, explicit_avx_op, speedup in zip(bit_sizes, gmp_ops_all, explicit_avx_ops_all, speedups) if gmp_op is not None and explicit_avx_op is not None and speedup is not None]
        valid_gmp_ops = [gmp_op for gmp_op in gmp_ops_all if gmp_op is not None]
        valid_explicit_avx_ops = [explicit_avx_op for explicit_avx_op in explicit_avx_ops_all if explicit_avx_op is not None]
        valid_speedups = [speedup for speedup in speedups if speedup is not None]

        if valid_bit_sizes and valid_gmp_ops and valid_explicit_avx_ops:
            plot_graph(valid_bit_sizes, test_case, measure_type, valid_gmp_ops, valid_explicit_avx_ops, valid_speedups)