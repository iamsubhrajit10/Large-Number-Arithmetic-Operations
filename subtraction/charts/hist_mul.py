import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch
from matplotlib import rcParams

# Set font
rcParams['font.family'] = 'sans-serif'
rcParams['font.sans-serif'] = ['Arial', 'Helvetica', 'DejaVu Sans']

# Data
metrics = ['Avg. Execution Time', 'Operations per seconds', 'User Instruction Count', 'Avg. Ticks']
improvement_factors = [1.83, 1.82, 2.89, 1.66]
vbap_values = [16.8, 59.383458, 129, 56]  # Avg. Time in ns, Operations in millions
gmp_values = [30.7, 32.582939, 373, 93]   # Avg. Time in ns, Operations in millions

# Colors
bar_colors = ['#3498db', '#2ecc71', '#9b59b6', '#f39c12']  # Blue, Green, Red, Orange
vbap_color = '#006400'  # Dark green for VBAP
gmp_color = '#8B0000'   # Dark red for GMP
factor_color = '#000000'  # Black for improvement factor

# Create figure and axis
fig, ax = plt.subplots(figsize=(10, 6))
fig.patch.set_facecolor('#ffffff')  # White background

# Create bars
bars = ax.bar(metrics, improvement_factors, color=bar_colors, width=0.25, alpha=0.8)

# Add boxes and text with increased offset
for i, bar in enumerate(bars):
    height = bar.get_height()
    x_center = bar.get_x() + bar.get_width() / 2
    # Box position
    box_x = x_center - 0.35
    box_y = height + 0.2
    box_width = 0.7
    box_height = 0.4
    # Add box with rounded corners
    rect = FancyBboxPatch((box_x, box_y), box_width, box_height, boxstyle="round,pad=0.05",
                          facecolor='#ffffff', edgecolor='#cccccc', lw=1, alpha=0.8, zorder=10)
    ax.add_patch(rect)
    # Text positions
    text_y_top = height + 0.55
    text_y_mid = height + 0.4
    text_y_bottom = height + 0.25
    # Format values (special case for Avg. Time with ns and Operations with M)
    if i == 0:  # Avg. Time in ns
        vbap_str = f'VBAP: {vbap_values[i]:.1f} ns'
        gmp_str = f'GMP: {gmp_values[i]:.1f} ns'
    elif i == 1:  # Operations in millions
        vbap_str = f'VBAP: {vbap_values[i]:.1f}M'
        gmp_str = f'GMP: {gmp_values[i]:.1f}M'
    else:  # User Instructions and Avg. Ticks (no units)
        vbap_str = f'VBAP: {vbap_values[i]:.1f}'
        gmp_str = f'GMP: {gmp_values[i]:.1f}'
    factor_str = f'Factor: {improvement_factors[i]:.2f}'
    # Add text
    ax.text(x_center, text_y_top, vbap_str, ha='center', va='center', color=vbap_color, fontsize=9, zorder=11)
    ax.text(x_center, text_y_mid, gmp_str, ha='center', va='center', color=gmp_color, fontsize=9, zorder=11)
    ax.text(x_center, text_y_bottom, factor_str, ha='center', va='center', color=factor_color, fontsize=9, fontweight='bold', zorder=11)
title = ax.set_title('VBAP vs GMP: 256-bit Multiplication Performance on Intel Xeon E-2314', 
                    fontsize=14, fontweight='bold', color='#333333', pad=20)

# Fix the facecolor value (use hex string instead of integer) and add a border
plt.setp(title, bbox=dict(facecolor='#f0f8ff', edgecolor='#4682b4', alpha=0.9, 
                         pad=5, boxstyle='round,pad=0.5', linewidth=1.5))

# Customize chart

ax.set_ylabel('Improvement Factor', fontsize=12, color='#333333')
ax.set_ylim(0, 3.9)  # Space for boxes
ax.grid(axis='y', linestyle='--', alpha=0.5, color='#cccccc')
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.spines['bottom'].set_color('#cccccc')
ax.spines['left'].set_color('#cccccc')
ax.tick_params(axis='x', colors='#333333')
ax.tick_params(axis='y', colors='#333333')

# Add note
fig.text(0.5, -0.1, 'Note: Improvement Factor > 1 indicates VBAP outperforms GMP.\n'
         'Avg. Time, User Instructions, Avg. Ticks: GMP/VBAP; Operations: VBAP/GMP',
         ha='center', fontsize=10, color='#666666', wrap=True)

# Adjust layout and save
plt.tight_layout()
plt.savefig('mul_comp.svg', format='svg', bbox_inches='tight')
plt.show()