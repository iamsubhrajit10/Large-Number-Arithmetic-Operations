import matplotlib.pyplot as plt
import numpy as np
import matplotlib
from matplotlib import rcParams

# Set professional styling
plt.style.use('seaborn-v0_8-whitegrid')
rcParams['font.family'] = 'sans-serif'
rcParams['font.sans-serif'] = ['Arial', 'DejaVu Sans', 'Liberation Sans', 'Bitstream Vera Sans', 'sans-serif']

# Data from your table
bit_sizes = [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072]
# Baseline_SUB data
base_ticks = [14, 27, 47, 91, 178, 352, 725, 1512, 3015, 6059]
base_instructions = [63, 129, 216, 411, 787, 1539, 3043, 6044, 12067, 24099]
base_l1d_reads = [23, 40, 72, 136, 264, 520, 1032, 2056, 4104, 8200]
base_l1d_misses = [6, 11, 11, 18, 33, 49, 93, 177, 405, 905]
base_l1d_miss_pct = [26.1, 27.5, 15.3, 13.2, 12.5, 9.4, 9.0, 8.6, 9.9, 11.0]

# GMP_SUB data
gmp_ticks = [23, 27, 34, 50, 87, 171, 424, 943, 1867, 3773]
gmp_instructions = [114, 131, 165, 233, 369, 641, 1185, 2273, 4449, 8801]
gmp_l1d_reads = [29, 37, 53, 85, 149, 277, 533, 1048, 2069, 4117]
gmp_l1d_misses = [6, 7, 12, 18, 31, 59, 104, 208, 412, 885]
gmp_l1d_miss_pct = [20.7, 18.9, 22.6, 21.2, 20.8, 21.3, 19.5, 19.8, 19.9, 21.5]

# PML_SUB data
pml_ticks = [11, 12, 14, 21, 34, 68, 133, 272, 547, 1074]
pml_instructions = [27, 53, 66, 96, 153, 246, 453, 846, 1653, 3246]
pml_l1d_reads = [23, 40, 72, 136, 264, 520, 1032, 1021, 4104, 4055]
pml_l1d_misses = [4, 8, 13, 18, 47, 53, 99, 188, 392, 896]
pml_l1d_miss_pct = [17.4, 20.0, 18.1, 13.2, 17.8, 10.2, 9.6, 18.4, 9.6, 22.1]


# Calculate speedup factors - PML vs GMP and PML vs Baseline
speedup_gmp_ticks = [gmp / pml for gmp, pml in zip(gmp_ticks, pml_ticks)]
speedup_base_ticks = [base / pml for base, pml in zip(base_ticks, pml_ticks)]
speedup_gmp_instructions = [gmp / pml for gmp, pml in zip(gmp_instructions, pml_instructions)]
speedup_base_instructions = [base / pml for base, pml in zip(base_instructions, pml_instructions)]
speedup_gmp_l1d_misses = [gmp / pml for gmp, pml in zip(gmp_l1d_misses, pml_l1d_misses)]
speedup_base_l1d_misses = [base / pml for base, pml in zip(base_l1d_misses, pml_l1d_misses)]


# Bar width
bar_width = 0.3

# Enhanced color palette - color-blind friendly and more vibrant
base_color = "#CC79A7"    # Pinkish-purple for baseline
gmp_color = "#D55E00"     # Red-orange for GMP
pml_color = "#009E73"     # Teal green for PML
speedup_gmp_color = "#0072B2" # Blue for GMP vs PML speedup
speedup_base_color = "#56B4E9" # Light blue for Baseline vs PML speedup

# Define function to create well-annotated individual plots
def create_metric_plot(metric_name, base_data, gmp_data, pml_data, 
                     speedup_gmp_data=None, speedup_base_data=None, 
                     y_label="", filename=""):
    plt.figure(figsize=(12, 8), dpi=300)
    ax = plt.gca()
    
    # Position arrays for bars
    x = np.arange(len(bit_sizes))
    
    # Create bars in order: Baseline, GMP, PML
    base_bars = ax.bar(x - bar_width, base_data, bar_width, label=f'Baseline_SUB {metric_name}', 
                     color=base_color, edgecolor='white', linewidth=0.8)
    gmp_bars = ax.bar(x, gmp_data, bar_width, label=f'GMP_SUB {metric_name}', 
                     color=gmp_color, edgecolor='white', linewidth=0.8)
    pml_bars = ax.bar(x + bar_width, pml_data, bar_width, label=f'PML_SUB {metric_name}', 
                     color=pml_color, edgecolor='white', linewidth=0.8)

    # Add value annotations above bars
    for i, (base_val, gmp_val, pml_val) in enumerate(zip(base_data, gmp_data, pml_data)):
        # Format value based on magnitude
        if base_val >= 1000:
            base_text = f'{base_val/1000:.1f}K'
        else:
            base_text = f'{base_val}'
            
        if gmp_val >= 1000:
            gmp_text = f'{gmp_val/1000:.1f}K'
        else:
            gmp_text = f'{gmp_val}'
            
        if pml_val >= 1000:
            pml_text = f'{pml_val/1000:.1f}K'
        else:
            pml_text = f'{pml_val}'
            
        ax.text(x[i] - bar_width, base_val * 1, base_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=base_color)
        ax.text(x[i], gmp_val * 1, gmp_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=gmp_color)
        ax.text(x[i] + bar_width, pml_val * 1, pml_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=pml_color)
    
    # Set labels and title
    ax.set_xlabel('Bit Size', fontsize=12, fontweight='bold')
    ax.set_ylabel(y_label, fontsize=12, fontweight='bold')
    ax.set_title(f'Comparison of {metric_name} between Baseline, GMP and PML (Subtraction)\n'
                f'on Intel Xeon E-2314', fontsize=14, fontweight='bold', pad=20)
    
    # Set x-ticks
    ax.set_xticks(x)
    ax.set_xticklabels([str(size) for size in bit_sizes], rotation=45, fontsize=10, fontweight='bold')
    
    # Add grid with lower alpha for cleaner look
    ax.grid(True, linestyle='--', alpha=0.3)
    
    # Place the legend inside the plot area
    ax.legend(fontsize=10, frameon=True, fancybox=True, framealpha=0.9,
                loc='upper left', ncol=1, bbox_to_anchor=(0, 1))
    
    # If this is a percentage plot, set y-axis range
    if "%" in y_label:
        ax.set_ylim(0, max(max(base_data), max(gmp_data), max(pml_data)) * 1.2)
    
    # Adjust layout and save
    plt.tight_layout(pad=2.0)
    plt.savefig(filename, dpi=300, bbox_inches='tight')
    
    return plt

# Create and save each plot separately
create_metric_plot("Average Ticks", base_ticks, gmp_ticks, pml_ticks, 
                 speedup_gmp_ticks, speedup_base_ticks,
                 "Average Ticks", "sub_ticks_cpu1.svg")

create_metric_plot("User Instructions", base_instructions, gmp_instructions, pml_instructions, 
                 speedup_gmp_instructions, speedup_base_instructions,
                 "User Instructions", "sub_instructions_cpu1.svg")

create_metric_plot("L1D Cache Reads", base_l1d_reads, gmp_l1d_reads, pml_l1d_reads, 
                 None, None, "L1D Cache Reads", "sub_l1d_reads_cpu1.svg")

create_metric_plot("L1D Cache Misses", base_l1d_misses, gmp_l1d_misses, pml_l1d_misses, 
                 speedup_gmp_l1d_misses, speedup_base_l1d_misses,
                 "L1D Cache Misses", "sub_l1d_misses_cpu1.svg")

create_metric_plot("L1D Cache Miss Percentage", base_l1d_miss_pct, gmp_l1d_miss_pct, pml_l1d_miss_pct, 
                 None, None, "L1D Cache Miss %", "sub_l1d_miss_pct_cpu1.svg")

# Create a summary plot for presentation needs (more focused version)
bit_indices = [0, 2, 4, 6, 8, 9]  # Select specific bit sizes for a cleaner summary (256, 1024, 4096, 16384, 65536, 131072)
selected_bits = [bit_sizes[i] for i in bit_indices]
selected_base_ticks = [base_ticks[i] for i in bit_indices]
selected_gmp_ticks = [gmp_ticks[i] for i in bit_indices]
selected_pml_ticks = [pml_ticks[i] for i in bit_indices]
selected_speedup_gmp = [speedup_gmp_ticks[i] for i in bit_indices]
selected_speedup_base = [speedup_base_ticks[i] for i in bit_indices]

plt.figure(figsize=(14, 9), dpi=300)
ax = plt.gca()

# Plot for selected bit sizes only - in order Baseline, GMP, PML
x = np.arange(len(selected_bits))
base_bars = ax.bar(x - bar_width, selected_base_ticks, bar_width, label='Baseline_SUB', 
                 color=base_color, edgecolor='white', linewidth=0.8)
gmp_bars = ax.bar(x, selected_gmp_ticks, bar_width, label='GMP_SUB', 
                 color=gmp_color, edgecolor='white', linewidth=0.8)
pml_bars = ax.bar(x + bar_width, selected_pml_ticks, bar_width, label='PML_SUB', 
                 color=pml_color, edgecolor='white', linewidth=0.8)

# Add annotations
for i, (base_val, gmp_val, pml_val) in enumerate(zip(selected_base_ticks, selected_gmp_ticks, selected_pml_ticks)):
    # Format values for clarity
    if base_val >= 1000:
        base_text = f'{base_val/1000:.1f}K'
    else:
        base_text = f'{base_val}'
        
    if gmp_val >= 1000:
        gmp_text = f'{gmp_val/1000:.1f}K'
    else:
        gmp_text = f'{gmp_val}'
        
    if pml_val >= 1000:
        pml_text = f'{pml_val/1000:.1f}K'
    else:
        pml_text = f'{pml_val}'
    
    # Add value annotations
    ax.text(x[i] - bar_width, base_val * 1, base_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=base_color)
    ax.text(x[i], gmp_val * 1, gmp_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=gmp_color)
    ax.text(x[i] + bar_width, pml_val * 1, pml_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=pml_color)


# Set labels and title
ax.set_xlabel('Bit Size', fontsize=14, fontweight='bold')
ax.set_ylabel('Average Ticks', fontsize=14, fontweight='bold')
ax.set_title('Performance Comparison: Baseline vs GMP vs PML Subtraction\nIntel Xeon E-2314 @ 2.80GHz', 
            fontsize=16, fontweight='bold', pad=20)

# Set x-ticks
ax.set_xticks(x)
ax.set_xticklabels([str(size) for size in selected_bits], rotation=45, fontsize=12, fontweight='bold')

# Add grid
ax.grid(True, linestyle='--', alpha=0.3)

# Place the legend inside the plot area
ax.legend(fontsize=10, frameon=True, fancybox=True, framealpha=0.9,
                loc='upper left', ncol=1, bbox_to_anchor=(0, 0.95))


plt.tight_layout(pad=2.0)
plt.savefig("sub_summary_cpu1.svg", dpi=300, bbox_inches='tight')

print("All plots created successfully!")