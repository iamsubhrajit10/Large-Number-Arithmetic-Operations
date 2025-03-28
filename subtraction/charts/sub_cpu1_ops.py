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
    "GMP_SUB Time (ns)": [8.3, 9.8, 12.1, 18, 31.3, 60.8, 151.7, 334.9, 664.7, 913.9],
    "PML_SUB Time (ns)": [3.2, 3.9, 4.7, 6.8, 11.6, 20.5, 52.7, 97.5, 182.4, 352],
    "Speedup (PML_SUB) Time": [2.59, 2.51, 2.57, 2.65, 2.70, 2.97, 2.88, 3.43, 3.64, 2.60],
    "GMP_SUB Ops": [119949519, 102192237, 82181593, 55512883, 31930662, 16441343, 6589119, 2986773, 1504512, 1093815],
    "PML_SUB Ops": [301817286, 250997087, 209040772, 143917609, 85866428, 48350473, 18939456, 10249878, 5484733, 2842293],
    "Speedup (PML_SUB) Ops": [2.52, 2.46, 2.54, 2.59, 2.69, 2.94, 2.87, 3.43, 3.65, 2.60],
}

# New Data
data = {
    "Bit Size": [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072],
    "GMP_SUB Time (ns)": [6.1, 6.8, 8.7, 12.1, 21.5, 41.4, 86.7, 170.2, 347.9, 700.6],
    "PML_SUB Time (ns)": [2.7, 3.3, 4.1, 6, 10.5, 19.3, 35.2, 74.3, 146.6, 301.8],
    "Speedup (PML_SUB) Time": [2.26, 2.06, 2.12, 2.02, 2.05, 2.15, 2.46, 2.29, 2.37, 2.32],
    "GMP_SUB Ops": [173771046, 153189405, 116583444, 82107176, 46464158, 24129813, 11566172, 5865885, 2877475, 1427702],
    "PML_SUB Ops": [350122857, 296186437, 246615757, 165150595, 94609267, 52237120, 28848316, 13429935, 6821303, 3311891],
    "Speedup (PML_SUB) Ops": [2.01, 1.93, 2.12, 2.01, 2.04, 2.16, 2.49, 2.29, 2.37, 2.32],
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
title = ax2.set_title("Operations Throughput on Xeon E-2314 for\nLarge-Number Subtraction (Log-scale)", 
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