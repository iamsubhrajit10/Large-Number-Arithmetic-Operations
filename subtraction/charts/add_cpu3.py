import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib import rcParams
from matplotlib.ticker import ScalarFormatter

# Apply professional styling
plt.style.use('seaborn-v0_8-whitegrid')
rcParams['font.family'] = 'sans-serif'
rcParams['font.sans-serif'] = ['Arial', 'DejaVu Sans', 'Liberation Sans', 'Bitstream Vera Sans', 'sans-serif']

# Updated Data with Baseline values
data = {
    "Bit Size": [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072],
    "GMP_ADD Time (ns)": [4.7, 4.9, 6.6, 9.6, 15.8, 31.4, 63.8, 131, 262.8, 529],
    "PML_ADD Time (ns)": [1.7, 2.7, 3.7, 5.8, 10, 21.2, 41.7, 82.5, 164.3, 331],
    "Baseline_ADD Time (ns)": [5.10, 7.50, 12.20, 24.40, 53.50, 117.90, 254.80, 511.60, 1029.40, 2068.90],
    "Speedup (PML_ADD vs GMP) Time": [2.76, 1.81, 1.78, 1.66, 1.58, 1.48, 1.53, 1.59, 1.60, 1.60],
    "Speedup (PML_ADD vs Baseline) Time": [3.00, 2.78, 3.30, 4.21, 5.35, 5.56, 6.11, 6.20, 6.27, 6.25],
    "GMP_ADD Ops": [231737042, 204617588, 157829644, 106665131, 63712006, 31774704, 15628063, 7721647, 3799027, 1886408],
    "PML_ADD Ops": [2128008093, 355134465, 260752574, 169483179, 90100188, 46700074, 23779200, 12054345, 6032443, 2987273],
    "Baseline_ADD Ops": [185128769, 130639419, 81629041, 40840136, 18730385, 8470307, 3950726, 1952380, 969170, 482557],
    "Speedup (PML_ADD vs GMP) Ops": [9.18, 1.74, 1.65, 1.59, 1.41, 1.47, 1.52, 1.56, 1.59, 1.58],
    "Speedup (PML_ADD vs Baseline) Ops": [11.49, 2.72, 3.19, 4.15, 4.81, 5.51, 6.02, 6.17, 6.22, 6.19]
}

df = pd.DataFrame(data)

# Enhanced color palette - color-blind friendly but more vibrant
gmp_color = "#D55E00"     # Red-orange
pml_color = "#009E73"     # Teal green
baseline_color = "#CC79A7" # Pinkish-purple
speedup_gmp_color = "#0072B2" # Blue (GMP vs PML speedup)
speedup_baseline_color = "#56B4E9" # Light blue (Baseline vs PML speedup)
bg_color = "#FFFFFF"      # White

# --- Plot: Execution Time (Log-Log Scale) with enhanced visuals ---
fig1 = plt.figure(figsize=(16, 12), dpi=300)
fig1.patch.set_facecolor(bg_color)
ax1 = fig1.add_subplot(111)
ax1.set_facecolor(bg_color)

# Add subtle grid with lower alpha for cleaner look
ax1.grid(True, linestyle='--', alpha=0.3, color='#CCCCCC')

# Add decade lines for the y-axis to make log scale more obvious
y_decade_lines = [1, 10, 100, 1000, 10000]
for y in y_decade_lines:
    ax1.axhline(y=y, linestyle='-', alpha=0.25, color='gray', zorder=1)

# Plot lines with enhanced styling
gmp_line = ax1.plot(df["Bit Size"], df["GMP_ADD Time (ns)"], 
                   marker='o', linestyle='-', linewidth=3, markersize=9,
                   label="GMP_ADD Time (ns)", color=gmp_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

pml_line = ax1.plot(df["Bit Size"], df["PML_ADD Time (ns)"], 
                   marker='s', linestyle='--', linewidth=3, markersize=9,
                   label="PML_ADD Time (ns)", color=pml_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

baseline_line = ax1.plot(df["Bit Size"], df["Baseline_ADD Time (ns)"], 
                       marker='^', linestyle='-.', linewidth=3, markersize=9,
                       label="Baseline_ADD Time (ns)", color=baseline_color, markeredgecolor='white', 
                       markeredgewidth=1, zorder=3)

# Instead of arrows, use a speedup callout box at strategic points
# We'll create callout boxes at select bit sizes to highlight speedups
selected_indices = [0, 3, 6, 9]  # First, middle, and last points

for i in selected_indices:
    bit_size = df["Bit Size"][i]
    pml_time = df["PML_ADD Time (ns)"][i]
    
    # Create a callout box at this bit size
    # Position it below the lowest data point with some padding
    box_y = pml_time * 0.4  # Position below PML line
    
    # Format the speedup values
    speedup_gmp = df["Speedup (PML_ADD vs GMP) Time"][i]
    speedup_baseline = df["Speedup (PML_ADD vs Baseline) Time"][i]
    
    # Create the callout text
    callout_text = f"Speedup\nPML vs GMP: {speedup_gmp:.2f}x\nPML vs Baseline: {speedup_baseline:.2f}x"
    
    # Add a fancy box with the speedup information
    props = dict(boxstyle='round,pad=0.5', facecolor='#F8F8F8', alpha=0.9, 
                edgecolor='gray', linewidth=1)
    
    # Connect the box to the PML data point with a line
    ax1.annotate('', xy=(bit_size, pml_time), xytext=(bit_size, box_y),
                arrowprops=dict(arrowstyle='-', color='gray', linewidth=1, 
                               linestyle='--', alpha=0.7))
    
    # Add text box
    ax1.text(bit_size, box_y, callout_text, 
            ha='center', va='center', fontsize=9, 
            bbox=props, zorder=5)

# Time annotations with increased separation - only at specific points
for i in range(0, len(df["Bit Size"]), 1):  # Annotate every third point
    bit_size = df["Bit Size"][i]
    
    # GMP time annotation
    ax1.text(bit_size * 1.05, df["GMP_ADD Time (ns)"][i] * 1.1,  
             f"{df['GMP_ADD Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='left', color=gmp_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=gmp_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML time annotation
    ax1.text(bit_size * 0.95, df["PML_ADD Time (ns)"][i] * 0.9,  
             f"{df['PML_ADD Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='right', color=pml_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_color, 
                      boxstyle='round,pad=0.2'))
    
    # Baseline time annotation
    ax1.text(bit_size * 1.05, df["Baseline_ADD Time (ns)"][i] * 1.1,  
             f"{df['Baseline_ADD Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='right', color=baseline_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=baseline_color, 
                      boxstyle='round,pad=0.2'))

# Scale and label settings
ax1.set_xscale("log", base=2)
ax1.set_yscale("log", base=10)
ax1.set_xticks(df["Bit Size"])
ax1.set_xticklabels(df["Bit Size"], rotation=45, fontsize=11, fontweight="bold")

# Set y-axis ticks at decade marks
ax1.set_yticks([1, 10, 100, 1000, 10000])
formatter = ScalarFormatter()
formatter.set_scientific(False)
ax1.yaxis.set_major_formatter(formatter)

# Axis labels
ax1.set_xlabel("Bit Size (log₂ scale)", fontsize=14, fontweight="bold", labelpad=12)
ax1.set_ylabel("Avg. Execution Time (ns, log₁₀ scale)", fontsize=14, fontweight="bold", labelpad=12)

# Title
title = ax1.set_title("Timing Comparison on Intel Xeon P 8481C for\nLarge-Number Addition (Log-scale)", 
                     fontsize=16, fontweight="bold", pad=20)
plt.setp(title, bbox=dict(facecolor=bg_color, edgecolor=None, alpha=0.8, 
                         pad=5, boxstyle='round,pad=0.5'))

# Enhanced legend for execution times
legend = ax1.legend(loc='upper left', fontsize=12, frameon=True, 
                   edgecolor='gray', fancybox=True, framealpha=0.9)

# Create a table-format string with the speedup data for all bit sizes
table_text = "Speedup Factors by Bit Size:\n"
table_text += "┌────────┬───────────┬────────────┐\n"
table_text += "│Bit Size│ PML vs GMP│ PML vs Base│\n"
table_text += "├────────┼───────────┼────────────┤\n"

# Add each row of data
for i, bit_size in enumerate(df["Bit Size"]):
    gmp_speedup = df["Speedup (PML_ADD vs GMP) Time"][i]
    baseline_speedup = df["Speedup (PML_ADD vs Baseline) Time"][i]
    
    # Format each row with proper alignment
    bit_size_str = f"{bit_size:6d}"
    gmp_speedup_str = f"{gmp_speedup:.2f}×"
    baseline_speedup_str = f"{baseline_speedup:.2f}×"
    
    table_text += f"│ {bit_size_str} │ {gmp_speedup_str:9} │ {baseline_speedup_str:10} │\n"

# Close the table
table_text += "└────────┴───────────┴────────────┘"

# Add explanation box with the data table
ax1.text(0.97, 0.05, table_text, 
         transform=ax1.transAxes, fontsize=9, fontfamily='monospace',
         bbox=dict(facecolor='white', alpha=0.9, edgecolor='gray', boxstyle='round,pad=0.5'),
         ha='right', va='bottom')

# Add a subtle border to the figure
for spine in ax1.spines.values():
    spine.set_edgecolor('lightgray')
    spine.set_linewidth(1.5)

plt.tight_layout(pad=1)
plt.savefig("cpu3_execution_time_add.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)