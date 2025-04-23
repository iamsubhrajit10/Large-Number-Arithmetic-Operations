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
    "GMP_ADD Time (ns)": [8.6, 9.8, 12.2, 18.4, 31.7, 60.9, 151, 335, 665.1, 917],
    "PML_ADD Time (ns)": [2.8, 4.3, 5.8, 9.6, 18.4, 35.8, 76.2, 158.8, 313.7, 629.2],
    "PML_ADD (approx) Time (ns)": [2.5, 4.2, 5.7, 8.5, 14.3, 28.1, 56.5, 118.1, 232, 471.6],
    "Speedup (PML_ADD (approx) vs GMP) Time": [3.44, 2.33, 2.14, 2.16, 2.22, 2.17, 2.67, 2.84, 2.87, 1.94],
    "Speedup (PML_ADD (approx) vs PML_ADD) Time": [1.12, 1.02, 1.02, 1.13, 1.29, 1.27, 1.35, 1.34, 1.35, 1.33],
    "GMP_ADD Ops": [115621209, 100961962, 81627840, 54157396, 31536684, 16481172, 6630445, 2985090, 1504493, 1090682],
    "PML_ADD Ops": [326750410, 228606237, 164320986, 102267366, 53881075, 27869415, 13111981, 6293498, 3186806, 1588567],
    "PML_ADD (approx) Ops": [399114525, 223419960, 171415542, 115192934, 68120579, 35027102, 17695372, 8468916, 4298776, 2125860],
    "Speedup (PML_ADD (approx) vs GMP) Ops": [3.45, 2.21, 2.10, 2.13, 2.16, 2.13, 2.67, 2.84, 2.86, 1.95],
    "Speedup (PML_ADD (approx) vs PML_ADD) Ops": [1.22, 0.98, 1.04, 1.13, 1.26, 1.26, 1.35, 1.35, 1.35, 1.34]
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
selected_indices = [0, 3, 6, 9]  # First, middle, and last points

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

# Create an expanded table-format string with the speedup data for all bit sizes
table_text = "Speedup Factors by Bit Size:\n"
table_text += "┌────────┬────────────────┬────────────────┐\n"
table_text += "│Bit Size│ Approx vs GMP  │ Approx vs PML  │\n"
table_text += "├────────┼────────────────┼────────────────┤\n"

# Add each row of data
for i, bit_size in enumerate(df["Bit Size"]):
    approx_vs_gmp = df["Speedup (PML_ADD (approx) vs GMP) Time"][i]
    approx_vs_pml = df["Speedup (PML_ADD (approx) vs PML_ADD) Time"][i]
    
    # Format each row with proper alignment
    bit_size_str = f"{bit_size:6d}"
    approx_vs_gmp_str = f"{approx_vs_gmp:.2f}×"
    approx_vs_pml_str = f"{approx_vs_pml:.2f}×"
    
    table_text += f"│ {bit_size_str} │ {approx_vs_gmp_str:14} │ {approx_vs_pml_str:14} │\n"

# Close the table
table_text += "└────────┴────────────────┴────────────────┘"

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
plt.savefig("cpu1_execution_time_add_approx.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)
plt.savefig("cpu1_execution_time_add_approx.png", dpi=300, bbox_inches='tight', facecolor=bg_color)

# --- Plot: Operations per second (Log-Log Scale) ---
fig2 = plt.figure(figsize=(16, 12), dpi=300)
fig2.patch.set_facecolor(bg_color)
ax2 = fig2.add_subplot(111)
ax2.set_facecolor(bg_color)

# Add subtle grid with lower alpha for cleaner look
ax2.grid(True, linestyle='--', alpha=0.3, color='#CCCCCC')

# Plot lines with enhanced styling for Operations
gmp_ops_line = ax2.plot(df["Bit Size"], df["GMP_ADD Ops"], 
                       marker='o', linestyle='-', linewidth=3, markersize=9,
                       label="GMP_ADD (ops)", color=gmp_color, markeredgecolor='white', 
                       markeredgewidth=1, zorder=3)

pml_ops_line = ax2.plot(df["Bit Size"], df["PML_ADD Ops"], 
                       marker='s', linestyle='--', linewidth=3, markersize=9,
                       label="PML_ADD (ops)", color=pml_color, markeredgecolor='white', 
                       markeredgewidth=1, zorder=3)

# Add the new PML_ADD(approx) ops line
pml_approx_ops_line = ax2.plot(df["Bit Size"], df["PML_ADD (approx) Ops"], 
                              marker='d', linestyle=':', linewidth=3, markersize=9,
                              label="PML_ADD (approx) (ops)", color=pml_approx_color, markeredgecolor='white', 
                              markeredgewidth=1, zorder=3)

# Create callout boxes at select bit sizes to highlight ops speedups
selected_indices = [0, 3, 6, 9]  # First, middle, and last points

for i in selected_indices:
    bit_size = df["Bit Size"][i]
    pml_ops = df["PML_ADD Ops"][i]
    pml_approx_ops = df["PML_ADD (approx) Ops"][i]
    
    # Position the callout box
    box_y = pml_approx_ops * 0.4  # Position below PML_ADD(approx) line
    
    # Format the speedup values
    speedup_gmp_ops = df["Speedup (PML_ADD (approx) vs GMP) Ops"][i]
    speedup_pml_ops = df["Speedup (PML_ADD (approx) vs PML_ADD) Ops"][i]
    
    # Create the callout text
    callout_text = f"Ops Speedup (PML Approx)\nPML Approx vs GMP: {speedup_gmp_ops:.2f}x\nPML Approx vs PML: {speedup_pml_ops:.2f}x"
    
    # Add a fancy box with the speedup information
    props = dict(boxstyle='round,pad=0.5', facecolor='#F8F8F8', alpha=0.95, 
                edgecolor=pml_approx_color, linewidth=1.5)
    
    # Connect the box to the PML_ADD(approx) data point with a line
    ax2.annotate('', xy=(bit_size, pml_approx_ops), xytext=(bit_size, box_y),
                arrowprops=dict(arrowstyle='-', color='gray', linewidth=1, 
                               linestyle='--', alpha=0.7))
    
    # Add text box
    ax2.text(bit_size, box_y, callout_text, 
            ha='center', va='center', fontsize=9, 
            bbox=props, zorder=5)

# Scale and label settings
ax2.set_xscale("log", base=2)
ax2.set_yscale("log", base=10)
ax2.set_xticks(df["Bit Size"])
ax2.set_xticklabels(df["Bit Size"], rotation=45, fontsize=11, fontweight="bold")

# Axis labels
ax2.set_xlabel("Bit Size (log₂ scale)", fontsize=14, fontweight="bold", labelpad=12)
ax2.set_ylabel("Operations per Second (log₁₀ scale)", fontsize=14, fontweight="bold", labelpad=12)

# Title
ops_title = ax2.set_title("Operations Per Second Comparison on Xeon E-2314 for\nLarge-Number Addition with Approximation (Log-scale)", 
                         fontsize=16, fontweight="bold", pad=20)
plt.setp(ops_title, bbox=dict(facecolor=bg_color, edgecolor=None, alpha=0.8, 
                             pad=5, boxstyle='round,pad=0.5'))

# Enhanced legend for execution times
ops_legend = ax2.legend(loc='upper right', fontsize=12, frameon=True, 
                       edgecolor='gray', fancybox=True, framealpha=0.9)

# Add a subtle border to the figure
for spine in ax2.spines.values():
    spine.set_edgecolor('lightgray')
    spine.set_linewidth(1.5)

plt.tight_layout(pad=1)
plt.savefig("cpu1_operations_add_approx.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)
plt.savefig("cpu1_operations_add_approx.png", dpi=300, bbox_inches='tight', facecolor=bg_color)

print("Generated visualizations for CPU1 data with PML_ADD(approx) comparison.")