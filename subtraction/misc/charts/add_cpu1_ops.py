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
    "GMP_ADD Time (ns)": [8.3, 9.7, 12.1, 17.9, 31.0, 60.6, 150.9, 335.1, 664.9, 904.8],
    "PML_ADD Time (ns)": [3.3, 3.9, 5.7, 9.1, 17.2, 32.6, 78.1, 153.6, 296.6, 589.6],
    "PML_ADD (Worst Case) Time (ns)": [4.7, 4.6, 7.5, 14.0, 27.2, 58.8, 125.6, 244.2, 478.6, 955.2],
    "Baseline_ADD Time (ns)": [9.0, 11.1, 21.0, 46.8, 104.1, 218.7, 454.9, 913.9, 1832.8, 3680.8],
    "Speedup (PML_ADD vs GMP) Time": [2.52, 2.49, 2.12, 1.97, 1.80, 1.86, 1.93, 2.18, 2.24, 1.53],
    "Speedup (PML_ADD vs Baseline) Time": [2.73, 2.85, 3.68, 5.14, 6.05, 6.71, 5.82, 5.95, 6.18, 6.24],
    "Speedup (PML_ADD Worst Case vs GMP) Time": [1.77, 2.11, 1.61, 1.28, 1.14, 1.03, 1.20, 1.37, 1.39, 0.95],
    "GMP_ADD Ops": [120037374, 102675970, 82231297, 55730331, 32212907, 16483525, 6622571, 2981604, 1501359, 1104400],
    "PML_ADD Ops": [253970455, 232799164, 174548545, 108662757, 58054446, 30598996, 12786763, 6496197, 3362922, 1692575],
    "PML_ADD (Worst Case) Ops": [213307432, 206545754, 121531111, 70908270, 36574396, 16685293, 7932657, 4089501, 2085634, 1046229],
    "Baseline_ADD Ops": [110803944, 90457876, 47488506, 21299563, 9603193, 4571277, 2196299, 1093490, 544969, 271301],
    "Speedup (PML_ADD vs GMP) Ops": [2.12, 2.27, 2.12, 1.95, 1.80, 1.86, 1.93, 2.18, 2.24, 1.53],
    "Speedup (PML_ADD vs Baseline) Ops": [2.29, 2.57, 3.68, 5.10, 6.05, 6.69, 5.82, 5.94, 6.17, 6.24],
    "Speedup (PML_ADD Worst Case vs GMP) Ops": [1.78, 2.01, 1.48, 1.27, 1.14, 1.01, 1.20, 1.37, 1.39, 0.95]
}

df = pd.DataFrame(data)

# Enhanced color palette - color-blind friendly but more vibrant
gmp_color = "#D55E00"      # Red-orange
pml_color = "#009E73"      # Teal green
pml_phase4_color = "#8CD17D"  # Purple
baseline_color = "#0072B2" # Dark blue
speedup_gmp_color = "#0072B2" # Blue (GMP vs PML speedup)
speedup_baseline_color = "#56B4E9" # Light blue (Baseline vs PML speedup)
bg_color = "#FFFFFF"       # White

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

# Add the new PML Worst Case line
pml_phase4_line = ax1.plot(df["Bit Size"], df["PML_ADD (Worst Case) Ops"], 
                          marker='d', linestyle=':', linewidth=3, markersize=9,
                          label="PML_ADD (Worst Case) Ops/s", color=pml_phase4_color, markeredgecolor='white', 
                          markeredgewidth=1, zorder=3)

baseline_line = ax1.plot(df["Bit Size"], df["Baseline_ADD Ops"], 
                       marker='^', linestyle='-.', linewidth=3, markersize=9,
                       label="Baseline_ADD Ops/s", color=baseline_color, markeredgecolor='white', 
                       markeredgewidth=1, zorder=3)

# Place callout boxes ABOVE data points at strategic points
selected_indices = [0, 2, 5, 8]  # First, middle, and last points

for i in selected_indices:
    bit_size = df["Bit Size"][i]
    pml_ops = df["PML_ADD Ops"][i]
    pml_phase4_ops = df["PML_ADD (Worst Case) Ops"][i]
    
    # Create a callout box at this bit size for regular PML
    # Position it ABOVE the data point with some padding
    box_y = pml_ops * 2.0  # Position ABOVE PML line
    
    # Format the speedup values for regular PML
    speedup_gmp = df["Speedup (PML_ADD vs GMP) Ops"][i]
    speedup_baseline = df["Speedup (PML_ADD vs Baseline) Ops"][i]
    
    # Create the callout text for regular PML
    callout_text = f"Speedup (PML)\nPML vs GMP: {speedup_gmp:.2f}x\nPML vs Baseline: {speedup_baseline:.2f}x"
    
    # Add a fancy box with the speedup information
    props = dict(boxstyle='round,pad=0.5', facecolor='#F8F8F8', alpha=0.95, 
                edgecolor=pml_color, linewidth=1.5)
    
    # Connect the box to the PML data point with a line
    ax1.annotate('', xy=(bit_size, pml_ops), xytext=(bit_size, box_y),
                arrowprops=dict(arrowstyle='-', color='gray', linewidth=1, 
                               linestyle='--', alpha=0.7))
    
    # Add text box for regular PML
    ax1.text(bit_size, box_y, callout_text, 
            ha='center', va='center', fontsize=9, 
            bbox=props, zorder=5)


# Operations annotations - only at specific points (reduced to avoid clutter)
for i in range(0, len(df["Bit Size"]), 1):  # Annotate every other point
    bit_size = df["Bit Size"][i]
    
    # Format ops values in millions (M) for readability
    gmp_ops_fmt = f"{df['GMP_ADD Ops'][i]/1e6:.1f}M"
    pml_ops_fmt = f"{df['PML_ADD Ops'][i]/1e6:.1f}M"
    pml_phase4_ops_fmt = f"{df['PML_ADD (Worst Case) Ops'][i]/1e6:.1f}M"
    baseline_ops_fmt = f"{df['Baseline_ADD Ops'][i]/1e6:.1f}M"
    
    # GMP ops annotation
    ax1.text(bit_size * 1.05, df["GMP_ADD Ops"][i] * 0.85,  
             gmp_ops_fmt, 
             fontsize=9, ha='left', color=gmp_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=gmp_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML ops annotation
    ax1.text(bit_size * 1, df["PML_ADD Ops"][i] * 1.1,  
             pml_ops_fmt, 
             fontsize=9, ha='left', color=pml_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML Worst Case ops annotation
    ax1.text(bit_size * 0.85, df["PML_ADD (Worst Case) Ops"][i] * 0.95,  
             pml_phase4_ops_fmt, 
             fontsize=9, ha='center', color=pml_phase4_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_phase4_color, 
                      boxstyle='round,pad=0.2'))
    
    # Baseline ops annotation
    ax1.text(bit_size * 0.95, df["Baseline_ADD Ops"][i] * 0.85,  
             baseline_ops_fmt, 
             fontsize=9, ha='center', color=baseline_color, fontweight="bold", 
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

# # Create a table-format string with the speedup data for all bit sizes
# table_text = "Speedup Factors by Bit Size:\n"
# table_text += "┌────────┬───────────┬────────────┬─────────────┐\n"
# table_text += "│Bit Size│ PML vs GMP│ PML vs Base│ Worst Case vs GMP │\n"
# table_text += "├────────┼───────────┼────────────┼─────────────┤\n"

# # Add each row of data
# for i, bit_size in enumerate(df["Bit Size"]):
#     gmp_speedup = df["Speedup (PML_ADD vs GMP) Ops"][i]
#     baseline_speedup = df["Speedup (PML_ADD vs Baseline) Ops"][i]
#     phase4_speedup = df["Speedup (PML_ADD Worst Case vs GMP) Ops"][i]
    
#     # Format each row with proper alignment
#     bit_size_str = f"{bit_size:6d}"
#     gmp_speedup_str = f"{gmp_speedup:.2f}×"
#     baseline_speedup_str = f"{baseline_speedup:.2f}×"
#     phase4_speedup_str = f"{phase4_speedup:.2f}×"
    
#     table_text += f"│ {bit_size_str} │ {gmp_speedup_str:9} │ {baseline_speedup_str:10} │ {phase4_speedup_str:11} │\n"

# # Close the table
# table_text += "└────────┴───────────┴────────────┴─────────────┘"

# # Add explanation box with the data table - NOW AT LEFT BOTTOM
# ax1.text(0.03, 0.05, table_text, 
#          transform=ax1.transAxes, fontsize=9, fontfamily='monospace',
#          bbox=dict(facecolor='white', alpha=0.9, edgecolor='gray', boxstyle='round,pad=0.5'),
#          ha='left', va='bottom')

# Add a subtle border to the figure
for spine in ax1.spines.values():
    spine.set_edgecolor('lightgray')
    spine.set_linewidth(1.5)

plt.tight_layout(pad=1)
plt.savefig("cpu1_operations_add.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)