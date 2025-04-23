import sys
import pandas as pd
import numpy as np

def calculate_statistics(file):
    # Read the CSV file
    df = pd.read_csv(file)

    # Initialize a dictionary to store the results
    results = {}

    # Calculate statistics for each column
    for column in df.columns:
        if df[column].dtype in [np.float64, np.int64]:
            min_val = df[column].min()
            avg_val = df[column].mean()
            max_val = df[column].max()
            stddev_val = df[column].std()
            results[column] = {
                'min': min_val,
                'avg': avg_val,
                'max': max_val,
                'stddev': stddev_val
            }
        else:
            results[column] = 'No numeric data'

    # Print the results
    for column, stats in results.items():
        if isinstance(stats, dict):
            print(f"{column}: min={stats['min']:.2f}, avg={stats['avg']:.2f}, max={stats['max']:.2f}, stddev={stats['stddev']:.2f}")
        else:
            print(f"{column}: {stats}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python central_tendencies.py <csv_file>")
        sys.exit(1)

    file = sys.argv[1]
    calculate_statistics(file)