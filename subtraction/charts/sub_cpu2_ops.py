import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib import rcParams
from matplotlib.ticker import ScalarFormatter

# Apply professional styling
plt.style.use('seaborn-v0_8-whitegrid')
rcParams['font.family'] = 'sans-serif'
rcParams['font.sans-serif'] = ['Arial', 'DejaVu Sans', 'Liberation Sans', 'Bitstream Vera Sans', 'sans-serif']


# New Data
data = {
    "Bit Size": [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072],
    "GMP_SUB Time (ns)": [9.8, 11.3, 13.2, 15.8, 22.6, 41.7, 84.9, 171.2, 352.1, 700],
    "PML_SUB Time (ns)": [3.1, 3.6, 4.4, 7.1, 12.7, 24, 47.6, 94.8, 195.3, 405.8],
    "Baseline_SUB Time (ns)": [5.4, 8.9, 15.7, 29.8, 58.3, 115.4, 260.1, 482.0, 955.5, 1887.7],
    "Speedup (PML_SUB vs GMP) Time": [3.16, 3.14, 3.00, 2.23, 1.78, 1.74, 1.78, 1.81, 1.80, 1.72],
    "Speedup (PML_SUB vs Baseline) Time": [1.74, 2.47, 3.57, 4.20, 4.59, 4.81, 5.46, 5.08, 4.89, 4.65],
    "GMP_SUB Ops": [109620700, 96122471, 80579723, 65055514, 44299811, 23975675, 11782193, 5856451, 2841413, 1428538],
    "PML_SUB Ops": [312459596, 266095105, 217957077, 140479192, 77223099, 41667556, 20989452, 10537283, 5121191, 2409393],
    "Baseline_SUB Ops": [177639803, 111587014, 63420691, 33485811, 17176433, 8630255, 4071515, 2068852, 1037980, 527162],
    "Speedup (PML_SUB vs GMP) Ops": [2.85, 2.77, 2.70, 2.16, 1.74, 1.74, 1.78, 1.80, 1.80, 1.69],
    "Speedup (PML_SUB vs Baseline) Ops": [1.76, 2.38, 3.44, 4.20, 4.50, 4.83, 5.16, 5.09, 4.93, 4.57]
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
gmp_line = ax1.plot(df["Bit Size"], df["GMP_SUB Ops"], 
                   marker='o', linestyle='-', linewidth=3, markersize=9,
                   label="GMP_SUB Ops/s", color=gmp_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

pml_line = ax1.plot(df["Bit Size"], df["PML_SUB Ops"], 
                   marker='s', linestyle='--', linewidth=3, markersize=9,
                   label="PML_SUB Ops/s", color=pml_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

baseline_line = ax1.plot(df["Bit Size"], df["Baseline_SUB Ops"], 
                       marker='^', linestyle='-.', linewidth=3, markersize=9,
                       label="Baseline_SUB Ops/s", color=baseline_color, markeredgecolor='white', 
                       markeredgewidth=1, zorder=3)

# Place callout boxes ABOVE data points at strategic points
selected_indices = [0, 3, 6, 9]  # First, middle, and last points

for i in selected_indices:
    bit_size = df["Bit Size"][i]
    pml_ops = df["PML_SUB Ops"][i]
    
    # Create a callout box at this bit size
    # Position it ABOVE the data point with some padding
    box_y = pml_ops * 2.0  # Position ABOVE PML line
    
    # Format the speedup values
    speedup_gmp = df["Speedup (PML_SUB vs GMP) Ops"][i]
    speedup_baseline = df["Speedup (PML_SUB vs Baseline) Ops"][i]
    
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
    gmp_ops_fmt = f"{df['GMP_SUB Ops'][i]/1e6:.1f}M"
    pml_ops_fmt = f"{df['PML_SUB Ops'][i]/1e6:.1f}M"
    baseline_ops_fmt = f"{df['Baseline_SUB Ops'][i]/1e6:.1f}M"
    
    # GMP ops annotation
    ax1.text(bit_size * 1.05, df["GMP_SUB Ops"][i] * 1.1,  
             gmp_ops_fmt, 
             fontsize=9, ha='left', color=gmp_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=gmp_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML ops annotation
    ax1.text(bit_size * 1.05, df["PML_SUB Ops"][i] * 1.1,  
             pml_ops_fmt, 
             fontsize=9, ha='left', color=pml_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_color, 
                      boxstyle='round,pad=0.2'))
    
    # Baseline ops annotation
    ax1.text(bit_size * 1, df["Baseline_SUB Ops"][i] * 0.85,  
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
title = ax1.set_title("Throughput Comparison on Intel Xeon P 8481C for\nLarge-Number Addition (Log-scale)", 
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
    gmp_speedup = df["Speedup (PML_SUB vs GMP) Ops"][i]
    baseline_speedup = df["Speedup (PML_SUB vs Baseline) Ops"][i]
    
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
plt.savefig("cpu2_operations_sub.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)