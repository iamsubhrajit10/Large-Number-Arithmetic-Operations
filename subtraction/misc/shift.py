
def right_shift_hex_with_propagation(hex_str, carry_in):
    # Convert hex string to integer
    num = int(hex_str, 16)
    # Right shift by one bit and add carry_in to the MSB
    shifted_num = (num >> 1) | (carry_in << 63)
    # Get the new carry_out (the original LSB)
    carry_out = num & 1
    # Convert back to hex string
    return format(shifted_num, '016x'), carry_out

# Data from the first file
# Data from the first file
data_array_1 = [
    "7b9e116d7e94f572", "1c9d5b6ecd27654d", "acb12ed3e0e03cd0", "f779c785c7134931",
    "6ca6131f2a750dbd", "f804d728e739cd79", "43928912e6d8e413", "2a4e836d570aa5d2",
    "501cfad7b054c491", "3fe73c2cef3855c7", "1b76b7493225bf20", "95f4c104ca73805d",
    "0aad61435d454885", "4122e121e3fae5b6", "5c05eaffea7448a1", "bf031a3a6e26786a",
    "60b0caa9a61c4863", "2d12658cd143aaaf", "db091c70ad1786ad", "ad8e4d4acf493095",
    "249f04753f53ab95", "f56708473af5e2ae", "30daab9bffa27e8e", "06d38d7026ff23db",
    "d9d2e42bad452738", "5e027bcf0d14c7c6", "2bc53750955da4fa", "8ad12551cb51c45a",
    "c05009fa7737164c", "dafed0e0a0cd64d1", "edf03492c46f5b74", "b2d3896649b841f8",
    "e5597a1499290b9f", "6b9884f6be8626de", "335f1f3b722f07e0", "3f7a50a0c77d1761",
    "fc55311d70d8a35b", "40b953604ebadb58", "69c9120896b2e95a", "f209ab97ca314629",
    "6b68b8136c62e24e", "d0337375f3ba2293", "21ce2ff86566e65c", "f9fff5aa0debff76",
    "ad56cd1aea6562d7", "e035d48365a110ef", "40d413cab2459bba", "8bb64db4bd4dbf13",
    "d876cce8c9761baf", "a63f72ec5f3d17dc", "ab182d98d759840d", "612c1fb2a16865ec",
    "4afba16e232aa23a", "b74be9aaa4aa38b8", "bdb1a6d1068ea46e", "73208b38be5e190c",
    "a4e691eb9c964a2d", "e82a937a734890c9", "6bc69f5f08eeb837", "dd6449aff12924b8",
    "54235f8b7f79fa94", "3752f1ff6ac76cf0", "977305df083f40a9", "7ab6ece6d9889d2a"
]

# Apply right shift with propagation to the data array
shifted_data_array_1 = []
carry = 0
for data in data_array_1:
    shifted_data, carry = right_shift_hex_with_propagation(data, carry)
    shifted_data_array_1.append(shifted_data)

# Print the results
print("Shifted Data Array 1:")
for i, data in enumerate(shifted_data_array_1):
    print(f"data_array[{i}]: {data}")