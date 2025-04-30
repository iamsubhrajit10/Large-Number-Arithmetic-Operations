import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib import rcParams
from matplotlib.ticker import ScalarFormatter

# Apply professional styling
plt.style.use('seaborn-v0_8-whitegrid')
rcParams['font.family'] = 'sans-serif'
rcParams['font.sans-serif'] = ['Arial', 'DejaVu Sans', 'Liberation Sans', 'Bitstream Vera Sans', 'sans-serif']

# Updated data with PML_ADD(approx) data
data = {
    "Bit Size": [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072],
    "GMP_ADD Time (ns)": [8.3, 9.7, 12.1, 17.9, 31.0, 60.6, 150.9, 335.1, 664.9, 904.8],
    "PML_ADD Time (ns)": [3.3, 3.9, 5.7, 9.1, 17.2, 32.6, 78.1, 153.6, 296.6, 589.6],
    "PML_ADD (approx) Time (ns)": [3.2, 3.4, 4.7, 7.5, 13.5, 25.5, 62.0, 119.9, 230.2, 457.3],
    "Speedup (PML_ADD (approx) vs GMP) Time": [2.59, 2.85, 2.57, 2.39, 2.30, 2.38, 2.43, 2.79, 2.89, 1.98],
    "Speedup (PML_ADD (approx) vs PML_ADD) Time": [1.03, 1.15, 1.21, 1.21, 1.27, 1.28, 1.26, 1.28, 1.29, 1.29],
    "GMP_ADD Ops": [120037374, 102675970, 82231297, 55730331, 32212907, 16483525, 6622571, 2981604, 1501359, 1104400],
    "PML_ADD Ops": [253970455, 232799164, 174548545, 108662757, 58054446, 30598996, 12786763, 6496197, 3362922, 1692575],
    "PML_ADD (approx) Ops": [253992481, 285871010, 213249745, 132728959, 74562953, 39447559, 16230374, 8306045, 4334310, 2185980],
    "Speedup (PML_ADD (approx) vs GMP) Ops": [2.12, 2.78, 2.59, 2.38, 2.31, 2.39, 2.45, 2.79, 2.89, 1.98],
    "Speedup (PML_ADD (approx) vs PML_ADD) Ops": [1.00, 1.23, 1.22, 1.22, 1.28, 1.29, 1.27, 1.28, 1.29, 1.29]
}

df = pd.DataFrame(data)

# Enhanced color palette - color-blind friendly but more vibrant
gmp_color = "#D55E00"      # Red-orange
pml_color = "#009E73"      # Teal green
# use purple for pml_approx
pml_approx_color = "#CC79A7"  # Purple
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

# Add the new PML_ADD(approx) line
pml_approx_line = ax1.plot(df["Bit Size"], df["PML_ADD (approx) Time (ns)"], 
                          marker='d', linestyle=':', linewidth=3, markersize=9,
                          label="PML_ADD (approx) Time (ns)", color=pml_approx_color, markeredgecolor='white', 
                          markeredgewidth=1, zorder=3)

# Create callout boxes at select bit sizes to highlight speedups
selected_indices = [0,2,5,8]  # First, middle, and last points

for i in selected_indices:
    bit_size = df["Bit Size"][i]
    pml_time = df["PML_ADD Time (ns)"][i]
    pml_approx_time = df["PML_ADD (approx) Time (ns)"][i]
    
    # Create a callout box at this bit size for PML_ADD(approx)
    # Position it below the lowest data point with some padding
    box_y = pml_approx_time * 0.4  # Position below PML_ADD(approx) line
    
    # Format the speedup values for PML_ADD(approx)
    speedup_gmp = df["Speedup (PML_ADD (approx) vs GMP) Time"][i]
    speedup_pml = df["Speedup (PML_ADD (approx) vs PML_ADD) Time"][i]
    
    # Create the callout text for PML_ADD(approx)
    callout_text = f"Speedup (PML Approx)\nPML Approx vs GMP: {speedup_gmp:.2f}x\nPML Approx vs PML: {speedup_pml:.2f}x"
    
    # Add a fancy box with the speedup information
    props = dict(boxstyle='round,pad=0.5', facecolor='#F8F8F8', alpha=0.95, 
                edgecolor=pml_approx_color, linewidth=1.5)
    
    # Connect the box to the PML_ADD(approx) data point with a line
    ax1.annotate('', xy=(bit_size, pml_approx_time), xytext=(bit_size, box_y),
                arrowprops=dict(arrowstyle='-', color='gray', linewidth=1, 
                               linestyle='--', alpha=0.7))
    
    # Add text box for PML_ADD(approx)
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
    ax1.text(bit_size * 1.1, df["PML_ADD Time (ns)"][i] * 1.1,  
             f"{df['PML_ADD Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='right', color=pml_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML_ADD(approx) time annotation (offset to avoid overlap)
    ax1.text(bit_size * 0.85, df["PML_ADD (approx) Time (ns)"][i] * 0.85,  
             f"{df['PML_ADD (approx) Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='left', color=pml_approx_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_approx_color, 
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
title = ax1.set_title("Timing Comparison on Xeon E-2314 for\nLarge-Number Addition with Approximation (Log-scale)", 
                     fontsize=16, fontweight="bold", pad=20)
plt.setp(title, bbox=dict(facecolor=bg_color, edgecolor=None, alpha=0.8, 
                         pad=5, boxstyle='round,pad=0.5'))

# Enhanced legend for execution times
legend = ax1.legend(loc='upper left', fontsize=12, frameon=True, 
                   edgecolor='gray', fancybox=True, framealpha=0.9)



plt.tight_layout(pad=1)
plt.savefig("cpu1_execution_time_add_approx.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)
plt.savefig("cpu1_execution_time_add_approx.png", dpi=300, bbox_inches='tight', facecolor=bg_color)