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

# PML_ADD(approx) data
pml_approx_ticks = [6, 12, 17, 25, 41, 76, 165, 332, 666, 1324]
pml_approx_instructions = [24, 49, 75, 113, 183, 323, 603, 1163, 2283, 4523]
pml_approx_l1d_reads = [29, 33, 66, 105, 201, 402, 786, 1554, 3090, 6153]
pml_approx_l1d_misses = [7, 5, 12, 17, 32, 51, 114, 198, 405, 900]
pml_approx_l1d_miss_pct = [24.1, 15.2, 18.2, 16.2, 15.9, 12.7, 14.5, 12.7, 13.1, 14.6]


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
    gmp_bars = ax.bar(x - bar_width, gmp_data, bar_width, label=f'GMP_ADD {metric_name}', 
                     color=gmp_color, edgecolor='white', linewidth=0.8)
    pml_bars = ax.bar(x, pml_data, bar_width, label=f'PML_ADD {metric_name}', 
                     color=pml_color, edgecolor='white', linewidth=0.8)
    pml_approx_bars = ax.bar(x + bar_width, pml_approx_data, bar_width, label=f'PML_ADD(approx) {metric_name}', 
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
    ax.set_title(f'Comparison of {metric_name} between Implementations (Addition)\n'
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
                 "Average Ticks", "add_approx_ticks_cpu1.svg")

create_metric_plot("User Instructions", gmp_instructions, pml_instructions, pml_approx_instructions,
                 speedup_pml_vs_gmp_instructions, speedup_pml_approx_vs_gmp_instructions, speedup_pml_approx_vs_pml_instructions,
                 "User Instructions", "add_approx_instructions_cpu1.svg")

create_metric_plot("L1D Cache Reads", gmp_l1d_reads, pml_l1d_reads, pml_approx_l1d_reads,
                 None, None, None, "L1D Cache Reads", "add_approx_l1d_reads_cpu1.svg")

create_metric_plot("L1D Cache Misses", gmp_l1d_misses, pml_l1d_misses, pml_approx_l1d_misses,
                 None, None, None, "L1D Cache Misses", "add_approx_l1d_misses_cpu1.svg")

create_metric_plot("L1D Cache Miss Percentage", gmp_l1d_miss_pct, pml_l1d_miss_pct, pml_approx_l1d_miss_pct,
                 None, None, None, "L1D Cache Miss %", "add_approx_l1d_miss_pct_cpu1.svg")

# Create a summary plot for presentation needs (focused on Average Ticks)
plt.figure(figsize=(14, 9), dpi=300)
ax = plt.gca()

# Plot for all bit sizes
x = np.arange(len(bit_sizes))
gmp_bars = ax.bar(x - bar_width, gmp_ticks, bar_width, label='GMP_ADD', 
                 color=gmp_color, edgecolor='white', linewidth=0.8)
pml_bars = ax.bar(x, pml_ticks, bar_width, label='PML_ADD', 
                 color=pml_color, edgecolor='white', linewidth=0.8)
pml_approx_bars = ax.bar(x + bar_width, pml_approx_ticks, bar_width, label='PML_ADD(approx)', 
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
ax.set_title('Performance Comparison: CPU Processing Ticks for Addition\nIntel Xeon E-2314 @ 2.80GHz', 
            fontsize=16, fontweight='bold', pad=20)

# Set x-ticks
ax.set_xticks(x)
ax.set_xticklabels([str(size) for size in bit_sizes], rotation=45, fontsize=12, fontweight='bold')

# Add grid
ax.grid(True, linestyle='--', alpha=0.3)

# Add legend
ax.legend(fontsize=12, frameon=True, fancybox=True, framealpha=0.9, 
         loc='upper left')

# Add a note about PML_ADD(approx)
ax.text(0.02, 0.02, 
       "Note: PML_ADD(approx) implements approximation techniques to achieve further performance improvements.",
       transform=ax.transAxes, fontsize=10, ha='left', va='bottom',
       bbox=dict(facecolor='white', alpha=0.9, edgecolor='lightgray', boxstyle='round,pad=0.3'))

plt.tight_layout(pad=2.0)
plt.savefig("add_approx_summary_cpu1.svg", dpi=300, bbox_inches='tight')
plt.savefig("add_approx_summary_cpu1.png", dpi=300, bbox_inches='tight')

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
ax.set_title('Speedup Comparison for Addition Implementations\nIntel Xeon E-2314 @ 2.80GHz', 
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
       "Values > 1 indicate faster performance than the reference implementation.\nPML_ADD(approx) shows the advantage of approximation techniques in large-number addition.",
       transform=ax.transAxes, fontsize=10, ha='left', va='bottom',
       bbox=dict(facecolor='white', alpha=0.9, edgecolor='lightgray', boxstyle='round,pad=0.3'))

plt.tight_layout(pad=2.0)
plt.savefig("add_approx_speedup_summary_cpu1.svg", dpi=300, bbox_inches='tight')
plt.savefig("add_approx_speedup_summary_cpu1.png", dpi=300, bbox_inches='tight')

print("All plots created successfully!")