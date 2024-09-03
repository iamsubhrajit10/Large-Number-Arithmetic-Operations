import sys

def calculate_sum_and_average(filename):
    try:
        with open(filename, 'r') as file:
            numbers = [float(line.strip()) for line in file if line.strip()]
        
        total = sum(numbers)
        count = len(numbers)
        average = total / count if count != 0 else 0
        
        return total, average
    except FileNotFoundError:
        print(f"File not found: {filename}")
        sys.exit(1)
    except ValueError:
        print(f"File contains non-numeric values: {filename}")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <filename>")
        sys.exit(1)
    
    filename = sys.argv[1]
    total, average = calculate_sum_and_average(filename)
    
    print(f"Total: {total}")
    print(f"Average: {average}")