compile add.c like this:
```
gcc add.c ../utils/perf_utils.c ../utils/limb_utils.c -o add -lz -I../utils -mavx512f -mavx512vl -O2 -funroll-all-loops -fno-inline-functions
```

First generate the test cases:
```
$~/test/./run.sh
```

