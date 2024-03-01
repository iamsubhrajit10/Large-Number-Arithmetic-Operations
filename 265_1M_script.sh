#!/bin/bash

cd ./Transparent\ Huge\ Pages
gcc -o intel-thp intel-thp.c -lgmp
sudo ./intel-thp 256 > thp-dump.txt

cd ../Regular-Implementation
gcc -o intel intel.c -lgmp
sudo ./intel 256 > dump.txt