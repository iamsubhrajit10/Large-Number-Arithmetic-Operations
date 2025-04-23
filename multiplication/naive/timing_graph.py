import matplotlib.pyplot as plt

# Timing data
labels = [
    "accumulate_muls",
    "multiply_AVX",
    "add_within_limbs",
    "adjust_inner_limbs",
    "remove_intermediary_zeros",
    "add_limbs",
    "adjust_limbs"
]
times = [
    211.911133,
    139.621094,
    15.523193,
    44.316772,
    28.975525,
    124.764648,
    0.494150
]

# Create the bar chart
plt.figure(figsize=(10, 6))
plt.barh(labels, times, color='skyblue')
plt.xlabel('Time (milliseconds)')
plt.title('Timing Graph')
plt.grid(axis='x', linestyle='--', alpha=0.7)

# Save the graph to a file
plt.tight_layout()
plt.savefig('./timing_graph.png')

# Display the graph
plt.show()