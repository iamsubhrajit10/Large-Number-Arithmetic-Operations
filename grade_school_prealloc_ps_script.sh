#!/bin/bash

cd ./Transparent\ Huge\ Pages
gcc -o g_s_p_t_p grade_school_prealloc_thp.c -lgmp -o3
sudo perf stat -e cpu-cycles,instructions,branch-misses,faults,dTLB-loads,dTLB-load-misses,cache-misses,cache-references ./g_s_p_t_p | tee g_s_p_t_p-dump.txt
echo "grade_school_prealloc_thp done"

cd ../Regular-Implementation
gcc -o g_s_p grade_school_prealloc.c -lgmp -o3
sudo perf stat -e cpu-cycles,instructions,branch-misses,faults,dTLB-loads,dTLB-load-misses,cache-misses,cache-references ./g_s_p | tee g_s_p-dump.txt
echo "grade_school_prealloc done"

echo "All tests done"