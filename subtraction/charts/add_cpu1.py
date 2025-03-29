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
    "GMP_ADD Time (ns)": [8.6, 9.8, 12.2, 18.4, 31.7, 60.9, 151, 335, 665.1, 917],
    "PML_ADD Time (ns)": [2.9, 5, 6.5, 9.3, 15.3, 29.7, 54.8, 113.2, 221, 433],
    "Speedup (PML_ADD) Time": [2.97, 1.96, 1.88, 1.98, 2.07, 2.05, 2.76, 2.96, 3.01, 2.12],
    "GMP_ADD Ops": [115621209, 100961962, 81627840, 54157396, 31536684, 16481172, 6630445, 2985090, 1504493, 1090682],
    "PML_ADD Ops": [343921608, 196048789, 152783887, 106432596, 65076578, 33463961, 18232863, 8897816, 4521150, 2306810],
    "Speedup (PML_ADD) Ops": [2.97, 1.94, 1.87, 1.97, 2.06, 2.03, 2.75, 2.98, 3.01, 2.12],
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
gmp_line = ax1.plot(df["Bit Size"], df["GMP_ADD Time (ns)"], 
                   marker='o', linestyle='-', linewidth=3, markersize=9,
                   label="GMP_ADD Time (ns)", color=gmp_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

pml_line = ax1.plot(df["Bit Size"], df["PML_ADD Time (ns)"], 
                   marker='s', linestyle='--', linewidth=3, markersize=9,
                   label="PML_ADD Time (ns)", color=pml_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

# Add arrows and speedup annotations between the data points
for i, bit_size in enumerate(df["Bit Size"]):
    gmp_time = df["GMP_ADD Time (ns)"][i]
    pml_time = df["PML_ADD Time (ns)"][i]
    speedup = df["Speedup (PML_ADD) Time"][i]
    
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
    ax1.text(bit_size, df["GMP_ADD Time (ns)"][i] * 1.18, 
             f"{df['GMP_ADD Time (ns)'][i]:.1f} ns", 
             fontsize=10, ha='right', color=gmp_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor='lightgray', 
                      boxstyle='round,pad=0.3'))
    
    ax1.text(bit_size, df["PML_ADD Time (ns)"][i] * 0.82, 
             f"{df['PML_ADD Time (ns)'][i]:.1f} ns", 
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
title = ax1.set_title("Timing Comparison on Xeon E-2314 for\nLarge-Number Addition (Log-scale)", 
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
plt.savefig("cpu1_execution_time_add.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)