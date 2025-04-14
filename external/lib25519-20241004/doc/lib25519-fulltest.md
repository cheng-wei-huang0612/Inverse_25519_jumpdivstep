### NAME

lib25519-fulltest - run the full lib25519 test suite

### SYNOPSIS

    lib25519-fulltest

### DESCRIPTION

`lib25519-fulltest`
runs the full suite of tests of
the lib25519 implementation of X25519 and Ed25519.

The `lib25519-fulltest` output format is subject to change.
A successful test prints a final line saying

    full tests succeeded

and exits 0.
An unsuccessful test exits nonzero without printing that line.

### SEE ALSO

**lib25519-test**(1),
**x25519**(1),
**ed25519**(1),
**lib25519**(3)
