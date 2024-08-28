#!/bin/bash
# Shell Script that tests the subtraction program for bit sizes 256 to 65536

# Shell Script that tests the subtraction program for bit sizes 256 to 65536

# Compile the subtraction program first
gcc -o avx_sub sub_avx.c -lm -lgmp -flto -funroll-all-loops -mavx512f -ffast-math -O3

# Run the subtraction program for bit sizes 256 to 65536, incrementing by twice the previous bit size
# Run it on 10 different cores, incrementing by 1 each time
for ((j=0; j<10; j++))
do
    echo "Running for core $j" | tee -a output.txt
    for ((i=256; i<=65536; i=i*2))
    do
    # print output as well as write to file
    echo "Running for bit size $i" | tee -a output.txt
    sudo taskset -c $j ./avx_sub $i $j | tee -a output.txt
    echo " " | tee -a output.txt
    done
done

# End of script
