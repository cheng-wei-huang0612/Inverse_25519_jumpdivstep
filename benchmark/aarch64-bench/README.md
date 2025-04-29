# Portable cycle-counting

This repository contains a simple framework for benchmarking on various platforms.
The hardware-abstraction layer (HAL) supports benchmarking using perf (any supported platform), PMU (AArch64, x86_64), and Apple's KPC (AArch64, x86_64).
This framework also includes a Neon NTT taken from [mlkem-native](https://github.com/pq-code-package/mlkem-native) which (obviously) only works on AArch64.

The HAL provides the following 3 self-explanatory functions:
```c
void enable_cyclecounter(void);
void disable_cyclecounter(void);
uint64_t get_cyclecounter(void);
```

For illustration how to use it, benchmarking code is included in [bench.c](./bench.c).
It performs `NTESTS=500` experiments. Each experiment first runs `NWARMUP=50` iterations of the 
target functions for the purpose of cache warming and then measures `NITERATIONS=300` of the 
target functions and stores the average cycle count.
Those parameters have proven to work well on many platforms. If you see unstable benchmarks you can try to increase
the number of iterations or tests.

At the end the median run-time is printed alongside the percentiles:
```
$ ./bench 
       ntt cycles = 992

           percentile      1     10     20     30     40     50     60     70     80     90     99
       ntt percentiles:    989    992    992    992    992    992    992    992   1017   1022   1202
```

## Usage

To compile the example that uses `perf` for cycle counting, run
```bash
make CYCLES=PERF
# perf requires root
sudo ./bench
```

To compile the example that uses PMU registers for cycle counting, run
```bash
make CYCLES=PERF
./bench
```
(If you see an `Illegal Instruction` exception that likely means you did not 
enable access to PMU register from user mode. You will have to install a kernel
module to do so. See e.g., [here](https://github.com/mupq/pqax/tree/main/enable_ccr)).

To compile the example that uses Apple's KPC framework (which works on both x86_64 and AArch64), run 
```bash
make CYCLES=PERF
# KPC requires root
sudo ./bench
```

(Note that this code currently does not work on the Apple M4. If you need 
benchmarking on the Apple M4, refer to [this framework](https://gist.github.com/ibireme/173517c208c7dc333ba962c1f0d67d12)).
