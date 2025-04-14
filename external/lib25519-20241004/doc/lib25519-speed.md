### NAME

lib25519-speed - run some lib25519 speed tests

### SYNOPSIS

    lib25519-speed

### DESCRIPTION

`lib25519-speed`
runs some tests of the speed of
the lib25519 implementation of X25519 and Ed25519.

The `lib25519-speed` output format is subject to change.
Examples of output lines with the current format,
from a `lib25519-speed` run on an Intel Haswell CPU core,
include the following:

    nG_merged25519 selected implementation amd64-mxaa-opt compiler clang -Wall -fPIC -fwrapv -Qunused-arguments -O2 -mmmx -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mbmi -mbmi2 -mavx2 -mtune=haswell; Ubuntu clang version 14.0.0-1ubuntu1.1; Target: x86_64-pc-linux-gnu; Thread model: posix; InstalledDir: /usr/bin
    nG_merged25519 selected 32 43276 +17556+272+38-60-200-13-109-24+139+118+3-24+39+37-86-221

These lines say that the automatically selected implementation
for the `nG_merged25519` subroutine
was the `amd64-mxaa-opt` implementation compiled with the `clang` options shown,
taking an interquartile mean (IQM) of 43276 CPU cycles.
The numbers `43276 +17556+272+...` show the timings for a series of consecutive operations:
the IQM was 43276 cycles,
the first run took 17556 cycles more than the IQM,
the second run took 272 cycles more than the IQM,
etc.

### SEE ALSO

**x25519**(1),
**ed25519**(1),
**lib25519**(3)
