import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib import rcParams
from matplotlib.ticker import ScalarFormatter

# Apply professional styling
plt.style.use('seaborn-v0_8-whitegrid')
rcParams['font.family'] = 'sans-serif'
rcParams['font.sans-serif'] = ['Arial', 'DejaVu Sans', 'Liberation Sans', 'Bitstream Vera Sans', 'sans-serif']


data = {
    "Bit Size": [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072],
    "GMP_SUB Time (ns)": [8.6, 9.8, 12.6, 18.3, 31.1, 61.0, 151.0, 334.6, 664.8, 913.1],
    "PML_SUB Time (ns)": [2.8, 3.6, 7.0, 8.6, 15.4, 30.7, 70.1, 133.7, 257.5, 507.5],
    "PML_SUB (Worst Case) Time (ns)": [3.9, 5.3, 8.3, 11.4, 20.2, 44.6, 96.0, 188.2, 364.5, 736.1],
    "Baseline_SUB Time (ns)": [5.0, 9.8, 17.0, 32.5, 63.5, 125.6, 256.9, 506.6, 1007.6, 2016.5],
    "Speedup (PML_SUB vs GMP) Time": [3.07, 2.72, 1.80, 2.13, 2.02, 1.99, 2.15, 2.50, 2.58, 1.80],
    "Speedup (PML_SUB vs Baseline) Time": [1.79, 2.28, 2.93, 3.39, 3.45, 3.51, 3.37, 3.19, 3.21, 3.20],
    "Speedup (PML_SUB Phase-4 vs GMP) Time": [2.21, 1.85, 1.52, 1.61, 1.54, 1.37, 1.57, 1.78, 1.82, 1.24],
    "GMP_SUB Ops": [115978795, 102187113, 79311500, 54480050, 32076268, 16394385, 6622956, 2986496, 1505049, 1095606],
    "PML_SUB Ops": [349305404, 276797587, 149858622, 118186196, 64577524, 32534281, 14504626, 7500546, 3891773, 1974289],
    "PML_SUB (Worst Case) Ops": [254032141, 199540690, 123645713, 89998541, 49322015, 22651013, 10479692, 5343289, 2751417, 1355281],
    "Baseline_SUB Ops": [199172848, 103142572, 58465642, 30851921, 15765670, 7965960, 3879579, 1973103, 995678, 497444],
    "Speedup (PML_SUB vs GMP) Ops": [3.01, 2.71, 1.89, 2.17, 2.01, 1.98, 2.19, 2.51, 2.59, 1.80],
    "Speedup (PML_SUB vs Baseline) Ops": [1.64, 2.22, 2.81, 3.31, 3.42, 3.50, 3.38, 3.19, 3.20, 3.19],
    "Speedup (PML_SUB Phase-4 vs GMP) Ops": [2.19, 1.95, 1.56, 1.65, 1.54, 1.38, 1.58, 1.79, 1.83, 1.24]
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
gmp_line = ax1.plot(df["Bit Size"], df["GMP_SUB Ops"], 
                   marker='o', linestyle='-', linewidth=3, markersize=9,
                   label="GMP_SUB Ops/s", color=gmp_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

pml_line = ax1.plot(df["Bit Size"], df["PML_SUB Ops"], 
                   marker='s', linestyle='--', linewidth=3, markersize=9,
                   label="PML_SUB Ops/s", color=pml_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

# Add the new PML Phase-4 line
pml_phase4_line = ax1.plot(df["Bit Size"], df["PML_SUB (Worst Case) Ops"], 
                          marker='d', linestyle=':', linewidth=3, markersize=9,
                          label="PML_SUB (Worst Case) Ops/s", color=pml_phase4_color, markeredgecolor='white', 
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
    pml_phase4_ops = df["PML_SUB (Worst Case) Ops"][i]
    
    # Create a callout box at this bit size for regular PML
    # Position it ABOVE the data point with some padding
    box_y = pml_ops * 2.0  # Position ABOVE PML line
    
    # Format the speedup values for regular PML
    speedup_gmp = df["Speedup (PML_SUB vs GMP) Ops"][i]
    speedup_baseline = df["Speedup (PML_SUB vs Baseline) Ops"][i]
    
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
    gmp_ops_fmt = f"{df['GMP_SUB Ops'][i]/1e6:.1f}M"
    pml_ops_fmt = f"{df['PML_SUB Ops'][i]/1e6:.1f}M"
    pml_phase4_ops_fmt = f"{df['PML_SUB (Worst Case) Ops'][i]/1e6:.1f}M"
    baseline_ops_fmt = f"{df['Baseline_SUB Ops'][i]/1e6:.1f}M"
    
    # GMP ops annotation
    ax1.text(bit_size * 1.05, df["GMP_SUB Ops"][i] * 0.85,  
             gmp_ops_fmt, 
             fontsize=9, ha='left', color=gmp_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=gmp_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML ops annotation
    ax1.text(bit_size * 1, df["PML_SUB Ops"][i] * 1.1,  
             pml_ops_fmt, 
             fontsize=9, ha='left', color=pml_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML Phase-4 ops annotation
    ax1.text(bit_size * 0.85, df["PML_SUB (Worst Case) Ops"][i] * 0.95,  
             pml_phase4_ops_fmt, 
             fontsize=9, ha='center', color=pml_phase4_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_phase4_color, 
                      boxstyle='round,pad=0.2'))
    
    # Baseline ops annotation
    ax1.text(bit_size * 0.95, df["Baseline_SUB Ops"][i] * 0.85,  
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
title = ax1.set_title("Throughput Comparison on Xeon E-2314 for\nLarge-Number Subtraction (Log-scale)", 
                     fontsize=16, fontweight="bold", pad=20)
plt.setp(title, bbox=dict(facecolor=bg_color, edgecolor=None, alpha=0.8, 
                         pad=5, boxstyle='round,pad=0.5'))

# Enhanced legend for operation throughput
legend = ax1.legend(loc='upper right', fontsize=12, frameon=True, 
                   edgecolor='gray', fancybox=True, framealpha=0.9)

# Create a table-format string with the speedup data for all bit sizes
table_text = "Speedup Factors by Bit Size:\n"
table_text += "┌────────┬───────────┬────────────┬─────────────┐\n"
table_text += "│Bit Size│ PML vs GMP│ PML vs Base│ Phase-4 vs GMP │\n"
table_text += "├────────┼───────────┼────────────┼─────────────┤\n"

# Add each row of data
for i, bit_size in enumerate(df["Bit Size"]):
    gmp_speedup = df["Speedup (PML_SUB vs GMP) Ops"][i]
    baseline_speedup = df["Speedup (PML_SUB vs Baseline) Ops"][i]
    phase4_speedup = df["Speedup (PML_SUB Phase-4 vs GMP) Ops"][i]
    
    # Format each row with proper alignment
    bit_size_str = f"{bit_size:6d}"
    gmp_speedup_str = f"{gmp_speedup:.2f}×"
    baseline_speedup_str = f"{baseline_speedup:.2f}×"
    phase4_speedup_str = f"{phase4_speedup:.2f}×"
    
    table_text += f"│ {bit_size_str} │ {gmp_speedup_str:9} │ {baseline_speedup_str:10} │ {phase4_speedup_str:11} │\n"

# Close the table
table_text += "└────────┴───────────┴────────────┴─────────────┘"

# Add explanation box with the data table - NOW AT LEFT BOTTOM
ax1.text(0.03, 0.05, table_text, 
         transform=ax1.transAxes, fontsize=9, fontfamily='monospace',
         bbox=dict(facecolor='white', alpha=0.9, edgecolor='gray', boxstyle='round,pad=0.5'),
         ha='left', va='bottom')

# Add a subtle border to the figure
for spine in ax1.spines.values():
    spine.set_edgecolor('lightgray')
    spine.set_linewidth(1.5)

plt.tight_layout(pad=1)
plt.savefig("cpu1_operations_sub.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)