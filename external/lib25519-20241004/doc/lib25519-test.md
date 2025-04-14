### NAME

lib25519-test - run some lib25519 correctness tests

### SYNOPSIS

    lib25519-test

### DESCRIPTION

`lib25519-test`
runs some tests of the correctness of
the lib25519 implementation of X25519 and Ed25519.

The `lib25519-test` output format is subject to change.
As examples of the current format, the lines

    nG_merged25519 offset 1
    nG_merged25519 selected implementation amd64-mxaa-opt compiler clang -Wall -fPIC -fwrapv -Qunused-arguments -O2 -mmmx -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mbmi -mbmi2 -mavx2 -mtune=haswell; Ubuntu clang version 14.0.0-1ubuntu1.1; Target: x86_64-pc-linux-gnu; Thread model: posix; InstalledDir: /usr/bin

mean that `lib25519-test` is testing the automatically selected
`amd64-mxaa-opt` implementation of the `nG_merged25519` subroutine
with various arrays offset by 1 byte from being aligned,
and a final line saying

    all tests succeeded

means that all tests passed.

### SEE ALSO

**lib25519-fulltest**(1),
**x25519**(1),
**ed25519**(1),
**lib25519**(3)
