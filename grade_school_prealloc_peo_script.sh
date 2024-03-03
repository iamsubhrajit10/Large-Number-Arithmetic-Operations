#!/bin/bash

cd ./Transparent\ Huge\ Pages
gcc -o g_s_p_t_p_e_o grade_school_prealloc_thp_perf_event_open.c -lgmp
sudo ./g_s_p_t_p_e_o | tee g_s_p_t_p_e_o-dump.txt
echo "grade_school_prealloc_thp_perf_event_open done"

cd ../Regular-Implementation
gcc -o g_s_p_p_e_o grade_school_prealloc_perf_event_open.c -lgmp
sudo ./g_s_p_p_e_o | tee g_s_p_p_e_o-dump.txt
echo "grade_school_prealloc_perf_event_open done"

echo "All tests done"
