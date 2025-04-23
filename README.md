
Compile the code with the following command:
```bash
gcc sub.c ../utils/perf_utils.c ../utils/limb_utils.c -o sub -lz -I../utils -mavx512f -mavx512vl -O2 -funroll-all-loops -fno-inline-functions
```
First generate the test cases:
```bash
$~/test$ ./run.sh
```

