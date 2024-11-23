import gmpy2
import random
import os
import concurrent.futures
from time import time
import gzip

BUFFER_SIZE = 1000

def generate_seed():
    return random.SystemRandom().randint(1, 2**32 - 1)

def generate_testcases(filename, bit_size, num_testcases, mode):
    random.seed(generate_seed())
    state = gmpy2.random_state(random.getrandbits(32))

    buffer = []
    with gzip.open(filename, 'wt') as f:
        f.write("num1,num2,result\n")
        for _ in range(num_testcases):
            a = gmpy2.mpz_urandomb(state, bit_size)
            b = gmpy2.mpz_urandomb(state, bit_size)

            if mode == 1:  # a = b
                b = a
            elif mode == 2:  # a > b
                if a < b:
                    a, b = b, a
            elif mode == 3:  # a < b
                if a > b:
                    a, b = b, a

            c = a * b

            buffer.append(f"{a},{b},{c}\n")

            if len(buffer) >= BUFFER_SIZE:
                f.writelines(buffer)
                buffer = []

        if buffer:
            f.writelines(buffer)

def main(bit_size, num_testcases, test_case_no):
    os.makedirs(f"cases/{bit_size}", exist_ok=True)

    filenames = [
        f"cases/{bit_size}/random.csv.gz",
        f"cases/{bit_size}/equal.csv.gz",
        f"cases/{bit_size}/greater.csv.gz",
        f"cases/{bit_size}/smaller.csv.gz"
    ]

    modes = [0, 1, 2, 3]

    if test_case_no == -1:
        with concurrent.futures.ThreadPoolExecutor() as executor:
            futures = [
                executor.submit(generate_testcases, filenames[i], bit_size, num_testcases, modes[i])
                for i in range(4)
            ]
            concurrent.futures.wait(futures)
    else:
        generate_testcases(filenames[test_case_no], bit_size, num_testcases, modes[test_case_no])

if __name__ == "__main__":
    import sys
    if len(sys.argv) < 3 or len(sys.argv) > 4:
        print("Usage: python gen_testcases.py <bit-size> <num-testcases> [<test-case-no>]")
        sys.exit(1)

    bit_size = int(sys.argv[1])
    num_testcases = int(sys.argv[2])
    test_case_no = int(sys.argv[3]) if len(sys.argv) == 4 else -1

    if bit_size <= 0 or bit_size > 2**31 - 1:
        print("Invalid bit-size, should be between 1 and 2^31-1")
        sys.exit(1)

    if num_testcases <= 0 or num_testcases > 2**31 - 1:
        print("Invalid testcase-size, should be between 1 and 2^31-1")
        sys.exit(1)

    if test_case_no < -1 or test_case_no > 3:
        print("Invalid number of testcases, should be between 0 and 3, and -1 for all")
        sys.exit(1)

    start_time = time()
    main(bit_size, num_testcases, test_case_no)
    end_time = time()
    print(f"Testcases generated successfully for bit-size {bit_size} in {end_time - start_time:.2f} seconds")