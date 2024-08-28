import pandas as pd
import matplotlib.pyplot as plt
import glob
import re

def calculate_statistics(data):
    return data.mean(), data.min(), data.max()

def plot_linear(core_number):
    gmp_timespec_stats = {'bit_size': [], 'min': [], 'avg': [], 'max': []}
    my_timespec_stats = {'bit_size': [], 'min': [], 'avg': [], 'max': []}
    
    gmp_rdtsc_stats = {'bit_size': [], 'min': [], 'avg': [], 'max': []}
    my_rdtsc_stats = {'bit_size': [], 'min': [], 'avg': [], 'max': []}

    # Fetch all relevant files for the given core number
    gmp_files = glob.glob(f"gmp_time_*_{core_number}.csv")
    my_files = glob.glob(f"my_time_*_{core_number}.csv")

    # Extract bit sizes from filenames
    bit_sizes = sorted(set(int(re.search(r'(\d+)_', f).group(1)) for f in gmp_files))
    
    print("Bit sizes found:", bit_sizes)

    for bit_size in bit_sizes:
        gmp_file = f"gmp_time_{bit_size}_{core_number}.csv"
        my_file = f"my_time_{bit_size}_{core_number}.csv"

        try:
            df1 = pd.read_csv(gmp_file, header=None)
            df2 = pd.read_csv(my_file, header=None)

            data1_timespec = df1.iloc[:, 0]
            data2_timespec = df2.iloc[:, 0]
            data1_rdtsc = df1.iloc[:, 1]
            data2_rdtsc = df2.iloc[:, 1]

            # Calculate statistics for timespec
            stats1_timespec = calculate_statistics(data1_timespec)
            stats2_timespec = calculate_statistics(data2_timespec)

            gmp_timespec_stats['bit_size'].append(bit_size)
            gmp_timespec_stats['min'].append(stats1_timespec[1])
            gmp_timespec_stats['avg'].append(stats1_timespec[0])
            gmp_timespec_stats['max'].append(stats1_timespec[2])

            my_timespec_stats['bit_size'].append(bit_size)
            my_timespec_stats['min'].append(stats2_timespec[1])
            my_timespec_stats['avg'].append(stats2_timespec[0])
            my_timespec_stats['max'].append(stats2_timespec[2])

            # Calculate statistics for rdtsc
            stats1_rdtsc = calculate_statistics(data1_rdtsc)
            stats2_rdtsc = calculate_statistics(data2_rdtsc)

            gmp_rdtsc_stats['bit_size'].append(bit_size)
            gmp_rdtsc_stats['min'].append(stats1_rdtsc[1])
            gmp_rdtsc_stats['avg'].append(stats1_rdtsc[0])
            gmp_rdtsc_stats['max'].append(stats1_rdtsc[2])

            my_rdtsc_stats['bit_size'].append(bit_size)
            my_rdtsc_stats['min'].append(stats2_rdtsc[1])
            my_rdtsc_stats['avg'].append(stats2_rdtsc[0])
            my_rdtsc_stats['max'].append(stats2_rdtsc[2])

        except FileNotFoundError:
            print(f"File not found: {gmp_file} or {my_file}")
            continue

    # Plotting
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 16))  # Create two subplots

    # Plot for timespec
    ax1.plot(gmp_timespec_stats['bit_size'], gmp_timespec_stats['min'], label='GMP Min (timespec)', marker='o')
    ax1.plot(gmp_timespec_stats['bit_size'], gmp_timespec_stats['avg'], label='GMP Avg (timespec)', marker='o')
    ax1.plot(gmp_timespec_stats['bit_size'], gmp_timespec_stats['max'], label='GMP Max (timespec)', marker='o')

    ax1.plot(my_timespec_stats['bit_size'], my_timespec_stats['min'], label='My Min (timespec)', marker='x')
    ax1.plot(my_timespec_stats['bit_size'], my_timespec_stats['avg'], label='My Avg (timespec)', marker='x')
    ax1.plot(my_timespec_stats['bit_size'], my_timespec_stats['max'], label='My Max (timespec)', marker='x')

    ax1.set_xlabel('Bit Size')
    ax1.set_ylabel('Timespec Values')
    ax1.set_title(f'Timespec Min, Avg, Max for Core {core_number}')
    ax1.set_xticks(bit_sizes)
    ax1.legend()
    ax1.grid(True)

    # Plot for rdtsc
    ax2.plot(gmp_rdtsc_stats['bit_size'], gmp_rdtsc_stats['min'], label='GMP Min (rdtsc)', marker='o')
    ax2.plot(gmp_rdtsc_stats['bit_size'], gmp_rdtsc_stats['avg'], label='GMP Avg (rdtsc)', marker='o')
    ax2.plot(gmp_rdtsc_stats['bit_size'], gmp_rdtsc_stats['max'], label='GMP Max (rdtsc)', marker='o')

    ax2.plot(my_rdtsc_stats['bit_size'], my_rdtsc_stats['min'], label='My Min (rdtsc)', marker='x')
    ax2.plot(my_rdtsc_stats['bit_size'], my_rdtsc_stats['avg'], label='My Avg (rdtsc)', marker='x')
    ax2.plot(my_rdtsc_stats['bit_size'], my_rdtsc_stats['max'], label='My Max (rdtsc)', marker='x')

    ax2.set_xlabel('Bit Size')
    ax2.set_ylabel('RDTSC Values')
    ax2.set_title(f'RDTSC Min, Avg, Max for Core {core_number}')
    ax2.set_xticks(bit_sizes)
    ax2.legend()
    ax2.grid(True)

    plt.tight_layout()
    plt.savefig(f'linear_plot_core_{core_number}.png')
    plt.show()

if __name__ == "__main__":
    core_number = 7
    plot_linear(core_number)
