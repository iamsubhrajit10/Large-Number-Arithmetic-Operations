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


# Baseline_SUB data - UPDATED
base_ticks = [11, 25, 44, 76, 140, 271, 542, 1377, 2740, 5428]
base_instructions = [34, 93, 134, 230, 422, 813, 1581, 3117, 6189, 12333]
base_l1d_reads = [23, 40, 72, 136, 264, 520, 1032, 2056, 4104, 8200]
base_l1d_misses = [6, 11, 11, 18, 33, 49, 93, 177, 405, 905]
base_l1d_miss_pct = [26.1, 27.5, 15.3, 13.2, 12.5, 9.4, 9.0, 8.6, 9.9, 11.0]


# GMP_SUB data
gmp_ticks = [23, 27, 34, 50, 87, 171, 424, 943, 1867, 3773]
gmp_instructions = [114, 131, 165, 233, 369, 641, 1185, 2273, 4449, 8801]
gmp_l1d_reads = [29, 37, 53, 85, 149, 277, 533, 1048, 2069, 4117]
gmp_l1d_misses = [6, 7, 12, 18, 31, 59, 104, 208, 412, 885]
gmp_l1d_miss_pct = [20.7, 18.9, 22.6, 21.2, 20.8, 21.3, 19.5, 19.8, 19.9, 21.5]

# PML_SUB data - updated with new values
pml_ticks = [9, 12, 18, 23, 44, 84, 167, 349, 675, 1341]
pml_instructions = [40, 61, 81, 125, 189, 333, 629, 1197, 2349, 4653]
pml_l1d_reads = [23, 40, 72, 136, 264, 520, 1032, 1021, 4104, 4055]
pml_l1d_misses = [4, 8, 13, 18, 47, 53, 99, 188, 392, 896]
pml_l1d_miss_pct = [17.4, 20.0, 18.1, 13.2, 17.8, 10.2, 9.6, 18.4, 9.6, 22.1]

# PML_SUB_WORST data
pml_worst_ticks = [11, 19, 24, 33, 60, 117, 232, 460, 935, 1860]
pml_worst_instructions = [45, 70, 98, 161, 260, 458, 854, 1646, 3222, 6390]
pml_worst_l1d_reads = [23, 40, 72, 136, 265, 520, 1032, 1021, 4104, 4055]
pml_worst_l1d_misses = [11, 13, 12, 16, 48, 57, 113, 209, 413, 912]
pml_worst_l1d_miss_pct = [47.8, 32.5, 16.7, 11.8, 18.1, 11.0, 10.9, 20.5, 10.1, 22.5]

# Calculate speedup factors - PML vs GMP and PML vs Baseline
speedup_gmp_ticks = [gmp / pml for gmp, pml in zip(gmp_ticks, pml_ticks)]
speedup_base_ticks = [base / pml for base, pml in zip(base_ticks, pml_ticks)]
speedup_gmp_instructions = [gmp / pml for gmp, pml in zip(gmp_instructions, pml_instructions)]
speedup_base_instructions = [base / pml for base, pml in zip(base_instructions, pml_instructions)]
speedup_gmp_l1d_misses = [gmp / pml for gmp, pml in zip(gmp_l1d_misses, pml_l1d_misses)]
speedup_base_l1d_misses = [base / pml for base, pml in zip(base_l1d_misses, pml_l1d_misses)]

# Bar width
bar_width = 0.225  # Reduced to accommodate 4 bars per group

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
    base_bars = ax.bar(x - 1.5*bar_width, base_data, bar_width, label=f'Baseline_SUB {metric_name}', 
                     color=base_color, edgecolor='white', linewidth=0.8)
    gmp_bars = ax.bar(x - 0.5*bar_width, gmp_data, bar_width, label=f'GMP_SUB {metric_name}', 
                     color=gmp_color, edgecolor='white', linewidth=0.8)
    pml_worst_bars = ax.bar(x + 0.5*bar_width, pml_worst_data, bar_width, label=f'PML_SUB_WORST {metric_name}', 
                     color=pml_worst_color, edgecolor='white', linewidth=0.8)
    pml_bars = ax.bar(x + 1.5*bar_width, pml_data, bar_width, label=f'PML_SUB {metric_name}', 
                          color=pml_color, edgecolor='white', linewidth=0.8)

    # Add value annotations above bars (only for specific bit sizes to reduce clutter)
    annotation_indices = [0,1, 2,3, 4,5, 6,7, 8, 9]  # 256, 1024, 4096, 16384, 65536, 131072
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
    ax.set_title(f'Comparison of {metric_name} between Implementations (Subtraction)\n'
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
                 "Average Ticks", "sub_ticks_cpu1.svg")

create_metric_plot("User Instructions", base_instructions, gmp_instructions, pml_instructions, pml_worst_instructions,
                 speedup_gmp_instructions, speedup_base_instructions,
                 "User Instructions", "sub_instructions_cpu1.svg")

create_metric_plot("L1D Cache Reads", base_l1d_reads, gmp_l1d_reads, pml_l1d_reads, pml_worst_l1d_reads,
                 None, None, "L1D Cache Reads", "sub_l1d_reads_cpu1.svg")

create_metric_plot("L1D Cache Misses", base_l1d_misses, gmp_l1d_misses, pml_l1d_misses, pml_worst_l1d_misses,
                 speedup_gmp_l1d_misses, speedup_base_l1d_misses,
                 "L1D Cache Misses", "sub_l1d_misses_cpu1.svg")

create_metric_plot("L1D Cache Miss Percentage", base_l1d_miss_pct, gmp_l1d_miss_pct, pml_l1d_miss_pct, pml_worst_l1d_miss_pct,
                 None, None, "L1D Cache Miss %", "sub_l1d_miss_pct_cpu1.svg")

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
base_bars = ax.bar(x - 1.5*bar_width, selected_base_ticks, bar_width, label='Baseline_SUB', 
                 color=base_color, edgecolor='white', linewidth=0.8)
gmp_bars = ax.bar(x - 0.5*bar_width, selected_gmp_ticks, bar_width, label='GMP_SUB', 
                 color=gmp_color, edgecolor='white', linewidth=0.8)
pml_bars = ax.bar(x + 0.5*bar_width, selected_pml_ticks, bar_width, label='PML_SUB', 
                 color=pml_color, edgecolor='white', linewidth=0.8)
pml_worst_bars = ax.bar(x + 1.5*bar_width, selected_pml_worst_ticks, bar_width, label='PML_SUB_WORST', 
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
ax.set_title('Performance Comparison: CPU Processing Ticks for Subtraction\nIntel Xeon E-2314 @ 2.80GHz', 
            fontsize=16, fontweight='bold', pad=20)

# Set x-ticks
ax.set_xticks(x)
ax.set_xticklabels([str(size) for size in selected_bits], rotation=45, fontsize=12, fontweight='bold')

# Add grid
ax.grid(True, linestyle='--', alpha=0.3)

# Add legend
ax.legend(fontsize=12, frameon=True, fancybox=True, framealpha=0.9, 
         loc='upper left', ncol=2)

# Add a note about PML_SUB_WORST
ax.text(0.02, 0.02, 
       "Note: PML_SUB_WORST represents the worst-case performance scenario for PML implementation.",
       transform=ax.transAxes, fontsize=10, ha='left', va='bottom',
       bbox=dict(facecolor='white', alpha=0.9, edgecolor='lightgray', boxstyle='round,pad=0.3'))

plt.tight_layout(pad=2.0)
plt.savefig("sub_summary_cpu1.svg", dpi=300, bbox_inches='tight')

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
ax.set_title('Speedup Comparison for Subtraction\nIntel Xeon E-2314 @ 2.80GHz', 
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
plt.savefig("sub_speedup_summary_cpu1.svg", dpi=300, bbox_inches='tight')

print("All plots created successfully!")