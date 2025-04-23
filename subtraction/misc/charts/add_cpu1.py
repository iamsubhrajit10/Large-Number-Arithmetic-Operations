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
data = {
    "Bit Size": [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072],
    "GMP_ADD Time (ns)": [8.6, 9.8, 12.2, 18.4, 31.7, 60.9, 151, 335, 665.1, 917],
    "PML_ADD Time (ns)": [2.8, 4.3, 5.8, 9.6, 18.4, 35.8, 76.2, 158.8, 313.7, 629.2],
    "PML_ADD (Worst Case) Time (ns)": [4.3, 5.0, 7.8, 14.0, 26.3, 51.3, 124.0, 256.9, 510.7, 1018.3],
    "Baseline_ADD Time (ns)": [6.5, 7.4, 14.7, 25.1, 40.7, 90.2, 191.9, 383.3, 776.6, 1563],
    "Speedup (PML_ADD vs GMP) Time": [3.07, 2.28, 2.10, 1.92, 1.72, 1.70, 1.98, 2.11, 2.12, 1.46],
    "Speedup (PML_ADD vs Baseline) Time": [2.32, 1.72, 2.53, 2.61, 2.21, 2.52, 2.52, 2.41, 2.48, 2.48],
    "Speedup (PML_ADD Phase-4 vs GMP) Time": [2.00, 1.96, 1.56, 1.31, 1.21, 1.19, 1.22, 1.30, 1.30, 0.90],
    "GMP_ADD Ops": [115621209, 100961962, 81627840, 54157396, 31536684, 16481172, 6630445, 2985090, 1504493, 1090682],
    "PML_ADD Ops": [326750410, 228606237, 164320986, 102267366, 53881075, 27869415, 13111981, 6293498, 3186806, 1588567],
    "PML_ADD (Phase-4) Ops": [230440418, 194434540, 128821596, 72139024, 37826906, 19477626, 8060899, 3892216, 1957854, 981990],
    "Baseline_ADD Ops": [152949897, 133061478, 67850597, 39685176, 24558590, 11082917, 5210652, 2607131, 1288031, 639874],
    "Speedup (PML_ADD vs GMP) Ops": [2.83, 2.26, 2.01, 1.89, 1.71, 1.69, 1.98, 2.11, 2.12, 1.46],
    "Speedup (PML_ADD vs Baseline) Ops": [2.14, 1.72, 2.42, 2.58, 2.19, 2.51, 2.52, 2.41, 2.47, 2.48],
    "Speedup (PML_ADD Phase-4 vs GMP) Ops": [1.99, 1.93, 1.58, 1.33, 1.20, 1.18, 1.22, 1.30, 1.30, 0.90]
}

df = pd.DataFrame(data)

# Enhanced color palette - color-blind friendly but more vibrant
gmp_color = "#D55E00"      # Red-orange
pml_color = "#009E73"      # Teal green
# light green color for PML Phase-4
pml_phase4_color = "#8CD17D"  # Light green
baseline_color = "#CC79A7" # Pinkish-purple
# Dark Blue for Baseline
baseline_color = "#0072B2" # Dark blue
speedup_gmp_color = "#0072B2" # Blue (GMP vs PML speedup)
speedup_baseline_color = "#56B4E9" # Light blue (Baseline vs PML speedup)
bg_color = "#FFFFFF"       # White

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

# Add the new PML Phase-4 line
pml_phase4_line = ax1.plot(df["Bit Size"], df["PML_ADD (Worst Case) Time (ns)"], 
                          marker='d', linestyle=':', linewidth=3, markersize=9,
                          label="PML_ADD (Worst Case) Time (ns)", color=pml_phase4_color, markeredgecolor='white', 
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
    pml_phase4_time = df["PML_ADD (Worst Case) Time (ns)"][i]
    
    # Create a callout box at this bit size for regular PML
    # Position it below the lowest data point with some padding
    box_y = pml_time * 0.4  # Position below PML line
    
    # Format the speedup values for regular PML
    speedup_gmp = df["Speedup (PML_ADD vs GMP) Time"][i]
    speedup_baseline = df["Speedup (PML_ADD vs Baseline) Time"][i]
    
    # Create the callout text for regular PML
    callout_text = f"Speedup (PML)\nPML vs GMP: {speedup_gmp:.2f}x\nPML vs Baseline: {speedup_baseline:.2f}x"
    # Add a fancy box with the speedup information
    props = dict(boxstyle='round,pad=0.5', facecolor='#F8F8F8', alpha=0.95, 
                edgecolor=pml_color, linewidth=1.5)
    
    # Connect the box to the PML data point with a line
    ax1.annotate('', xy=(bit_size, pml_time), xytext=(bit_size, box_y),
                arrowprops=dict(arrowstyle='-', color='gray', linewidth=1, 
                               linestyle='--', alpha=0.7))
    
    # Add text box for regular PML
    ax1.text(bit_size, box_y, callout_text, 
            ha='center', va='center', fontsize=9, 
            bbox=props, zorder=5)
    

# Time annotations with increased separation - only at specific points
for i in range(0, len(df["Bit Size"]), 1):  # Annotate every other point to reduce clutter
    bit_size = df["Bit Size"][i]
    
    # GMP time annotation
    ax1.text(bit_size * 1.05, df["GMP_ADD Time (ns)"][i] * 1.1,  
             f"{df['GMP_ADD Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='left', color=gmp_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=gmp_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML time annotation
    ax1.text(bit_size * 1.1, df["PML_ADD Time (ns)"][i] *0.75,  
             f"{df['PML_ADD Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='right', color=pml_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML Phase-4 time annotation (offset to avoid overlap)
    ax1.text(bit_size * 0.85, df["PML_ADD (Worst Case) Time (ns)"][i] * 0.85,  
             f"{df['PML_ADD (Worst Case) Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='center', color=pml_phase4_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_phase4_color, 
                      boxstyle='round,pad=0.2'))
    
    # Baseline time annotation
    ax1.text(bit_size * 0.95, df["Baseline_ADD Time (ns)"][i] * 1.1,  
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
title = ax1.set_title("Timing Comparison on Xeon E-2314 for\nLarge-Number Addition (Log-scale)", 
                     fontsize=16, fontweight="bold", pad=20)
plt.setp(title, bbox=dict(facecolor=bg_color, edgecolor=None, alpha=0.8, 
                         pad=5, boxstyle='round,pad=0.5'))

# Enhanced legend for execution times
legend = ax1.legend(loc='upper left', fontsize=12, frameon=True, 
                   edgecolor='gray', fancybox=True, framealpha=0.9)

# Create an expanded table-format string with the speedup data for all bit sizes
table_text = "Speedup Factors by Bit Size:\n"
table_text += "┌────────┬───────────┬────────────┬─────────────┐\n"
table_text += "│Bit Size│ PML vs GMP│ PML vs Base│ PMLW vs GMP │\n"
table_text += "├────────┼───────────┼────────────┼─────────────┤\n"

# Add each row of data
for i, bit_size in enumerate(df["Bit Size"]):
    gmp_speedup = df["Speedup (PML_ADD vs GMP) Time"][i]
    baseline_speedup = df["Speedup (PML_ADD vs Baseline) Time"][i]
    phase4_speedup = df["Speedup (PML_ADD Phase-4 vs GMP) Time"][i]
    
    # Format each row with proper alignment
    bit_size_str = f"{bit_size:6d}"
    gmp_speedup_str = f"{gmp_speedup:.2f}×"
    baseline_speedup_str = f"{baseline_speedup:.2f}×"
    phase4_speedup_str = f"{phase4_speedup:.2f}×"
    
    table_text += f"│ {bit_size_str} │ {gmp_speedup_str:9} │ {baseline_speedup_str:10} │ {phase4_speedup_str:11} │\n"

# Close the table
table_text += "└────────┴───────────┴────────────┴─────────────┘"

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
plt.savefig("cpu1_execution_time_add.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)