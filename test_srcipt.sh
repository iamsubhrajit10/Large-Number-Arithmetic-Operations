#!/bin/bash

cd ./Transparent\ Huge\ Pages
gcc -o test-thp test-thp.c -lgmp
sudo ./test-thp | tee test-thp-dump.txt
echo "THP test done"

cd ../Regular-Implementation
gcc -o test test.c -lgmp
sudo ./test | tee test-dump.txt
echo "Regular test done"
