def read_file(file_path):
    data1 = []
    data2 = []
    current_data = None
    
    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()
            if line == "Starting first loop":
                current_data = data1
            elif line == "First loop done":
                current_data = None
            elif line == "Second loop":
                current_data = data2
            elif line == "Second loop done":
                current_data = None
            elif current_data is not None:
                try:
                    current_data.append(float(line))
                except ValueError:
                    pass
    
    return data1, data2

def calculate_stats(data):
    min_val = min(data)
    max_val = max(data)
    avg_val = sum(data) / len(data)
    
    return min_val, avg_val, max_val

def main():
    file_path = 'rdtsc_values_16384_0'  # Replace with your file path
    data1, data2 = read_file(file_path)
    
    if data1:
        min1, avg1, max1 = calculate_stats(data1)
        print(f"First Data - Min: {min1}, Avg: {avg1}, Max: {max1}")
    else:
        print("No data found for the first loop.")
    
    if data2:
        min2, avg2, max2 = calculate_stats(data2)
        print(f"Second Data - Min: {min2}, Avg: {avg2}, Max: {max2}")
    else:
        print("No data found for the second loop.")

if __name__ == "__main__":
    main()