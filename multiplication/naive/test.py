import gmpy2

# Define the hexadecimal numbers as strings
num1 = "2812 fbb8 3a69 e956 9658 6f4e c5f3 5708 eef8 dea6 13b7 6d4e 151e db56 fe57 3880 33dd dd5b ce76 fe6d"
num2 = "226c 4926 e3ef 1c4f c942 462b 65c0 070f 3db7 3426 d7ca e5c8 afde 1234 cf1f 4637 0182 1514 1d40 f07a"

# Convert hexadecimal strings to gmpy2 integers
int_num1 = gmpy2.mpz(num1, 16)
int_num2 = gmpy2.mpz(num2, 16)

# Perform multiplication
result = int_num1 * int_num2

# Convert the result back to hexadecimal and display
hex_result = result.digits(16)  # Use gmpy2's digits method to get the hex string

# From LSB to MSB, print the hex string in 4-byte chunks
print(f"Multiplication Result: {hex_result}")