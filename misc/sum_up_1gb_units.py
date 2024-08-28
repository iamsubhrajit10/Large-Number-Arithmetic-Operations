import pandas as pd

# Read the CSV file
df = pd.read_csv('1gb_units.csv')

# Get the sum of each column
column_sums = df.sum()

print(column_sums)