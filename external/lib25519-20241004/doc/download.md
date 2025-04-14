To download and unpack the latest version of lib25519:

    wget -m https://lib25519.cr.yp.to/lib25519-latest-version.txt
    version=$(cat lib25519.cr.yp.to/lib25519-latest-version.txt)
    wget -m https://lib25519.cr.yp.to/lib25519-$version.tar.gz
    tar -xzf lib25519.cr.yp.to/lib25519-$version.tar.gz
    cd lib25519-$version

Then [install](install.html).

### Archives and changelog (reverse chronological) {#changelog}

[`lib25519-20241004.tar.gz`](lib25519-20241004.tar.gz) [browse](lib25519-20241004.html)

Announce latest version on front page.

Upgrade to `cryptoint 20241003`.

Use the `cryptoint` big-endian load/store functions in various SHA-512 functions.
In particular, this ports `wflip` to big-endian CPUs;
thanks to Jan Mojzis for pointing out the portability issue.

Include `crypto_declassify.h` for non-`valgrind` builds,
and include `crypto_asm_rodata.h` for default builds.
Thanks to Jan Mojzis.

Align constants in
`crypto_nP/montgomery25519/amd64-avx512-8x1-ns10l-maax/shared-consts.c`.

[`lib25519-20240928.tar.gz`](lib25519-20240928.tar.gz) [browse](lib25519-20240928.html)

Add `mGnP/ed25519/arm64-maa4-{int,red}mul`.

Add `multiscalar/ed25519/amd64-{maa4,maax,mxaa}-opt`,
`multiscalar/ed25519/amd64-{maa4,maax,mxaa}-p3-opt`,
`multiscalar/ed25519/arm64-maa4-{int,red}mul`,
`multiscalar/ed25519/arm64-maa4-{int,red}mul-p3`.

Use `nsquare` more in `fe25519_pow2523.c`.

Replace `fe25519_cmov.c` with `fe25519_cmov.S`.

Speed up `double_scalarmult`,
`arm64-maa4-{int,red}mul/mladder.S`,
`arm64-maa4-{int,red}mul/fe25519_nsquare.S`,
`arm64-maa4-{int,red}mul/ge25519_base.S`.

Switch speed measurements from medians to interquartile means.

Upgrade from `inttypes` to `cryptoint 20240806`, and use `cryptoint` more systematically.

Support `valgrind` in `lib25519-test`, with help from `configure`.

Split `command/lib25519-test.c` into multiple `.c` files.

Support finer-grained command-line splits in `lib25519-test`.
Add `lib25519-fulltest`.
Document `lib25519-fulltest` as being required for support.

Move some entries not supported by `valgrind`
from `compilers` to `skipcompilers`.

Rename `--no` as `--no-`.

Rename `ALIGN` as `CRYPTO_ALIGN`.
Systematically use `CRYPTO_ALIGN`.

Use `hidden` visibility for `crypto_*` symbols.
Use `ASM_HIDDEN` in more `.S` files.

Use `.note.GNU-stack` more.

Handle `checkinsns` etc. on shared directories.

Move `cat result-impl` to `default` for better visibility.

Recognize `sun4v` as `sparc64`.

For `donna_c64`:
Change `uint128_t` to `my_uint128_t`;
switch from mode `TI` to `unsigned __int128`;
import load/store fixes from upstream;
compile only for 64-bit architectures.

Handle `implarchreq` better in `configure`.

Make `dispatch/ifunc.do` work with `configure --noclean`.

Add `note.GNU-stack` to assembly.

Sort directory order in `scripts-build/ofiles`.
Thanks to Jan Mojzis.

For `use-s2n-bignum`,
insist locally on precomputed SHA-256 checksums.

[`lib25519-20240321.tar.gz`](lib25519-20240321.tar.gz) [browse](lib25519-20240321.html)

Add `./use-s2n-bignum` compile-time option,
along with lib25519+s2n benchmarks and separate s2n-bignum benchmarks.

Speed up `amd64-{maa4,maax,mxaa}` for `nP`, `nG`, `mGnP`.
Add `amd64-avx512-8x1-ns10l-maax` for `nP`.

Add initial code for 64-bit ARM.

MacOS X port: `dylib`; deal with `s` and `S` in `checknamespace`;
use `-flat_namespace` so `lib25519-test` can substitute `randombytes`;
add `crypto_asm_rodata.h` abstraction;
expand `#define` for assembly to eliminate semicolons.

Add benchmarks for more platforms.

Support empty compiler lists.

Improve selection for Zen 2, Zen 3, and Golden Cove.

Add background colors to speed table.

Improve HTML formatting for code.

Add NGI0 information.

[`lib25519-20230630.tar.gz`](lib25519-20230630.tar.gz) [browse](lib25519-20230630.html)

Add `powbatch`, `nPbatch`, and `multiscalar` APIs
with various implementations for basic amd64, BMI, ADX, AVX2, and AVX-512,
plus portable implementations.

Include benchmarks on more microarchitectures.
Add auto-generated table in documentation
summarizing [speeds](speed.html),
with OpenSSL speeds as a baseline for comparison.

For compatibility with musl etc.,
support `constructor` as an alternative to `ifunc` for dispatch.
Select `constructor` automatically if an `ifunc` compile-time test fails,
or if `--notryifunc` is passed to `./configure`.

Add command-line interface for shell scripts.

Rely on separate [libcpucycles](https://cpucycles.cr.yp.to)
to automatically use RDPMC etc.,
and separate [librandombytes](https://randombytes.cr.yp.to)
to automatically use `getrandom` etc.

Reorganize documentation into `doc/*.md` directory,
with auto-generation of HTML and manual pages.

Inside auto-generation of `command/lib25519-test.c`,
automatically cache Python computations of nP etc.

Reorganize precomputed tests to handle APIs with variable-length inputs and outputs.

Import infrastructure improvements from libmceliece.

[`lib25519-20221222.tar.gz`](lib25519-20221222.tar.gz) [browse](lib25519-20221222.html)

[`lib25519-20220726.tar.gz`](lib25519-20220726.tar.gz) [browse](lib25519-20220726.html)

[`lib25519-20220426.tar.gz`](lib25519-20220426.tar.gz) [browse](lib25519-20220426.html)
