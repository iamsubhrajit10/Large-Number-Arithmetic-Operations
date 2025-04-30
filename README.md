First install the dependencies:
```bash
./setup.sh
```
Then for each operation, create the test cases:
```bash
$test/ ./run.sh
```

Now, for compile the add and subtract operations:
```bash
gcc <add/sub>.c ../utils/limb_utils.c ../utils/perf_utils.c -o <add/sub> -lz -I../utils -O1 -mavx512f -mavx512vl
```
Then run the <add/sub> executable:
```bash
./<add/sub> <operand-size> 0 <measure-type> <test-type>
```

For multiplication, compile the mul operation:
```bash
gcc mul.c limb_utils.c -I. -o mul -lz -O1 -mavx512f -mavx512ifma -I..
```
Then run the mul executable:
```bash
./mul <test-type> <measure-type>
```
