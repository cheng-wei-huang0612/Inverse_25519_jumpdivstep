To run the full test suite
after compiling and installing lib25519,
run `lib25519-fulltest`.
This indicates success in two ways:
it prints `full tests succeeded` as its last line of output;
it exits 0.

Any change in the compiled library
(compiling for a different architecture, compiling with a different compiler, etc.) must be subjected to a new round of tests.
A compiled version of lib25519 that does not pass the full test suite is **not supported**.

One run of `lib25519-fulltest`
was observed to take 31 core-minutes on a 3.3GHz Intel Core i3-12100 with overclocking disabled.
This test finished in 6 minutes of real time;
`lib25519-fulltest` includes some automatic parallelization.
To limit the number of threads used to 1,
run `env THREADS=1 lib25519-fulltest`.

lib25519 automatically selects
AVX2 implementations when it is running on an Intel/AMD CPU that supports AVX2,
while falling back to portable implementations otherwise.
Running `lib25519-fulltest` on an Intel/AMD CPU without AVX2
will say `CPU does not support implementation` for the AVX2 implementations
and will fail.
To test a compilation of lib25519 for Intel/AMD CPUs,
you have to pick an Intel/AMD CPU with AVX2 to run `lib25519-fulltest`.

The rest of this page says more about what is happening inside `lib25519-fulltest`.

### <a name="conventional"></a>Conventional tests

The workhorse inside `lib25519-fulltest`
is a separate `lib25519-test` program.

Simply calling `lib25519-test` without arguments
will run SUPERCOP-style tests that the subroutines in lib25519
produce the expected results for known inputs (including known randomness),
and will indicate success in two ways:
printing `all tests succeeded` as the last line of output,
and exiting 0.

For parallelism,
`lib25519-fulltest` calls `lib25519-test` many times,
using optional `lib25519-test` arguments to narrow which subroutines are being tested.

### <a name="dataflow"></a>Data-flow tests

Another way that `lib25519-fulltest`
runs `lib25519-test` is as follows,
running TIMECOP-style tests that branch conditions and array indices
are independent of secrets:

    env valgrind_multiplier=1 \
    valgrind -q \
    --error-exitcode=99 \
    lib25519-test

This requires `valgrind` to be installed at test time.
The output will include a line `valgrind 1 declassify 1`
if the library was compiled with `--valgrind` (which is the only supported option),
or a line `valgrind 1 declassify 0 (expect false positives)` otherwise.

These data-flow tests
do not supersede the conventional tests.
The conventional tests run code directly on the CPU
and might catch issues hidden by the emulation in `valgrind`.
The conventional tests also include some memory tests that are disabled to improve the `valgrind` memory tests
but that are not necessarily superseded by the `valgrind` memory tests.
