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
pml_ticks = [10, 12, 17, 27, 50, 98, 214, 446, 886, 1769]
pml_instructions = [32, 57, 83, 129, 215, 387, 731, 1419, 2795, 5547]
pml_l1d_reads = [29, 33, 66, 105, 201, 402, 786, 1554, 3090, 6153]
pml_l1d_misses = [6, 6, 11, 18, 30, 53, 113, 202, 419, 917]
pml_l1d_miss_pct = [20.7, 18.2, 16.7, 17.1, 14.9, 13.2, 14.4, 13.0, 13.6, 14.9]

# PML_ADD_WORST data
pml_worst_ticks = [12, 14, 29, 39, 74, 151, 354, 722, 1444, 2873]
pml_worst_instructions = [45, 67, 102, 170, 295, 545, 1045, 2045, 4045, 8045]
pml_worst_l1d_reads = [29, 33, 66, 105, 201, 402, 786, 1554, 3090, 6153]
pml_worst_l1d_misses = [8, 8, 11, 20, 28, 55, 111, 207, 420, 900]
pml_worst_l1d_miss_pct = [27.6, 24.2, 16.7, 19.0, 13.9, 13.7, 14.1, 13.3, 13.6, 14.6]

# Calculate speedup factors - PML vs GMP and PML vs Baseline
speedup_gmp_ticks = [gmp / pml for gmp, pml in zip(gmp_ticks, pml_ticks)]
speedup_base_ticks = [base / pml for base, pml in zip(base_ticks, pml_ticks)]
speedup_gmp_instructions = [gmp / pml for gmp, pml in zip(gmp_instructions, pml_instructions)]
speedup_base_instructions = [base / pml for base, pml in zip(base_instructions, pml_instructions)]
speedup_gmp_l1d_misses = [gmp / pml for gmp, pml in zip(gmp_l1d_misses, pml_l1d_misses)]
speedup_base_l1d_misses = [base / pml for base, pml in zip(base_l1d_misses, pml_l1d_misses)]

# Bar width
bar_width = 0.225  # Reduced from 0.3 to accommodate 4 bars per group

# Enhanced color palette - color-blind friendly and more vibrant
base_color = "#0072B2"    # Dark blue for baseline
gmp_color = "#D55E00"     # Red-orange for GMP
pml_color = "#009E73"     # Teal green for PML
pml_worst_color = "#8CD17D"  # Purple for PML_WORST
speedup_gmp_color = "#0072B2" # Blue for GMP vs PML speedup
speedup_base_color = "#56B4E9" # Light blue for Baseline vs PML speedup

# Define function to create well-annotated individual plots
def create_metric_plot(metric_name, base_data, gmp_data, pml_data, pml_worst_data,
                     speedup_gmp_data=None, speedup_base_data=None, 
                     y_label="", filename=""):
    plt.figure(figsize=(14, 8), dpi=300)
    ax = plt.gca()
    
    # Position arrays for bars
    x = np.arange(len(bit_sizes))
    
    # Create bars in order: Baseline, GMP, PML, PML_WORST
    base_bars = ax.bar(x - 1.5*bar_width, base_data, bar_width, label=f'Baseline_ADD {metric_name}', 
                     color=base_color, edgecolor='white', linewidth=0.8)
    gmp_bars = ax.bar(x - 0.5*bar_width, gmp_data, bar_width, label=f'GMP_ADD {metric_name}', 
                     color=gmp_color, edgecolor='white', linewidth=0.8)
    pml_worst_bars = ax.bar(x + 0.5*bar_width, pml_worst_data, bar_width, label=f'PML_ADD_WORST {metric_name}', 
                     color=pml_worst_color, edgecolor='white', linewidth=0.8)
    pml_bars = ax.bar(x + 1.5*bar_width, pml_data, bar_width, label=f'PML_ADD {metric_name}', 
                          color=pml_color, edgecolor='white', linewidth=0.8)

    # Add value annotations above bars (only for specific bit sizes to reduce clutter)
    annotation_indices = [0,1, 2, 3, 4, 5, 6, 7,8, 9]  # 256, 1024, 4096, 16384, 65536, 131072
    for i in annotation_indices:
        base_val = base_data[i]
        gmp_val = gmp_data[i]
        pml_val = pml_data[i]
        pml_worst_val = pml_worst_data[i]
        
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
            
        if pml_worst_val >= 1000:
            pml_worst_text = f'{pml_worst_val/1000:.1f}K'
        else:
            pml_worst_text = f'{pml_worst_val}'
            
        # Add value annotations with slightly adjusted positions
        ax.text(x[i] - 1.5*bar_width, base_val * 1.02, base_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=base_color)
        ax.text(x[i] - 0.5*bar_width, gmp_val * 1.02, gmp_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=gmp_color)
        ax.text(x[i] + 0.5*bar_width, pml_worst_val * 1.02, pml_worst_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=pml_worst_color)
        ax.text(x[i] + 1.5*bar_width, pml_val * 1.02, pml_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=pml_color)
    
    # Set labels and title
    ax.set_xlabel('Bit Size', fontsize=12, fontweight='bold')
    ax.set_ylabel(y_label, fontsize=12, fontweight='bold')
    ax.set_title(f'Comparison of {metric_name} between Implementations (Addition)\n'
                f'Intel Xeon E-2314 @ 2.80GHz', fontsize=14, fontweight='bold', pad=20)
    
    # Set x-ticks
    ax.set_xticks(x)
    ax.set_xticklabels([str(size) for size in bit_sizes], rotation=45, fontsize=10, fontweight='bold')
    
    # Add grid with lower alpha for cleaner look
    ax.grid(True, linestyle='--', alpha=0.3)
    
    # Place the legend inside the plot area
    ax.legend(fontsize=10, frameon=True, fancybox=True, framealpha=0.9,
                loc='upper left', ncol=2, bbox_to_anchor=(0, 1))
    
    # If this is a percentage plot, set y-axis range
    if "%" in y_label:
        ax.set_ylim(0, max(max(base_data), max(gmp_data), max(pml_data), max(pml_worst_data)) * 1.2)
    
    # Adjust layout and save
    plt.tight_layout(pad=2.0)
    plt.savefig(filename, dpi=300, bbox_inches='tight')
    
    return plt

# Create and save each plot separately
create_metric_plot("Average Ticks", base_ticks, gmp_ticks, pml_ticks, pml_worst_ticks,
                 speedup_gmp_ticks, speedup_base_ticks,
                 "Average Ticks", "add_ticks_cpu1.svg")

create_metric_plot("User Instructions", base_instructions, gmp_instructions, pml_instructions, pml_worst_instructions,
                 speedup_gmp_instructions, speedup_base_instructions,
                 "User Instructions", "add_instructions_cpu1.svg")

create_metric_plot("L1D Cache Reads", base_l1d_reads, gmp_l1d_reads, pml_l1d_reads, pml_worst_l1d_reads,
                 None, None, "L1D Cache Reads", "add_l1d_reads_cpu1.svg")

create_metric_plot("L1D Cache Misses", base_l1d_misses, gmp_l1d_misses, pml_l1d_misses, pml_worst_l1d_misses,
                 speedup_gmp_l1d_misses, speedup_base_l1d_misses,
                 "L1D Cache Misses", "add_l1d_misses_cpu1.svg")

create_metric_plot("L1D Cache Miss Percentage", base_l1d_miss_pct, gmp_l1d_miss_pct, pml_l1d_miss_pct, pml_worst_l1d_miss_pct,
                 None, None, "L1D Cache Miss %", "add_l1d_miss_pct_cpu1.svg")

# Create a summary plot for presentation needs (more focused version)
bit_indices = [0,1, 2,3, 4,5, 6,7, 8, 9]  # Select specific bit sizes for a cleaner summary (256, 1024, 4096, 16384, 65536, 131072)
selected_bits = [bit_sizes[i] for i in bit_indices]
selected_base_ticks = [base_ticks[i] for i in bit_indices]
selected_gmp_ticks = [gmp_ticks[i] for i in bit_indices]
selected_pml_ticks = [pml_ticks[i] for i in bit_indices]
selected_pml_worst_ticks = [pml_worst_ticks[i] for i in bit_indices]
selected_speedup_gmp = [speedup_gmp_ticks[i] for i in bit_indices]
selected_speedup_base = [speedup_base_ticks[i] for i in bit_indices]

plt.figure(figsize=(14, 9), dpi=300)
ax = plt.gca()

# Plot for selected bit sizes only - in order Baseline, GMP, PML, PML_WORST
x = np.arange(len(selected_bits))
base_bars = ax.bar(x - 1.5*bar_width, selected_base_ticks, bar_width, label='Baseline_ADD', 
                 color=base_color, edgecolor='white', linewidth=0.8)
gmp_bars = ax.bar(x - 0.5*bar_width, selected_gmp_ticks, bar_width, label='GMP_ADD', 
                 color=gmp_color, edgecolor='white', linewidth=0.8)
pml_bars = ax.bar(x + 0.5*bar_width, selected_pml_ticks, bar_width, label='PML_ADD', 
                 color=pml_color, edgecolor='white', linewidth=0.8)
pml_worst_bars = ax.bar(x + 1.5*bar_width, selected_pml_worst_ticks, bar_width, label='PML_ADD_WORST', 
                      color=pml_worst_color, edgecolor='white', linewidth=0.8)

# Add annotations
for i, (base_val, gmp_val, pml_val, pml_worst_val) in enumerate(zip(selected_base_ticks, selected_gmp_ticks, 
                                                                   selected_pml_ticks, selected_pml_worst_ticks)):
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
        
    if pml_worst_val >= 1000:
        pml_worst_text = f'{pml_worst_val/1000:.1f}K'
    else:
        pml_worst_text = f'{pml_worst_val}'
    
    # Add value annotations
    ax.text(x[i] - 1.5*bar_width, base_val * 1.05, base_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=base_color)
    ax.text(x[i] - 0.5*bar_width, gmp_val * 1.05, gmp_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=gmp_color)
    ax.text(x[i] + 0.5*bar_width, pml_val * 1.05, pml_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=pml_color)
    ax.text(x[i] + 1.5*bar_width, pml_worst_val * 1.05, pml_worst_text, 
            ha='center', va='bottom', fontsize=10, fontweight='bold', color=pml_worst_color)

# Set labels and title
ax.set_xlabel('Bit Size', fontsize=14, fontweight='bold')
ax.set_ylabel('Average Ticks', fontsize=14, fontweight='bold')
ax.set_title('Performance Comparison: CPU Processing Ticks for Addition\nIntel Xeon E-2314 @ 2.80GHz', 
            fontsize=16, fontweight='bold', pad=20)

# Set x-ticks
ax.set_xticks(x)
ax.set_xticklabels([str(size) for size in selected_bits], rotation=45, fontsize=12, fontweight='bold')

# Add grid
ax.grid(True, linestyle='--', alpha=0.3)

# Add legend
ax.legend(fontsize=12, frameon=True, fancybox=True, framealpha=0.9, 
         loc='upper left', ncol=2)

# Add a note about PML_ADD_WORST
ax.text(0.02, 0.02, 
       "Note: PML_ADD_WORST represents the worst-case performance scenario for PML implementation.",
       transform=ax.transAxes, fontsize=10, ha='left', va='bottom',
       bbox=dict(facecolor='white', alpha=0.9, edgecolor='lightgray', boxstyle='round,pad=0.3'))

plt.tight_layout(pad=2.0)
plt.savefig("add_summary_cpu1.svg", dpi=300, bbox_inches='tight')

# Create a speedup summary chart
plt.figure(figsize=(14, 9), dpi=300)
ax = plt.gca()

# Calculate speedups specifically for the summary chart
speedup_pml_vs_gmp = [gmp / pml for gmp, pml in zip(selected_gmp_ticks, selected_pml_ticks)]
speedup_pml_vs_base = [base / pml for base, pml in zip(selected_base_ticks, selected_pml_ticks)]
speedup_pml_worst_vs_gmp = [gmp / worst for gmp, worst in zip(selected_gmp_ticks, selected_pml_worst_ticks)]

# Plot speedups as bars
speedup_width = 0.25
x = np.arange(len(selected_bits))
ax.bar(x - speedup_width, speedup_pml_vs_gmp, speedup_width, label='PML vs GMP', color=pml_color, alpha=0.9)
ax.bar(x, speedup_pml_vs_base, speedup_width, label='PML vs Baseline', color=base_color, alpha=0.9)
ax.bar(x + speedup_width, speedup_pml_worst_vs_gmp, speedup_width, label='PML_WORST vs GMP', color=pml_worst_color, alpha=0.9)

# Add speedup value annotations
for i, (s1, s2, s3) in enumerate(zip(speedup_pml_vs_gmp, speedup_pml_vs_base, speedup_pml_worst_vs_gmp)):
    ax.text(x[i] - speedup_width, s1 + 0.1, f'{s1:.2f}x', ha='center', fontsize=10, fontweight='bold')
    ax.text(x[i], s2 + 0.1, f'{s2:.2f}x', ha='center', fontsize=10, fontweight='bold')
    ax.text(x[i] + speedup_width, s3 + 0.1, f'{s3:.2f}x', ha='center', fontsize=10, fontweight='bold')

# Draw a horizontal line at y=1 to indicate the baseline
ax.axhline(y=1, color='black', linestyle='--', alpha=0.5)

# Set labels and title
ax.set_xlabel('Bit Size', fontsize=14, fontweight='bold')
ax.set_ylabel('Speedup Factor (×)', fontsize=14, fontweight='bold')
ax.set_title('Speedup Comparison for Addition\nIntel Xeon E-2314 @ 2.80GHz', 
            fontsize=16, fontweight='bold', pad=20)

# Set x-ticks and y-limit
ax.set_xticks(x)
ax.set_xticklabels([str(size) for size in selected_bits], rotation=45, fontsize=12, fontweight='bold')
ax.set_ylim(0, max(max(speedup_pml_vs_gmp), max(speedup_pml_vs_base), max(speedup_pml_worst_vs_gmp)) + 0.5)

# Add grid
ax.grid(True, linestyle='--', alpha=0.3)

# Add legend
ax.legend(fontsize=12, frameon=True, fancybox=True, framealpha=0.9, loc='upper right')

plt.tight_layout(pad=2.0)
plt.savefig("add_speedup_summary_cpu1.svg", dpi=300, bbox_inches='tight')

print("All plots created successfully!")