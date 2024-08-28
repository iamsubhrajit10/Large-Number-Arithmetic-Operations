import pandas as pd
import matplotlib.pyplot as plt
import glob
import re
import numpy as np

def calculate_average(data):
    return data.mean()

def plot_linear(core_number, max_bit_size=65536):
    gmp_stats = {'bit_size': [], 'avg_timespec': [], 'avg_rdtsc': []}
    my_stats = {'bit_size': [], 'avg_timespec': [], 'avg_rdtsc': []}
    speedup_stats = {'bit_size': [], 'speedup_timespec': [], 'speedup_rdtsc': []}

    # Fetch all relevant files for the given core number
    gmp_files = glob.glob(f"gmp_time_*_{core_number}.csv")
    my_files = glob.glob(f"my_time_*_{core_number}.csv")

    # Extract bit sizes from filenames and filter by max_bit_size
    bit_sizes = sorted(set(int(re.search(r'(\d+)_', f).group(1)) for f in gmp_files))
    bit_sizes = [bit_size for bit_size in bit_sizes if bit_size <= max_bit_size]
    
    print("Bit sizes found and filtered:", bit_sizes)

    for bit_size in bit_sizes:
        gmp_file = f"gmp_time_{bit_size}_{core_number}.csv"
        my_file = f"my_time_{bit_size}_{core_number}.csv"

        try:
            df1 = pd.read_csv(gmp_file, header=None)
            df2 = pd.read_csv(my_file, header=None)

            avg1_timespec = calculate_average(df1.iloc[:, 0])
            avg1_rdtsc = calculate_average(df1.iloc[:, 1])
            avg2_timespec = calculate_average(df2.iloc[:, 0])
            avg2_rdtsc = calculate_average(df2.iloc[:, 1])

            gmp_stats['bit_size'].append(bit_size)
            gmp_stats['avg_timespec'].append(avg1_timespec)
            gmp_stats['avg_rdtsc'].append(avg1_rdtsc)

            my_stats['bit_size'].append(bit_size)
            my_stats['avg_timespec'].append(avg2_timespec)
            my_stats['avg_rdtsc'].append(avg2_rdtsc)

            # Calculate speedup (GMP/AVX)
            speedup_timespec = avg1_timespec / avg2_timespec
            speedup_rdtsc = avg1_rdtsc / avg2_rdtsc
            speedup_stats['bit_size'].append(bit_size)
            speedup_stats['speedup_timespec'].append(speedup_timespec)
            speedup_stats['speedup_rdtsc'].append(speedup_rdtsc)

        except FileNotFoundError:
            print(f"File not found: {gmp_file} or {my_file}")
            continue

    print("GMP Stats:", gmp_stats)
    print("My Stats:", my_stats)
    print("Speedup Stats:", speedup_stats)

    fig, axs = plt.subplots(3, 1, figsize=(12, 18))

    # Create equidistant x-axis points for plotting
    x_positions = np.arange(len(bit_sizes))

    # Plot the data with equidistant spacing on the x-axis
    for i, bit_size in enumerate(bit_sizes):
        # Timespec plot
        axs[0].plot(x_positions[i], gmp_stats['avg_timespec'][i], 'o', label='GMP Avg Timespec' if i == 0 else "")
        axs[0].plot(x_positions[i], my_stats['avg_timespec'][i], 'x', label='My Avg Timespec' if i == 0 else "")
        axs[0].annotate(f'{gmp_stats["avg_timespec"][i]:.2f}', (x_positions[i], gmp_stats['avg_timespec'][i]), textcoords="offset points", xytext=(0,10), ha='center')
        axs[0].annotate(f'{my_stats["avg_timespec"][i]:.2f}', (x_positions[i], my_stats['avg_timespec'][i]), textcoords="offset points", xytext=(0,10), ha='center')

    axs[0].plot(x_positions, gmp_stats['avg_timespec'], 'o-', label='GMP Avg Timespec')
    axs[0].plot(x_positions, my_stats['avg_timespec'], 'x-', label='My Avg Timespec')

    # RDTSC plot
    for i, bit_size in enumerate(bit_sizes):
        axs[1].plot(x_positions[i], gmp_stats['avg_rdtsc'][i], 'o', label='GMP Avg RDTSC' if i == 0 else "")
        axs[1].plot(x_positions[i], my_stats['avg_rdtsc'][i], 'x', label='My Avg RDTSC' if i == 0 else "")
        axs[1].annotate(f'{gmp_stats["avg_rdtsc"][i]:.2f}', (x_positions[i], gmp_stats['avg_rdtsc'][i]), textcoords="offset points", xytext=(0,10), ha='center')
        axs[1].annotate(f'{my_stats["avg_rdtsc"][i]:.2f}', (x_positions[i], my_stats['avg_rdtsc'][i]), textcoords="offset points", xytext=(0,10), ha='center')

    axs[1].plot(x_positions, gmp_stats['avg_rdtsc'], 'o-', label='GMP Avg RDTSC')
    axs[1].plot(x_positions, my_stats['avg_rdtsc'], 'x-', label='My Avg RDTSC')

    # Speedup plot
    for i, bit_size in enumerate(bit_sizes):
        marker_timespec = 'o' if speedup_stats['speedup_timespec'][i] >= 1 else 'v'
        marker_rdtsc = 'x' if speedup_stats['speedup_rdtsc'][i] >= 1 else 'v'
        axs[2].plot(x_positions[i], speedup_stats['speedup_timespec'][i], marker_timespec, label='Speedup (Timespec)' if i == 0 else "")
        axs[2].plot(x_positions[i], speedup_stats['speedup_rdtsc'][i], marker_rdtsc, label='Speedup (RDTSC)' if i == 0 else "")
        axs[2].annotate(f'{speedup_stats["speedup_timespec"][i]:.2f}', (x_positions[i], speedup_stats['speedup_timespec'][i]), textcoords="offset points", xytext=(0,10), ha='center')
        axs[2].annotate(f'{speedup_stats["speedup_rdtsc"][i]:.2f}', (x_positions[i], speedup_stats['speedup_rdtsc'][i]), textcoords="offset points", xytext=(0,10), ha='center')

    axs[2].plot(x_positions, speedup_stats['speedup_timespec'], 'o-', label='Speedup (Timespec)')
    axs[2].plot(x_positions, speedup_stats['speedup_rdtsc'], 'x-', label='Speedup (RDTSC)')

    axs[0].set_xlabel('Bit Size')
    axs[0].set_ylabel('Average Timespec')
    axs[0].set_title(f'Average Timespec for Core {core_number}')
    axs[0].legend()
    axs[0].grid(True)
    axs[0].set_xticks(x_positions)
    axs[0].set_xticklabels(bit_sizes)  # Set bit sizes as labels

    axs[1].set_xlabel('Bit Size')
    axs[1].set_ylabel('Average RDTSC')
    axs[1].set_title(f'Average RDTSC for Core {core_number}')
    axs[1].legend()
    axs[1].grid(True)
    axs[1].set_xticks(x_positions)
    axs[1].set_xticklabels(bit_sizes)  # Set bit sizes as labels

    axs[2].set_xlabel('Bit Size')
    axs[2].set_ylabel('Speedup (GMP/AVX)')
    axs[2].set_title(f'Speedup (GMP/AVX) for Core {core_number}')
    axs[2].legend()
    axs[2].grid(True)
    axs[2].set_xticks(x_positions)
    axs[2].set_xticklabels(bit_sizes)  # Set bit sizes as labels

    plt.tight_layout()
    plt.savefig(f'linear_plot_with_speedup_core_{core_number}.png')
    plt.show()

if __name__ == "__main__":
    core_number = 7
    plot_linear(core_number)