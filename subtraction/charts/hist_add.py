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

# Baseline_ADD data
base_ticks = [18, 21, 45, 72, 114, 253, 539, 1087, 2183, 4390]
base_instructions = [63, 78, 146, 201, 365, 720, 1376, 2688, 5312, 10533]
base_l1d_reads = [29, 33, 66, 105, 201, 402, 786, 1554, 3090, 6153]
base_l1d_misses = [7, 3, 9, 13, 25, 50, 192, 197, 407, 897]
base_l1d_miss_pct = [24.1, 9.1, 13.6, 12.4, 12.4, 12.4, 24.4, 12.7, 13.2, 14.6]

# GMP_ADD data
gmp_ticks = [24, 27, 35, 51, 87, 171, 425, 980, 1891, 3996]
gmp_instructions = [110, 127, 161, 229, 365, 637, 1181, 2269, 4445, 8797]
gmp_l1d_reads = [27, 35, 51, 83, 147, 275, 531, 1043, 2067, 4115]
gmp_l1d_misses = [8, 7, 19, 20, 38, 53, 111, 218, 416, 875]
gmp_l1d_miss_pct = [29.6, 20.0, 37.3, 24.1, 25.9, 19.3, 20.9, 20.9, 20.1, 21.3]

# PML_ADD data
pml_ticks = [14, 14, 25, 33, 47, 80, 160, 315, 619, 1220]
pml_instructions = [67, 49, 108, 144, 206, 303, 578, 1047, 2066, 4023]
pml_l1d_reads = [29, 33, 66, 105, 201, 402, 786, 1554, 3090, 6153]
pml_l1d_misses = [9, 5, 8, 18, 29, 53, 104, 198, 413, 906]
pml_l1d_miss_pct = [31.0, 15.2, 12.1, 17.1, 14.4, 13.2, 13.2, 12.7, 13.4, 14.7]

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
    base_bars = ax.bar(x - bar_width, base_data, bar_width, label=f'Baseline_ADD {metric_name}', 
                     color=base_color, edgecolor='white', linewidth=0.8)
    gmp_bars = ax.bar(x, gmp_data, bar_width, label=f'GMP_ADD {metric_name}', 
                     color=gmp_color, edgecolor='white', linewidth=0.8)
    pml_bars = ax.bar(x + bar_width, pml_data, bar_width, label=f'PML_ADD {metric_name}', 
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
            
        # Add value annotations with slightly adjusted positions
        ax.text(x[i] - bar_width, base_val * 1, base_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=base_color)
        ax.text(x[i], gmp_val * 1, gmp_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=gmp_color)
        ax.text(x[i] + bar_width, pml_val * 1, pml_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=pml_color)
    
    # Set labels and title
    ax.set_xlabel('Bit Size', fontsize=12, fontweight='bold')
    ax.set_ylabel(y_label, fontsize=12, fontweight='bold')
    ax.set_title(f'Comparison of {metric_name} between Baseline, GMP and PML (Addition)\n'
                f'on Intel Xeon E-2314', fontsize=14, fontweight='bold', pad=20)
    
    # Set x-ticks
    ax.set_xticks(x)
    ax.set_xticklabels([str(size) for size in bit_sizes], rotation=45, fontsize=10, fontweight='bold')
    
    # Add grid with lower alpha for cleaner look
    ax.grid(True, linestyle='--', alpha=0.3)
    
    # # Add legend with better placement and formatting
    # ax.legend(fontsize=10, frameon=True, fancybox=True, framealpha=0.9, 
    #          loc='upper left', ncol=1, bbox_to_anchor=(0, 1.15))

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
                 "Average Ticks", "add_ticks_cpu1.svg")

create_metric_plot("User Instructions", base_instructions, gmp_instructions, pml_instructions, 
                 speedup_gmp_instructions, speedup_base_instructions,
                 "User Instructions", "add_instructions_cpu1.svg")

create_metric_plot("L1D Cache Reads", base_l1d_reads, gmp_l1d_reads, pml_l1d_reads, 
                 None, None, "L1D Cache Reads", "add_l1d_reads_cpu1.svg")

create_metric_plot("L1D Cache Misses", base_l1d_misses, gmp_l1d_misses, pml_l1d_misses, 
                 speedup_gmp_l1d_misses, speedup_base_l1d_misses,
                 "L1D Cache Misses", "add_l1d_misses_cpu1.svg")

create_metric_plot("L1D Cache Miss Percentage", base_l1d_miss_pct, gmp_l1d_miss_pct, pml_l1d_miss_pct, 
                 None, None, "L1D Cache Miss %", "add_l1d_miss_pct_cpu1.svg")

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
base_bars = ax.bar(x - bar_width, selected_base_ticks, bar_width, label='Baseline_ADD', 
                 color=base_color, edgecolor='white', linewidth=0.8)
gmp_bars = ax.bar(x, selected_gmp_ticks, bar_width, label='GMP_ADD', 
                 color=gmp_color, edgecolor='white', linewidth=0.8)
pml_bars = ax.bar(x + bar_width, selected_pml_ticks, bar_width, label='PML_ADD', 
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
    ax.text(x[i] - bar_width, base_val * 1.05, base_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=base_color)
    ax.text(x[i], gmp_val * 1.05, gmp_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=gmp_color)
    ax.text(x[i] + bar_width, pml_val * 1.05, pml_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=pml_color)


# Set labels and title
ax.set_xlabel('Bit Size', fontsize=14, fontweight='bold')
ax.set_ylabel('Average Ticks', fontsize=14, fontweight='bold')
ax.set_title('Performance Comparison: Baseline vs GMP vs PML Addition\nIntel Xeon E-2314 @ 2.80GHz', 
            fontsize=16, fontweight='bold', pad=20)

# Set x-ticks
ax.set_xticks(x)
ax.set_xticklabels([str(size) for size in selected_bits], rotation=45, fontsize=12, fontweight='bold')

# Add grid
ax.grid(True, linestyle='--', alpha=0.3)

# Add legend
ax.legend(fontsize=12, frameon=True, fancybox=True, framealpha=0.9, 
         loc='upper left', ncol=3)


plt.tight_layout(pad=2.0)
plt.savefig("add_summary_cpu1.svg", dpi=300, bbox_inches='tight')

print("All plots created successfully!")