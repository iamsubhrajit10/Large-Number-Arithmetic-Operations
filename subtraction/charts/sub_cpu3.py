import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

data = {
    "Bit Size": [256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072],
    "GMP_SUB Time (ns)": [5.5, 6.9, 8.5, 10.3, 16.2, 32.7, 63.9, 129.1, 264.7, 534],
    "PML_SUB Time (ns)": [1.7, 2.3, 3.1, 4.6, 7.6, 13.7, 29.7, 52.4, 103.2, 213.1],
    "Speedup (PML_SUB) Time": [3.24, 3.00, 2.74, 2.24, 2.13, 2.39, 2.15, 2.46, 2.56, 2.51],
    "GMP_SUB Ops": [179705681, 140905429, 113209770, 99659420, 62705356, 31348384, 15598555, 7736673, 3762620, 1867885],
    "PML_SUB Ops": [2421183884, 433359367, 326630709, 214251303, 131109937, 72788864, 36832042, 18869834, 9662924, 4663445],
    "Speedup (PML_SUB) Ops": [13.47, 3.08, 2.89, 2.15, 2.09, 2.32, 2.36, 2.44, 2.57, 2.50],
}

df = pd.DataFrame(data)

# Define colors with a polished palette
gmp_color = "#D32F2F"  # Deep Red
pml_color = "#1976D2"  # Vibrant Blue
speedup_color = "#388E3C"  # Forest Green
bg_color = "#F5F5F5"  # Light Gray Background

# --- Plot 1: Execution Time (Log-Log Scale) ---
fig1 = plt.figure(figsize=(12, 6), dpi=150)
fig1.patch.set_facecolor(bg_color)
ax1 = fig1.add_subplot(111)
ax1.set_facecolor(bg_color)

ax1.plot(df["Bit Size"], df["GMP_SUB Time (ns)"], marker='o', linestyle='-', linewidth=2.5, markersize=8, label="GMP_SUB Time (ns)", color=gmp_color)
ax1.plot(df["Bit Size"], df["PML_SUB Time (ns)"], marker='s', linestyle='--', linewidth=2.5, markersize=8, label="PML_SUB Time (ns)", color=pml_color)

# Annotate points
for i, bit_size in enumerate(df["Bit Size"]):
    ax1.text(bit_size, df["GMP_SUB Time (ns)"][i] * 1.15, f"{df['GMP_SUB Time (ns)'][i]:.1f}", fontsize=9, ha='right', color=gmp_color, fontweight="bold", bbox=dict(facecolor='white', alpha=0.7, edgecolor='none'))
    ax1.text(bit_size, df["PML_SUB Time (ns)"][i] * 0.85, f"{df['PML_SUB Time (ns)'][i]:.1f}", fontsize=9, ha='left', color=pml_color, fontweight="bold", bbox=dict(facecolor='white', alpha=0.7, edgecolor='none'))

ax1.set_xscale("log", base=2)
ax1.set_yscale("log", base=10)  # Explicit log scale for y-axis
ax1.set_xticks(df["Bit Size"])
ax1.set_xticklabels(df["Bit Size"], rotation=45, fontsize=11, fontweight="bold")
ax1.set_xlabel("Bit Size", fontsize=14, fontweight="bold")
ax1.set_ylabel("Execution Time (ns)", fontsize=14, fontweight="bold")
ax1.set_title("Timing Comparison on CPU3 for\nLarge-Number Subtraction (Log-scale)", fontsize=16, fontweight="bold", pad=20)
ax1.legend(loc='upper left', fontsize=11, frameon=True, edgecolor='black')
ax1.grid(True, which="both", ls="--", alpha=0.2)

plt.tight_layout(pad=2.0)
plt.savefig("cpu3_execution_time.png", dpi=300, bbox_inches='tight', facecolor=bg_color)

# --- Plot 2: Speedup (Time) ---
fig2 = plt.figure(figsize=(12, 6), dpi=150)
fig2.patch.set_facecolor(bg_color)
ax2 = fig2.add_subplot(111)
ax2.set_facecolor(bg_color)

ax2.plot(df["Bit Size"], df["Speedup (PML_SUB) Time"], marker='d', linestyle='-', linewidth=2.5, markersize=8, label="Speedup (PML_SUB) Time", color=speedup_color)

# Annotate points
for i, bit_size in enumerate(df["Bit Size"]):
    ax2.text(bit_size, df["Speedup (PML_SUB) Time"][i] + 0.1, f"{df['Speedup (PML_SUB) Time'][i]:.2f}", fontsize=9, ha='center', color=speedup_color, fontweight="bold", bbox=dict(facecolor='white', alpha=0.7, edgecolor='none'))

ax2.set_xscale("log", base=2)
ax2.set_yscale("linear")  # Linear scale for y-axis
ax2.set_ylim(0.5, 4)
ax2.set_xticks(df["Bit Size"])
ax2.set_xticklabels(df["Bit Size"], rotation=45, fontsize=11, fontweight="bold")
ax2.set_xlabel("Bit Size", fontsize=14, fontweight="bold")
ax2.set_ylabel("Speedup", fontsize=14, fontweight="bold", color=speedup_color)
ax2.set_title("Speedup (PML_SUB Time) on CPU3 for\nLarge-Number Subtraction", fontsize=16, fontweight="bold", pad=20)
ax2.legend(loc='upper left', fontsize=11, frameon=True, edgecolor='black')
ax2.grid(True, which="both", ls="--", alpha=0.2)

plt.tight_layout(pad=2.0)
plt.savefig("cpu3_speedup_time.png", dpi=300, bbox_inches='tight', facecolor=bg_color)

# --- Plot 3: Number of Operations (Log-Log Scale) ---
fig3 = plt.figure(figsize=(12, 6), dpi=150)
fig3.patch.set_facecolor(bg_color)
ax3 = fig3.add_subplot(111)
ax3.set_facecolor(bg_color)

ax3.plot(df["Bit Size"], df["GMP_SUB Ops"], marker='o', linestyle='-', linewidth=2.5, markersize=8, label="GMP_SUB Ops", color=gmp_color)
ax3.plot(df["Bit Size"], df["PML_SUB Ops"], marker='s', linestyle='--', linewidth=2.5, markersize=8, label="PML_SUB Ops", color=pml_color)

# Annotate points
for i, bit_size in enumerate(df["Bit Size"]):
    ax3.text(bit_size, df["GMP_SUB Ops"][i] * 1.15, f"{df['GMP_SUB Ops'][i]:,}", fontsize=9, ha='right', color=gmp_color, fontweight="bold", bbox=dict(facecolor='white', alpha=0.7, edgecolor='none'))
    ax3.text(bit_size, df["PML_SUB Ops"][i] * 0.85, f"{df['PML_SUB Ops'][i]:,}", fontsize=9, ha='left', color=pml_color, fontweight="bold", bbox=dict(facecolor='white', alpha=0.7, edgecolor='none'))

ax3.set_xscale("log", base=2)
ax3.set_yscale("log", base=10)  # Explicit log scale for y-axis
ax3.set_xticks(df["Bit Size"])
ax3.set_xticklabels(df["Bit Size"], rotation=45, fontsize=11, fontweight="bold")
ax3.set_xlabel("Bit Size", fontsize=14, fontweight="bold")
ax3.set_ylabel("Number of Operations", fontsize=14, fontweight="bold")
ax3.set_title("OP/s Comparison on CPU3 for\nLarge-Number Subtraction (Log-scale)", fontsize=16, fontweight="bold", pad=20)
ax3.legend(loc='upper right', fontsize=11, frameon=True, edgecolor='black')
ax3.grid(True, which="both", ls="--", alpha=0.2)

plt.tight_layout(pad=2.0)
plt.savefig("cpu3_operations.png", dpi=300, bbox_inches='tight', facecolor=bg_color)

# --- Plot 4: Speedup (Ops) ---
fig4 = plt.figure(figsize=(12, 6), dpi=150)
fig4.patch.set_facecolor(bg_color)
ax4 = fig4.add_subplot(111)
ax4.set_facecolor(bg_color)

ax4.plot(df["Bit Size"], df["Speedup (PML_SUB) Ops"], marker='d', linestyle='-', linewidth=2.5, markersize=8, label="Speedup (PML_SUB) Ops", color=speedup_color)

# Annotate points
for i, bit_size in enumerate(df["Bit Size"]):
    ax4.text(bit_size, df["Speedup (PML_SUB) Ops"][i] + 0.5, f"{df['Speedup (PML_SUB) Ops'][i]:.2f}", fontsize=9, ha='center', color=speedup_color, fontweight="bold", bbox=dict(facecolor='white', alpha=0.7, edgecolor='none'))

ax4.set_xscale("log", base=2)
ax4.set_yscale("linear")  # Linear scale for y-axis
ax4.set_ylim(0.5, 14)
ax4.set_xticks(df["Bit Size"])
ax4.set_xticklabels(df["Bit Size"], rotation=45, fontsize=11, fontweight="bold")
ax4.set_xlabel("Bit Size", fontsize=14, fontweight="bold")
ax4.set_ylabel("Speedup", fontsize=14, fontweight="bold", color=speedup_color)
ax4.set_title("Speedup (PML_SUB Ops) on CPU3 for\nLarge-Number Subtraction", fontsize=16, fontweight="bold", pad=20)
ax4.legend(loc='upper left', fontsize=11, frameon=True, edgecolor='black')
ax4.grid(True, which="both", ls="--", alpha=0.2)

plt.tight_layout(pad=2.0)
plt.savefig("cpu3_speedup_ops.png", dpi=300, bbox_inches='tight', facecolor=bg_color)

# Display all plots (optional)
plt.show()