import matplotlib.pyplot as plt

# Data
number_of_bits = [65536, 32768, 16384, 8192, 4096, 2048, 1024, 512, 256]
gmp_ops = [1515283, 3307810, 7182027, 16644063, 25115592, 33756973, 40233131, 40427026, 42473964]
explicit_avx_ops = [2576353, 5418997, 12633445, 23301688, 33554432, 56111090, 63550060, 72786186, 75743638]

# Reverse the data to ensure it is shown from larger to smaller bit-size
number_of_bits.reverse()
gmp_ops.reverse()
explicit_avx_ops.reverse()

# Create the plot
plt.figure(figsize=(10, 6))
plt.plot(number_of_bits, gmp_ops, marker='o', label='GMP')
plt.plot(number_of_bits, explicit_avx_ops, marker='s', label='EXPLICIT-AVX')

# Add labels and title
plt.xlabel('Number of Bits')
plt.ylabel('Number of Ops/s')
plt.title('Performance Comparison: GMP vs EXPLICIT-AVX')
plt.xscale('log')  # Use logarithmic scale for better visualization of large range
plt.yscale('log')  # Use logarithmic scale for better visualization
plt.legend()
plt.grid(True, which='both', linestyle='--', linewidth=0.5)

# Set custom x-axis tick labels
plt.xticks(number_of_bits, [str(bit) for bit in number_of_bits])

# Annotate the numbers
for i, txt in enumerate(gmp_ops):
    plt.annotate(f'{txt}', (number_of_bits[i], gmp_ops[i]), textcoords="offset points", xytext=(0,10), ha='center')
for i, txt in enumerate(explicit_avx_ops):
    plt.annotate(f'{txt}', (number_of_bits[i], explicit_avx_ops[i]), textcoords="offset points", xytext=(0,10), ha='center')

# Save plot to a file
plt.savefig('performance_comparison.png')

# Optionally, you can also display the plot
# plt.show()
