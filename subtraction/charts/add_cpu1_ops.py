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

# Updated data with Baseline_ADD and Ops data
# ...existing code...
data = {
    "Bit Size": [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072],
    "GMP_ADD Time (ns)": [8.6, 9.8, 12.2, 18.4, 31.7, 60.9, 151, 335, 665.1, 917],
    "PML_ADD Time (ns)": [2.9, 5, 6.5, 10, 15.3, 29.5, 53, 103.9, 203.9, 414.7],
    "Baseline_ADD Time (ns)": [6.5, 7.4, 14.7, 25.1, 40.7, 90.2, 191.9, 383.3, 776.6, 1563],
    "Speedup (PML_ADD vs GMP) Time": [2.97, 1.96, 1.88, 1.84, 2.07, 2.06, 2.85, 3.22, 3.26, 2.21],
    "Speedup (PML_ADD vs Baseline) Time": [2.24, 1.48, 2.26, 2.51, 2.66, 3.06, 3.62, 3.69, 3.81, 3.77],
    "GMP_ADD Ops": [115621209, 100961962, 81627840, 54157396, 31536684, 16481172, 6630445, 2985090, 1504493, 1090682],
    "PML_ADD Ops": [343921608, 196048789, 152783887, 98940660, 65076578, 33796657, 18854088, 9614968, 4903891, 2410687],
    "Baseline_ADD Ops": [152949897, 133061478, 67850597, 39685176, 24558590, 11082917, 5210652, 2607131, 1288031, 639874],
    "Speedup (PML_ADD vs GMP) Ops": [2.97, 1.94, 1.87, 1.83, 2.06, 2.05, 2.84, 3.22, 3.26, 2.21],
    "Speedup (PML_ADD vs Baseline) Ops": [2.25, 1.47, 2.25, 2.49, 2.65, 3.05, 3.62, 3.69, 3.81, 3.77]
}
# ...existing code...
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
title = ax1.set_title("Throughput Comparison on Xeon E-2314 for\nLarge-Number Addition (Log-scale)", 
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
plt.savefig("cpu1_operations_add.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)
# plt.savefig("cpu1_operations_add.png", dpi=300, bbox_inches='tight', facecolor=bg_color)