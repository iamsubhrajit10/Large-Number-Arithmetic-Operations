# Enabling Transparent Huge Pages (THP)
There can be two ways to enable the transparent huge pages:
## System-wide
```
$ sudo sh -c 'echo always >/sys/kernel/mm/transparent_hugepage/enabled'
```
## Application-Level using madvise
```
$ sudo sh -c 'echo madvise >/sys/kernel/mm/transparent_hugepage/enabled'
```
## To disable THP
```
$ sudo sh -c 'echo never >/sys/kernel/mm/transparent_hugepage/enabled'
```
## To check if THP is enabled or not
```
$ cat /sys/kernel/mm/transparent_hugepage/enabled
```
If it is not enabled, you'll see "always madvise [never]" as output. (if madvise is enabled, you'll see "always [madvise] never" as output)

# To verify the Huge Pages
Put the executable file on running mode i.e. may be put a scanf to halt the termination.
## Get PID of the process
```
$ pgrep <executable filename>
```
## Check the THP Mappings
```
$ grep AnonHugePages /proc/<PID>/smaps
```
## To check the perf stats:
```bash
$ sudo perf record -e cpu-cycles,instructions,branch-misses,faults,dTLB-loads,dTLB-load-misses,cache-misses,cache-references ./<file name> <bit size> <no of iterations>
$ sudo perf report --symbols=multiply -f
```
