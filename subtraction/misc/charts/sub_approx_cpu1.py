import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib import rcParams
from matplotlib.ticker import ScalarFormatter

# Apply professional styling
plt.style.use('seaborn-v0_8-whitegrid')
rcParams['font.family'] = 'sans-serif'
rcParams['font.sans-serif'] = ['Arial', 'DejaVu Sans', 'Liberation Sans', 'Bitstream Vera Sans', 'sans-serif']

# Updated data with PML_SUB(approx) data
data = {
    "Bit Size": [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072],
    "GMP_SUB Time (ns)": [8.6, 9.8, 12.3, 18.1, 31.2, 60.4, 150.5, 335.0, 665.9, 902.5],
    "PML_SUB Time (ns)": [2.9, 4.5, 6.3, 8.9, 14.6, 28.0, 65.1, 124.2, 237.8, 470.3],
    "PML_SUB (approx) Time (ns)": [2.9, 4.4, 5.5, 7.5, 11.8, 21.3, 50.3, 96.6, 182.0, 357.1],
    "Speedup (PML_SUB (approx) vs GMP) Time": [2.97, 2.23, 2.24, 2.41, 2.64, 2.84, 2.99, 3.47, 3.66, 2.53],
    "Speedup (PML_SUB (approx) vs PML_SUB) Time": [1.00, 1.02, 1.15, 1.19, 1.24, 1.31, 1.29, 1.29, 1.31, 1.32],
    "GMP_SUB Ops": [115978795, 102187113, 79311500, 54480050, 32076268, 16394385, 6622956, 2986496, 1505049, 1095606],
    "PML_SUB Ops": [349305404, 276797587, 149858622, 118186196, 64577524, 32534281, 14504626, 7500546, 3891773, 1974289],
    "PML_SUB (approx) Ops": [397850691, 279210706, 214907685, 135801970, 74050656, 39594625, 20550414, 10382399, 5117309, 2591133],
    "Speedup (PML_SUB (approx) vs GMP) Ops": [3.43, 2.73, 2.71, 2.49, 2.31, 2.42, 3.10, 3.48, 3.40, 2.37],
    "Speedup (PML_SUB (approx) vs PML_SUB) Ops": [1.14, 1.01, 1.43, 1.15, 1.15, 1.22, 1.42, 1.38, 1.31, 1.31]
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
gmp_line = ax1.plot(df["Bit Size"], df["GMP_SUB Time (ns)"], 
                   marker='o', linestyle='-', linewidth=3, markersize=9,
                   label="GMP_SUB Time (ns)", color=gmp_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

pml_line = ax1.plot(df["Bit Size"], df["PML_SUB Time (ns)"], 
                   marker='s', linestyle='--', linewidth=3, markersize=9,
                   label="PML_SUB Time (ns)", color=pml_color, markeredgecolor='white', 
                   markeredgewidth=1, zorder=3)

# Add the new PML_SUB(approx) line
pml_approx_line = ax1.plot(df["Bit Size"], df["PML_SUB (approx) Time (ns)"], 
                          marker='d', linestyle=':', linewidth=3, markersize=9,
                          label="PML_SUB (approx) Time (ns)", color=pml_approx_color, markeredgecolor='white', 
                          markeredgewidth=1, zorder=3)

# Create callout boxes at select bit sizes to highlight speedups
selected_indices = [0, 2, 5, 8]  # First, middle, and last points

for i in selected_indices:
    bit_size = df["Bit Size"][i]
    pml_time = df["PML_SUB Time (ns)"][i]
    pml_approx_time = df["PML_SUB (approx) Time (ns)"][i]
    
    # Create a callout box at this bit size for PML_SUB(approx)
    # Position it below the lowest data point with some padding
    box_y = pml_approx_time * 0.4  # Position below PML_SUB(approx) line
    
    # Format the speedup values for PML_SUB(approx)
    speedup_gmp = df["Speedup (PML_SUB (approx) vs GMP) Time"][i]
    speedup_pml = df["Speedup (PML_SUB (approx) vs PML_SUB) Time"][i]
    
    # Create the callout text for PML_SUB(approx)
    callout_text = f"Speedup (PML Approx)\nPML Approx vs GMP: {speedup_gmp:.2f}x\nPML Approx vs PML: {speedup_pml:.2f}x"
    
    # Add a fancy box with the speedup information
    props = dict(boxstyle='round,pad=0.5', facecolor='#F8F8F8', alpha=0.95, 
                edgecolor=pml_approx_color, linewidth=1.5)
    
    # Connect the box to the PML_SUB(approx) data point with a line
    ax1.annotate('', xy=(bit_size, pml_approx_time), xytext=(bit_size, box_y),
                arrowprops=dict(arrowstyle='-', color='gray', linewidth=1, 
                               linestyle='--', alpha=0.7))
    
    # Add text box for PML_SUB(approx)
    ax1.text(bit_size, box_y, callout_text, 
            ha='center', va='center', fontsize=9, 
            bbox=props, zorder=5)

# Time annotations with increased separation - only at specific points
for i in range(0, len(df["Bit Size"]), 1):  # Annotate every other point to reduce clutter
    bit_size = df["Bit Size"][i]
    
    # GMP time annotation
    ax1.text(bit_size * 1.05, df["GMP_SUB Time (ns)"][i] * 1.1,  
             f"{df['GMP_SUB Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='left', color=gmp_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=gmp_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML time annotation
    ax1.text(bit_size * 1.1, df["PML_SUB Time (ns)"][i] * 1.1,  
             f"{df['PML_SUB Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='right', color=pml_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML_SUB(approx) time annotation (offset to avoid overlap)
    ax1.text(bit_size * 0.85, df["PML_SUB (approx) Time (ns)"][i] * 0.85,  
             f"{df['PML_SUB (approx) Time (ns)'][i]:.1f} ns", 
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
title = ax1.set_title("Timing Comparison on Xeon E-2314 for\nLarge-Number Subtraction with Approximation (Log-scale)", 
                     fontsize=16, fontweight="bold", pad=20)
plt.setp(title, bbox=dict(facecolor=bg_color, edgecolor=None, alpha=0.8, 
                         pad=5, boxstyle='round,pad=0.5'))

# Enhanced legend for execution times
legend = ax1.legend(loc='upper left', fontsize=12, frameon=True, 
                   edgecolor='gray', fancybox=True, framealpha=0.9)




plt.tight_layout(pad=1)
plt.savefig("cpu1_execution_time_sub_approx.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)
plt.savefig("cpu1_execution_time_sub_approx.png", dpi=300, bbox_inches='tight', facecolor=bg_color)
