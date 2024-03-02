#!/bin/bash

cd ./Transparent\ Huge\ Pages
gcc -o k_p_t_p karatsuba_prealloc_thp.c -lgmp
sudo perf stat -e cpu-cycles,instructions,branch-misses,faults,dTLB-loads,dTLB-load-misses,cache-misses,cache-references ./k_p_t_p | tee k_p_t_p-dump.txt
echo "karatsuba_prealloc_thp done"

cd ../Regular-Implementation
gcc -o k_p karatsuba_prealloc.c -lgmp
sudo perf stat -e cpu-cycles,instructions,branch-misses,faults,dTLB-loads,dTLB-load-misses,cache-misses,cache-references ./k_p | tee k_p-dump.txt
echo "Regular test done"

echo "All tests done"