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
pml_ticks = [9, 12, 18, 23, 44, 84, 167, 349, 675, 1341]
pml_instructions = [40, 61, 81, 125, 189, 333, 629, 1197, 2349, 4653]
pml_l1d_reads = [23, 40, 72, 136, 264, 520, 1032, 1021, 4104, 4055]
pml_l1d_misses = [4, 8, 13, 18, 47, 53, 99, 188, 392, 896]
pml_l1d_miss_pct = [17.4, 20.0, 18.1, 13.2, 17.8, 10.2, 9.6, 18.4, 9.6, 22.1]

# PML_SUB(approx) data - NEW
pml_approx_ticks = [7, 12, 15, 22, 37, 72, 139, 279, 542, 1081]
pml_approx_instructions = [36, 58, 78, 116, 158, 258, 466, 858, 1666, 3258]
pml_approx_l1d_reads = [23, 40, 72, 136, 264, 520, 1032, 1021, 4104, 4055]
pml_approx_l1d_misses = [7, 5, 14, 20, 44, 51, 102, 195, 390, 888]
pml_approx_l1d_miss_pct = [30.4, 12.5, 19.4, 14.7, 16.7, 9.8, 9.9, 19.1, 9.5, 21.9]

# Calculate speedup factors - PML vs GMP and PML_approx vs GMP
speedup_pml_vs_gmp_ticks = [gmp / pml for gmp, pml in zip(gmp_ticks, pml_ticks)]
speedup_pml_approx_vs_gmp_ticks = [gmp / pml_approx for gmp, pml_approx in zip(gmp_ticks, pml_approx_ticks)]
speedup_pml_approx_vs_pml_ticks = [pml / pml_approx for pml, pml_approx in zip(pml_ticks, pml_approx_ticks)]

speedup_pml_vs_gmp_instructions = [gmp / pml for gmp, pml in zip(gmp_instructions, pml_instructions)]
speedup_pml_approx_vs_gmp_instructions = [gmp / pml_approx for gmp, pml_approx in zip(gmp_instructions, pml_approx_instructions)]
speedup_pml_approx_vs_pml_instructions = [pml / pml_approx for pml, pml_approx in zip(pml_instructions, pml_approx_instructions)]

# Bar width
bar_width = 0.25  # For 3 bars per group

# Enhanced color palette - color-blind friendly and more vibrant
gmp_color = "#D55E00"     # Red-orange for GMP
pml_color = "#009E73"     # Teal green for PML
pml_approx_color = "#CC79A7"  # Blue for PML_approx

bg_color = "#FFFFFF"       # White background

# Define function to create well-annotated individual plots
def create_metric_plot(metric_name, gmp_data, pml_data, pml_approx_data,
                     speedup_pml_vs_gmp=None, speedup_pml_approx_vs_gmp=None, speedup_pml_approx_vs_pml=None,
                     y_label="", filename=""):
    plt.figure(figsize=(14, 8), dpi=300)
    ax = plt.gca()
    
    # Position arrays for bars
    x = np.arange(len(bit_sizes))
    
    # Create bars in order: GMP, PML, PML_approx
    gmp_bars = ax.bar(x - bar_width, gmp_data, bar_width, label=f'GMP_SUB {metric_name}', 
                     color=gmp_color, edgecolor='white', linewidth=0.8)
    pml_bars = ax.bar(x, pml_data, bar_width, label=f'PML_SUB {metric_name}', 
                     color=pml_color, edgecolor='white', linewidth=0.8)
    pml_approx_bars = ax.bar(x + bar_width, pml_approx_data, bar_width, label=f'PML_SUB(approx) {metric_name}', 
                          color=pml_approx_color, edgecolor='white', linewidth=0.8)

    # Add value annotations above bars
    for i, (gmp_val, pml_val, pml_approx_val) in enumerate(zip(gmp_data, pml_data, pml_approx_data)):
        # Format value based on magnitude
        if gmp_val >= 1000:
            gmp_text = f'{gmp_val/1000:.1f}K'
        else:
            gmp_text = f'{gmp_val}'
            
        if pml_val >= 1000:
            pml_text = f'{pml_val/1000:.1f}K'
        else:
            pml_text = f'{pml_val}'
            
        if pml_approx_val >= 1000:
            pml_approx_text = f'{pml_approx_val/1000:.1f}K'
        else:
            pml_approx_text = f'{pml_approx_val}'
            
        # Add value annotations with slightly adjusted positions
        ax.text(x[i] - bar_width, gmp_val * 1.02, gmp_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=gmp_color)
        ax.text(x[i], pml_val * 1.02, pml_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=pml_color)
        ax.text(x[i] + bar_width, pml_approx_val * 1.02, pml_approx_text, 
                ha='center', va='bottom', fontsize=8, fontweight='bold', color=pml_approx_color)
    
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
                loc='upper left', ncol=1)
    
    # If this is a percentage plot, set y-axis range
    if "%" in y_label:
        ax.set_ylim(0, max(max(gmp_data), max(pml_data), max(pml_approx_data)) * 1.2)
        
    # Adjust layout and save
    plt.tight_layout(pad=2.0)
    plt.savefig(filename, dpi=300, bbox_inches='tight')
    
    return plt

# Create and save each plot separately
create_metric_plot("Average Ticks", gmp_ticks, pml_ticks, pml_approx_ticks,
                 speedup_pml_vs_gmp_ticks, speedup_pml_approx_vs_gmp_ticks, speedup_pml_approx_vs_pml_ticks,
                 "Average Ticks", "sub_approx_ticks_cpu1.svg")

create_metric_plot("User Instructions", gmp_instructions, pml_instructions, pml_approx_instructions,
                 speedup_pml_vs_gmp_instructions, speedup_pml_approx_vs_gmp_instructions, speedup_pml_approx_vs_pml_instructions,
                 "User Instructions", "sub_approx_instructions_cpu1.svg")

create_metric_plot("L1D Cache Reads", gmp_l1d_reads, pml_l1d_reads, pml_approx_l1d_reads,
                 None, None, None, "L1D Cache Reads", "sub_approx_l1d_reads_cpu1.svg")

create_metric_plot("L1D Cache Misses", gmp_l1d_misses, pml_l1d_misses, pml_approx_l1d_misses,
                 None, None, None, "L1D Cache Misses", "sub_approx_l1d_misses_cpu1.svg")

create_metric_plot("L1D Cache Miss Percentage", gmp_l1d_miss_pct, pml_l1d_miss_pct, pml_approx_l1d_miss_pct,
                 None, None, None, "L1D Cache Miss %", "sub_approx_l1d_miss_pct_cpu1.svg")

# Create a summary plot for presentation needs (focused on Average Ticks)
plt.figure(figsize=(14, 9), dpi=300)
ax = plt.gca()

# Plot for all bit sizes
x = np.arange(len(bit_sizes))
gmp_bars = ax.bar(x - bar_width, gmp_ticks, bar_width, label='GMP_SUB', 
                 color=gmp_color, edgecolor='white', linewidth=0.8)
pml_bars = ax.bar(x, pml_ticks, bar_width, label='PML_SUB', 
                 color=pml_color, edgecolor='white', linewidth=0.8)
pml_approx_bars = ax.bar(x + bar_width, pml_approx_ticks, bar_width, label='PML_SUB(approx)', 
                      color=pml_approx_color, edgecolor='white', linewidth=0.8)

# Add annotations with a cleaner format for larger values
for i, (gmp_val, pml_val, pml_approx_val) in enumerate(zip(gmp_ticks, pml_ticks, pml_approx_ticks)):
    # Format values for clarity
    if gmp_val >= 1000:
        gmp_text = f'{gmp_val/1000:.1f}K'
    else:
        gmp_text = f'{gmp_val}'
        
    if pml_val >= 1000:
        pml_text = f'{pml_val/1000:.1f}K'
    else:
        pml_text = f'{pml_val}'
        
    if pml_approx_val >= 1000:
        pml_approx_text = f'{pml_approx_val/1000:.1f}K'
    else:
        pml_approx_text = f'{pml_approx_val}'
    
    # Add value annotations with clean white boxes
    ax.text(x[i] - bar_width, gmp_val * 1.05, gmp_text, 
            ha='center', va='bottom', fontsize=9, fontweight='bold', color=gmp_color,
            bbox=dict(facecolor='white', alpha=0.7, edgecolor=gmp_color, boxstyle='round,pad=0.1'))
    ax.text(x[i], pml_val * 1.05, pml_text, 
            ha='center', va='bottom', fontsize=9, fontweight='bold', color=pml_color,
            bbox=dict(facecolor='white', alpha=0.7, edgecolor=pml_color, boxstyle='round,pad=0.1'))
    ax.text(x[i] + bar_width, pml_approx_val * 1.05, pml_approx_text, 
            ha='center', va='bottom', fontsize=9, fontweight='bold', color=pml_approx_color,
            bbox=dict(facecolor='white', alpha=0.7, edgecolor=pml_approx_color, boxstyle='round,pad=0.1'))

# Set labels and title
ax.set_xlabel('Bit Size', fontsize=14, fontweight='bold')
ax.set_ylabel('Average CPU Ticks', fontsize=14, fontweight='bold')
ax.set_title('Performance Comparison: CPU Processing Ticks for Subtraction\nIntel Xeon E-2314 @ 2.80GHz', 
            fontsize=16, fontweight='bold', pad=20)

# Set x-ticks
ax.set_xticks(x)
ax.set_xticklabels([str(size) for size in bit_sizes], rotation=45, fontsize=12, fontweight='bold')

# Add grid
ax.grid(True, linestyle='--', alpha=0.3)

# Add legend
ax.legend(fontsize=12, frameon=True, fancybox=True, framealpha=0.9, 
         loc='upper left')

# Add a note about PML_SUB(approx)
ax.text(0.02, 0.02, 
       "Note: PML_SUB(approx) implements approximation techniques to achieve further performance improvements.",
       transform=ax.transAxes, fontsize=10, ha='left', va='bottom',
       bbox=dict(facecolor='white', alpha=0.9, edgecolor='lightgray', boxstyle='round,pad=0.3'))

plt.tight_layout(pad=2.0)
plt.savefig("sub_approx_summary_cpu1.svg", dpi=300, bbox_inches='tight')
plt.savefig("sub_approx_summary_cpu1.png", dpi=300, bbox_inches='tight')

# Create a speedup summary chart
plt.figure(figsize=(14, 9), dpi=300)
ax = plt.gca()

# Calculate speedups for all bit sizes
speedup_pml_vs_gmp = [gmp / pml for gmp, pml in zip(gmp_ticks, pml_ticks)]
speedup_pml_approx_vs_gmp = [gmp / pml_approx for gmp, pml_approx in zip(gmp_ticks, pml_approx_ticks)]
speedup_pml_approx_vs_pml = [pml / pml_approx for pml, pml_approx in zip(pml_ticks, pml_approx_ticks)]

# Plot speedups as bars with spacing adjusted for 3 sets
speedup_width = 0.25
x = np.arange(len(bit_sizes))
s1_bars = ax.bar(x - speedup_width, speedup_pml_vs_gmp, speedup_width, 
                label='PML vs GMP', color=pml_color, alpha=0.9)
s2_bars = ax.bar(x, speedup_pml_approx_vs_gmp, speedup_width, 
                label='PML(approx) vs GMP', color=pml_approx_color, alpha=0.9)
s3_bars = ax.bar(x + speedup_width, speedup_pml_approx_vs_pml, speedup_width, 
                label='PML(approx) vs PML', color='#CC79A7', alpha=0.9)  # Using a different color for clarity

# Add speedup value annotations
for i, (s1, s2, s3) in enumerate(zip(speedup_pml_vs_gmp, speedup_pml_approx_vs_gmp, speedup_pml_approx_vs_pml)):
    ax.text(x[i] - speedup_width, s1 + 0.1, f'{s1:.2f}x', ha='center', fontsize=9, fontweight='bold')
    ax.text(x[i], s2 + 0.1, f'{s2:.2f}x', ha='center', fontsize=9, fontweight='bold')
    ax.text(x[i] + speedup_width, s3 + 0.1, f'{s3:.2f}x', ha='center', fontsize=9, fontweight='bold')

# Draw a horizontal line at y=1 to indicate the baseline
ax.axhline(y=1, color='black', linestyle='--', alpha=0.5)

# Set labels and title
ax.set_xlabel('Bit Size', fontsize=14, fontweight='bold')
ax.set_ylabel('Speedup Factor (×)', fontsize=14, fontweight='bold')
ax.set_title('Speedup Comparison for Subtraction Implementations\nIntel Xeon E-2314 @ 2.80GHz', 
            fontsize=16, fontweight='bold', pad=20)

# Set x-ticks and y-limit
ax.set_xticks(x)
ax.set_xticklabels([str(size) for size in bit_sizes], rotation=45, fontsize=12, fontweight='bold')
ax.set_ylim(0, max(max(speedup_pml_vs_gmp), max(speedup_pml_approx_vs_gmp), max(speedup_pml_approx_vs_pml)) + 0.5)

# Add grid
ax.grid(True, linestyle='--', alpha=0.3)

# Add legend
ax.legend(fontsize=12, frameon=True, fancybox=True, framealpha=0.9, loc='upper right')

# Add explanation
ax.text(0.02, 0.02, 
       "Values > 1 indicate faster performance than the reference implementation.\nPML_SUB(approx) shows the advantage of approximation techniques in large-number subtraction.",
       transform=ax.transAxes, fontsize=10, ha='left', va='bottom',
       bbox=dict(facecolor='white', alpha=0.9, edgecolor='lightgray', boxstyle='round,pad=0.3'))

plt.tight_layout(pad=2.0)
plt.savefig("sub_approx_speedup_summary_cpu1.svg", dpi=300, bbox_inches='tight')
plt.savefig("sub_approx_speedup_summary_cpu1.png", dpi=300, bbox_inches='tight')

print("All plots created successfully!")