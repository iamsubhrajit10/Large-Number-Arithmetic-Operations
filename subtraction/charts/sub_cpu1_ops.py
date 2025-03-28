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
    "GMP_SUB Time (ns)": [8.6, 9.8, 12.6, 18.3, 31.1, 61, 151, 334.6, 664.8, 913.1],
    "PML_SUB Time (ns)": [3.9, 4.3, 5.1, 7.5, 12.3, 24.2, 47.5, 94.3, 190.3, 379.1],
    "Speedup (PML_SUB) Time": [2.21, 2.28, 2.47, 2.44, 2.53, 2.52, 3.18, 3.55, 3.49, 2.41],
    "GMP_SUB Ops": [115978795, 102187113, 79311500, 54480050, 32076268, 16394385, 6622956, 2986496, 1505049, 1095606],
    "PML_SUB Ops": [343903979, 230498515, 192961304, 137973118, 81268450, 41188732, 21009782, 10317795, 5143623, 2582408],
    "Speedup (PML_SUB) Ops": [2.97, 2.26, 2.43, 2.53, 2.53, 2.51, 3.17, 3.45, 3.42, 2.36]
}

df = pd.DataFrame(data)

# Enhanced color palette - color-blind friendly but more vibrant
gmp_color = "#D55E00"     # Red-orange
pml_color = "#009E73"     # Teal green
speedup_color = "#0072B2" # Blue
bg_color = "#FFFFFF"      # White

# --- Plot for Operations Per Second (Log-Log Scale) with enhanced visuals ---
fig2 = plt.figure(figsize=(12, 10), dpi=300)
fig2.patch.set_facecolor(bg_color)
ax2 = fig2.add_subplot(111)
ax2.set_facecolor(bg_color)

# Add subtle grid with lower alpha for cleaner look
ax2.grid(True, linestyle='--', alpha=0.3, color='#CCCCCC')

# Add decade lines for the y-axis to make log scale more obvious
y_values = [1e6, 1e7, 1e8, 1e9]
for y in y_values:
    ax2.axhline(y=y, linestyle='-', alpha=0.25, color='gray', zorder=1)

# Enhanced line styling with more pronounced markers
gmp_line = ax2.plot(df["Bit Size"], df["GMP_SUB Ops"], 
                   marker='o', linestyle='-', linewidth=3, markersize=9,
                   label="GMP_SUB Ops/s", color=gmp_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

pml_line = ax2.plot(df["Bit Size"], df["PML_SUB Ops"], 
                   marker='s', linestyle='--', linewidth=3, markersize=9,
                   label="PML_SUB Ops/s", color=pml_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

# Add arrows and speedup annotations between the data points
for i, bit_size in enumerate(df["Bit Size"]):
    gmp_ops = df["GMP_SUB Ops"][i]
    pml_ops = df["PML_SUB Ops"][i]
    speedup = df["Speedup (PML_SUB) Ops"][i]
    
    # Calculate midpoint for annotation (in log space)
    mid_y = np.sqrt(gmp_ops * pml_ops)  # Geometric mean for log scale
    
    # Draw arrow from GMP to PML
    ax2.annotate('', 
                xy=(bit_size, pml_ops),      # end point
                xytext=(bit_size, gmp_ops),  # start point
                arrowprops=dict(arrowstyle='<->', linestyle=':', 
                              color=speedup_color, linewidth=1.5,
                              shrinkA=5, shrinkB=5),
                zorder=2)
    
    # Add speedup text
    ax2.text(bit_size*0.85, mid_y, f"{speedup:.2f}×", 
            color=speedup_color, fontweight='bold', fontsize=9,
            bbox=dict(facecolor='white', alpha=0.9, edgecolor=speedup_color,
                     boxstyle='round,pad=0.2'),
            ha='left', va='center')

# Operation count annotations - formatted for readability
for i, bit_size in enumerate(df["Bit Size"]):
    # Format operations count in millions (M) or thousands (K)
    if df["GMP_SUB Ops"][i] >= 1e6:
        gmp_text = f"{df['GMP_SUB Ops'][i]/1e6:.1f}M"
    else:
        gmp_text = f"{df['GMP_SUB Ops'][i]/1e3:.1f}K"
        
    if df["PML_SUB Ops"][i] >= 1e6:
        pml_text = f"{df['PML_SUB Ops'][i]/1e6:.1f}M"
    else:
        pml_text = f"{df['PML_SUB Ops'][i]/1e3:.1f}K"
    
    ax2.text(bit_size, df["GMP_SUB Ops"][i] * 0.85, 
             gmp_text, 
             fontsize=10, ha='right', color=gmp_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor='lightgray', 
                      boxstyle='round,pad=0.3'))
    
    ax2.text(bit_size, df["PML_SUB Ops"][i] * 1.15, 
             pml_text, 
             fontsize=10, ha='left', color=pml_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor='lightgray', 
                      boxstyle='round,pad=0.3'))

# Scale and label settings
ax2.set_xscale("log", base=2)
ax2.set_yscale("log", base=10)
ax2.set_xticks(df["Bit Size"])
ax2.set_xticklabels(df["Bit Size"], rotation=45, fontsize=12, fontweight="bold")

# Set y-axis tick formatting
formatter = ScalarFormatter()
formatter.set_scientific(False)
ax2.yaxis.set_major_formatter(formatter)

# More prominent axis labels with log scale indicator
ax2.set_xlabel("Bit Size", fontsize=14, fontweight="bold", labelpad=12)
ax2.set_ylabel("Operations per Second (log₁₀ scale)", fontsize=14, fontweight="bold", labelpad=12)


# Add a subtle spline to the title
title = ax2.set_title("Operations Throughput on Intel Xeon E-2314 for\nLarge-Number Subtraction (Log-scale)", 
                     fontsize=16, fontweight="bold", pad=20)
plt.setp(title, bbox=dict(facecolor=bg_color, edgecolor=None, alpha=0.8, 
                         pad=5, boxstyle='round,pad=0.5'))

# Enhanced legend with shadow
legend = ax2.legend(loc='upper right', fontsize=12, frameon=True, 
                   edgecolor='gray', fancybox=True, framealpha=0.9)

# Add a legend item for speedup
from matplotlib.lines import Line2D
custom_lines = [Line2D([0], [0], color=speedup_color, linestyle=':', marker='', markersize=0)]
custom_labels = ["PML vs GMP Speedup"]
second_legend = ax2.legend(custom_lines, custom_labels, loc='lower left', 
                         fontsize=10, frameon=True, edgecolor='gray', 
                         fancybox=True, framealpha=0.9)
ax2.add_artist(legend)  # Add back the first legend

# Add a subtle border to the figure
for spine in ax2.spines.values():
    spine.set_edgecolor('lightgray')
    spine.set_linewidth(1.5)

plt.tight_layout(pad=1)
plt.savefig("cpu1_operations_sub.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)