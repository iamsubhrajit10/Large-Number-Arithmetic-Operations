#!/bin/bash

cd ./Transparent\ Huge\ Pages
gcc -o k_p_t_p_e_o karatsuba_prealloc_thp_perf_event_open.c -lgmp
sudo ./k_p_t_p_e_o | tee k_p_t_p_e_o-dump.txt
echo "karatsuba_prealloc_thp_perf_event_open done"

cd ../Regular-Implementation
gcc -o k_p_p_e_o karatsuba_prealloc_perf_event_open.c -lgmp
sudo ./k_p_p_e_o | tee k_p_p_e_o-dump.txt
echo "Regular test done"

echo "All tests done"
