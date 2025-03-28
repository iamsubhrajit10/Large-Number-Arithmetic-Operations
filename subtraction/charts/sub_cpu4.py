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
    "GMP_SUB Time (ns)": [5.8, 6.4, 8.5, 13, 22.6, 42.3, 82.1, 160, 316, 730.5],
    "PML_SUB Time (ns)": [1.7, 3, 4.5, 8.4, 15.7, 30.3, 60.1, 118, 239.5, 520.6],
    "Speedup (PML_SUB) Time": [3.41, 2.13, 1.89, 1.55, 1.44, 1.40, 1.37, 1.36, 1.32, 1.40],
    "GMP_SUB Ops": [171201257, 155512356, 116772827, 76972526, 44224639, 23627636, 12166759, 6256362, 3111359, 1354327],
    "PML_SUB Ops": [2376872633, 331940940, 218415925, 118048494, 63735107, 32825665, 16639054, 8457107, 4182628, 1920933],
    "Speedup (PML_SUB) Ops": [13.88, 2.13, 1.87, 1.53, 1.44, 1.39, 1.37, 1.35, 1.34, 1.42]
}

df = pd.DataFrame(data)

# Enhanced color palette - color-blind friendly but more vibrant
gmp_color = "#D55E00"     # Red-orange
pml_color = "#009E73"     # Teal green
speedup_color = "#0072B2" # Blue
bg_color = "#FFFFFF"      # White

# --- Plot 1: Execution Time (Log-Log Scale) with enhanced visuals ---
fig1 = plt.figure(figsize=(12, 10), dpi=300)
fig1.patch.set_facecolor(bg_color)
ax1 = fig1.add_subplot(111)
ax1.set_facecolor(bg_color)

# Add subtle grid with lower alpha for cleaner look
ax1.grid(True, linestyle='--', alpha=0.3, color='#CCCCCC')

# Add decade lines for the y-axis to make log scale more obvious
y_decade_lines = [1, 10, 100, 1000]
for y in y_decade_lines:
    ax1.axhline(y=y, linestyle='-', alpha=0.25, color='gray', zorder=1)

# Enhanced line styling with more pronounced markers
gmp_line = ax1.plot(df["Bit Size"], df["GMP_SUB Time (ns)"], 
                   marker='o', linestyle='-', linewidth=3, markersize=9,
                   label="GMP_SUB Time (ns)", color=gmp_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

pml_line = ax1.plot(df["Bit Size"], df["PML_SUB Time (ns)"], 
                   marker='s', linestyle='--', linewidth=3, markersize=9,
                   label="PML_SUB Time (ns)", color=pml_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

# Add arrows and speedup annotations between the data points
for i, bit_size in enumerate(df["Bit Size"]):
    gmp_time = df["GMP_SUB Time (ns)"][i]
    pml_time = df["PML_SUB Time (ns)"][i]
    speedup = df["Speedup (PML_SUB) Time"][i]
    
    # Calculate midpoint for annotation (in log space)
    mid_y = np.sqrt(gmp_time * pml_time)  # Geometric mean for log scale
    
    # Draw arrow from GMP to PML
    ax1.annotate('', 
                xy=(bit_size, pml_time),      # end point
                xytext=(bit_size, gmp_time),  # start point
                arrowprops=dict(arrowstyle='<->', linestyle=':', 
                              color=speedup_color, linewidth=1.5,
                              shrinkA=5, shrinkB=5),
                zorder=2)
    
    # Add speedup text
    ax1.text(bit_size*0.85, mid_y, f"{speedup:.2f}×", 
            color=speedup_color, fontweight='bold', fontsize=9,
            bbox=dict(facecolor='white', alpha=0.9, edgecolor=speedup_color,
                     boxstyle='round,pad=0.2'),
            ha='left', va='center')

# Time annotations
for i, bit_size in enumerate(df["Bit Size"]):
    ax1.text(bit_size, df["GMP_SUB Time (ns)"][i] * 1.18, 
             f"{df['GMP_SUB Time (ns)'][i]:.1f} ns", 
             fontsize=10, ha='right', color=gmp_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor='lightgray', 
                      boxstyle='round,pad=0.3'))
    
    ax1.text(bit_size, df["PML_SUB Time (ns)"][i] * 0.82, 
             f"{df['PML_SUB Time (ns)'][i]:.1f} ns", 
             fontsize=10, ha='left', color=pml_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor='lightgray', 
                      boxstyle='round,pad=0.3'))

# Scale and label settings
ax1.set_xscale("log", base=2)
ax1.set_yscale("log", base=10)
ax1.set_xticks(df["Bit Size"])
ax1.set_xticklabels(df["Bit Size"], rotation=45, fontsize=12, fontweight="bold")

# Set y-axis ticks at decade marks
ax1.set_yticks([1, 10, 100, 1000])
formatter = ScalarFormatter()
formatter.set_scientific(False)
ax1.yaxis.set_major_formatter(formatter)

# More prominent axis labels with log scale indicator
ax1.set_xlabel("Bit Size", fontsize=14, fontweight="bold", labelpad=12)
ax1.set_ylabel("Avg. Execution Time (ns, log₁₀ scale)", fontsize=14, fontweight="bold", labelpad=12)

# Add a subtle spline to the title
title = ax1.set_title("Timing Comparison on AMD EPYC 9B14 for\nLarge-Number Subtraction (Log-scale)", 
                     fontsize=16, fontweight="bold", pad=20)
plt.setp(title, bbox=dict(facecolor=bg_color, edgecolor=None, alpha=0.8, 
                         pad=5, boxstyle='round,pad=0.5'))

# Enhanced legend with shadow
legend = ax1.legend(loc='upper left', fontsize=12, frameon=True, 
                   edgecolor='gray', fancybox=True, framealpha=0.9)

# Add a legend item for speedup
from matplotlib.lines import Line2D
custom_lines = [Line2D([0], [0], color=speedup_color, linestyle=':', marker='', markersize=0)]
custom_labels = ["PML vs GMP Speedup"]
second_legend = ax1.legend(custom_lines, custom_labels, loc='lower right', 
                         fontsize=10, frameon=True, edgecolor='gray', 
                         fancybox=True, framealpha=0.9)
ax1.add_artist(legend)  # Add back the first legend


# Add a subtle border to the figure
for spine in ax1.spines.values():
    spine.set_edgecolor('lightgray')
    spine.set_linewidth(1.5)

plt.tight_layout(pad=1)
plt.savefig("cpu4_execution_time_sub.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)