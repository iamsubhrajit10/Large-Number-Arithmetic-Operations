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
# GMP_SUB data
gmp_ticks = [23, 27, 34, 50, 87, 171, 424, 943, 1867, 3773]
gmp_instructions = [114, 131, 165, 233, 369, 641, 1185, 2273, 4449, 8801]
gmp_l1d_reads = [29, 37, 53, 85, 149, 277, 533, 1048, 2069, 4117]
gmp_l1d_misses = [6, 7, 12, 18, 31, 59, 104, 208, 412, 885]
gmp_l1d_miss_pct = [20.7, 18.9, 22.6, 21.2, 20.8, 21.3, 19.5, 19.8, 19.9, 21.5]

# PML_SUB data
pml_ticks = [11, 12, 14, 21, 34, 68, 133, 272, 547, 1074]
pml_instructions = [27, 53, 66, 96, 153, 246, 453, 846, 1653, 3246]
pml_l1d_reads = [25, 27, 48, 77, 124, 257, 524, 1021, 2044, 4055]
pml_l1d_misses = [4, 6, 7, 18, 47, 53, 99, 188, 392, 896]
pml_l1d_miss_pct = [16.0, 22.2, 14.6, 23.4, 37.9, 20.6, 18.9, 18.4, 19.2, 22.1]

# Calculate speedup factors
speedup_ticks = [gmp / pml for gmp, pml in zip(gmp_ticks, pml_ticks)]
speedup_instructions = [gmp / pml for gmp, pml in zip(gmp_instructions, pml_instructions)]
speedup_l1d_misses = [gmp / pml for gmp, pml in zip(gmp_l1d_misses, pml_l1d_misses)]

# Bar width
bar_width = 0.35

# Enhanced color palette - color-blind friendly but more vibrant
gmp_color = "#D55E00"     # Red-orange
pml_color = "#009E73"     # Teal green
speedup_color = "#0072B2" # Blue

# Define function to create well-annotated individual plots
def create_metric_plot(metric_name, gmp_data, pml_data, speedup_data=None, y_label="", filename=""):
    plt.figure(figsize=(10, 7), dpi=300)
    ax = plt.gca()
    
    # Position arrays for bars
    x = np.arange(len(bit_sizes))
    
    # Create bars
    gmp_bars = ax.bar(x - bar_width/2, gmp_data, bar_width, label=f'GMP_SUB {metric_name}', 
                     color=gmp_color, edgecolor='white', linewidth=0.8)
    pml_bars = ax.bar(x + bar_width/2, pml_data, bar_width, label=f'PML_SUB {metric_name}', 
                     color=pml_color, edgecolor='white', linewidth=0.8)

    # Add value annotations above bars
    for i, (gmp_val, pml_val) in enumerate(zip(gmp_data, pml_data)):
        # Format value based on magnitude
        if gmp_val >= 1000:
            gmp_text = f'{gmp_val/1000:.1f}K'
        else:
            gmp_text = f'{gmp_val}'
            
        if pml_val >= 1000:
            pml_text = f'{pml_val/1000:.1f}K'
        else:
            pml_text = f'{pml_val}'
            
        # Add value annotations
        ax.text(x[i] - bar_width/2, gmp_val * 1.05, gmp_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=gmp_color)
        ax.text(x[i] + bar_width/2, pml_val * 1.05, pml_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=pml_color)
        
    
    # Set labels and title
    ax.set_xlabel('Bit Size', fontsize=12, fontweight='bold')
    ax.set_ylabel(y_label, fontsize=12, fontweight='bold')
    ax.set_title(f'Comparison of {metric_name} between GMP_SUB and PML_SUB\n'
                f'Intel Xeon E-2314', fontsize=14, fontweight='bold', pad=20)
    
    # Set x-ticks
    ax.set_xticks(x)
    ax.set_xticklabels([str(size) for size in bit_sizes], rotation=45, fontsize=10, fontweight='bold')
    
    # Add grid
    ax.grid(True, linestyle='--', alpha=0.3)
    
    # Add legend
    ax.legend(fontsize=10, frameon=True, fancybox=True, framealpha=0.8, loc='upper left')
    
    # If this is a percentage plot, set y-axis range
    if "%" in y_label:
        ax.set_ylim(0, max(max(gmp_data), max(pml_data)) * 1.2)
    

    
    # Adjust layout and save
    plt.tight_layout(pad=2.0)
    plt.savefig(filename, dpi=300, bbox_inches='tight')
    
    return plt

# Create and save each plot separately
create_metric_plot("Average Ticks", gmp_ticks, pml_ticks, speedup_ticks, 
                 "Average Ticks", "sub_ticks_cpu1.svg")

create_metric_plot("User Instructions", gmp_instructions, pml_instructions, speedup_instructions, 
                 "User Instructions", "sub_instructions_cpu1.svg")

create_metric_plot("L1D Cache Reads", gmp_l1d_reads, pml_l1d_reads, None, 
                 "L1D Cache Reads", "sub_l1d_reads_cpu1.svg")

create_metric_plot("L1D Cache Misses", gmp_l1d_misses, pml_l1d_misses, speedup_l1d_misses, 
                 "L1D Cache Misses", "sub_l1d_misses_cpu1.svg")

create_metric_plot("L1D Cache Miss Percentage", gmp_l1d_miss_pct, pml_l1d_miss_pct, None, 
                 "L1D Cache Miss %", "sub_l1d_miss_pct_cpu1.svg")

# Create a summary plot for presentation needs (optional - less crowded version)
bit_indices = [0, 2, 4, 6, 8, 9]  # Select specific bit sizes for a cleaner summary (256, 1024, 4096, 16384, 65536, 131072)
selected_bits = [bit_sizes[i] for i in bit_indices]
selected_gmp_ticks = [gmp_ticks[i] for i in bit_indices]
selected_pml_ticks = [pml_ticks[i] for i in bit_indices]
selected_speedup = [speedup_ticks[i] for i in bit_indices]

plt.figure(figsize=(12, 8), dpi=300)
ax = plt.gca()

# Plot for selected bit sizes only
x = np.arange(len(selected_bits))
gmp_bars = ax.bar(x - bar_width/2, selected_gmp_ticks, bar_width, label='GMP_SUB', 
                 color=gmp_color, edgecolor='white', linewidth=0.8)
pml_bars = ax.bar(x + bar_width/2, selected_pml_ticks, bar_width, label='PML_SUB', 
                 color=pml_color, edgecolor='white', linewidth=0.8)

# Add annotations
for i, (gmp_val, pml_val, speedup) in enumerate(zip(selected_gmp_ticks, selected_pml_ticks, selected_speedup)):
    # Format values for clarity
    if gmp_val >= 1000:
        gmp_text = f'{gmp_val/1000:.1f}K'
    else:
        gmp_text = f'{gmp_val}'
        
    if pml_val >= 1000:
        pml_text = f'{pml_val/1000:.1f}K'
    else:
        pml_text = f'{pml_val}'
    
    ax.text(x[i] - bar_width/2, gmp_val * 1.05, gmp_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=gmp_color)
    ax.text(x[i] + bar_width/2, pml_val * 1.05, pml_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=pml_color)
    
    # Add speedup text
    ax.text(x[i], min(gmp_val, pml_val) * 0.5, f"{speedup:.2f}×", 
           color=speedup_color, fontweight='bold', fontsize=12,
           ha='center', va='center', 
           bbox=dict(facecolor='white', alpha=0.9, boxstyle='round,pad=0.3'))

# Set labels and title
ax.set_xlabel('Bit Size', fontsize=14, fontweight='bold')
ax.set_ylabel('Average Ticks', fontsize=14, fontweight='bold')
ax.set_title('Performance Comparison: GMP vs PML Subtraction\nIntel Xeon E-2314 @ 2.80GHz', 
            fontsize=16, fontweight='bold', pad=20)

# Set x-ticks
ax.set_xticks(x)
ax.set_xticklabels([str(size) for size in selected_bits], rotation=45, fontsize=12, fontweight='bold')

# Add grid
ax.grid(True, linestyle='--', alpha=0.3)

# Add legend
ax.legend(fontsize=12, frameon=True, fancybox=True, framealpha=0.8, loc='upper left')



plt.tight_layout(pad=2.0)

print("All plots created successfully!")