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
    "GMP_SUB Time (ns)": [8.6, 9.8, 12.3, 18.1, 31.2, 60.4, 150.5, 335.0, 665.9, 902.5],
    "PML_SUB Time (ns)": [2.9, 4.5, 6.3, 8.9, 14.6, 28.0, 65.1, 124.2, 237.8, 470.3],
    "PML_SUB (Worst Case) Time (ns)": [3.7, 5.7, 8.1, 12.9, 25.3, 55.9, 109.8, 211.5, 413.8, 823.5],
    "Baseline_SUB Time (ns)": [7.8, 10.8, 19.3, 36.8, 73.4, 148.8, 306.6, 610.2, 1217.8, 2447.3],
    "Speedup (PML_SUB vs GMP) Time": [2.97, 2.18, 1.95, 2.03, 2.14, 2.16, 2.31, 2.70, 2.80, 1.92],
    "Speedup (PML_SUB vs Baseline) Time": [2.69, 2.40, 3.06, 4.13, 5.03, 5.31, 4.71, 4.91, 5.12, 5.20],
    "Speedup (PML_SUB Phase-4 vs GMP) Time": [2.32, 1.72, 1.52, 1.40, 1.23, 1.08, 1.37, 1.58, 1.61, 1.10],
    "GMP_SUB Ops": [116112338, 102407023, 80950129, 55303909, 32056603, 16521602, 6640534, 2983314, 1501619, 1107828],
    "PML_SUB Ops": [348436867, 212877730, 148602559, 110238572, 67677991, 35703504, 15280723, 8024103, 4197451, 2124207],
    "PML_SUB (Worst Case) Ops": [253456702, 167660087, 116833167, 76438742, 39408643, 17642779, 9087181, 4717617, 2415316, 1213213],
    "Baseline_SUB Ops": [128673330, 91618185, 51774170, 27067545, 13586173, 6708674, 3255660, 1636416, 819801, 407891],
    "Speedup (PML_SUB vs GMP) Ops": [3.00, 2.08, 1.84, 1.99, 2.11, 2.16, 2.30, 2.69, 2.80, 1.92],
    "Speedup (PML_SUB vs Baseline) Ops": [2.71, 2.32, 2.87, 4.07, 4.98, 5.32, 4.69, 4.90, 5.12, 5.21],
    "Speedup (PML_SUB Phase-4 vs GMP) Ops": [2.18, 1.64, 1.44, 1.38, 1.23, 1.07, 1.37, 1.58, 1.61, 1.10]
}
df = pd.DataFrame(data)

# Enhanced color palette - color-blind friendly but more vibrant
gmp_color = "#D55E00"     # Red-orange
pml_color = "#009E73"     # Teal green
pml_phase4_color = "#8CD17D"  # Purple
baseline_color = "#0072B2" # Dark blue
speedup_gmp_color = "#0072B2" # Blue (GMP vs PML speedup)
speedup_baseline_color = "#56B4E9" # Light blue (Baseline vs PML speedup)
bg_color = "#FFFFFF"      # White

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

# Add the new PML Phase-4 line
pml_phase4_line = ax1.plot(df["Bit Size"], df["PML_SUB (Worst Case) Time (ns)"], 
                          marker='d', linestyle=':', linewidth=3, markersize=9,
                          label="PML_SUB (Worst Case) Time (ns)", color=pml_phase4_color, markeredgecolor='white', 
                          markeredgewidth=1, zorder=3)

baseline_line = ax1.plot(df["Bit Size"], df["Baseline_SUB Time (ns)"], 
                       marker='^', linestyle='-.', linewidth=3, markersize=9,
                       label="Baseline_SUB Time (ns)", color=baseline_color, markeredgecolor='white', 
                       markeredgewidth=1, zorder=3)

# Instead of arrows, use a speedup callout box at strategic points
# We'll create callout boxes at select bit sizes to highlight speedups
selected_indices = [0, 2, 5, 8]  # First, middle, and last points

for i in selected_indices:
    bit_size = df["Bit Size"][i]
    pml_time = df["PML_SUB Time (ns)"][i]
    pml_phase4_time = df["PML_SUB (Worst Case) Time (ns)"][i]
    
    # Create a callout box at this bit size for regular PML
    # Position it below the lowest data point with some padding
    box_y = pml_time * 0.4  # Position below PML line
    
    # Format the speedup values for regular PML
    speedup_gmp = df["Speedup (PML_SUB vs GMP) Time"][i]
    speedup_baseline = df["Speedup (PML_SUB vs Baseline) Time"][i]
    
    # Create the callout text for regular PML
    callout_text = f"Speedup (PML)\nPML vs GMP: {speedup_gmp:.2f}x\nPML vs Baseline: {speedup_baseline:.2f}x"
    
    # Add a fancy box with the speedup information
    props = dict(boxstyle='round,pad=0.5', facecolor='#F8F8F8', alpha=0.95, 
                edgecolor=pml_color, linewidth=1.5)
    
    # Connect the box to the PML data point with a line
    ax1.annotate('', xy=(bit_size, pml_time), xytext=(bit_size, box_y),
                arrowprops=dict(arrowstyle='-', color='gray', linewidth=1, 
                               linestyle='--', alpha=0.7))
    
    # Add text box for regular PML
    ax1.text(bit_size, box_y, callout_text, 
            ha='center', va='center', fontsize=9, 
            bbox=props, zorder=5)


# Time annotations with increased separation - only at specific points
for i in range(0, len(df["Bit Size"]), 1):  # Annotate every other point
    bit_size = df["Bit Size"][i]
    
    # GMP time annotation
    ax1.text(bit_size * 1.05, df["GMP_SUB Time (ns)"][i] * 1.1,  
             f"{df['GMP_SUB Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='left', color=gmp_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=gmp_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML time annotation
    ax1.text(bit_size * 0.95, df["PML_SUB Time (ns)"][i] * 0.75,  
             f"{df['PML_SUB Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='left', color=pml_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_color, 
                      boxstyle='round,pad=0.2'))
    
    # PML Phase-4 time annotation (offset to avoid overlap)
    ax1.text(bit_size * 0.85, df["PML_SUB (Worst Case) Time (ns)"][i] * 1.05,  
             f"{df['PML_SUB (Worst Case) Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='center', color=pml_phase4_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=pml_phase4_color, 
                      boxstyle='round,pad=0.2'))
    
    # Baseline time annotation
    ax1.text(bit_size * 0.95, df["Baseline_SUB Time (ns)"][i] * 1.1,  
             f"{df['Baseline_SUB Time (ns)'][i]:.1f} ns", 
             fontsize=9, ha='right', color=baseline_color, fontweight="bold", 
             bbox=dict(facecolor='white', alpha=0.85, edgecolor=baseline_color, 
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
title = ax1.set_title("Timing Comparison on Xeon E-2314 for\nLarge-Number Subtraction (Log-scale)", 
                     fontsize=16, fontweight="bold", pad=20)
plt.setp(title, bbox=dict(facecolor=bg_color, edgecolor=None, alpha=0.8, 
                         pad=5, boxstyle='round,pad=0.5'))

# Enhanced legend for execution times
legend = ax1.legend(loc='upper left', fontsize=12, frameon=True, 
                   edgecolor='gray', fancybox=True, framealpha=0.9)



plt.tight_layout(pad=1)
plt.savefig("cpu1_execution_time_sub.svg", dpi=300, bbox_inches='tight', facecolor=bg_color)