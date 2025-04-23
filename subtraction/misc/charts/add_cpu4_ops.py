import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib import rcParams
from matplotlib.ticker import ScalarFormatter
from matplotlib.lines import Line2D
from matplotlib.patches import FancyArrowPatch, Rectangle

# Apply professional styling
plt.style.use('seaborn-v0_8-whitegrid')
rcParams['font.family'] = 'sans-serif'
rcParams['font.sans-serif'] = ['Arial', 'DejaVu Sans', 'Liberation Sans', 'Bitstream Vera Sans', 'sans-serif']


# Apply professional styling
plt.style.use('seaborn-v0_8-whitegrid')
rcParams['font.family'] = 'sans-serif'
rcParams['font.sans-serif'] = ['Arial', 'DejaVu Sans', 'Liberation Sans', 'Bitstream Vera Sans', 'sans-serif']

# Updated Data with Baseline values
data = {
    "Bit Size": [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072],
    "GMP_ADD Time (ns)": [5.2, 6.1, 8, 12.6, 22.5, 41.6, 88.7, 161.4, 315.2, 745.3],
    "PML_ADD Time (ns)": [2, 4.1, 5.9, 9.3, 16.2, 32.8, 57.9, 112.9, 222.1, 490.4],
    "Baseline_ADD Time (ns)": [5.5, 11.0, 16.10, 32.10, 69.00, 146.20, 294.40, 596.10, 1194.20, 2400.00],
    "Speedup (PML_ADD vs GMP) Time": [2.60, 1.49, 1.36, 1.35, 1.39, 1.27, 1.53, 1.43, 1.42, 1.52],
    "Speedup (PML_ADD vs Baseline) Time": [2.75, 2.68, 2.73, 3.45, 4.26, 4.46, 5.08, 5.28, 5.38, 4.89],
    "GMP_ADD Ops": [186274989, 170741433, 124986512, 79347296, 44138219, 24023000, 11259055, 6221864, 3170014, 1341365],
    "PML_ADD Ops": [4074383931, 240605384, 169461870, 106458562, 61483328, 30126304, 17213564, 8842715, 4509170, 2040345],
    "Baseline_ADD Ops": [179908706, 90419224, 61794465, 31228769, 14513821, 6845267, 3410175, 1675932, 837466, 416565],
    "Speedup (PML_ADD vs GMP) Ops": [21.87, 1.41, 1.36, 1.34, 1.39, 1.25, 1.53, 1.42, 1.42, 1.52],
    "Speedup (PML_ADD vs Baseline) Ops": [22.65, 2.66, 2.74, 3.41, 4.24, 4.40, 5.05, 5.28, 5.38, 4.90]
}



df = pd.DataFrame(data)

# Enhanced color palette - color-blind friendly but more vibrant
gmp_color = "#D55E00"     # Red-orange
pml_color = "#009E73"     # Teal green
baseline_color = "#CC79A7" # Pinkish-purple
speedup_gmp_color = "#0072B2" # Blue (GMP vs PML speedup)
speedup_baseline_color = "#56B4E9" # Light blue (Baseline vs PML speedup)
bg_color = "#FFFFFF"      # White

# --- Plot: Operations per Second (Log-Log Scale) with enhanced visuals ---
fig1 = plt.figure(figsize=(16, 12), dpi=300)
fig1.patch.set_facecolor(bg_color)
ax1 = fig1.add_subplot(111)
ax1.set_facecolor(bg_color)

# Add subtle grid with lower alpha for cleaner look
ax1.grid(True, linestyle='--', alpha=0.3, color='#CCCCCC')

# Add decade lines for the y-axis to make log scale more obvious
y_decade_lines = [1e6, 1e7, 1e8, 1e9]
for y in y_decade_lines:
    ax1.axhline(y=y, linestyle='-', alpha=0.25, color='gray', zorder=1)

# Plot lines with enhanced styling
gmp_line = ax1.plot(df["Bit Size"], df["GMP_ADD Ops"], 
                   marker='o', linestyle='-', linewidth=3, markersize=9,
                   label="GMP_ADD Ops/s", color=gmp_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

pml_line = ax1.plot(df["Bit Size"], df["PML_ADD Ops"], 
                   marker='s', linestyle='--', linewidth=3, markersize=9,
                   label="PML_ADD Ops/s", color=pml_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

baseline_line = ax1.plot(df["Bit Size"], df["Baseline_ADD Ops"], 
                       marker='^', linestyle='-.', linewidth=3, markersize=9,
                       label="Baseline_ADD Ops/s", color=baseline_color, markeredgecolor='white', 
                       markeredgewidth=1, zorder=3)

# Place callout boxes ABOVE data points at strategic points
selected_indices = [0, 3, 6, 9]  # First, middle, and last points

for i in selected_indices:
    bit_size = df["Bit Size"][i]
    pml_ops = df["PML_ADD Ops"][i]
    
    # Create a callout box at this bit size
    # Position it ABOVE the data point with some padding
    box_y = pml_ops * 2.0  # Position ABOVE PML line
    
    # Format the speedup values
    speedup_gmp = df["Speedup (PML_ADD vs GMP) Ops"][i]
    speedup_baseline = df["Speedup (PML_ADD vs Baseline) Ops"][i]
    
    # Create the callout text
    callout_text = f"Speedup\nPML vs GMP: {speedup_gmp:.2f}x\nPML vs Baseline: {speedup_baseline:.2f}x"
    
    # Add a fancy box with the speedup information
    props = dict(boxstyle='round,pad=0.5', facecolor='#F8F8F8', alpha=0.9, 
                edgecolor='gray', linewidth=1)
    
    # Connect the box to the PML data point with a line
    ax1.annotate('', xy=(bit_size, pml_ops), xytext=(bit_size, box_y),
                arrowprops=dict(arrowstyle='-', color='gray', linewidth=1, 
                               linestyle='--', alpha=0.7))
    
    # Add text box
    ax1.text(bit_size, box_y, callout_text, 
            ha='center', va='center', fontsize=9, 
            bbox=props, zorder=5)

# Operations annotations - only at specific points
for i in range(0, len(df["Bit Size"]), 1):  # Annotate every other point for clarity
    bit_size = df["Bit Size"][i]
    
    # Format ops values in millions (M) for readability
    gmp_ops_fmt = f"{df['GMP_ADD Ops'][i]/1e6:.1f}M"
    pml_ops_fmt = f"{df['PML_ADD Ops'][i]/1e6:.1f}M"
    baseline_ops_fmt = f"{df['Baseline_ADD Ops'][i]/1e6:.1f}M"
    
    # GMP ops annotation
    ax1.text(bit_size * 1.05, df["GMP_ADD Ops"][i] * 1.1,  
             gmp_ops_fmt, 
             fontsize=9, ha='left', color=gmp_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=gmp_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML ops annotation
    ax1.text(bit_size * 1.05, df["PML_ADD Ops"][i] * 1.1,  
             pml_ops_fmt, 
             fontsize=9, ha='left', color=pml_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_color, 
                      boxstyle='round,pad=0.2'))
    
    # Baseline ops annotation
    ax1.text(bit_size * 1, df["Baseline_ADD Ops"][i] * 0.85,  
             baseline_ops_fmt, 
             fontsize=9, ha='right', color=baseline_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=baseline_color, 
                      boxstyle='round,pad=0.2'))

# Scale and label settings
ax1.set_xscale("log", base=2)
ax1.set_yscale("log", base=10)
ax1.set_xticks(df["Bit Size"])
ax1.set_xticklabels(df["Bit Size"], rotation=45, fontsize=11, fontweight="bold")

# Set y-axis ticks at decade marks
ax1.set_yticks([1e6, 1e7, 1e8, 1e9])
formatter = ScalarFormatter()
formatter.set_scientific(False)
ax1.yaxis.set_major_formatter(formatter)

# Axis labels
ax1.set_xlabel("Bit Size (log₂ scale)", fontsize=14, fontweight="bold", labelpad=12)
ax1.set_ylabel("Operations per Second (log₁₀ scale)", fontsize=14, fontweight="bold", labelpad=12)

# Title
title = ax1.set_title("Throughput Comparison on AMD EPYC 9B14 for\nLarge-Number Addition (Log-scale)", 
                     fontsize=16, fontweight="bold", pad=20)
plt.setp(title, bbox=dict(facecolor=bg_color, edgecolor=None, alpha=0.8, 
                         pad=5, boxstyle='round,pad=0.5'))

# Enhanced legend for operation throughput
legend = ax1.legend(loc='upper right', fontsize=12, frameon=True, 
                   edgecolor='gray', fancybox=True, framealpha=0.9)

# Create a table-format string with the speedup data for all bit sizes
table_text = "Speedup Factors by Bit Size:\n"
table_text += "┌────────┬───────────┬────────────┐\n"
table_text += "│Bit Size│ PML vs GMP│ PML vs Base│\n"
table_text += "├────────┼───────────┼────────────┤\n"

# Add each row of data
for i, bit_size in enumerate(df["Bit Size"]):
    gmp_speedup = df["Speedup (PML_ADD vs GMP) Ops"][i]
    baseline_speedup = df["Speedup (PML_ADD vs Baseline) Ops"][i]
    
    # Format each row with proper alignment
    bit_size_str = f"{bit_size:6d}"
    gmp_speedup_str = f"{gmp_speedup:.2f}×"
    baseline_speedup_str = f"{baseline_speedup:.2f}×"
    
    table_text += f"│ {bit_size_str} │ {gmp_speedup_str:9} │ {baseline_speedup_str:10} │\n"

# Close the table
table_text += "└────────┴───────────┴────────────┘"

# Add explanation box with the data table - NOW AT LEFT BOTTOM
ax1.text(0.03, 0.05, table_text, 
         transform=ax1.transAxes, fontsize=9, fontfamily='monospace',
         bbox=dict(facecolor='white', alpha=0.9, edgecolor='gray', boxstyle='round,pad=0.5'),
         ha='left', va='bottom')  # Changed ha from 'right' to 'left'

# Add a subtle border to the figure
for spine in ax1.spines.values():
    spine.set_edgecolor('lightgray')
    spine.set_linewidth(1.5)

plt.tight_layout(pad=1)
plt.savefig("cpu4_operations_add.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)
# plt.savefig("cpu1_operations_add.png", dpi=300, bbox_inches='tight', facecolor=bg_color)