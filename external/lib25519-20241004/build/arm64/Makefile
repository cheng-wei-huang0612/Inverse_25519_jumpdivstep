default: package/lib/lib25519.a package/lib/lib25519.dylib package/lib/lib25519.1.dylib \
commands result-impl
	cat result-impl

install: scripts/install default
	scripts/install /usr/local

commands: package/bin/ed25519-keypair package/bin/ed25519-open package/bin/ed25519-sign package/bin/lib25519-speed package/bin/lib25519-test package/bin/x25519-dh package/bin/x25519-keypair package/bin/lib25519-fulltest

package/bin/lib25519-fulltest: scripts/fulltest-convert scripts/fulltest-top usedimplementations
	scripts/fulltest-convert lib25519 < usedimplementations > package/bin/lib25519-fulltest

package/bin/x25519-keypair: command/x25519-keypair.o \
package/lib/lib25519.dylib
	cd command && ./link bin/x25519-keypair x25519-keypair.o \
lib/lib25519.dylib

command/x25519-keypair.o: command/x25519-keypair.c
	scripts/compiledefault command x25519-keypair c -I include -I include-build

package/bin/x25519-dh: command/x25519-dh.o \
package/lib/lib25519.dylib
	cd command && ./link bin/x25519-dh x25519-dh.o \
lib/lib25519.dylib

command/x25519-dh.o: command/x25519-dh.c
	scripts/compiledefault command x25519-dh c -I include -I include-build

package/bin/lib25519-test: command/lib25519-test.o \
command/lib25519-test_dh_x25519.o \
command/lib25519-test_hash_sha512.o \
command/lib25519-test_hashblocks_sha512.o \
command/lib25519-test_mGnP_ed25519.o \
command/lib25519-test_multiscalar_ed25519.o \
command/lib25519-test_nG_merged25519.o \
command/lib25519-test_nG_montgomery25519.o \
command/lib25519-test_nP_montgomery25519.o \
command/lib25519-test_nPbatch_montgomery25519.o \
command/lib25519-test_pow_inv25519.o \
command/lib25519-test_powbatch_inv25519.o \
command/lib25519-test_sign_ed25519.o \
package/lib/lib25519.dylib
	cd command && ./link bin/lib25519-test lib25519-test.o \
lib25519-test_dh_x25519.o \
lib25519-test_hash_sha512.o \
lib25519-test_hashblocks_sha512.o \
lib25519-test_mGnP_ed25519.o \
lib25519-test_multiscalar_ed25519.o \
lib25519-test_nG_merged25519.o \
lib25519-test_nG_montgomery25519.o \
lib25519-test_nP_montgomery25519.o \
lib25519-test_nPbatch_montgomery25519.o \
lib25519-test_pow_inv25519.o \
lib25519-test_powbatch_inv25519.o \
lib25519-test_sign_ed25519.o \
lib/lib25519.dylib

command/lib25519-test.o: command/lib25519-test.c
	scripts/compiledefault command lib25519-test c -I include -I include-build

package/bin/lib25519-speed: command/lib25519-speed.o \
package/lib/lib25519.dylib
	cd command && ./link bin/lib25519-speed lib25519-speed.o \
lib/lib25519.dylib -lcpucycles -lrandombytes

command/lib25519-speed.o: command/lib25519-speed.c
	scripts/compiledefault command lib25519-speed c -I include -I include-build

package/bin/ed25519-sign: command/ed25519-sign.o \
package/lib/lib25519.dylib
	cd command && ./link bin/ed25519-sign ed25519-sign.o \
lib/lib25519.dylib

command/ed25519-sign.o: command/ed25519-sign.c
	scripts/compiledefault command ed25519-sign c -I include -I include-build

package/bin/ed25519-open: command/ed25519-open.o \
package/lib/lib25519.dylib
	cd command && ./link bin/ed25519-open ed25519-open.o \
lib/lib25519.dylib

command/ed25519-open.o: command/ed25519-open.c
	scripts/compiledefault command ed25519-open c -I include -I include-build

package/bin/ed25519-keypair: command/ed25519-keypair.o \
package/lib/lib25519.dylib
	cd command && ./link bin/ed25519-keypair ed25519-keypair.o \
lib/lib25519.dylib

command/ed25519-keypair.o: command/ed25519-keypair.c
	scripts/compiledefault command ed25519-keypair c -I include -I include-build

command/lib25519-test_sign_ed25519.o: command/lib25519-test_sign_ed25519.c
	scripts/compiledefault command lib25519-test_sign_ed25519 c -I include -I include-build

command/lib25519-test_powbatch_inv25519.o: command/lib25519-test_powbatch_inv25519.c
	scripts/compiledefault command lib25519-test_powbatch_inv25519 c -I include -I include-build

command/lib25519-test_pow_inv25519.o: command/lib25519-test_pow_inv25519.c
	scripts/compiledefault command lib25519-test_pow_inv25519 c -I include -I include-build

command/lib25519-test_nPbatch_montgomery25519.o: command/lib25519-test_nPbatch_montgomery25519.c
	scripts/compiledefault command lib25519-test_nPbatch_montgomery25519 c -I include -I include-build

command/lib25519-test_nP_montgomery25519.o: command/lib25519-test_nP_montgomery25519.c
	scripts/compiledefault command lib25519-test_nP_montgomery25519 c -I include -I include-build

command/lib25519-test_nG_montgomery25519.o: command/lib25519-test_nG_montgomery25519.c
	scripts/compiledefault command lib25519-test_nG_montgomery25519 c -I include -I include-build

command/lib25519-test_nG_merged25519.o: command/lib25519-test_nG_merged25519.c
	scripts/compiledefault command lib25519-test_nG_merged25519 c -I include -I include-build

command/lib25519-test_multiscalar_ed25519.o: command/lib25519-test_multiscalar_ed25519.c
	scripts/compiledefault command lib25519-test_multiscalar_ed25519 c -I include -I include-build

command/lib25519-test_mGnP_ed25519.o: command/lib25519-test_mGnP_ed25519.c
	scripts/compiledefault command lib25519-test_mGnP_ed25519 c -I include -I include-build

command/lib25519-test_hashblocks_sha512.o: command/lib25519-test_hashblocks_sha512.c
	scripts/compiledefault command lib25519-test_hashblocks_sha512 c -I include -I include-build

command/lib25519-test_hash_sha512.o: command/lib25519-test_hash_sha512.c
	scripts/compiledefault command lib25519-test_hash_sha512 c -I include -I include-build

command/lib25519-test_dh_x25519.o: command/lib25519-test_dh_x25519.c
	scripts/compiledefault command lib25519-test_dh_x25519 c -I include -I include-build

package/lib/lib25519.dylib: package/lib/lib25519.1.dylib
	rm -f package/lib/lib25519.dylib
	ln -s lib25519.1.dylib package/lib/lib25519.dylib

package/lib/lib25519.1.dylib: scripts/sharedlib ofiles
	scripts/sharedlib lib25519 -lrandombytes

package/lib/lib25519.a: scripts/staticlib ofiles
	scripts/staticlib lib25519

ofiles: scripts/ofiles odirs usedimplementations dispatch-auto-all dispatch-manual-all compilers-all cpuid-all cryptoint-all
	scripts/ofiles < odirs

odirs: usedimplementations
	( cat usedimplementations; echo dispatch-auto; echo dispatch-manual; echo compilers; echo cpuid; echo cryptoint ) > odirs

dispatch-manual-all: \
dispatch-manual/verify_32.o \
dispatch-manual/hashblocks_sha512.o \
dispatch-manual/hash_sha512.o \
dispatch-manual/pow_inv25519.o \
dispatch-manual/powbatch_inv25519.o \
dispatch-manual/nP_montgomery25519.o \
dispatch-manual/nPbatch_montgomery25519.o \
dispatch-manual/nG_merged25519.o \
dispatch-manual/nG_montgomery25519.o \
dispatch-manual/mGnP_ed25519.o \
dispatch-manual/multiscalar_ed25519.o \
dispatch-manual/dh_x25519.o \
dispatch-manual/sign_ed25519.o \

	touch dispatch-manual-all

dispatch-manual/verify_32.o: dispatch-manual/verify_32.c
	scripts/compiledefault dispatch-manual verify_32 c

dispatch-manual/hashblocks_sha512.o: dispatch-manual/hashblocks_sha512.c
	scripts/compiledefault dispatch-manual hashblocks_sha512 c

dispatch-manual/hash_sha512.o: dispatch-manual/hash_sha512.c
	scripts/compiledefault dispatch-manual hash_sha512 c

dispatch-manual/pow_inv25519.o: dispatch-manual/pow_inv25519.c
	scripts/compiledefault dispatch-manual pow_inv25519 c

dispatch-manual/powbatch_inv25519.o: dispatch-manual/powbatch_inv25519.c
	scripts/compiledefault dispatch-manual powbatch_inv25519 c

dispatch-manual/nP_montgomery25519.o: dispatch-manual/nP_montgomery25519.c
	scripts/compiledefault dispatch-manual nP_montgomery25519 c

dispatch-manual/nPbatch_montgomery25519.o: dispatch-manual/nPbatch_montgomery25519.c
	scripts/compiledefault dispatch-manual nPbatch_montgomery25519 c

dispatch-manual/nG_merged25519.o: dispatch-manual/nG_merged25519.c
	scripts/compiledefault dispatch-manual nG_merged25519 c

dispatch-manual/nG_montgomery25519.o: dispatch-manual/nG_montgomery25519.c
	scripts/compiledefault dispatch-manual nG_montgomery25519 c

dispatch-manual/mGnP_ed25519.o: dispatch-manual/mGnP_ed25519.c
	scripts/compiledefault dispatch-manual mGnP_ed25519 c

dispatch-manual/multiscalar_ed25519.o: dispatch-manual/multiscalar_ed25519.c
	scripts/compiledefault dispatch-manual multiscalar_ed25519 c

dispatch-manual/dh_x25519.o: dispatch-manual/dh_x25519.c
	scripts/compiledefault dispatch-manual dh_x25519 c

dispatch-manual/sign_ed25519.o: dispatch-manual/sign_ed25519.c
	scripts/compiledefault dispatch-manual sign_ed25519 c

dispatch-manual/verify_32.c: scripts/dispatch selected/verify_32 dispatch/ifunc
	scripts/dispatch manual verify 32 arm64 lib25519 < selected/verify_32 > dispatch-manual/verify_32.c

dispatch-manual/hashblocks_sha512.c: scripts/dispatch selected/hashblocks_sha512 dispatch/ifunc
	scripts/dispatch manual hashblocks sha512 arm64 lib25519 < selected/hashblocks_sha512 > dispatch-manual/hashblocks_sha512.c

dispatch-manual/hash_sha512.c: scripts/dispatch selected/hash_sha512 dispatch/ifunc
	scripts/dispatch manual hash sha512 arm64 lib25519 < selected/hash_sha512 > dispatch-manual/hash_sha512.c

dispatch-manual/pow_inv25519.c: scripts/dispatch selected/pow_inv25519 dispatch/ifunc
	scripts/dispatch manual pow inv25519 arm64 lib25519 < selected/pow_inv25519 > dispatch-manual/pow_inv25519.c

dispatch-manual/powbatch_inv25519.c: scripts/dispatch selected/powbatch_inv25519 dispatch/ifunc
	scripts/dispatch manual powbatch inv25519 arm64 lib25519 < selected/powbatch_inv25519 > dispatch-manual/powbatch_inv25519.c

dispatch-manual/nP_montgomery25519.c: scripts/dispatch selected/nP_montgomery25519 dispatch/ifunc
	scripts/dispatch manual nP montgomery25519 arm64 lib25519 < selected/nP_montgomery25519 > dispatch-manual/nP_montgomery25519.c

dispatch-manual/nPbatch_montgomery25519.c: scripts/dispatch selected/nPbatch_montgomery25519 dispatch/ifunc
	scripts/dispatch manual nPbatch montgomery25519 arm64 lib25519 < selected/nPbatch_montgomery25519 > dispatch-manual/nPbatch_montgomery25519.c

dispatch-manual/nG_merged25519.c: scripts/dispatch selected/nG_merged25519 dispatch/ifunc
	scripts/dispatch manual nG merged25519 arm64 lib25519 < selected/nG_merged25519 > dispatch-manual/nG_merged25519.c

dispatch-manual/nG_montgomery25519.c: scripts/dispatch selected/nG_montgomery25519 dispatch/ifunc
	scripts/dispatch manual nG montgomery25519 arm64 lib25519 < selected/nG_montgomery25519 > dispatch-manual/nG_montgomery25519.c

dispatch-manual/mGnP_ed25519.c: scripts/dispatch selected/mGnP_ed25519 dispatch/ifunc
	scripts/dispatch manual mGnP ed25519 arm64 lib25519 < selected/mGnP_ed25519 > dispatch-manual/mGnP_ed25519.c

dispatch-manual/multiscalar_ed25519.c: scripts/dispatch selected/multiscalar_ed25519 dispatch/ifunc
	scripts/dispatch manual multiscalar ed25519 arm64 lib25519 < selected/multiscalar_ed25519 > dispatch-manual/multiscalar_ed25519.c

dispatch-manual/dh_x25519.c: scripts/dispatch selected/dh_x25519 dispatch/ifunc
	scripts/dispatch manual dh x25519 arm64 lib25519 < selected/dh_x25519 > dispatch-manual/dh_x25519.c

dispatch-manual/sign_ed25519.c: scripts/dispatch selected/sign_ed25519 dispatch/ifunc
	scripts/dispatch manual sign ed25519 arm64 lib25519 < selected/sign_ed25519 > dispatch-manual/sign_ed25519.c

dispatch-auto-all: \
dispatch-auto/verify_32.o \
dispatch-auto/hashblocks_sha512.o \
dispatch-auto/hash_sha512.o \
dispatch-auto/pow_inv25519.o \
dispatch-auto/powbatch_inv25519.o \
dispatch-auto/nP_montgomery25519.o \
dispatch-auto/nPbatch_montgomery25519.o \
dispatch-auto/nG_merged25519.o \
dispatch-auto/nG_montgomery25519.o \
dispatch-auto/mGnP_ed25519.o \
dispatch-auto/multiscalar_ed25519.o \
dispatch-auto/dh_x25519.o \
dispatch-auto/sign_ed25519.o \

	touch dispatch-auto-all

dispatch-auto/verify_32.o: dispatch-auto/verify_32.c
	scripts/compiledefault dispatch-auto verify_32 c

dispatch-auto/hashblocks_sha512.o: dispatch-auto/hashblocks_sha512.c
	scripts/compiledefault dispatch-auto hashblocks_sha512 c

dispatch-auto/hash_sha512.o: dispatch-auto/hash_sha512.c
	scripts/compiledefault dispatch-auto hash_sha512 c

dispatch-auto/pow_inv25519.o: dispatch-auto/pow_inv25519.c
	scripts/compiledefault dispatch-auto pow_inv25519 c

dispatch-auto/powbatch_inv25519.o: dispatch-auto/powbatch_inv25519.c
	scripts/compiledefault dispatch-auto powbatch_inv25519 c

dispatch-auto/nP_montgomery25519.o: dispatch-auto/nP_montgomery25519.c
	scripts/compiledefault dispatch-auto nP_montgomery25519 c

dispatch-auto/nPbatch_montgomery25519.o: dispatch-auto/nPbatch_montgomery25519.c
	scripts/compiledefault dispatch-auto nPbatch_montgomery25519 c

dispatch-auto/nG_merged25519.o: dispatch-auto/nG_merged25519.c
	scripts/compiledefault dispatch-auto nG_merged25519 c

dispatch-auto/nG_montgomery25519.o: dispatch-auto/nG_montgomery25519.c
	scripts/compiledefault dispatch-auto nG_montgomery25519 c

dispatch-auto/mGnP_ed25519.o: dispatch-auto/mGnP_ed25519.c
	scripts/compiledefault dispatch-auto mGnP_ed25519 c

dispatch-auto/multiscalar_ed25519.o: dispatch-auto/multiscalar_ed25519.c
	scripts/compiledefault dispatch-auto multiscalar_ed25519 c

dispatch-auto/dh_x25519.o: dispatch-auto/dh_x25519.c
	scripts/compiledefault dispatch-auto dh_x25519 c

dispatch-auto/sign_ed25519.o: dispatch-auto/sign_ed25519.c
	scripts/compiledefault dispatch-auto sign_ed25519 c

dispatch-auto/verify_32.c: scripts/dispatch selected/verify_32 dispatch/ifunc
	scripts/dispatch auto verify 32 arm64 lib25519 < selected/verify_32 > dispatch-auto/verify_32.c

dispatch-auto/hashblocks_sha512.c: scripts/dispatch selected/hashblocks_sha512 dispatch/ifunc
	scripts/dispatch auto hashblocks sha512 arm64 lib25519 < selected/hashblocks_sha512 > dispatch-auto/hashblocks_sha512.c

dispatch-auto/hash_sha512.c: scripts/dispatch selected/hash_sha512 dispatch/ifunc
	scripts/dispatch auto hash sha512 arm64 lib25519 < selected/hash_sha512 > dispatch-auto/hash_sha512.c

dispatch-auto/pow_inv25519.c: scripts/dispatch selected/pow_inv25519 dispatch/ifunc
	scripts/dispatch auto pow inv25519 arm64 lib25519 < selected/pow_inv25519 > dispatch-auto/pow_inv25519.c

dispatch-auto/powbatch_inv25519.c: scripts/dispatch selected/powbatch_inv25519 dispatch/ifunc
	scripts/dispatch auto powbatch inv25519 arm64 lib25519 < selected/powbatch_inv25519 > dispatch-auto/powbatch_inv25519.c

dispatch-auto/nP_montgomery25519.c: scripts/dispatch selected/nP_montgomery25519 dispatch/ifunc
	scripts/dispatch auto nP montgomery25519 arm64 lib25519 < selected/nP_montgomery25519 > dispatch-auto/nP_montgomery25519.c

dispatch-auto/nPbatch_montgomery25519.c: scripts/dispatch selected/nPbatch_montgomery25519 dispatch/ifunc
	scripts/dispatch auto nPbatch montgomery25519 arm64 lib25519 < selected/nPbatch_montgomery25519 > dispatch-auto/nPbatch_montgomery25519.c

dispatch-auto/nG_merged25519.c: scripts/dispatch selected/nG_merged25519 dispatch/ifunc
	scripts/dispatch auto nG merged25519 arm64 lib25519 < selected/nG_merged25519 > dispatch-auto/nG_merged25519.c

dispatch-auto/nG_montgomery25519.c: scripts/dispatch selected/nG_montgomery25519 dispatch/ifunc
	scripts/dispatch auto nG montgomery25519 arm64 lib25519 < selected/nG_montgomery25519 > dispatch-auto/nG_montgomery25519.c

dispatch-auto/mGnP_ed25519.c: scripts/dispatch selected/mGnP_ed25519 dispatch/ifunc
	scripts/dispatch auto mGnP ed25519 arm64 lib25519 < selected/mGnP_ed25519 > dispatch-auto/mGnP_ed25519.c

dispatch-auto/multiscalar_ed25519.c: scripts/dispatch selected/multiscalar_ed25519 dispatch/ifunc
	scripts/dispatch auto multiscalar ed25519 arm64 lib25519 < selected/multiscalar_ed25519 > dispatch-auto/multiscalar_ed25519.c

dispatch-auto/dh_x25519.c: scripts/dispatch selected/dh_x25519 dispatch/ifunc
	scripts/dispatch auto dh x25519 arm64 lib25519 < selected/dh_x25519 > dispatch-auto/dh_x25519.c

dispatch-auto/sign_ed25519.c: scripts/dispatch selected/sign_ed25519 dispatch/ifunc
	scripts/dispatch auto sign ed25519 arm64 lib25519 < selected/sign_ed25519 > dispatch-auto/sign_ed25519.c

selected/verify_32: scripts/selected compiledimplementations
	scripts/selected verify 32 arm64 True < compiledimplementations > selected/verify_32

selected/hashblocks_sha512: scripts/selected compiledimplementations
	scripts/selected hashblocks sha512 arm64 True < compiledimplementations > selected/hashblocks_sha512

selected/hash_sha512: scripts/selected compiledimplementations
	scripts/selected hash sha512 arm64 True < compiledimplementations > selected/hash_sha512

selected/pow_inv25519: scripts/selected compiledimplementations
	scripts/selected pow inv25519 arm64 True < compiledimplementations > selected/pow_inv25519

selected/powbatch_inv25519: scripts/selected compiledimplementations
	scripts/selected powbatch inv25519 arm64 True < compiledimplementations > selected/powbatch_inv25519

selected/nP_montgomery25519: scripts/selected compiledimplementations
	scripts/selected nP montgomery25519 arm64 True < compiledimplementations > selected/nP_montgomery25519

selected/nPbatch_montgomery25519: scripts/selected compiledimplementations
	scripts/selected nPbatch montgomery25519 arm64 True < compiledimplementations > selected/nPbatch_montgomery25519

selected/nG_merged25519: scripts/selected compiledimplementations
	scripts/selected nG merged25519 arm64 True < compiledimplementations > selected/nG_merged25519

selected/nG_montgomery25519: scripts/selected compiledimplementations
	scripts/selected nG montgomery25519 arm64 True < compiledimplementations > selected/nG_montgomery25519

selected/mGnP_ed25519: scripts/selected compiledimplementations
	scripts/selected mGnP ed25519 arm64 True < compiledimplementations > selected/mGnP_ed25519

selected/multiscalar_ed25519: scripts/selected compiledimplementations
	scripts/selected multiscalar ed25519 arm64 True < compiledimplementations > selected/multiscalar_ed25519

selected/dh_x25519: scripts/selected compiledimplementations
	scripts/selected dh x25519 arm64 True < compiledimplementations > selected/dh_x25519

selected/sign_ed25519: scripts/selected compiledimplementations
	scripts/selected sign ed25519 arm64 True < compiledimplementations > selected/sign_ed25519

usedimplementations: scripts/usedimplementations selected/verify_32 selected/hashblocks_sha512 selected/hash_sha512 selected/pow_inv25519 selected/powbatch_inv25519 selected/nP_montgomery25519 selected/nPbatch_montgomery25519 selected/nG_merged25519 selected/nG_montgomery25519 selected/mGnP_ed25519 selected/multiscalar_ed25519 selected/dh_x25519 selected/sign_ed25519
	scripts/usedimplementations selected/verify_32 selected/hashblocks_sha512 selected/hash_sha512 selected/pow_inv25519 selected/powbatch_inv25519 selected/nP_montgomery25519 selected/nPbatch_montgomery25519 selected/nG_merged25519 selected/nG_montgomery25519 selected/mGnP_ed25519 selected/multiscalar_ed25519 selected/dh_x25519 selected/sign_ed25519 > usedimplementations

compiledimplementations: opicdirs scripts/compiledimplementations \
verify/32/ref/C0/allcompiled \
verify/32/ref/C1/allcompiled \
hashblocks/sha512/compact/C0/allcompiled \
hashblocks/sha512/compact/C1/allcompiled \
hashblocks/sha512/compact2/C0/allcompiled \
hashblocks/sha512/compact2/C1/allcompiled \
hashblocks/sha512/compact3/C0/allcompiled \
hashblocks/sha512/compact3/C1/allcompiled \
hashblocks/sha512/compact4/C0/allcompiled \
hashblocks/sha512/compact4/C1/allcompiled \
hashblocks/sha512/inplace/C0/allcompiled \
hashblocks/sha512/inplace/C1/allcompiled \
hashblocks/sha512/ref/C0/allcompiled \
hashblocks/sha512/ref/C1/allcompiled \
hashblocks/sha512/wflip/C0/allcompiled \
hashblocks/sha512/wflip/C1/allcompiled \
hash/sha512/ref/C0/allcompiled \
hash/sha512/ref/C1/allcompiled \
pow/inv25519/arm64-maa4-intmul/C0/allcompiled \
pow/inv25519/arm64-maa4-intmul/C1/allcompiled \
pow/inv25519/arm64-maa4-redmul/C0/allcompiled \
pow/inv25519/arm64-maa4-redmul/C1/allcompiled \
pow/inv25519/donna_c64/C0/allcompiled \
pow/inv25519/donna_c64/C1/allcompiled \
pow/inv25519/ref10/C0/allcompiled \
pow/inv25519/ref10/C1/allcompiled \
powbatch/inv25519/ref10/C0/allcompiled \
powbatch/inv25519/ref10/C1/allcompiled \
powbatch/inv25519/simple/C0/allcompiled \
powbatch/inv25519/simple/C1/allcompiled \
nP/montgomery25519/arm64-maa4-intmul/C0/allcompiled \
nP/montgomery25519/arm64-maa4-intmul/C1/allcompiled \
nP/montgomery25519/arm64-maa4-redmul/C0/allcompiled \
nP/montgomery25519/arm64-maa4-redmul/C1/allcompiled \
nP/montgomery25519/donna_c64/C0/allcompiled \
nP/montgomery25519/donna_c64/C1/allcompiled \
nP/montgomery25519/ref10/C0/allcompiled \
nP/montgomery25519/ref10/C1/allcompiled \
nPbatch/montgomery25519/ref/C0/allcompiled \
nPbatch/montgomery25519/ref/C1/allcompiled \
nG/merged25519/arm64-maa4-intmul/C0/allcompiled \
nG/merged25519/arm64-maa4-intmul/C1/allcompiled \
nG/merged25519/arm64-maa4-redmul/C0/allcompiled \
nG/merged25519/arm64-maa4-redmul/C1/allcompiled \
nG/merged25519/ref10/C0/allcompiled \
nG/merged25519/ref10/C1/allcompiled \
nG/montgomery25519/ref/C0/allcompiled \
nG/montgomery25519/ref/C1/allcompiled \
nG/montgomery25519/usemerged/C0/allcompiled \
nG/montgomery25519/usemerged/C1/allcompiled \
mGnP/ed25519/arm64-maa4-intmul/C0/allcompiled \
mGnP/ed25519/arm64-maa4-intmul/C1/allcompiled \
mGnP/ed25519/arm64-maa4-redmul/C0/allcompiled \
mGnP/ed25519/arm64-maa4-redmul/C1/allcompiled \
mGnP/ed25519/ref10/C0/allcompiled \
mGnP/ed25519/ref10/C1/allcompiled \
multiscalar/ed25519/arm64-maa4-intmul/C0/allcompiled \
multiscalar/ed25519/arm64-maa4-intmul/C1/allcompiled \
multiscalar/ed25519/arm64-maa4-intmul-p3/C0/allcompiled \
multiscalar/ed25519/arm64-maa4-intmul-p3/C1/allcompiled \
multiscalar/ed25519/arm64-maa4-redmul/C0/allcompiled \
multiscalar/ed25519/arm64-maa4-redmul/C1/allcompiled \
multiscalar/ed25519/arm64-maa4-redmul-p3/C0/allcompiled \
multiscalar/ed25519/arm64-maa4-redmul-p3/C1/allcompiled \
multiscalar/ed25519/ref10/C0/allcompiled \
multiscalar/ed25519/ref10/C1/allcompiled \
dh/x25519/wrapper/C0/allcompiled \
dh/x25519/wrapper/C1/allcompiled \
sign/ed25519/ref10/C0/allcompiled \
sign/ed25519/ref10/C1/allcompiled \

	scripts/compiledimplementations < opicdirs > compiledimplementations

result-impl: \
verify/32/ref/shared/result \
verify/32/ref/C0/result \
verify/32/ref/C1/result \
hashblocks/sha512/compact/shared/result \
hashblocks/sha512/compact/C0/result \
hashblocks/sha512/compact/C1/result \
hashblocks/sha512/compact2/shared/result \
hashblocks/sha512/compact2/C0/result \
hashblocks/sha512/compact2/C1/result \
hashblocks/sha512/compact3/shared/result \
hashblocks/sha512/compact3/C0/result \
hashblocks/sha512/compact3/C1/result \
hashblocks/sha512/compact4/shared/result \
hashblocks/sha512/compact4/C0/result \
hashblocks/sha512/compact4/C1/result \
hashblocks/sha512/inplace/shared/result \
hashblocks/sha512/inplace/C0/result \
hashblocks/sha512/inplace/C1/result \
hashblocks/sha512/ref/shared/result \
hashblocks/sha512/ref/C0/result \
hashblocks/sha512/ref/C1/result \
hashblocks/sha512/wflip/shared/result \
hashblocks/sha512/wflip/C0/result \
hashblocks/sha512/wflip/C1/result \
hash/sha512/ref/shared/result \
hash/sha512/ref/C0/result \
hash/sha512/ref/C1/result \
pow/inv25519/arm64-maa4-intmul/shared/result \
pow/inv25519/arm64-maa4-intmul/C0/result \
unified/fe25519unpackc/1/C0/result \
pow/inv25519/arm64-maa4-intmul/C1/result \
unified/fe25519unpackc/2/C1/result \
pow/inv25519/arm64-maa4-redmul/shared/result \
pow/inv25519/arm64-maa4-redmul/C0/result \
pow/inv25519/arm64-maa4-redmul/C1/result \
pow/inv25519/donna_c64/shared/result \
pow/inv25519/donna_c64/C0/result \
pow/inv25519/donna_c64/C1/result \
pow/inv25519/ref10/shared/result \
pow/inv25519/ref10/C0/result \
unified/fefrombytesc/1/C0/result \
unified/femulc/1/C0/result \
unified/fesqc/1/C0/result \
unified/fetobytesc/1/C0/result \
pow/inv25519/ref10/C1/result \
unified/fefrombytesc/2/C1/result \
unified/femulc/2/C1/result \
unified/fesqc/2/C1/result \
unified/fetobytesc/2/C1/result \
powbatch/inv25519/ref10/shared/result \
powbatch/inv25519/ref10/C0/result \
unified/fe0c/1/C0/result \
unified/fe1c/1/C0/result \
unified/fecmovc/1/C0/result \
powbatch/inv25519/ref10/C1/result \
unified/fe0c/2/C1/result \
unified/fe1c/2/C1/result \
unified/fecmovc/2/C1/result \
powbatch/inv25519/simple/shared/result \
powbatch/inv25519/simple/C0/result \
powbatch/inv25519/simple/C1/result \
nP/montgomery25519/arm64-maa4-intmul/shared/result \
unified/fe25519freezeS/1/shared/result \
unified/fe25519mulS/1/shared/result \
unified/fe25519nsquareS/1/shared/result \
unified/fe25519squareS/1/shared/result \
nP/montgomery25519/arm64-maa4-intmul/C0/result \
unified/fe25519invertc/1/C0/result \
unified/fe25519packc/1/C0/result \
unified/fe25519unpackc/3/C0/result \
nP/montgomery25519/arm64-maa4-intmul/C1/result \
unified/fe25519invertc/2/C1/result \
unified/fe25519packc/2/C1/result \
unified/fe25519unpackc/4/C1/result \
nP/montgomery25519/arm64-maa4-redmul/shared/result \
unified/fe25519mulS/2/shared/result \
unified/fe25519nsquareS/2/shared/result \
unified/fe25519squareS/2/shared/result \
nP/montgomery25519/arm64-maa4-redmul/C0/result \
nP/montgomery25519/arm64-maa4-redmul/C1/result \
nP/montgomery25519/donna_c64/shared/result \
nP/montgomery25519/donna_c64/C0/result \
nP/montgomery25519/donna_c64/C1/result \
nP/montgomery25519/ref10/shared/result \
nP/montgomery25519/ref10/C0/result \
nP/montgomery25519/ref10/C1/result \
nPbatch/montgomery25519/ref/shared/result \
nPbatch/montgomery25519/ref/C0/result \
nPbatch/montgomery25519/ref/C1/result \
nG/merged25519/arm64-maa4-intmul/shared/result \
unified/fe25519addS/1/shared/result \
unified/fe25519cmovS/1/shared/result \
unified/fe25519subS/1/shared/result \
unified/sharedbasedatac/1/shared/result \
nG/merged25519/arm64-maa4-intmul/C0/result \
unified/fe25519getparityc/1/C0/result \
unified/sc25519from32bytesc/1/C0/result \
unified/sc25519window4c/1/C0/result \
nG/merged25519/arm64-maa4-intmul/C1/result \
unified/fe25519getparityc/2/C1/result \
unified/sc25519from32bytesc/2/C1/result \
unified/sc25519window4c/2/C1/result \
nG/merged25519/arm64-maa4-redmul/shared/result \
nG/merged25519/arm64-maa4-redmul/C0/result \
nG/merged25519/arm64-maa4-redmul/C1/result \
nG/merged25519/ref10/shared/result \
nG/merged25519/ref10/C0/result \
unified/feaddc/1/C0/result \
unified/fecopyc/1/C0/result \
unified/fefrombytesc/3/C0/result \
unified/feinvertc/1/C0/result \
unified/feisnegativec/1/C0/result \
unified/femulc/3/C0/result \
unified/fenegc/1/C0/result \
unified/fesqc/3/C0/result \
unified/fesq2c/1/C0/result \
unified/fesubc/1/C0/result \
unified/fetobytesc/3/C0/result \
unified/gemaddc/1/C0/result \
unified/gep1p1top2c/1/C0/result \
unified/gep1p1top3c/1/C0/result \
unified/gep2dblc/1/C0/result \
unified/gep3dblc/1/C0/result \
unified/gep3top2c/1/C0/result \
nG/merged25519/ref10/C1/result \
unified/feaddc/2/C1/result \
unified/fecopyc/2/C1/result \
unified/fefrombytesc/4/C1/result \
unified/feinvertc/2/C1/result \
unified/feisnegativec/2/C1/result \
unified/femulc/4/C1/result \
unified/fenegc/2/C1/result \
unified/fesqc/4/C1/result \
unified/fesq2c/2/C1/result \
unified/fesubc/2/C1/result \
unified/fetobytesc/4/C1/result \
unified/gemaddc/2/C1/result \
unified/gep1p1top2c/2/C1/result \
unified/gep1p1top3c/2/C1/result \
unified/gep2dblc/2/C1/result \
unified/gep3dblc/2/C1/result \
unified/gep3top2c/2/C1/result \
nG/montgomery25519/ref/shared/result \
nG/montgomery25519/ref/C0/result \
nG/montgomery25519/ref/C1/result \
nG/montgomery25519/usemerged/shared/result \
nG/montgomery25519/usemerged/C0/result \
nG/montgomery25519/usemerged/C1/result \
mGnP/ed25519/arm64-maa4-intmul/shared/result \
unified/ge25519doublescalarmultprecomputeS/1/shared/result \
unified/sc25519barrettS/1/shared/result \
mGnP/ed25519/arm64-maa4-intmul/C0/result \
unified/fe25519iseqc/1/C0/result \
unified/fe25519pow2523c/1/C0/result \
unified/fe25519setintc/1/C0/result \
unified/sc25519from64bytesc/1/C0/result \
unified/sc25519slidec/1/C0/result \
unified/sc25519to32bytesc/1/C0/result \
mGnP/ed25519/arm64-maa4-intmul/C1/result \
unified/fe25519iseqc/2/C1/result \
unified/fe25519pow2523c/2/C1/result \
unified/fe25519setintc/2/C1/result \
unified/sc25519from64bytesc/2/C1/result \
unified/sc25519slidec/2/C1/result \
unified/sc25519to32bytesc/2/C1/result \
mGnP/ed25519/arm64-maa4-redmul/shared/result \
unified/ge25519doublescalarmultprecomputeS/2/shared/result \
mGnP/ed25519/arm64-maa4-redmul/C0/result \
unified/fe25519pow2523c/3/C0/result \
mGnP/ed25519/arm64-maa4-redmul/C1/result \
unified/fe25519pow2523c/4/C1/result \
mGnP/ed25519/ref10/shared/result \
mGnP/ed25519/ref10/C0/result \
unified/feisnonzeroc/1/C0/result \
unified/fepow22523c/1/C0/result \
unified/geaddc/1/C0/result \
unified/gep3tocachedc/1/C0/result \
unified/gesubc/1/C0/result \
unified/getobytesc/1/C0/result \
unified/screducec/1/C0/result \
mGnP/ed25519/ref10/C1/result \
unified/feisnonzeroc/2/C1/result \
unified/fepow22523c/2/C1/result \
unified/geaddc/2/C1/result \
unified/gep3tocachedc/2/C1/result \
unified/gesubc/2/C1/result \
unified/getobytesc/2/C1/result \
unified/screducec/2/C1/result \
multiscalar/ed25519/arm64-maa4-intmul/shared/result \
multiscalar/ed25519/arm64-maa4-intmul/C0/result \
multiscalar/ed25519/arm64-maa4-intmul/C1/result \
multiscalar/ed25519/arm64-maa4-intmul-p3/shared/result \
multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result \
multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result \
multiscalar/ed25519/arm64-maa4-redmul/shared/result \
multiscalar/ed25519/arm64-maa4-redmul/C0/result \
multiscalar/ed25519/arm64-maa4-redmul/C1/result \
multiscalar/ed25519/arm64-maa4-redmul-p3/shared/result \
multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result \
multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result \
multiscalar/ed25519/ref10/shared/result \
multiscalar/ed25519/ref10/C0/result \
multiscalar/ed25519/ref10/C1/result \
dh/x25519/wrapper/shared/result \
dh/x25519/wrapper/C0/result \
dh/x25519/wrapper/C1/result \
sign/ed25519/ref10/shared/result \
sign/ed25519/ref10/C0/result \
sign/ed25519/ref10/C1/result \

	scripts/result-impl < builddirs > result-impl

pow/inv25519/arm64-maa4-intmul/C0/allcompiled: pow/inv25519/arm64-maa4-intmul/shared/allcompiled unified/fe25519unpackc/1/C0/allcompiled

pow/inv25519/arm64-maa4-intmul/C1/allcompiled: pow/inv25519/arm64-maa4-intmul/shared/allcompiled unified/fe25519unpackc/2/C1/allcompiled

pow/inv25519/arm64-maa4-redmul/C0/allcompiled: pow/inv25519/arm64-maa4-redmul/shared/allcompiled unified/fe25519unpackc/1/C0/allcompiled

pow/inv25519/arm64-maa4-redmul/C1/allcompiled: pow/inv25519/arm64-maa4-redmul/shared/allcompiled unified/fe25519unpackc/2/C1/allcompiled

pow/inv25519/ref10/C0/allcompiled: unified/fefrombytesc/1/C0/allcompiled unified/femulc/1/C0/allcompiled unified/fesqc/1/C0/allcompiled unified/fetobytesc/1/C0/allcompiled

pow/inv25519/ref10/C1/allcompiled: unified/fefrombytesc/2/C1/allcompiled unified/femulc/2/C1/allcompiled unified/fesqc/2/C1/allcompiled unified/fetobytesc/2/C1/allcompiled

powbatch/inv25519/ref10/C0/allcompiled: unified/fe0c/1/C0/allcompiled unified/fe1c/1/C0/allcompiled unified/fecmovc/1/C0/allcompiled

powbatch/inv25519/ref10/C1/allcompiled: unified/fe0c/2/C1/allcompiled unified/fe1c/2/C1/allcompiled unified/fecmovc/2/C1/allcompiled

nP/montgomery25519/arm64-maa4-intmul/C0/allcompiled: nP/montgomery25519/arm64-maa4-intmul/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/1/shared/allcompiled unified/fe25519nsquareS/1/shared/allcompiled unified/fe25519squareS/1/shared/allcompiled unified/fe25519invertc/1/C0/allcompiled unified/fe25519packc/1/C0/allcompiled unified/fe25519unpackc/3/C0/allcompiled

nP/montgomery25519/arm64-maa4-intmul/C1/allcompiled: nP/montgomery25519/arm64-maa4-intmul/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/1/shared/allcompiled unified/fe25519nsquareS/1/shared/allcompiled unified/fe25519squareS/1/shared/allcompiled unified/fe25519invertc/2/C1/allcompiled unified/fe25519packc/2/C1/allcompiled unified/fe25519unpackc/4/C1/allcompiled

nP/montgomery25519/arm64-maa4-redmul/C0/allcompiled: nP/montgomery25519/arm64-maa4-redmul/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/2/shared/allcompiled unified/fe25519nsquareS/2/shared/allcompiled unified/fe25519squareS/2/shared/allcompiled unified/fe25519invertc/1/C0/allcompiled unified/fe25519packc/1/C0/allcompiled unified/fe25519unpackc/3/C0/allcompiled

nP/montgomery25519/arm64-maa4-redmul/C1/allcompiled: nP/montgomery25519/arm64-maa4-redmul/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/2/shared/allcompiled unified/fe25519nsquareS/2/shared/allcompiled unified/fe25519squareS/2/shared/allcompiled unified/fe25519invertc/2/C1/allcompiled unified/fe25519packc/2/C1/allcompiled unified/fe25519unpackc/4/C1/allcompiled

nP/montgomery25519/ref10/C0/allcompiled: unified/fefrombytesc/1/C0/allcompiled unified/femulc/1/C0/allcompiled unified/fesqc/1/C0/allcompiled unified/fetobytesc/1/C0/allcompiled

nP/montgomery25519/ref10/C1/allcompiled: unified/fefrombytesc/2/C1/allcompiled unified/femulc/2/C1/allcompiled unified/fesqc/2/C1/allcompiled unified/fetobytesc/2/C1/allcompiled

nG/merged25519/arm64-maa4-intmul/C0/allcompiled: nG/merged25519/arm64-maa4-intmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519cmovS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/1/shared/allcompiled unified/fe25519nsquareS/1/shared/allcompiled unified/fe25519squareS/1/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/sharedbasedatac/1/shared/allcompiled unified/fe25519getparityc/1/C0/allcompiled unified/fe25519invertc/1/C0/allcompiled unified/fe25519packc/1/C0/allcompiled unified/fe25519unpackc/3/C0/allcompiled unified/sc25519from32bytesc/1/C0/allcompiled unified/sc25519window4c/1/C0/allcompiled

nG/merged25519/arm64-maa4-intmul/C1/allcompiled: nG/merged25519/arm64-maa4-intmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519cmovS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/1/shared/allcompiled unified/fe25519nsquareS/1/shared/allcompiled unified/fe25519squareS/1/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/sharedbasedatac/1/shared/allcompiled unified/fe25519getparityc/2/C1/allcompiled unified/fe25519invertc/2/C1/allcompiled unified/fe25519packc/2/C1/allcompiled unified/fe25519unpackc/4/C1/allcompiled unified/sc25519from32bytesc/2/C1/allcompiled unified/sc25519window4c/2/C1/allcompiled

nG/merged25519/arm64-maa4-redmul/C0/allcompiled: nG/merged25519/arm64-maa4-redmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519cmovS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/2/shared/allcompiled unified/fe25519nsquareS/2/shared/allcompiled unified/fe25519squareS/2/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/sharedbasedatac/1/shared/allcompiled unified/fe25519getparityc/1/C0/allcompiled unified/fe25519invertc/1/C0/allcompiled unified/fe25519packc/1/C0/allcompiled unified/fe25519unpackc/3/C0/allcompiled unified/sc25519from32bytesc/1/C0/allcompiled unified/sc25519window4c/1/C0/allcompiled

nG/merged25519/arm64-maa4-redmul/C1/allcompiled: nG/merged25519/arm64-maa4-redmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519cmovS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/2/shared/allcompiled unified/fe25519nsquareS/2/shared/allcompiled unified/fe25519squareS/2/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/sharedbasedatac/1/shared/allcompiled unified/fe25519getparityc/2/C1/allcompiled unified/fe25519invertc/2/C1/allcompiled unified/fe25519packc/2/C1/allcompiled unified/fe25519unpackc/4/C1/allcompiled unified/sc25519from32bytesc/2/C1/allcompiled unified/sc25519window4c/2/C1/allcompiled

nG/merged25519/ref10/C0/allcompiled: nG/merged25519/ref10/shared/allcompiled unified/fe0c/1/C0/allcompiled unified/fe1c/1/C0/allcompiled unified/feaddc/1/C0/allcompiled unified/fecmovc/1/C0/allcompiled unified/fecopyc/1/C0/allcompiled unified/fefrombytesc/3/C0/allcompiled unified/feinvertc/1/C0/allcompiled unified/feisnegativec/1/C0/allcompiled unified/femulc/3/C0/allcompiled unified/fenegc/1/C0/allcompiled unified/fesqc/3/C0/allcompiled unified/fesq2c/1/C0/allcompiled unified/fesubc/1/C0/allcompiled unified/fetobytesc/3/C0/allcompiled unified/gemaddc/1/C0/allcompiled unified/gep1p1top2c/1/C0/allcompiled unified/gep1p1top3c/1/C0/allcompiled unified/gep2dblc/1/C0/allcompiled unified/gep3dblc/1/C0/allcompiled unified/gep3top2c/1/C0/allcompiled

nG/merged25519/ref10/C1/allcompiled: nG/merged25519/ref10/shared/allcompiled unified/fe0c/2/C1/allcompiled unified/fe1c/2/C1/allcompiled unified/feaddc/2/C1/allcompiled unified/fecmovc/2/C1/allcompiled unified/fecopyc/2/C1/allcompiled unified/fefrombytesc/4/C1/allcompiled unified/feinvertc/2/C1/allcompiled unified/feisnegativec/2/C1/allcompiled unified/femulc/4/C1/allcompiled unified/fenegc/2/C1/allcompiled unified/fesqc/4/C1/allcompiled unified/fesq2c/2/C1/allcompiled unified/fesubc/2/C1/allcompiled unified/fetobytesc/4/C1/allcompiled unified/gemaddc/2/C1/allcompiled unified/gep1p1top2c/2/C1/allcompiled unified/gep1p1top3c/2/C1/allcompiled unified/gep2dblc/2/C1/allcompiled unified/gep3dblc/2/C1/allcompiled unified/gep3top2c/2/C1/allcompiled

mGnP/ed25519/arm64-maa4-intmul/C0/allcompiled: mGnP/ed25519/arm64-maa4-intmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/1/shared/allcompiled unified/fe25519nsquareS/1/shared/allcompiled unified/fe25519squareS/1/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/ge25519doublescalarmultprecomputeS/1/shared/allcompiled unified/sc25519barrettS/1/shared/allcompiled unified/fe25519getparityc/1/C0/allcompiled unified/fe25519invertc/1/C0/allcompiled unified/fe25519iseqc/1/C0/allcompiled unified/fe25519packc/1/C0/allcompiled unified/fe25519pow2523c/1/C0/allcompiled unified/fe25519setintc/1/C0/allcompiled unified/fe25519unpackc/3/C0/allcompiled unified/sc25519from32bytesc/1/C0/allcompiled unified/sc25519from64bytesc/1/C0/allcompiled unified/sc25519slidec/1/C0/allcompiled unified/sc25519to32bytesc/1/C0/allcompiled

mGnP/ed25519/arm64-maa4-intmul/C1/allcompiled: mGnP/ed25519/arm64-maa4-intmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/1/shared/allcompiled unified/fe25519nsquareS/1/shared/allcompiled unified/fe25519squareS/1/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/ge25519doublescalarmultprecomputeS/1/shared/allcompiled unified/sc25519barrettS/1/shared/allcompiled unified/fe25519getparityc/2/C1/allcompiled unified/fe25519invertc/2/C1/allcompiled unified/fe25519iseqc/2/C1/allcompiled unified/fe25519packc/2/C1/allcompiled unified/fe25519pow2523c/2/C1/allcompiled unified/fe25519setintc/2/C1/allcompiled unified/fe25519unpackc/4/C1/allcompiled unified/sc25519from32bytesc/2/C1/allcompiled unified/sc25519from64bytesc/2/C1/allcompiled unified/sc25519slidec/2/C1/allcompiled unified/sc25519to32bytesc/2/C1/allcompiled

mGnP/ed25519/arm64-maa4-redmul/C0/allcompiled: mGnP/ed25519/arm64-maa4-redmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/2/shared/allcompiled unified/fe25519nsquareS/2/shared/allcompiled unified/fe25519squareS/2/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/ge25519doublescalarmultprecomputeS/2/shared/allcompiled unified/sc25519barrettS/1/shared/allcompiled unified/fe25519getparityc/1/C0/allcompiled unified/fe25519invertc/1/C0/allcompiled unified/fe25519iseqc/1/C0/allcompiled unified/fe25519packc/1/C0/allcompiled unified/fe25519pow2523c/3/C0/allcompiled unified/fe25519setintc/1/C0/allcompiled unified/fe25519unpackc/3/C0/allcompiled unified/sc25519from32bytesc/1/C0/allcompiled unified/sc25519from64bytesc/1/C0/allcompiled unified/sc25519slidec/1/C0/allcompiled unified/sc25519to32bytesc/1/C0/allcompiled

mGnP/ed25519/arm64-maa4-redmul/C1/allcompiled: mGnP/ed25519/arm64-maa4-redmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/2/shared/allcompiled unified/fe25519nsquareS/2/shared/allcompiled unified/fe25519squareS/2/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/ge25519doublescalarmultprecomputeS/2/shared/allcompiled unified/sc25519barrettS/1/shared/allcompiled unified/fe25519getparityc/2/C1/allcompiled unified/fe25519invertc/2/C1/allcompiled unified/fe25519iseqc/2/C1/allcompiled unified/fe25519packc/2/C1/allcompiled unified/fe25519pow2523c/4/C1/allcompiled unified/fe25519setintc/2/C1/allcompiled unified/fe25519unpackc/4/C1/allcompiled unified/sc25519from32bytesc/2/C1/allcompiled unified/sc25519from64bytesc/2/C1/allcompiled unified/sc25519slidec/2/C1/allcompiled unified/sc25519to32bytesc/2/C1/allcompiled

mGnP/ed25519/ref10/C0/allcompiled: mGnP/ed25519/ref10/shared/allcompiled unified/fe0c/1/C0/allcompiled unified/fe1c/1/C0/allcompiled unified/feaddc/1/C0/allcompiled unified/fecopyc/1/C0/allcompiled unified/fefrombytesc/3/C0/allcompiled unified/feinvertc/1/C0/allcompiled unified/feisnegativec/1/C0/allcompiled unified/feisnonzeroc/1/C0/allcompiled unified/femulc/3/C0/allcompiled unified/fenegc/1/C0/allcompiled unified/fepow22523c/1/C0/allcompiled unified/fesqc/3/C0/allcompiled unified/fesq2c/1/C0/allcompiled unified/fesubc/1/C0/allcompiled unified/fetobytesc/3/C0/allcompiled unified/geaddc/1/C0/allcompiled unified/gemaddc/1/C0/allcompiled unified/gep1p1top2c/1/C0/allcompiled unified/gep1p1top3c/1/C0/allcompiled unified/gep2dblc/1/C0/allcompiled unified/gep3dblc/1/C0/allcompiled unified/gep3tocachedc/1/C0/allcompiled unified/gep3top2c/1/C0/allcompiled unified/gesubc/1/C0/allcompiled unified/getobytesc/1/C0/allcompiled unified/screducec/1/C0/allcompiled

mGnP/ed25519/ref10/C1/allcompiled: mGnP/ed25519/ref10/shared/allcompiled unified/fe0c/2/C1/allcompiled unified/fe1c/2/C1/allcompiled unified/feaddc/2/C1/allcompiled unified/fecopyc/2/C1/allcompiled unified/fefrombytesc/4/C1/allcompiled unified/feinvertc/2/C1/allcompiled unified/feisnegativec/2/C1/allcompiled unified/feisnonzeroc/2/C1/allcompiled unified/femulc/4/C1/allcompiled unified/fenegc/2/C1/allcompiled unified/fepow22523c/2/C1/allcompiled unified/fesqc/4/C1/allcompiled unified/fesq2c/2/C1/allcompiled unified/fesubc/2/C1/allcompiled unified/fetobytesc/4/C1/allcompiled unified/geaddc/2/C1/allcompiled unified/gemaddc/2/C1/allcompiled unified/gep1p1top2c/2/C1/allcompiled unified/gep1p1top3c/2/C1/allcompiled unified/gep2dblc/2/C1/allcompiled unified/gep3dblc/2/C1/allcompiled unified/gep3tocachedc/2/C1/allcompiled unified/gep3top2c/2/C1/allcompiled unified/gesubc/2/C1/allcompiled unified/getobytesc/2/C1/allcompiled unified/screducec/2/C1/allcompiled

multiscalar/ed25519/arm64-maa4-intmul/C0/allcompiled: multiscalar/ed25519/arm64-maa4-intmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/1/shared/allcompiled unified/fe25519nsquareS/1/shared/allcompiled unified/fe25519squareS/1/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/ge25519doublescalarmultprecomputeS/1/shared/allcompiled unified/fe25519getparityc/1/C0/allcompiled unified/fe25519invertc/1/C0/allcompiled unified/fe25519iseqc/1/C0/allcompiled unified/fe25519packc/1/C0/allcompiled unified/fe25519pow2523c/1/C0/allcompiled unified/fe25519setintc/1/C0/allcompiled unified/fe25519unpackc/3/C0/allcompiled unified/sc25519from32bytesc/1/C0/allcompiled unified/sc25519slidec/1/C0/allcompiled unified/sc25519to32bytesc/1/C0/allcompiled

multiscalar/ed25519/arm64-maa4-intmul/C1/allcompiled: multiscalar/ed25519/arm64-maa4-intmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/1/shared/allcompiled unified/fe25519nsquareS/1/shared/allcompiled unified/fe25519squareS/1/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/ge25519doublescalarmultprecomputeS/1/shared/allcompiled unified/fe25519getparityc/2/C1/allcompiled unified/fe25519invertc/2/C1/allcompiled unified/fe25519iseqc/2/C1/allcompiled unified/fe25519packc/2/C1/allcompiled unified/fe25519pow2523c/2/C1/allcompiled unified/fe25519setintc/2/C1/allcompiled unified/fe25519unpackc/4/C1/allcompiled unified/sc25519from32bytesc/2/C1/allcompiled unified/sc25519slidec/2/C1/allcompiled unified/sc25519to32bytesc/2/C1/allcompiled

multiscalar/ed25519/arm64-maa4-intmul-p3/C0/allcompiled: multiscalar/ed25519/arm64-maa4-intmul-p3/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/1/shared/allcompiled unified/fe25519nsquareS/1/shared/allcompiled unified/fe25519squareS/1/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/fe25519getparityc/1/C0/allcompiled unified/fe25519invertc/1/C0/allcompiled unified/fe25519iseqc/1/C0/allcompiled unified/fe25519packc/1/C0/allcompiled unified/fe25519pow2523c/1/C0/allcompiled unified/fe25519setintc/1/C0/allcompiled unified/fe25519unpackc/3/C0/allcompiled unified/sc25519from32bytesc/1/C0/allcompiled unified/sc25519slidec/1/C0/allcompiled unified/sc25519to32bytesc/1/C0/allcompiled

multiscalar/ed25519/arm64-maa4-intmul-p3/C1/allcompiled: multiscalar/ed25519/arm64-maa4-intmul-p3/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/1/shared/allcompiled unified/fe25519nsquareS/1/shared/allcompiled unified/fe25519squareS/1/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/fe25519getparityc/2/C1/allcompiled unified/fe25519invertc/2/C1/allcompiled unified/fe25519iseqc/2/C1/allcompiled unified/fe25519packc/2/C1/allcompiled unified/fe25519pow2523c/2/C1/allcompiled unified/fe25519setintc/2/C1/allcompiled unified/fe25519unpackc/4/C1/allcompiled unified/sc25519from32bytesc/2/C1/allcompiled unified/sc25519slidec/2/C1/allcompiled unified/sc25519to32bytesc/2/C1/allcompiled

multiscalar/ed25519/arm64-maa4-redmul/C0/allcompiled: multiscalar/ed25519/arm64-maa4-redmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/2/shared/allcompiled unified/fe25519nsquareS/2/shared/allcompiled unified/fe25519squareS/2/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/ge25519doublescalarmultprecomputeS/2/shared/allcompiled unified/fe25519getparityc/1/C0/allcompiled unified/fe25519invertc/1/C0/allcompiled unified/fe25519iseqc/1/C0/allcompiled unified/fe25519packc/1/C0/allcompiled unified/fe25519pow2523c/3/C0/allcompiled unified/fe25519setintc/1/C0/allcompiled unified/fe25519unpackc/3/C0/allcompiled unified/sc25519from32bytesc/1/C0/allcompiled unified/sc25519slidec/1/C0/allcompiled unified/sc25519to32bytesc/1/C0/allcompiled

multiscalar/ed25519/arm64-maa4-redmul/C1/allcompiled: multiscalar/ed25519/arm64-maa4-redmul/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/2/shared/allcompiled unified/fe25519nsquareS/2/shared/allcompiled unified/fe25519squareS/2/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/ge25519doublescalarmultprecomputeS/2/shared/allcompiled unified/fe25519getparityc/2/C1/allcompiled unified/fe25519invertc/2/C1/allcompiled unified/fe25519iseqc/2/C1/allcompiled unified/fe25519packc/2/C1/allcompiled unified/fe25519pow2523c/4/C1/allcompiled unified/fe25519setintc/2/C1/allcompiled unified/fe25519unpackc/4/C1/allcompiled unified/sc25519from32bytesc/2/C1/allcompiled unified/sc25519slidec/2/C1/allcompiled unified/sc25519to32bytesc/2/C1/allcompiled

multiscalar/ed25519/arm64-maa4-redmul-p3/C0/allcompiled: multiscalar/ed25519/arm64-maa4-redmul-p3/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/2/shared/allcompiled unified/fe25519nsquareS/2/shared/allcompiled unified/fe25519squareS/2/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/fe25519getparityc/1/C0/allcompiled unified/fe25519invertc/1/C0/allcompiled unified/fe25519iseqc/1/C0/allcompiled unified/fe25519packc/1/C0/allcompiled unified/fe25519pow2523c/3/C0/allcompiled unified/fe25519setintc/1/C0/allcompiled unified/fe25519unpackc/3/C0/allcompiled unified/sc25519from32bytesc/1/C0/allcompiled unified/sc25519slidec/1/C0/allcompiled unified/sc25519to32bytesc/1/C0/allcompiled

multiscalar/ed25519/arm64-maa4-redmul-p3/C1/allcompiled: multiscalar/ed25519/arm64-maa4-redmul-p3/shared/allcompiled unified/fe25519addS/1/shared/allcompiled unified/fe25519freezeS/1/shared/allcompiled unified/fe25519mulS/2/shared/allcompiled unified/fe25519nsquareS/2/shared/allcompiled unified/fe25519squareS/2/shared/allcompiled unified/fe25519subS/1/shared/allcompiled unified/fe25519getparityc/2/C1/allcompiled unified/fe25519invertc/2/C1/allcompiled unified/fe25519iseqc/2/C1/allcompiled unified/fe25519packc/2/C1/allcompiled unified/fe25519pow2523c/4/C1/allcompiled unified/fe25519setintc/2/C1/allcompiled unified/fe25519unpackc/4/C1/allcompiled unified/sc25519from32bytesc/2/C1/allcompiled unified/sc25519slidec/2/C1/allcompiled unified/sc25519to32bytesc/2/C1/allcompiled

multiscalar/ed25519/ref10/C0/allcompiled: unified/fe0c/1/C0/allcompiled unified/fe1c/1/C0/allcompiled unified/feaddc/1/C0/allcompiled unified/fecopyc/1/C0/allcompiled unified/fefrombytesc/3/C0/allcompiled unified/feinvertc/1/C0/allcompiled unified/feisnegativec/1/C0/allcompiled unified/feisnonzeroc/1/C0/allcompiled unified/femulc/3/C0/allcompiled unified/fenegc/1/C0/allcompiled unified/fepow22523c/1/C0/allcompiled unified/fesqc/3/C0/allcompiled unified/fesq2c/1/C0/allcompiled unified/fesubc/1/C0/allcompiled unified/fetobytesc/3/C0/allcompiled unified/geaddc/1/C0/allcompiled unified/gep1p1top2c/1/C0/allcompiled unified/gep1p1top3c/1/C0/allcompiled unified/gep2dblc/1/C0/allcompiled unified/gep3dblc/1/C0/allcompiled unified/gep3tocachedc/1/C0/allcompiled unified/gep3top2c/1/C0/allcompiled unified/gesubc/1/C0/allcompiled unified/getobytesc/1/C0/allcompiled

multiscalar/ed25519/ref10/C1/allcompiled: unified/fe0c/2/C1/allcompiled unified/fe1c/2/C1/allcompiled unified/feaddc/2/C1/allcompiled unified/fecopyc/2/C1/allcompiled unified/fefrombytesc/4/C1/allcompiled unified/feinvertc/2/C1/allcompiled unified/feisnegativec/2/C1/allcompiled unified/feisnonzeroc/2/C1/allcompiled unified/femulc/4/C1/allcompiled unified/fenegc/2/C1/allcompiled unified/fepow22523c/2/C1/allcompiled unified/fesqc/4/C1/allcompiled unified/fesq2c/2/C1/allcompiled unified/fesubc/2/C1/allcompiled unified/fetobytesc/4/C1/allcompiled unified/geaddc/2/C1/allcompiled unified/gep1p1top2c/2/C1/allcompiled unified/gep1p1top3c/2/C1/allcompiled unified/gep2dblc/2/C1/allcompiled unified/gep3dblc/2/C1/allcompiled unified/gep3tocachedc/2/C1/allcompiled unified/gep3top2c/2/C1/allcompiled unified/gesubc/2/C1/allcompiled unified/getobytesc/2/C1/allcompiled

sign/ed25519/ref10/C0/allcompiled: unified/screducec/1/C0/allcompiled

sign/ed25519/ref10/C1/allcompiled: unified/screducec/2/C1/allcompiled

verify/32/ref/shared/allcompiled: 
	touch verify/32/ref/shared/allcompiled

verify/32/ref/C0/allcompiled: verify/32/ref/C0/verify.o
	touch verify/32/ref/C0/allcompiled

verify/32/ref/C1/allcompiled: verify/32/ref/C1/verify.o
	touch verify/32/ref/C1/allcompiled

hashblocks/sha512/compact/shared/allcompiled: 
	touch hashblocks/sha512/compact/shared/allcompiled

hashblocks/sha512/compact/C0/allcompiled: hashblocks/sha512/compact/C0/blocks.o
	touch hashblocks/sha512/compact/C0/allcompiled

hashblocks/sha512/compact/C1/allcompiled: hashblocks/sha512/compact/C1/blocks.o
	touch hashblocks/sha512/compact/C1/allcompiled

hashblocks/sha512/compact2/shared/allcompiled: 
	touch hashblocks/sha512/compact2/shared/allcompiled

hashblocks/sha512/compact2/C0/allcompiled: hashblocks/sha512/compact2/C0/blocks.o
	touch hashblocks/sha512/compact2/C0/allcompiled

hashblocks/sha512/compact2/C1/allcompiled: hashblocks/sha512/compact2/C1/blocks.o
	touch hashblocks/sha512/compact2/C1/allcompiled

hashblocks/sha512/compact3/shared/allcompiled: 
	touch hashblocks/sha512/compact3/shared/allcompiled

hashblocks/sha512/compact3/C0/allcompiled: hashblocks/sha512/compact3/C0/blocks.o
	touch hashblocks/sha512/compact3/C0/allcompiled

hashblocks/sha512/compact3/C1/allcompiled: hashblocks/sha512/compact3/C1/blocks.o
	touch hashblocks/sha512/compact3/C1/allcompiled

hashblocks/sha512/compact4/shared/allcompiled: 
	touch hashblocks/sha512/compact4/shared/allcompiled

hashblocks/sha512/compact4/C0/allcompiled: hashblocks/sha512/compact4/C0/blocks.o
	touch hashblocks/sha512/compact4/C0/allcompiled

hashblocks/sha512/compact4/C1/allcompiled: hashblocks/sha512/compact4/C1/blocks.o
	touch hashblocks/sha512/compact4/C1/allcompiled

hashblocks/sha512/inplace/shared/allcompiled: 
	touch hashblocks/sha512/inplace/shared/allcompiled

hashblocks/sha512/inplace/C0/allcompiled: hashblocks/sha512/inplace/C0/blocks.o
	touch hashblocks/sha512/inplace/C0/allcompiled

hashblocks/sha512/inplace/C1/allcompiled: hashblocks/sha512/inplace/C1/blocks.o
	touch hashblocks/sha512/inplace/C1/allcompiled

hashblocks/sha512/ref/shared/allcompiled: 
	touch hashblocks/sha512/ref/shared/allcompiled

hashblocks/sha512/ref/C0/allcompiled: hashblocks/sha512/ref/C0/blocks.o
	touch hashblocks/sha512/ref/C0/allcompiled

hashblocks/sha512/ref/C1/allcompiled: hashblocks/sha512/ref/C1/blocks.o
	touch hashblocks/sha512/ref/C1/allcompiled

hashblocks/sha512/wflip/shared/allcompiled: 
	touch hashblocks/sha512/wflip/shared/allcompiled

hashblocks/sha512/wflip/C0/allcompiled: hashblocks/sha512/wflip/C0/constants.o hashblocks/sha512/wflip/C0/inner.o
	touch hashblocks/sha512/wflip/C0/allcompiled

hashblocks/sha512/wflip/C1/allcompiled: hashblocks/sha512/wflip/C1/constants.o hashblocks/sha512/wflip/C1/inner.o
	touch hashblocks/sha512/wflip/C1/allcompiled

hash/sha512/ref/shared/allcompiled: 
	touch hash/sha512/ref/shared/allcompiled

hash/sha512/ref/C0/allcompiled: hash/sha512/ref/C0/hash.o
	touch hash/sha512/ref/C0/allcompiled

hash/sha512/ref/C1/allcompiled: hash/sha512/ref/C1/hash.o
	touch hash/sha512/ref/C1/allcompiled

pow/inv25519/arm64-maa4-intmul/shared/allcompiled: pow/inv25519/arm64-maa4-intmul/shared/fe25519_freeze.o pow/inv25519/arm64-maa4-intmul/shared/fe25519_mul.o pow/inv25519/arm64-maa4-intmul/shared/fe25519_nsquare.o pow/inv25519/arm64-maa4-intmul/shared/fe25519_square.o
	touch pow/inv25519/arm64-maa4-intmul/shared/allcompiled

pow/inv25519/arm64-maa4-intmul/C0/allcompiled: pow/inv25519/arm64-maa4-intmul/C0/api.o pow/inv25519/arm64-maa4-intmul/C0/fe25519_invert.o pow/inv25519/arm64-maa4-intmul/C0/fe25519_pack.o
	touch pow/inv25519/arm64-maa4-intmul/C0/allcompiled

unified/fe25519unpackc/1/C0/allcompiled: unified/fe25519unpackc/1/C0/fe25519_unpack.o
	touch unified/fe25519unpackc/1/C0/allcompiled

pow/inv25519/arm64-maa4-intmul/C1/allcompiled: pow/inv25519/arm64-maa4-intmul/C1/api.o pow/inv25519/arm64-maa4-intmul/C1/fe25519_invert.o pow/inv25519/arm64-maa4-intmul/C1/fe25519_pack.o
	touch pow/inv25519/arm64-maa4-intmul/C1/allcompiled

unified/fe25519unpackc/2/C1/allcompiled: unified/fe25519unpackc/2/C1/fe25519_unpack.o
	touch unified/fe25519unpackc/2/C1/allcompiled

pow/inv25519/arm64-maa4-redmul/shared/allcompiled: pow/inv25519/arm64-maa4-redmul/shared/fe25519_freeze.o pow/inv25519/arm64-maa4-redmul/shared/fe25519_mul.o pow/inv25519/arm64-maa4-redmul/shared/fe25519_nsquare.o pow/inv25519/arm64-maa4-redmul/shared/fe25519_square.o
	touch pow/inv25519/arm64-maa4-redmul/shared/allcompiled

pow/inv25519/arm64-maa4-redmul/C0/allcompiled: pow/inv25519/arm64-maa4-redmul/C0/api.o pow/inv25519/arm64-maa4-redmul/C0/fe25519_invert.o pow/inv25519/arm64-maa4-redmul/C0/fe25519_pack.o
	touch pow/inv25519/arm64-maa4-redmul/C0/allcompiled

pow/inv25519/arm64-maa4-redmul/C1/allcompiled: pow/inv25519/arm64-maa4-redmul/C1/api.o pow/inv25519/arm64-maa4-redmul/C1/fe25519_invert.o pow/inv25519/arm64-maa4-redmul/C1/fe25519_pack.o
	touch pow/inv25519/arm64-maa4-redmul/C1/allcompiled

pow/inv25519/donna_c64/shared/allcompiled: 
	touch pow/inv25519/donna_c64/shared/allcompiled

pow/inv25519/donna_c64/C0/allcompiled: pow/inv25519/donna_c64/C0/pow.o
	touch pow/inv25519/donna_c64/C0/allcompiled

pow/inv25519/donna_c64/C1/allcompiled: pow/inv25519/donna_c64/C1/pow.o
	touch pow/inv25519/donna_c64/C1/allcompiled

pow/inv25519/ref10/shared/allcompiled: 
	touch pow/inv25519/ref10/shared/allcompiled

pow/inv25519/ref10/C0/allcompiled: pow/inv25519/ref10/C0/api.o pow/inv25519/ref10/C0/fe_invert.o
	touch pow/inv25519/ref10/C0/allcompiled

unified/fefrombytesc/1/C0/allcompiled: unified/fefrombytesc/1/C0/fe_frombytes.o
	touch unified/fefrombytesc/1/C0/allcompiled

unified/femulc/1/C0/allcompiled: unified/femulc/1/C0/fe_mul.o
	touch unified/femulc/1/C0/allcompiled

unified/fesqc/1/C0/allcompiled: unified/fesqc/1/C0/fe_sq.o
	touch unified/fesqc/1/C0/allcompiled

unified/fetobytesc/1/C0/allcompiled: unified/fetobytesc/1/C0/fe_tobytes.o
	touch unified/fetobytesc/1/C0/allcompiled

pow/inv25519/ref10/C1/allcompiled: pow/inv25519/ref10/C1/api.o pow/inv25519/ref10/C1/fe_invert.o
	touch pow/inv25519/ref10/C1/allcompiled

unified/fefrombytesc/2/C1/allcompiled: unified/fefrombytesc/2/C1/fe_frombytes.o
	touch unified/fefrombytesc/2/C1/allcompiled

unified/femulc/2/C1/allcompiled: unified/femulc/2/C1/fe_mul.o
	touch unified/femulc/2/C1/allcompiled

unified/fesqc/2/C1/allcompiled: unified/fesqc/2/C1/fe_sq.o
	touch unified/fesqc/2/C1/allcompiled

unified/fetobytesc/2/C1/allcompiled: unified/fetobytesc/2/C1/fe_tobytes.o
	touch unified/fetobytesc/2/C1/allcompiled

powbatch/inv25519/ref10/shared/allcompiled: 
	touch powbatch/inv25519/ref10/shared/allcompiled

powbatch/inv25519/ref10/C0/allcompiled: powbatch/inv25519/ref10/C0/api.o powbatch/inv25519/ref10/C0/fe_frombytes.o powbatch/inv25519/ref10/C0/fe_isnonzero.o powbatch/inv25519/ref10/C0/fe_mul.o powbatch/inv25519/ref10/C0/fe_tobytes.o
	touch powbatch/inv25519/ref10/C0/allcompiled

unified/fe0c/1/C0/allcompiled: unified/fe0c/1/C0/fe_0.o
	touch unified/fe0c/1/C0/allcompiled

unified/fe1c/1/C0/allcompiled: unified/fe1c/1/C0/fe_1.o
	touch unified/fe1c/1/C0/allcompiled

unified/fecmovc/1/C0/allcompiled: unified/fecmovc/1/C0/fe_cmov.o
	touch unified/fecmovc/1/C0/allcompiled

powbatch/inv25519/ref10/C1/allcompiled: powbatch/inv25519/ref10/C1/api.o powbatch/inv25519/ref10/C1/fe_frombytes.o powbatch/inv25519/ref10/C1/fe_isnonzero.o powbatch/inv25519/ref10/C1/fe_mul.o powbatch/inv25519/ref10/C1/fe_tobytes.o
	touch powbatch/inv25519/ref10/C1/allcompiled

unified/fe0c/2/C1/allcompiled: unified/fe0c/2/C1/fe_0.o
	touch unified/fe0c/2/C1/allcompiled

unified/fe1c/2/C1/allcompiled: unified/fe1c/2/C1/fe_1.o
	touch unified/fe1c/2/C1/allcompiled

unified/fecmovc/2/C1/allcompiled: unified/fecmovc/2/C1/fe_cmov.o
	touch unified/fecmovc/2/C1/allcompiled

powbatch/inv25519/simple/shared/allcompiled: 
	touch powbatch/inv25519/simple/shared/allcompiled

powbatch/inv25519/simple/C0/allcompiled: powbatch/inv25519/simple/C0/powbatch.o
	touch powbatch/inv25519/simple/C0/allcompiled

powbatch/inv25519/simple/C1/allcompiled: powbatch/inv25519/simple/C1/powbatch.o
	touch powbatch/inv25519/simple/C1/allcompiled

nP/montgomery25519/arm64-maa4-intmul/shared/allcompiled: nP/montgomery25519/arm64-maa4-intmul/shared/mladder.o
	touch nP/montgomery25519/arm64-maa4-intmul/shared/allcompiled

unified/fe25519freezeS/1/shared/allcompiled: unified/fe25519freezeS/1/shared/fe25519_freeze.o
	touch unified/fe25519freezeS/1/shared/allcompiled

unified/fe25519mulS/1/shared/allcompiled: unified/fe25519mulS/1/shared/fe25519_mul.o
	touch unified/fe25519mulS/1/shared/allcompiled

unified/fe25519nsquareS/1/shared/allcompiled: unified/fe25519nsquareS/1/shared/fe25519_nsquare.o
	touch unified/fe25519nsquareS/1/shared/allcompiled

unified/fe25519squareS/1/shared/allcompiled: unified/fe25519squareS/1/shared/fe25519_square.o
	touch unified/fe25519squareS/1/shared/allcompiled

nP/montgomery25519/arm64-maa4-intmul/C0/allcompiled: nP/montgomery25519/arm64-maa4-intmul/C0/mont25519.o
	touch nP/montgomery25519/arm64-maa4-intmul/C0/allcompiled

unified/fe25519invertc/1/C0/allcompiled: unified/fe25519invertc/1/C0/fe25519_invert.o
	touch unified/fe25519invertc/1/C0/allcompiled

unified/fe25519packc/1/C0/allcompiled: unified/fe25519packc/1/C0/fe25519_pack.o
	touch unified/fe25519packc/1/C0/allcompiled

unified/fe25519unpackc/3/C0/allcompiled: unified/fe25519unpackc/3/C0/fe25519_unpack.o
	touch unified/fe25519unpackc/3/C0/allcompiled

nP/montgomery25519/arm64-maa4-intmul/C1/allcompiled: nP/montgomery25519/arm64-maa4-intmul/C1/mont25519.o
	touch nP/montgomery25519/arm64-maa4-intmul/C1/allcompiled

unified/fe25519invertc/2/C1/allcompiled: unified/fe25519invertc/2/C1/fe25519_invert.o
	touch unified/fe25519invertc/2/C1/allcompiled

unified/fe25519packc/2/C1/allcompiled: unified/fe25519packc/2/C1/fe25519_pack.o
	touch unified/fe25519packc/2/C1/allcompiled

unified/fe25519unpackc/4/C1/allcompiled: unified/fe25519unpackc/4/C1/fe25519_unpack.o
	touch unified/fe25519unpackc/4/C1/allcompiled

nP/montgomery25519/arm64-maa4-redmul/shared/allcompiled: nP/montgomery25519/arm64-maa4-redmul/shared/mladder.o
	touch nP/montgomery25519/arm64-maa4-redmul/shared/allcompiled

unified/fe25519mulS/2/shared/allcompiled: unified/fe25519mulS/2/shared/fe25519_mul.o
	touch unified/fe25519mulS/2/shared/allcompiled

unified/fe25519nsquareS/2/shared/allcompiled: unified/fe25519nsquareS/2/shared/fe25519_nsquare.o
	touch unified/fe25519nsquareS/2/shared/allcompiled

unified/fe25519squareS/2/shared/allcompiled: unified/fe25519squareS/2/shared/fe25519_square.o
	touch unified/fe25519squareS/2/shared/allcompiled

nP/montgomery25519/arm64-maa4-redmul/C0/allcompiled: nP/montgomery25519/arm64-maa4-redmul/C0/mont25519.o
	touch nP/montgomery25519/arm64-maa4-redmul/C0/allcompiled

nP/montgomery25519/arm64-maa4-redmul/C1/allcompiled: nP/montgomery25519/arm64-maa4-redmul/C1/mont25519.o
	touch nP/montgomery25519/arm64-maa4-redmul/C1/allcompiled

nP/montgomery25519/donna_c64/shared/allcompiled: 
	touch nP/montgomery25519/donna_c64/shared/allcompiled

nP/montgomery25519/donna_c64/C0/allcompiled: nP/montgomery25519/donna_c64/C0/smult.o
	touch nP/montgomery25519/donna_c64/C0/allcompiled

nP/montgomery25519/donna_c64/C1/allcompiled: nP/montgomery25519/donna_c64/C1/smult.o
	touch nP/montgomery25519/donna_c64/C1/allcompiled

nP/montgomery25519/ref10/shared/allcompiled: 
	touch nP/montgomery25519/ref10/shared/allcompiled

nP/montgomery25519/ref10/C0/allcompiled: nP/montgomery25519/ref10/C0/fe_0.o nP/montgomery25519/ref10/C0/fe_1.o nP/montgomery25519/ref10/C0/fe_add.o nP/montgomery25519/ref10/C0/fe_copy.o nP/montgomery25519/ref10/C0/fe_cswap.o nP/montgomery25519/ref10/C0/fe_invert.o nP/montgomery25519/ref10/C0/fe_mul121666.o nP/montgomery25519/ref10/C0/fe_sub.o nP/montgomery25519/ref10/C0/scalarmult.o
	touch nP/montgomery25519/ref10/C0/allcompiled

nP/montgomery25519/ref10/C1/allcompiled: nP/montgomery25519/ref10/C1/fe_0.o nP/montgomery25519/ref10/C1/fe_1.o nP/montgomery25519/ref10/C1/fe_add.o nP/montgomery25519/ref10/C1/fe_copy.o nP/montgomery25519/ref10/C1/fe_cswap.o nP/montgomery25519/ref10/C1/fe_invert.o nP/montgomery25519/ref10/C1/fe_mul121666.o nP/montgomery25519/ref10/C1/fe_sub.o nP/montgomery25519/ref10/C1/scalarmult.o
	touch nP/montgomery25519/ref10/C1/allcompiled

nPbatch/montgomery25519/ref/shared/allcompiled: 
	touch nPbatch/montgomery25519/ref/shared/allcompiled

nPbatch/montgomery25519/ref/C0/allcompiled: nPbatch/montgomery25519/ref/C0/nPbatch.o
	touch nPbatch/montgomery25519/ref/C0/allcompiled

nPbatch/montgomery25519/ref/C1/allcompiled: nPbatch/montgomery25519/ref/C1/nPbatch.o
	touch nPbatch/montgomery25519/ref/C1/allcompiled

nG/merged25519/arm64-maa4-intmul/shared/allcompiled: nG/merged25519/arm64-maa4-intmul/shared/ge25519_base.o
	touch nG/merged25519/arm64-maa4-intmul/shared/allcompiled

unified/fe25519addS/1/shared/allcompiled: unified/fe25519addS/1/shared/fe25519_add.o
	touch unified/fe25519addS/1/shared/allcompiled

unified/fe25519cmovS/1/shared/allcompiled: unified/fe25519cmovS/1/shared/fe25519_cmov.o
	touch unified/fe25519cmovS/1/shared/allcompiled

unified/fe25519subS/1/shared/allcompiled: unified/fe25519subS/1/shared/fe25519_sub.o
	touch unified/fe25519subS/1/shared/allcompiled

unified/sharedbasedatac/1/shared/allcompiled: unified/sharedbasedatac/1/shared/shared-base-data.o
	touch unified/sharedbasedatac/1/shared/allcompiled

nG/merged25519/arm64-maa4-intmul/C0/allcompiled: nG/merged25519/arm64-maa4-intmul/C0/ge25519_scalarmult_base.o nG/merged25519/arm64-maa4-intmul/C0/nG.o
	touch nG/merged25519/arm64-maa4-intmul/C0/allcompiled

unified/fe25519getparityc/1/C0/allcompiled: unified/fe25519getparityc/1/C0/fe25519_getparity.o
	touch unified/fe25519getparityc/1/C0/allcompiled

unified/sc25519from32bytesc/1/C0/allcompiled: unified/sc25519from32bytesc/1/C0/sc25519_from32bytes.o
	touch unified/sc25519from32bytesc/1/C0/allcompiled

unified/sc25519window4c/1/C0/allcompiled: unified/sc25519window4c/1/C0/sc25519_window4.o
	touch unified/sc25519window4c/1/C0/allcompiled

nG/merged25519/arm64-maa4-intmul/C1/allcompiled: nG/merged25519/arm64-maa4-intmul/C1/ge25519_scalarmult_base.o nG/merged25519/arm64-maa4-intmul/C1/nG.o
	touch nG/merged25519/arm64-maa4-intmul/C1/allcompiled

unified/fe25519getparityc/2/C1/allcompiled: unified/fe25519getparityc/2/C1/fe25519_getparity.o
	touch unified/fe25519getparityc/2/C1/allcompiled

unified/sc25519from32bytesc/2/C1/allcompiled: unified/sc25519from32bytesc/2/C1/sc25519_from32bytes.o
	touch unified/sc25519from32bytesc/2/C1/allcompiled

unified/sc25519window4c/2/C1/allcompiled: unified/sc25519window4c/2/C1/sc25519_window4.o
	touch unified/sc25519window4c/2/C1/allcompiled

nG/merged25519/arm64-maa4-redmul/shared/allcompiled: nG/merged25519/arm64-maa4-redmul/shared/ge25519_base.o
	touch nG/merged25519/arm64-maa4-redmul/shared/allcompiled

nG/merged25519/arm64-maa4-redmul/C0/allcompiled: nG/merged25519/arm64-maa4-redmul/C0/ge25519_scalarmult_base.o nG/merged25519/arm64-maa4-redmul/C0/nG.o
	touch nG/merged25519/arm64-maa4-redmul/C0/allcompiled

nG/merged25519/arm64-maa4-redmul/C1/allcompiled: nG/merged25519/arm64-maa4-redmul/C1/ge25519_scalarmult_base.o nG/merged25519/arm64-maa4-redmul/C1/nG.o
	touch nG/merged25519/arm64-maa4-redmul/C1/allcompiled

nG/merged25519/ref10/shared/allcompiled: nG/merged25519/ref10/shared/shared-base.o
	touch nG/merged25519/ref10/shared/allcompiled

nG/merged25519/ref10/C0/allcompiled: nG/merged25519/ref10/C0/ge_p3_0.o nG/merged25519/ref10/C0/ge_precomp_0.o nG/merged25519/ref10/C0/ge_scalarmult_base.o nG/merged25519/ref10/C0/nG.o
	touch nG/merged25519/ref10/C0/allcompiled

unified/feaddc/1/C0/allcompiled: unified/feaddc/1/C0/fe_add.o
	touch unified/feaddc/1/C0/allcompiled

unified/fecopyc/1/C0/allcompiled: unified/fecopyc/1/C0/fe_copy.o
	touch unified/fecopyc/1/C0/allcompiled

unified/fefrombytesc/3/C0/allcompiled: unified/fefrombytesc/3/C0/fe_frombytes.o
	touch unified/fefrombytesc/3/C0/allcompiled

unified/feinvertc/1/C0/allcompiled: unified/feinvertc/1/C0/fe_invert.o
	touch unified/feinvertc/1/C0/allcompiled

unified/feisnegativec/1/C0/allcompiled: unified/feisnegativec/1/C0/fe_isnegative.o
	touch unified/feisnegativec/1/C0/allcompiled

unified/femulc/3/C0/allcompiled: unified/femulc/3/C0/fe_mul.o
	touch unified/femulc/3/C0/allcompiled

unified/fenegc/1/C0/allcompiled: unified/fenegc/1/C0/fe_neg.o
	touch unified/fenegc/1/C0/allcompiled

unified/fesqc/3/C0/allcompiled: unified/fesqc/3/C0/fe_sq.o
	touch unified/fesqc/3/C0/allcompiled

unified/fesq2c/1/C0/allcompiled: unified/fesq2c/1/C0/fe_sq2.o
	touch unified/fesq2c/1/C0/allcompiled

unified/fesubc/1/C0/allcompiled: unified/fesubc/1/C0/fe_sub.o
	touch unified/fesubc/1/C0/allcompiled

unified/fetobytesc/3/C0/allcompiled: unified/fetobytesc/3/C0/fe_tobytes.o
	touch unified/fetobytesc/3/C0/allcompiled

unified/gemaddc/1/C0/allcompiled: unified/gemaddc/1/C0/ge_madd.o
	touch unified/gemaddc/1/C0/allcompiled

unified/gep1p1top2c/1/C0/allcompiled: unified/gep1p1top2c/1/C0/ge_p1p1_to_p2.o
	touch unified/gep1p1top2c/1/C0/allcompiled

unified/gep1p1top3c/1/C0/allcompiled: unified/gep1p1top3c/1/C0/ge_p1p1_to_p3.o
	touch unified/gep1p1top3c/1/C0/allcompiled

unified/gep2dblc/1/C0/allcompiled: unified/gep2dblc/1/C0/ge_p2_dbl.o
	touch unified/gep2dblc/1/C0/allcompiled

unified/gep3dblc/1/C0/allcompiled: unified/gep3dblc/1/C0/ge_p3_dbl.o
	touch unified/gep3dblc/1/C0/allcompiled

unified/gep3top2c/1/C0/allcompiled: unified/gep3top2c/1/C0/ge_p3_to_p2.o
	touch unified/gep3top2c/1/C0/allcompiled

nG/merged25519/ref10/C1/allcompiled: nG/merged25519/ref10/C1/ge_p3_0.o nG/merged25519/ref10/C1/ge_precomp_0.o nG/merged25519/ref10/C1/ge_scalarmult_base.o nG/merged25519/ref10/C1/nG.o
	touch nG/merged25519/ref10/C1/allcompiled

unified/feaddc/2/C1/allcompiled: unified/feaddc/2/C1/fe_add.o
	touch unified/feaddc/2/C1/allcompiled

unified/fecopyc/2/C1/allcompiled: unified/fecopyc/2/C1/fe_copy.o
	touch unified/fecopyc/2/C1/allcompiled

unified/fefrombytesc/4/C1/allcompiled: unified/fefrombytesc/4/C1/fe_frombytes.o
	touch unified/fefrombytesc/4/C1/allcompiled

unified/feinvertc/2/C1/allcompiled: unified/feinvertc/2/C1/fe_invert.o
	touch unified/feinvertc/2/C1/allcompiled

unified/feisnegativec/2/C1/allcompiled: unified/feisnegativec/2/C1/fe_isnegative.o
	touch unified/feisnegativec/2/C1/allcompiled

unified/femulc/4/C1/allcompiled: unified/femulc/4/C1/fe_mul.o
	touch unified/femulc/4/C1/allcompiled

unified/fenegc/2/C1/allcompiled: unified/fenegc/2/C1/fe_neg.o
	touch unified/fenegc/2/C1/allcompiled

unified/fesqc/4/C1/allcompiled: unified/fesqc/4/C1/fe_sq.o
	touch unified/fesqc/4/C1/allcompiled

unified/fesq2c/2/C1/allcompiled: unified/fesq2c/2/C1/fe_sq2.o
	touch unified/fesq2c/2/C1/allcompiled

unified/fesubc/2/C1/allcompiled: unified/fesubc/2/C1/fe_sub.o
	touch unified/fesubc/2/C1/allcompiled

unified/fetobytesc/4/C1/allcompiled: unified/fetobytesc/4/C1/fe_tobytes.o
	touch unified/fetobytesc/4/C1/allcompiled

unified/gemaddc/2/C1/allcompiled: unified/gemaddc/2/C1/ge_madd.o
	touch unified/gemaddc/2/C1/allcompiled

unified/gep1p1top2c/2/C1/allcompiled: unified/gep1p1top2c/2/C1/ge_p1p1_to_p2.o
	touch unified/gep1p1top2c/2/C1/allcompiled

unified/gep1p1top3c/2/C1/allcompiled: unified/gep1p1top3c/2/C1/ge_p1p1_to_p3.o
	touch unified/gep1p1top3c/2/C1/allcompiled

unified/gep2dblc/2/C1/allcompiled: unified/gep2dblc/2/C1/ge_p2_dbl.o
	touch unified/gep2dblc/2/C1/allcompiled

unified/gep3dblc/2/C1/allcompiled: unified/gep3dblc/2/C1/ge_p3_dbl.o
	touch unified/gep3dblc/2/C1/allcompiled

unified/gep3top2c/2/C1/allcompiled: unified/gep3top2c/2/C1/ge_p3_to_p2.o
	touch unified/gep3top2c/2/C1/allcompiled

nG/montgomery25519/ref/shared/allcompiled: 
	touch nG/montgomery25519/ref/shared/allcompiled

nG/montgomery25519/ref/C0/allcompiled: nG/montgomery25519/ref/C0/base.o
	touch nG/montgomery25519/ref/C0/allcompiled

nG/montgomery25519/ref/C1/allcompiled: nG/montgomery25519/ref/C1/base.o
	touch nG/montgomery25519/ref/C1/allcompiled

nG/montgomery25519/usemerged/shared/allcompiled: 
	touch nG/montgomery25519/usemerged/shared/allcompiled

nG/montgomery25519/usemerged/C0/allcompiled: nG/montgomery25519/usemerged/C0/base.o
	touch nG/montgomery25519/usemerged/C0/allcompiled

nG/montgomery25519/usemerged/C1/allcompiled: nG/montgomery25519/usemerged/C1/base.o
	touch nG/montgomery25519/usemerged/C1/allcompiled

mGnP/ed25519/arm64-maa4-intmul/shared/allcompiled: mGnP/ed25519/arm64-maa4-intmul/shared/ge25519_double_scalarmult_process.o mGnP/ed25519/arm64-maa4-intmul/shared/shared-data.o
	touch mGnP/ed25519/arm64-maa4-intmul/shared/allcompiled

unified/ge25519doublescalarmultprecomputeS/1/shared/allcompiled: unified/ge25519doublescalarmultprecomputeS/1/shared/ge25519_double_scalarmult_precompute.o
	touch unified/ge25519doublescalarmultprecomputeS/1/shared/allcompiled

unified/sc25519barrettS/1/shared/allcompiled: unified/sc25519barrettS/1/shared/sc25519_barrett.o
	touch unified/sc25519barrettS/1/shared/allcompiled

mGnP/ed25519/arm64-maa4-intmul/C0/allcompiled: mGnP/ed25519/arm64-maa4-intmul/C0/ge25519_pack.o mGnP/ed25519/arm64-maa4-intmul/C0/ge25519_unpackneg.o mGnP/ed25519/arm64-maa4-intmul/C0/mGnP.o
	touch mGnP/ed25519/arm64-maa4-intmul/C0/allcompiled

unified/fe25519iseqc/1/C0/allcompiled: unified/fe25519iseqc/1/C0/fe25519_iseq.o
	touch unified/fe25519iseqc/1/C0/allcompiled

unified/fe25519pow2523c/1/C0/allcompiled: unified/fe25519pow2523c/1/C0/fe25519_pow2523.o
	touch unified/fe25519pow2523c/1/C0/allcompiled

unified/fe25519setintc/1/C0/allcompiled: unified/fe25519setintc/1/C0/fe25519_setint.o
	touch unified/fe25519setintc/1/C0/allcompiled

unified/sc25519from64bytesc/1/C0/allcompiled: unified/sc25519from64bytesc/1/C0/sc25519_from64bytes.o
	touch unified/sc25519from64bytesc/1/C0/allcompiled

unified/sc25519slidec/1/C0/allcompiled: unified/sc25519slidec/1/C0/sc25519_slide.o
	touch unified/sc25519slidec/1/C0/allcompiled

unified/sc25519to32bytesc/1/C0/allcompiled: unified/sc25519to32bytesc/1/C0/sc25519_to32bytes.o
	touch unified/sc25519to32bytesc/1/C0/allcompiled

mGnP/ed25519/arm64-maa4-intmul/C1/allcompiled: mGnP/ed25519/arm64-maa4-intmul/C1/ge25519_pack.o mGnP/ed25519/arm64-maa4-intmul/C1/ge25519_unpackneg.o mGnP/ed25519/arm64-maa4-intmul/C1/mGnP.o
	touch mGnP/ed25519/arm64-maa4-intmul/C1/allcompiled

unified/fe25519iseqc/2/C1/allcompiled: unified/fe25519iseqc/2/C1/fe25519_iseq.o
	touch unified/fe25519iseqc/2/C1/allcompiled

unified/fe25519pow2523c/2/C1/allcompiled: unified/fe25519pow2523c/2/C1/fe25519_pow2523.o
	touch unified/fe25519pow2523c/2/C1/allcompiled

unified/fe25519setintc/2/C1/allcompiled: unified/fe25519setintc/2/C1/fe25519_setint.o
	touch unified/fe25519setintc/2/C1/allcompiled

unified/sc25519from64bytesc/2/C1/allcompiled: unified/sc25519from64bytesc/2/C1/sc25519_from64bytes.o
	touch unified/sc25519from64bytesc/2/C1/allcompiled

unified/sc25519slidec/2/C1/allcompiled: unified/sc25519slidec/2/C1/sc25519_slide.o
	touch unified/sc25519slidec/2/C1/allcompiled

unified/sc25519to32bytesc/2/C1/allcompiled: unified/sc25519to32bytesc/2/C1/sc25519_to32bytes.o
	touch unified/sc25519to32bytesc/2/C1/allcompiled

mGnP/ed25519/arm64-maa4-redmul/shared/allcompiled: mGnP/ed25519/arm64-maa4-redmul/shared/ge25519_double_scalarmult_process.o mGnP/ed25519/arm64-maa4-redmul/shared/shared-data.o
	touch mGnP/ed25519/arm64-maa4-redmul/shared/allcompiled

unified/ge25519doublescalarmultprecomputeS/2/shared/allcompiled: unified/ge25519doublescalarmultprecomputeS/2/shared/ge25519_double_scalarmult_precompute.o
	touch unified/ge25519doublescalarmultprecomputeS/2/shared/allcompiled

mGnP/ed25519/arm64-maa4-redmul/C0/allcompiled: mGnP/ed25519/arm64-maa4-redmul/C0/ge25519_pack.o mGnP/ed25519/arm64-maa4-redmul/C0/ge25519_unpackneg.o mGnP/ed25519/arm64-maa4-redmul/C0/mGnP.o
	touch mGnP/ed25519/arm64-maa4-redmul/C0/allcompiled

unified/fe25519pow2523c/3/C0/allcompiled: unified/fe25519pow2523c/3/C0/fe25519_pow2523.o
	touch unified/fe25519pow2523c/3/C0/allcompiled

mGnP/ed25519/arm64-maa4-redmul/C1/allcompiled: mGnP/ed25519/arm64-maa4-redmul/C1/ge25519_pack.o mGnP/ed25519/arm64-maa4-redmul/C1/ge25519_unpackneg.o mGnP/ed25519/arm64-maa4-redmul/C1/mGnP.o
	touch mGnP/ed25519/arm64-maa4-redmul/C1/allcompiled

unified/fe25519pow2523c/4/C1/allcompiled: unified/fe25519pow2523c/4/C1/fe25519_pow2523.o
	touch unified/fe25519pow2523c/4/C1/allcompiled

mGnP/ed25519/ref10/shared/allcompiled: mGnP/ed25519/ref10/shared/shared-Bi.o
	touch mGnP/ed25519/ref10/shared/allcompiled

mGnP/ed25519/ref10/C0/allcompiled: mGnP/ed25519/ref10/C0/ge_double_scalarmult.o mGnP/ed25519/ref10/C0/ge_frombytes.o mGnP/ed25519/ref10/C0/ge_msub.o mGnP/ed25519/ref10/C0/ge_p2_0.o mGnP/ed25519/ref10/C0/mGnP.o
	touch mGnP/ed25519/ref10/C0/allcompiled

unified/feisnonzeroc/1/C0/allcompiled: unified/feisnonzeroc/1/C0/fe_isnonzero.o
	touch unified/feisnonzeroc/1/C0/allcompiled

unified/fepow22523c/1/C0/allcompiled: unified/fepow22523c/1/C0/fe_pow22523.o
	touch unified/fepow22523c/1/C0/allcompiled

unified/geaddc/1/C0/allcompiled: unified/geaddc/1/C0/ge_add.o
	touch unified/geaddc/1/C0/allcompiled

unified/gep3tocachedc/1/C0/allcompiled: unified/gep3tocachedc/1/C0/ge_p3_to_cached.o
	touch unified/gep3tocachedc/1/C0/allcompiled

unified/gesubc/1/C0/allcompiled: unified/gesubc/1/C0/ge_sub.o
	touch unified/gesubc/1/C0/allcompiled

unified/getobytesc/1/C0/allcompiled: unified/getobytesc/1/C0/ge_tobytes.o
	touch unified/getobytesc/1/C0/allcompiled

unified/screducec/1/C0/allcompiled: unified/screducec/1/C0/sc_reduce.o
	touch unified/screducec/1/C0/allcompiled

mGnP/ed25519/ref10/C1/allcompiled: mGnP/ed25519/ref10/C1/ge_double_scalarmult.o mGnP/ed25519/ref10/C1/ge_frombytes.o mGnP/ed25519/ref10/C1/ge_msub.o mGnP/ed25519/ref10/C1/ge_p2_0.o mGnP/ed25519/ref10/C1/mGnP.o
	touch mGnP/ed25519/ref10/C1/allcompiled

unified/feisnonzeroc/2/C1/allcompiled: unified/feisnonzeroc/2/C1/fe_isnonzero.o
	touch unified/feisnonzeroc/2/C1/allcompiled

unified/fepow22523c/2/C1/allcompiled: unified/fepow22523c/2/C1/fe_pow22523.o
	touch unified/fepow22523c/2/C1/allcompiled

unified/geaddc/2/C1/allcompiled: unified/geaddc/2/C1/ge_add.o
	touch unified/geaddc/2/C1/allcompiled

unified/gep3tocachedc/2/C1/allcompiled: unified/gep3tocachedc/2/C1/ge_p3_to_cached.o
	touch unified/gep3tocachedc/2/C1/allcompiled

unified/gesubc/2/C1/allcompiled: unified/gesubc/2/C1/ge_sub.o
	touch unified/gesubc/2/C1/allcompiled

unified/getobytesc/2/C1/allcompiled: unified/getobytesc/2/C1/ge_tobytes.o
	touch unified/getobytesc/2/C1/allcompiled

unified/screducec/2/C1/allcompiled: unified/screducec/2/C1/sc_reduce.o
	touch unified/screducec/2/C1/allcompiled

multiscalar/ed25519/arm64-maa4-intmul/shared/allcompiled: multiscalar/ed25519/arm64-maa4-intmul/shared/ge25519_multi_scalarmult_process.o multiscalar/ed25519/arm64-maa4-intmul/shared/ge25519_p1p1_to_p2.o
	touch multiscalar/ed25519/arm64-maa4-intmul/shared/allcompiled

multiscalar/ed25519/arm64-maa4-intmul/C0/allcompiled: multiscalar/ed25519/arm64-maa4-intmul/C0/ge25519_pack.o multiscalar/ed25519/arm64-maa4-intmul/C0/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-intmul/C0/multiscalar.o
	touch multiscalar/ed25519/arm64-maa4-intmul/C0/allcompiled

multiscalar/ed25519/arm64-maa4-intmul/C1/allcompiled: multiscalar/ed25519/arm64-maa4-intmul/C1/ge25519_pack.o multiscalar/ed25519/arm64-maa4-intmul/C1/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-intmul/C1/multiscalar.o
	touch multiscalar/ed25519/arm64-maa4-intmul/C1/allcompiled

multiscalar/ed25519/arm64-maa4-intmul-p3/shared/allcompiled: multiscalar/ed25519/arm64-maa4-intmul-p3/shared/ge25519_multi_scalarmult_precompute.o multiscalar/ed25519/arm64-maa4-intmul-p3/shared/ge25519_multi_scalarmult_process.o
	touch multiscalar/ed25519/arm64-maa4-intmul-p3/shared/allcompiled

multiscalar/ed25519/arm64-maa4-intmul-p3/C0/allcompiled: multiscalar/ed25519/arm64-maa4-intmul-p3/C0/ge25519_pack.o multiscalar/ed25519/arm64-maa4-intmul-p3/C0/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-intmul-p3/C0/multiscalar.o
	touch multiscalar/ed25519/arm64-maa4-intmul-p3/C0/allcompiled

multiscalar/ed25519/arm64-maa4-intmul-p3/C1/allcompiled: multiscalar/ed25519/arm64-maa4-intmul-p3/C1/ge25519_pack.o multiscalar/ed25519/arm64-maa4-intmul-p3/C1/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-intmul-p3/C1/multiscalar.o
	touch multiscalar/ed25519/arm64-maa4-intmul-p3/C1/allcompiled

multiscalar/ed25519/arm64-maa4-redmul/shared/allcompiled: multiscalar/ed25519/arm64-maa4-redmul/shared/ge25519_multi_scalarmult_process.o multiscalar/ed25519/arm64-maa4-redmul/shared/ge25519_p1p1_to_p2.o
	touch multiscalar/ed25519/arm64-maa4-redmul/shared/allcompiled

multiscalar/ed25519/arm64-maa4-redmul/C0/allcompiled: multiscalar/ed25519/arm64-maa4-redmul/C0/ge25519_pack.o multiscalar/ed25519/arm64-maa4-redmul/C0/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-redmul/C0/multiscalar.o
	touch multiscalar/ed25519/arm64-maa4-redmul/C0/allcompiled

multiscalar/ed25519/arm64-maa4-redmul/C1/allcompiled: multiscalar/ed25519/arm64-maa4-redmul/C1/ge25519_pack.o multiscalar/ed25519/arm64-maa4-redmul/C1/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-redmul/C1/multiscalar.o
	touch multiscalar/ed25519/arm64-maa4-redmul/C1/allcompiled

multiscalar/ed25519/arm64-maa4-redmul-p3/shared/allcompiled: multiscalar/ed25519/arm64-maa4-redmul-p3/shared/ge25519_multi_scalarmult_precompute.o multiscalar/ed25519/arm64-maa4-redmul-p3/shared/ge25519_multi_scalarmult_process.o
	touch multiscalar/ed25519/arm64-maa4-redmul-p3/shared/allcompiled

multiscalar/ed25519/arm64-maa4-redmul-p3/C0/allcompiled: multiscalar/ed25519/arm64-maa4-redmul-p3/C0/ge25519_pack.o multiscalar/ed25519/arm64-maa4-redmul-p3/C0/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-redmul-p3/C0/multiscalar.o
	touch multiscalar/ed25519/arm64-maa4-redmul-p3/C0/allcompiled

multiscalar/ed25519/arm64-maa4-redmul-p3/C1/allcompiled: multiscalar/ed25519/arm64-maa4-redmul-p3/C1/ge25519_pack.o multiscalar/ed25519/arm64-maa4-redmul-p3/C1/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-redmul-p3/C1/multiscalar.o
	touch multiscalar/ed25519/arm64-maa4-redmul-p3/C1/allcompiled

multiscalar/ed25519/ref10/shared/allcompiled: 
	touch multiscalar/ed25519/ref10/shared/allcompiled

multiscalar/ed25519/ref10/C0/allcompiled: multiscalar/ed25519/ref10/C0/ge_frombytes.o multiscalar/ed25519/ref10/C0/ge_p1p1_0.o multiscalar/ed25519/ref10/C0/multiscalar.o multiscalar/ed25519/ref10/C0/sc_reduce.o
	touch multiscalar/ed25519/ref10/C0/allcompiled

multiscalar/ed25519/ref10/C1/allcompiled: multiscalar/ed25519/ref10/C1/ge_frombytes.o multiscalar/ed25519/ref10/C1/ge_p1p1_0.o multiscalar/ed25519/ref10/C1/multiscalar.o multiscalar/ed25519/ref10/C1/sc_reduce.o
	touch multiscalar/ed25519/ref10/C1/allcompiled

dh/x25519/wrapper/shared/allcompiled: 
	touch dh/x25519/wrapper/shared/allcompiled

dh/x25519/wrapper/C0/allcompiled: dh/x25519/wrapper/C0/dh.o dh/x25519/wrapper/C0/keypair.o
	touch dh/x25519/wrapper/C0/allcompiled

dh/x25519/wrapper/C1/allcompiled: dh/x25519/wrapper/C1/dh.o dh/x25519/wrapper/C1/keypair.o
	touch dh/x25519/wrapper/C1/allcompiled

sign/ed25519/ref10/shared/allcompiled: 
	touch sign/ed25519/ref10/shared/allcompiled

sign/ed25519/ref10/C0/allcompiled: sign/ed25519/ref10/C0/keypair.o sign/ed25519/ref10/C0/open.o sign/ed25519/ref10/C0/sc_muladd.o sign/ed25519/ref10/C0/sign.o
	touch sign/ed25519/ref10/C0/allcompiled

sign/ed25519/ref10/C1/allcompiled: sign/ed25519/ref10/C1/keypair.o sign/ed25519/ref10/C1/open.o sign/ed25519/ref10/C1/sc_muladd.o sign/ed25519/ref10/C1/sign.o
	touch sign/ed25519/ref10/C1/allcompiled

verify/32/ref/shared/result: verify/32/ref/shared/result-namespace verify/32/ref/shared/result-insns
	cat verify/32/ref/shared/result-namespace verify/32/ref/shared/result-insns > verify/32/ref/shared/result

verify/32/ref/C0/result: verify/32/ref/C0/result-namespace verify/32/ref/C0/result-insns verify/32/ref/C0/verify.o
	cat verify/32/ref/C0/result-namespace verify/32/ref/C0/result-insns verify/32/ref/C0/result-compile-verify > verify/32/ref/C0/result

verify/32/ref/C1/result: verify/32/ref/C1/result-namespace verify/32/ref/C1/result-insns verify/32/ref/C1/verify.o
	cat verify/32/ref/C1/result-namespace verify/32/ref/C1/result-insns verify/32/ref/C1/result-compile-verify > verify/32/ref/C1/result

hashblocks/sha512/compact/shared/result: hashblocks/sha512/compact/shared/result-namespace hashblocks/sha512/compact/shared/result-insns
	cat hashblocks/sha512/compact/shared/result-namespace hashblocks/sha512/compact/shared/result-insns > hashblocks/sha512/compact/shared/result

hashblocks/sha512/compact/C0/result: hashblocks/sha512/compact/C0/result-namespace hashblocks/sha512/compact/C0/result-insns hashblocks/sha512/compact/C0/blocks.o
	cat hashblocks/sha512/compact/C0/result-namespace hashblocks/sha512/compact/C0/result-insns hashblocks/sha512/compact/C0/result-compile-blocks > hashblocks/sha512/compact/C0/result

hashblocks/sha512/compact/C1/result: hashblocks/sha512/compact/C1/result-namespace hashblocks/sha512/compact/C1/result-insns hashblocks/sha512/compact/C1/blocks.o
	cat hashblocks/sha512/compact/C1/result-namespace hashblocks/sha512/compact/C1/result-insns hashblocks/sha512/compact/C1/result-compile-blocks > hashblocks/sha512/compact/C1/result

hashblocks/sha512/compact2/shared/result: hashblocks/sha512/compact2/shared/result-namespace hashblocks/sha512/compact2/shared/result-insns
	cat hashblocks/sha512/compact2/shared/result-namespace hashblocks/sha512/compact2/shared/result-insns > hashblocks/sha512/compact2/shared/result

hashblocks/sha512/compact2/C0/result: hashblocks/sha512/compact2/C0/result-namespace hashblocks/sha512/compact2/C0/result-insns hashblocks/sha512/compact2/C0/blocks.o
	cat hashblocks/sha512/compact2/C0/result-namespace hashblocks/sha512/compact2/C0/result-insns hashblocks/sha512/compact2/C0/result-compile-blocks > hashblocks/sha512/compact2/C0/result

hashblocks/sha512/compact2/C1/result: hashblocks/sha512/compact2/C1/result-namespace hashblocks/sha512/compact2/C1/result-insns hashblocks/sha512/compact2/C1/blocks.o
	cat hashblocks/sha512/compact2/C1/result-namespace hashblocks/sha512/compact2/C1/result-insns hashblocks/sha512/compact2/C1/result-compile-blocks > hashblocks/sha512/compact2/C1/result

hashblocks/sha512/compact3/shared/result: hashblocks/sha512/compact3/shared/result-namespace hashblocks/sha512/compact3/shared/result-insns
	cat hashblocks/sha512/compact3/shared/result-namespace hashblocks/sha512/compact3/shared/result-insns > hashblocks/sha512/compact3/shared/result

hashblocks/sha512/compact3/C0/result: hashblocks/sha512/compact3/C0/result-namespace hashblocks/sha512/compact3/C0/result-insns hashblocks/sha512/compact3/C0/blocks.o
	cat hashblocks/sha512/compact3/C0/result-namespace hashblocks/sha512/compact3/C0/result-insns hashblocks/sha512/compact3/C0/result-compile-blocks > hashblocks/sha512/compact3/C0/result

hashblocks/sha512/compact3/C1/result: hashblocks/sha512/compact3/C1/result-namespace hashblocks/sha512/compact3/C1/result-insns hashblocks/sha512/compact3/C1/blocks.o
	cat hashblocks/sha512/compact3/C1/result-namespace hashblocks/sha512/compact3/C1/result-insns hashblocks/sha512/compact3/C1/result-compile-blocks > hashblocks/sha512/compact3/C1/result

hashblocks/sha512/compact4/shared/result: hashblocks/sha512/compact4/shared/result-namespace hashblocks/sha512/compact4/shared/result-insns
	cat hashblocks/sha512/compact4/shared/result-namespace hashblocks/sha512/compact4/shared/result-insns > hashblocks/sha512/compact4/shared/result

hashblocks/sha512/compact4/C0/result: hashblocks/sha512/compact4/C0/result-namespace hashblocks/sha512/compact4/C0/result-insns hashblocks/sha512/compact4/C0/blocks.o
	cat hashblocks/sha512/compact4/C0/result-namespace hashblocks/sha512/compact4/C0/result-insns hashblocks/sha512/compact4/C0/result-compile-blocks > hashblocks/sha512/compact4/C0/result

hashblocks/sha512/compact4/C1/result: hashblocks/sha512/compact4/C1/result-namespace hashblocks/sha512/compact4/C1/result-insns hashblocks/sha512/compact4/C1/blocks.o
	cat hashblocks/sha512/compact4/C1/result-namespace hashblocks/sha512/compact4/C1/result-insns hashblocks/sha512/compact4/C1/result-compile-blocks > hashblocks/sha512/compact4/C1/result

hashblocks/sha512/inplace/shared/result: hashblocks/sha512/inplace/shared/result-namespace hashblocks/sha512/inplace/shared/result-insns
	cat hashblocks/sha512/inplace/shared/result-namespace hashblocks/sha512/inplace/shared/result-insns > hashblocks/sha512/inplace/shared/result

hashblocks/sha512/inplace/C0/result: hashblocks/sha512/inplace/C0/result-namespace hashblocks/sha512/inplace/C0/result-insns hashblocks/sha512/inplace/C0/blocks.o
	cat hashblocks/sha512/inplace/C0/result-namespace hashblocks/sha512/inplace/C0/result-insns hashblocks/sha512/inplace/C0/result-compile-blocks > hashblocks/sha512/inplace/C0/result

hashblocks/sha512/inplace/C1/result: hashblocks/sha512/inplace/C1/result-namespace hashblocks/sha512/inplace/C1/result-insns hashblocks/sha512/inplace/C1/blocks.o
	cat hashblocks/sha512/inplace/C1/result-namespace hashblocks/sha512/inplace/C1/result-insns hashblocks/sha512/inplace/C1/result-compile-blocks > hashblocks/sha512/inplace/C1/result

hashblocks/sha512/ref/shared/result: hashblocks/sha512/ref/shared/result-namespace hashblocks/sha512/ref/shared/result-insns
	cat hashblocks/sha512/ref/shared/result-namespace hashblocks/sha512/ref/shared/result-insns > hashblocks/sha512/ref/shared/result

hashblocks/sha512/ref/C0/result: hashblocks/sha512/ref/C0/result-namespace hashblocks/sha512/ref/C0/result-insns hashblocks/sha512/ref/C0/blocks.o
	cat hashblocks/sha512/ref/C0/result-namespace hashblocks/sha512/ref/C0/result-insns hashblocks/sha512/ref/C0/result-compile-blocks > hashblocks/sha512/ref/C0/result

hashblocks/sha512/ref/C1/result: hashblocks/sha512/ref/C1/result-namespace hashblocks/sha512/ref/C1/result-insns hashblocks/sha512/ref/C1/blocks.o
	cat hashblocks/sha512/ref/C1/result-namespace hashblocks/sha512/ref/C1/result-insns hashblocks/sha512/ref/C1/result-compile-blocks > hashblocks/sha512/ref/C1/result

hashblocks/sha512/wflip/shared/result: hashblocks/sha512/wflip/shared/result-namespace hashblocks/sha512/wflip/shared/result-insns
	cat hashblocks/sha512/wflip/shared/result-namespace hashblocks/sha512/wflip/shared/result-insns > hashblocks/sha512/wflip/shared/result

hashblocks/sha512/wflip/C0/result: hashblocks/sha512/wflip/C0/result-namespace hashblocks/sha512/wflip/C0/result-insns hashblocks/sha512/wflip/C0/constants.o hashblocks/sha512/wflip/C0/inner.o
	cat hashblocks/sha512/wflip/C0/result-namespace hashblocks/sha512/wflip/C0/result-insns hashblocks/sha512/wflip/C0/result-compile-constants hashblocks/sha512/wflip/C0/result-compile-inner > hashblocks/sha512/wflip/C0/result

hashblocks/sha512/wflip/C1/result: hashblocks/sha512/wflip/C1/result-namespace hashblocks/sha512/wflip/C1/result-insns hashblocks/sha512/wflip/C1/constants.o hashblocks/sha512/wflip/C1/inner.o
	cat hashblocks/sha512/wflip/C1/result-namespace hashblocks/sha512/wflip/C1/result-insns hashblocks/sha512/wflip/C1/result-compile-constants hashblocks/sha512/wflip/C1/result-compile-inner > hashblocks/sha512/wflip/C1/result

hash/sha512/ref/shared/result: hash/sha512/ref/shared/result-namespace hash/sha512/ref/shared/result-insns
	cat hash/sha512/ref/shared/result-namespace hash/sha512/ref/shared/result-insns > hash/sha512/ref/shared/result

hash/sha512/ref/C0/result: hash/sha512/ref/C0/result-namespace hash/sha512/ref/C0/result-insns hash/sha512/ref/C0/hash.o
	cat hash/sha512/ref/C0/result-namespace hash/sha512/ref/C0/result-insns hash/sha512/ref/C0/result-compile-hash > hash/sha512/ref/C0/result

hash/sha512/ref/C1/result: hash/sha512/ref/C1/result-namespace hash/sha512/ref/C1/result-insns hash/sha512/ref/C1/hash.o
	cat hash/sha512/ref/C1/result-namespace hash/sha512/ref/C1/result-insns hash/sha512/ref/C1/result-compile-hash > hash/sha512/ref/C1/result

pow/inv25519/arm64-maa4-intmul/shared/result: pow/inv25519/arm64-maa4-intmul/shared/result-namespace pow/inv25519/arm64-maa4-intmul/shared/result-insns pow/inv25519/arm64-maa4-intmul/shared/fe25519_freeze.o pow/inv25519/arm64-maa4-intmul/shared/fe25519_mul.o pow/inv25519/arm64-maa4-intmul/shared/fe25519_nsquare.o pow/inv25519/arm64-maa4-intmul/shared/fe25519_square.o
	cat pow/inv25519/arm64-maa4-intmul/shared/result-namespace pow/inv25519/arm64-maa4-intmul/shared/result-insns pow/inv25519/arm64-maa4-intmul/shared/result-compile-fe25519_freeze pow/inv25519/arm64-maa4-intmul/shared/result-compile-fe25519_mul pow/inv25519/arm64-maa4-intmul/shared/result-compile-fe25519_nsquare pow/inv25519/arm64-maa4-intmul/shared/result-compile-fe25519_square > pow/inv25519/arm64-maa4-intmul/shared/result

pow/inv25519/arm64-maa4-intmul/C0/result: pow/inv25519/arm64-maa4-intmul/C0/result-namespace pow/inv25519/arm64-maa4-intmul/C0/result-insns pow/inv25519/arm64-maa4-intmul/C0/api.o pow/inv25519/arm64-maa4-intmul/C0/fe25519_invert.o pow/inv25519/arm64-maa4-intmul/C0/fe25519_pack.o
	cat pow/inv25519/arm64-maa4-intmul/C0/result-namespace pow/inv25519/arm64-maa4-intmul/C0/result-insns pow/inv25519/arm64-maa4-intmul/C0/result-compile-api pow/inv25519/arm64-maa4-intmul/C0/result-compile-fe25519_invert pow/inv25519/arm64-maa4-intmul/C0/result-compile-fe25519_pack > pow/inv25519/arm64-maa4-intmul/C0/result

unified/fe25519unpackc/1/C0/result: unified/fe25519unpackc/1/C0/result-namespace unified/fe25519unpackc/1/C0/result-insns unified/fe25519unpackc/1/C0/fe25519_unpack.o
	cat unified/fe25519unpackc/1/C0/result-namespace unified/fe25519unpackc/1/C0/result-insns unified/fe25519unpackc/1/C0/result-compile-fe25519_unpack > unified/fe25519unpackc/1/C0/result

pow/inv25519/arm64-maa4-intmul/C1/result: pow/inv25519/arm64-maa4-intmul/C1/result-namespace pow/inv25519/arm64-maa4-intmul/C1/result-insns pow/inv25519/arm64-maa4-intmul/C1/api.o pow/inv25519/arm64-maa4-intmul/C1/fe25519_invert.o pow/inv25519/arm64-maa4-intmul/C1/fe25519_pack.o
	cat pow/inv25519/arm64-maa4-intmul/C1/result-namespace pow/inv25519/arm64-maa4-intmul/C1/result-insns pow/inv25519/arm64-maa4-intmul/C1/result-compile-api pow/inv25519/arm64-maa4-intmul/C1/result-compile-fe25519_invert pow/inv25519/arm64-maa4-intmul/C1/result-compile-fe25519_pack > pow/inv25519/arm64-maa4-intmul/C1/result

unified/fe25519unpackc/2/C1/result: unified/fe25519unpackc/2/C1/result-namespace unified/fe25519unpackc/2/C1/result-insns unified/fe25519unpackc/2/C1/fe25519_unpack.o
	cat unified/fe25519unpackc/2/C1/result-namespace unified/fe25519unpackc/2/C1/result-insns unified/fe25519unpackc/2/C1/result-compile-fe25519_unpack > unified/fe25519unpackc/2/C1/result

pow/inv25519/arm64-maa4-redmul/shared/result: pow/inv25519/arm64-maa4-redmul/shared/result-namespace pow/inv25519/arm64-maa4-redmul/shared/result-insns pow/inv25519/arm64-maa4-redmul/shared/fe25519_freeze.o pow/inv25519/arm64-maa4-redmul/shared/fe25519_mul.o pow/inv25519/arm64-maa4-redmul/shared/fe25519_nsquare.o pow/inv25519/arm64-maa4-redmul/shared/fe25519_square.o
	cat pow/inv25519/arm64-maa4-redmul/shared/result-namespace pow/inv25519/arm64-maa4-redmul/shared/result-insns pow/inv25519/arm64-maa4-redmul/shared/result-compile-fe25519_freeze pow/inv25519/arm64-maa4-redmul/shared/result-compile-fe25519_mul pow/inv25519/arm64-maa4-redmul/shared/result-compile-fe25519_nsquare pow/inv25519/arm64-maa4-redmul/shared/result-compile-fe25519_square > pow/inv25519/arm64-maa4-redmul/shared/result

pow/inv25519/arm64-maa4-redmul/C0/result: pow/inv25519/arm64-maa4-redmul/C0/result-namespace pow/inv25519/arm64-maa4-redmul/C0/result-insns pow/inv25519/arm64-maa4-redmul/C0/api.o pow/inv25519/arm64-maa4-redmul/C0/fe25519_invert.o pow/inv25519/arm64-maa4-redmul/C0/fe25519_pack.o
	cat pow/inv25519/arm64-maa4-redmul/C0/result-namespace pow/inv25519/arm64-maa4-redmul/C0/result-insns pow/inv25519/arm64-maa4-redmul/C0/result-compile-api pow/inv25519/arm64-maa4-redmul/C0/result-compile-fe25519_invert pow/inv25519/arm64-maa4-redmul/C0/result-compile-fe25519_pack > pow/inv25519/arm64-maa4-redmul/C0/result

pow/inv25519/arm64-maa4-redmul/C1/result: pow/inv25519/arm64-maa4-redmul/C1/result-namespace pow/inv25519/arm64-maa4-redmul/C1/result-insns pow/inv25519/arm64-maa4-redmul/C1/api.o pow/inv25519/arm64-maa4-redmul/C1/fe25519_invert.o pow/inv25519/arm64-maa4-redmul/C1/fe25519_pack.o
	cat pow/inv25519/arm64-maa4-redmul/C1/result-namespace pow/inv25519/arm64-maa4-redmul/C1/result-insns pow/inv25519/arm64-maa4-redmul/C1/result-compile-api pow/inv25519/arm64-maa4-redmul/C1/result-compile-fe25519_invert pow/inv25519/arm64-maa4-redmul/C1/result-compile-fe25519_pack > pow/inv25519/arm64-maa4-redmul/C1/result

pow/inv25519/donna_c64/shared/result: pow/inv25519/donna_c64/shared/result-namespace pow/inv25519/donna_c64/shared/result-insns
	cat pow/inv25519/donna_c64/shared/result-namespace pow/inv25519/donna_c64/shared/result-insns > pow/inv25519/donna_c64/shared/result

pow/inv25519/donna_c64/C0/result: pow/inv25519/donna_c64/C0/result-namespace pow/inv25519/donna_c64/C0/result-insns pow/inv25519/donna_c64/C0/pow.o
	cat pow/inv25519/donna_c64/C0/result-namespace pow/inv25519/donna_c64/C0/result-insns pow/inv25519/donna_c64/C0/result-compile-pow > pow/inv25519/donna_c64/C0/result

pow/inv25519/donna_c64/C1/result: pow/inv25519/donna_c64/C1/result-namespace pow/inv25519/donna_c64/C1/result-insns pow/inv25519/donna_c64/C1/pow.o
	cat pow/inv25519/donna_c64/C1/result-namespace pow/inv25519/donna_c64/C1/result-insns pow/inv25519/donna_c64/C1/result-compile-pow > pow/inv25519/donna_c64/C1/result

pow/inv25519/ref10/shared/result: pow/inv25519/ref10/shared/result-namespace pow/inv25519/ref10/shared/result-insns
	cat pow/inv25519/ref10/shared/result-namespace pow/inv25519/ref10/shared/result-insns > pow/inv25519/ref10/shared/result

pow/inv25519/ref10/C0/result: pow/inv25519/ref10/C0/result-namespace pow/inv25519/ref10/C0/result-insns pow/inv25519/ref10/C0/api.o pow/inv25519/ref10/C0/fe_invert.o
	cat pow/inv25519/ref10/C0/result-namespace pow/inv25519/ref10/C0/result-insns pow/inv25519/ref10/C0/result-compile-api pow/inv25519/ref10/C0/result-compile-fe_invert > pow/inv25519/ref10/C0/result

unified/fefrombytesc/1/C0/result: unified/fefrombytesc/1/C0/result-namespace unified/fefrombytesc/1/C0/result-insns unified/fefrombytesc/1/C0/fe_frombytes.o
	cat unified/fefrombytesc/1/C0/result-namespace unified/fefrombytesc/1/C0/result-insns unified/fefrombytesc/1/C0/result-compile-fe_frombytes > unified/fefrombytesc/1/C0/result

unified/femulc/1/C0/result: unified/femulc/1/C0/result-namespace unified/femulc/1/C0/result-insns unified/femulc/1/C0/fe_mul.o
	cat unified/femulc/1/C0/result-namespace unified/femulc/1/C0/result-insns unified/femulc/1/C0/result-compile-fe_mul > unified/femulc/1/C0/result

unified/fesqc/1/C0/result: unified/fesqc/1/C0/result-namespace unified/fesqc/1/C0/result-insns unified/fesqc/1/C0/fe_sq.o
	cat unified/fesqc/1/C0/result-namespace unified/fesqc/1/C0/result-insns unified/fesqc/1/C0/result-compile-fe_sq > unified/fesqc/1/C0/result

unified/fetobytesc/1/C0/result: unified/fetobytesc/1/C0/result-namespace unified/fetobytesc/1/C0/result-insns unified/fetobytesc/1/C0/fe_tobytes.o
	cat unified/fetobytesc/1/C0/result-namespace unified/fetobytesc/1/C0/result-insns unified/fetobytesc/1/C0/result-compile-fe_tobytes > unified/fetobytesc/1/C0/result

pow/inv25519/ref10/C1/result: pow/inv25519/ref10/C1/result-namespace pow/inv25519/ref10/C1/result-insns pow/inv25519/ref10/C1/api.o pow/inv25519/ref10/C1/fe_invert.o
	cat pow/inv25519/ref10/C1/result-namespace pow/inv25519/ref10/C1/result-insns pow/inv25519/ref10/C1/result-compile-api pow/inv25519/ref10/C1/result-compile-fe_invert > pow/inv25519/ref10/C1/result

unified/fefrombytesc/2/C1/result: unified/fefrombytesc/2/C1/result-namespace unified/fefrombytesc/2/C1/result-insns unified/fefrombytesc/2/C1/fe_frombytes.o
	cat unified/fefrombytesc/2/C1/result-namespace unified/fefrombytesc/2/C1/result-insns unified/fefrombytesc/2/C1/result-compile-fe_frombytes > unified/fefrombytesc/2/C1/result

unified/femulc/2/C1/result: unified/femulc/2/C1/result-namespace unified/femulc/2/C1/result-insns unified/femulc/2/C1/fe_mul.o
	cat unified/femulc/2/C1/result-namespace unified/femulc/2/C1/result-insns unified/femulc/2/C1/result-compile-fe_mul > unified/femulc/2/C1/result

unified/fesqc/2/C1/result: unified/fesqc/2/C1/result-namespace unified/fesqc/2/C1/result-insns unified/fesqc/2/C1/fe_sq.o
	cat unified/fesqc/2/C1/result-namespace unified/fesqc/2/C1/result-insns unified/fesqc/2/C1/result-compile-fe_sq > unified/fesqc/2/C1/result

unified/fetobytesc/2/C1/result: unified/fetobytesc/2/C1/result-namespace unified/fetobytesc/2/C1/result-insns unified/fetobytesc/2/C1/fe_tobytes.o
	cat unified/fetobytesc/2/C1/result-namespace unified/fetobytesc/2/C1/result-insns unified/fetobytesc/2/C1/result-compile-fe_tobytes > unified/fetobytesc/2/C1/result

powbatch/inv25519/ref10/shared/result: powbatch/inv25519/ref10/shared/result-namespace powbatch/inv25519/ref10/shared/result-insns
	cat powbatch/inv25519/ref10/shared/result-namespace powbatch/inv25519/ref10/shared/result-insns > powbatch/inv25519/ref10/shared/result

powbatch/inv25519/ref10/C0/result: powbatch/inv25519/ref10/C0/result-namespace powbatch/inv25519/ref10/C0/result-insns powbatch/inv25519/ref10/C0/api.o powbatch/inv25519/ref10/C0/fe_frombytes.o powbatch/inv25519/ref10/C0/fe_isnonzero.o powbatch/inv25519/ref10/C0/fe_mul.o powbatch/inv25519/ref10/C0/fe_tobytes.o
	cat powbatch/inv25519/ref10/C0/result-namespace powbatch/inv25519/ref10/C0/result-insns powbatch/inv25519/ref10/C0/result-compile-api powbatch/inv25519/ref10/C0/result-compile-fe_frombytes powbatch/inv25519/ref10/C0/result-compile-fe_isnonzero powbatch/inv25519/ref10/C0/result-compile-fe_mul powbatch/inv25519/ref10/C0/result-compile-fe_tobytes > powbatch/inv25519/ref10/C0/result

unified/fe0c/1/C0/result: unified/fe0c/1/C0/result-namespace unified/fe0c/1/C0/result-insns unified/fe0c/1/C0/fe_0.o
	cat unified/fe0c/1/C0/result-namespace unified/fe0c/1/C0/result-insns unified/fe0c/1/C0/result-compile-fe_0 > unified/fe0c/1/C0/result

unified/fe1c/1/C0/result: unified/fe1c/1/C0/result-namespace unified/fe1c/1/C0/result-insns unified/fe1c/1/C0/fe_1.o
	cat unified/fe1c/1/C0/result-namespace unified/fe1c/1/C0/result-insns unified/fe1c/1/C0/result-compile-fe_1 > unified/fe1c/1/C0/result

unified/fecmovc/1/C0/result: unified/fecmovc/1/C0/result-namespace unified/fecmovc/1/C0/result-insns unified/fecmovc/1/C0/fe_cmov.o
	cat unified/fecmovc/1/C0/result-namespace unified/fecmovc/1/C0/result-insns unified/fecmovc/1/C0/result-compile-fe_cmov > unified/fecmovc/1/C0/result

powbatch/inv25519/ref10/C1/result: powbatch/inv25519/ref10/C1/result-namespace powbatch/inv25519/ref10/C1/result-insns powbatch/inv25519/ref10/C1/api.o powbatch/inv25519/ref10/C1/fe_frombytes.o powbatch/inv25519/ref10/C1/fe_isnonzero.o powbatch/inv25519/ref10/C1/fe_mul.o powbatch/inv25519/ref10/C1/fe_tobytes.o
	cat powbatch/inv25519/ref10/C1/result-namespace powbatch/inv25519/ref10/C1/result-insns powbatch/inv25519/ref10/C1/result-compile-api powbatch/inv25519/ref10/C1/result-compile-fe_frombytes powbatch/inv25519/ref10/C1/result-compile-fe_isnonzero powbatch/inv25519/ref10/C1/result-compile-fe_mul powbatch/inv25519/ref10/C1/result-compile-fe_tobytes > powbatch/inv25519/ref10/C1/result

unified/fe0c/2/C1/result: unified/fe0c/2/C1/result-namespace unified/fe0c/2/C1/result-insns unified/fe0c/2/C1/fe_0.o
	cat unified/fe0c/2/C1/result-namespace unified/fe0c/2/C1/result-insns unified/fe0c/2/C1/result-compile-fe_0 > unified/fe0c/2/C1/result

unified/fe1c/2/C1/result: unified/fe1c/2/C1/result-namespace unified/fe1c/2/C1/result-insns unified/fe1c/2/C1/fe_1.o
	cat unified/fe1c/2/C1/result-namespace unified/fe1c/2/C1/result-insns unified/fe1c/2/C1/result-compile-fe_1 > unified/fe1c/2/C1/result

unified/fecmovc/2/C1/result: unified/fecmovc/2/C1/result-namespace unified/fecmovc/2/C1/result-insns unified/fecmovc/2/C1/fe_cmov.o
	cat unified/fecmovc/2/C1/result-namespace unified/fecmovc/2/C1/result-insns unified/fecmovc/2/C1/result-compile-fe_cmov > unified/fecmovc/2/C1/result

powbatch/inv25519/simple/shared/result: powbatch/inv25519/simple/shared/result-namespace powbatch/inv25519/simple/shared/result-insns
	cat powbatch/inv25519/simple/shared/result-namespace powbatch/inv25519/simple/shared/result-insns > powbatch/inv25519/simple/shared/result

powbatch/inv25519/simple/C0/result: powbatch/inv25519/simple/C0/result-namespace powbatch/inv25519/simple/C0/result-insns powbatch/inv25519/simple/C0/powbatch.o
	cat powbatch/inv25519/simple/C0/result-namespace powbatch/inv25519/simple/C0/result-insns powbatch/inv25519/simple/C0/result-compile-powbatch > powbatch/inv25519/simple/C0/result

powbatch/inv25519/simple/C1/result: powbatch/inv25519/simple/C1/result-namespace powbatch/inv25519/simple/C1/result-insns powbatch/inv25519/simple/C1/powbatch.o
	cat powbatch/inv25519/simple/C1/result-namespace powbatch/inv25519/simple/C1/result-insns powbatch/inv25519/simple/C1/result-compile-powbatch > powbatch/inv25519/simple/C1/result

nP/montgomery25519/arm64-maa4-intmul/shared/result: nP/montgomery25519/arm64-maa4-intmul/shared/result-namespace nP/montgomery25519/arm64-maa4-intmul/shared/result-insns nP/montgomery25519/arm64-maa4-intmul/shared/mladder.o
	cat nP/montgomery25519/arm64-maa4-intmul/shared/result-namespace nP/montgomery25519/arm64-maa4-intmul/shared/result-insns nP/montgomery25519/arm64-maa4-intmul/shared/result-compile-mladder > nP/montgomery25519/arm64-maa4-intmul/shared/result

unified/fe25519freezeS/1/shared/result: unified/fe25519freezeS/1/shared/result-namespace unified/fe25519freezeS/1/shared/result-insns unified/fe25519freezeS/1/shared/fe25519_freeze.o
	cat unified/fe25519freezeS/1/shared/result-namespace unified/fe25519freezeS/1/shared/result-insns unified/fe25519freezeS/1/shared/result-compile-fe25519_freeze > unified/fe25519freezeS/1/shared/result

unified/fe25519mulS/1/shared/result: unified/fe25519mulS/1/shared/result-namespace unified/fe25519mulS/1/shared/result-insns unified/fe25519mulS/1/shared/fe25519_mul.o
	cat unified/fe25519mulS/1/shared/result-namespace unified/fe25519mulS/1/shared/result-insns unified/fe25519mulS/1/shared/result-compile-fe25519_mul > unified/fe25519mulS/1/shared/result

unified/fe25519nsquareS/1/shared/result: unified/fe25519nsquareS/1/shared/result-namespace unified/fe25519nsquareS/1/shared/result-insns unified/fe25519nsquareS/1/shared/fe25519_nsquare.o
	cat unified/fe25519nsquareS/1/shared/result-namespace unified/fe25519nsquareS/1/shared/result-insns unified/fe25519nsquareS/1/shared/result-compile-fe25519_nsquare > unified/fe25519nsquareS/1/shared/result

unified/fe25519squareS/1/shared/result: unified/fe25519squareS/1/shared/result-namespace unified/fe25519squareS/1/shared/result-insns unified/fe25519squareS/1/shared/fe25519_square.o
	cat unified/fe25519squareS/1/shared/result-namespace unified/fe25519squareS/1/shared/result-insns unified/fe25519squareS/1/shared/result-compile-fe25519_square > unified/fe25519squareS/1/shared/result

nP/montgomery25519/arm64-maa4-intmul/C0/result: nP/montgomery25519/arm64-maa4-intmul/C0/result-namespace nP/montgomery25519/arm64-maa4-intmul/C0/result-insns nP/montgomery25519/arm64-maa4-intmul/C0/mont25519.o
	cat nP/montgomery25519/arm64-maa4-intmul/C0/result-namespace nP/montgomery25519/arm64-maa4-intmul/C0/result-insns nP/montgomery25519/arm64-maa4-intmul/C0/result-compile-mont25519 > nP/montgomery25519/arm64-maa4-intmul/C0/result

unified/fe25519invertc/1/C0/result: unified/fe25519invertc/1/C0/result-namespace unified/fe25519invertc/1/C0/result-insns unified/fe25519invertc/1/C0/fe25519_invert.o
	cat unified/fe25519invertc/1/C0/result-namespace unified/fe25519invertc/1/C0/result-insns unified/fe25519invertc/1/C0/result-compile-fe25519_invert > unified/fe25519invertc/1/C0/result

unified/fe25519packc/1/C0/result: unified/fe25519packc/1/C0/result-namespace unified/fe25519packc/1/C0/result-insns unified/fe25519packc/1/C0/fe25519_pack.o
	cat unified/fe25519packc/1/C0/result-namespace unified/fe25519packc/1/C0/result-insns unified/fe25519packc/1/C0/result-compile-fe25519_pack > unified/fe25519packc/1/C0/result

unified/fe25519unpackc/3/C0/result: unified/fe25519unpackc/3/C0/result-namespace unified/fe25519unpackc/3/C0/result-insns unified/fe25519unpackc/3/C0/fe25519_unpack.o
	cat unified/fe25519unpackc/3/C0/result-namespace unified/fe25519unpackc/3/C0/result-insns unified/fe25519unpackc/3/C0/result-compile-fe25519_unpack > unified/fe25519unpackc/3/C0/result

nP/montgomery25519/arm64-maa4-intmul/C1/result: nP/montgomery25519/arm64-maa4-intmul/C1/result-namespace nP/montgomery25519/arm64-maa4-intmul/C1/result-insns nP/montgomery25519/arm64-maa4-intmul/C1/mont25519.o
	cat nP/montgomery25519/arm64-maa4-intmul/C1/result-namespace nP/montgomery25519/arm64-maa4-intmul/C1/result-insns nP/montgomery25519/arm64-maa4-intmul/C1/result-compile-mont25519 > nP/montgomery25519/arm64-maa4-intmul/C1/result

unified/fe25519invertc/2/C1/result: unified/fe25519invertc/2/C1/result-namespace unified/fe25519invertc/2/C1/result-insns unified/fe25519invertc/2/C1/fe25519_invert.o
	cat unified/fe25519invertc/2/C1/result-namespace unified/fe25519invertc/2/C1/result-insns unified/fe25519invertc/2/C1/result-compile-fe25519_invert > unified/fe25519invertc/2/C1/result

unified/fe25519packc/2/C1/result: unified/fe25519packc/2/C1/result-namespace unified/fe25519packc/2/C1/result-insns unified/fe25519packc/2/C1/fe25519_pack.o
	cat unified/fe25519packc/2/C1/result-namespace unified/fe25519packc/2/C1/result-insns unified/fe25519packc/2/C1/result-compile-fe25519_pack > unified/fe25519packc/2/C1/result

unified/fe25519unpackc/4/C1/result: unified/fe25519unpackc/4/C1/result-namespace unified/fe25519unpackc/4/C1/result-insns unified/fe25519unpackc/4/C1/fe25519_unpack.o
	cat unified/fe25519unpackc/4/C1/result-namespace unified/fe25519unpackc/4/C1/result-insns unified/fe25519unpackc/4/C1/result-compile-fe25519_unpack > unified/fe25519unpackc/4/C1/result

nP/montgomery25519/arm64-maa4-redmul/shared/result: nP/montgomery25519/arm64-maa4-redmul/shared/result-namespace nP/montgomery25519/arm64-maa4-redmul/shared/result-insns nP/montgomery25519/arm64-maa4-redmul/shared/mladder.o
	cat nP/montgomery25519/arm64-maa4-redmul/shared/result-namespace nP/montgomery25519/arm64-maa4-redmul/shared/result-insns nP/montgomery25519/arm64-maa4-redmul/shared/result-compile-mladder > nP/montgomery25519/arm64-maa4-redmul/shared/result

unified/fe25519mulS/2/shared/result: unified/fe25519mulS/2/shared/result-namespace unified/fe25519mulS/2/shared/result-insns unified/fe25519mulS/2/shared/fe25519_mul.o
	cat unified/fe25519mulS/2/shared/result-namespace unified/fe25519mulS/2/shared/result-insns unified/fe25519mulS/2/shared/result-compile-fe25519_mul > unified/fe25519mulS/2/shared/result

unified/fe25519nsquareS/2/shared/result: unified/fe25519nsquareS/2/shared/result-namespace unified/fe25519nsquareS/2/shared/result-insns unified/fe25519nsquareS/2/shared/fe25519_nsquare.o
	cat unified/fe25519nsquareS/2/shared/result-namespace unified/fe25519nsquareS/2/shared/result-insns unified/fe25519nsquareS/2/shared/result-compile-fe25519_nsquare > unified/fe25519nsquareS/2/shared/result

unified/fe25519squareS/2/shared/result: unified/fe25519squareS/2/shared/result-namespace unified/fe25519squareS/2/shared/result-insns unified/fe25519squareS/2/shared/fe25519_square.o
	cat unified/fe25519squareS/2/shared/result-namespace unified/fe25519squareS/2/shared/result-insns unified/fe25519squareS/2/shared/result-compile-fe25519_square > unified/fe25519squareS/2/shared/result

nP/montgomery25519/arm64-maa4-redmul/C0/result: nP/montgomery25519/arm64-maa4-redmul/C0/result-namespace nP/montgomery25519/arm64-maa4-redmul/C0/result-insns nP/montgomery25519/arm64-maa4-redmul/C0/mont25519.o
	cat nP/montgomery25519/arm64-maa4-redmul/C0/result-namespace nP/montgomery25519/arm64-maa4-redmul/C0/result-insns nP/montgomery25519/arm64-maa4-redmul/C0/result-compile-mont25519 > nP/montgomery25519/arm64-maa4-redmul/C0/result

nP/montgomery25519/arm64-maa4-redmul/C1/result: nP/montgomery25519/arm64-maa4-redmul/C1/result-namespace nP/montgomery25519/arm64-maa4-redmul/C1/result-insns nP/montgomery25519/arm64-maa4-redmul/C1/mont25519.o
	cat nP/montgomery25519/arm64-maa4-redmul/C1/result-namespace nP/montgomery25519/arm64-maa4-redmul/C1/result-insns nP/montgomery25519/arm64-maa4-redmul/C1/result-compile-mont25519 > nP/montgomery25519/arm64-maa4-redmul/C1/result

nP/montgomery25519/donna_c64/shared/result: nP/montgomery25519/donna_c64/shared/result-namespace nP/montgomery25519/donna_c64/shared/result-insns
	cat nP/montgomery25519/donna_c64/shared/result-namespace nP/montgomery25519/donna_c64/shared/result-insns > nP/montgomery25519/donna_c64/shared/result

nP/montgomery25519/donna_c64/C0/result: nP/montgomery25519/donna_c64/C0/result-namespace nP/montgomery25519/donna_c64/C0/result-insns nP/montgomery25519/donna_c64/C0/smult.o
	cat nP/montgomery25519/donna_c64/C0/result-namespace nP/montgomery25519/donna_c64/C0/result-insns nP/montgomery25519/donna_c64/C0/result-compile-smult > nP/montgomery25519/donna_c64/C0/result

nP/montgomery25519/donna_c64/C1/result: nP/montgomery25519/donna_c64/C1/result-namespace nP/montgomery25519/donna_c64/C1/result-insns nP/montgomery25519/donna_c64/C1/smult.o
	cat nP/montgomery25519/donna_c64/C1/result-namespace nP/montgomery25519/donna_c64/C1/result-insns nP/montgomery25519/donna_c64/C1/result-compile-smult > nP/montgomery25519/donna_c64/C1/result

nP/montgomery25519/ref10/shared/result: nP/montgomery25519/ref10/shared/result-namespace nP/montgomery25519/ref10/shared/result-insns
	cat nP/montgomery25519/ref10/shared/result-namespace nP/montgomery25519/ref10/shared/result-insns > nP/montgomery25519/ref10/shared/result

nP/montgomery25519/ref10/C0/result: nP/montgomery25519/ref10/C0/result-namespace nP/montgomery25519/ref10/C0/result-insns nP/montgomery25519/ref10/C0/fe_0.o nP/montgomery25519/ref10/C0/fe_1.o nP/montgomery25519/ref10/C0/fe_add.o nP/montgomery25519/ref10/C0/fe_copy.o nP/montgomery25519/ref10/C0/fe_cswap.o nP/montgomery25519/ref10/C0/fe_invert.o nP/montgomery25519/ref10/C0/fe_mul121666.o nP/montgomery25519/ref10/C0/fe_sub.o nP/montgomery25519/ref10/C0/scalarmult.o
	cat nP/montgomery25519/ref10/C0/result-namespace nP/montgomery25519/ref10/C0/result-insns nP/montgomery25519/ref10/C0/result-compile-fe_0 nP/montgomery25519/ref10/C0/result-compile-fe_1 nP/montgomery25519/ref10/C0/result-compile-fe_add nP/montgomery25519/ref10/C0/result-compile-fe_copy nP/montgomery25519/ref10/C0/result-compile-fe_cswap nP/montgomery25519/ref10/C0/result-compile-fe_invert nP/montgomery25519/ref10/C0/result-compile-fe_mul121666 nP/montgomery25519/ref10/C0/result-compile-fe_sub nP/montgomery25519/ref10/C0/result-compile-scalarmult > nP/montgomery25519/ref10/C0/result

nP/montgomery25519/ref10/C1/result: nP/montgomery25519/ref10/C1/result-namespace nP/montgomery25519/ref10/C1/result-insns nP/montgomery25519/ref10/C1/fe_0.o nP/montgomery25519/ref10/C1/fe_1.o nP/montgomery25519/ref10/C1/fe_add.o nP/montgomery25519/ref10/C1/fe_copy.o nP/montgomery25519/ref10/C1/fe_cswap.o nP/montgomery25519/ref10/C1/fe_invert.o nP/montgomery25519/ref10/C1/fe_mul121666.o nP/montgomery25519/ref10/C1/fe_sub.o nP/montgomery25519/ref10/C1/scalarmult.o
	cat nP/montgomery25519/ref10/C1/result-namespace nP/montgomery25519/ref10/C1/result-insns nP/montgomery25519/ref10/C1/result-compile-fe_0 nP/montgomery25519/ref10/C1/result-compile-fe_1 nP/montgomery25519/ref10/C1/result-compile-fe_add nP/montgomery25519/ref10/C1/result-compile-fe_copy nP/montgomery25519/ref10/C1/result-compile-fe_cswap nP/montgomery25519/ref10/C1/result-compile-fe_invert nP/montgomery25519/ref10/C1/result-compile-fe_mul121666 nP/montgomery25519/ref10/C1/result-compile-fe_sub nP/montgomery25519/ref10/C1/result-compile-scalarmult > nP/montgomery25519/ref10/C1/result

nPbatch/montgomery25519/ref/shared/result: nPbatch/montgomery25519/ref/shared/result-namespace nPbatch/montgomery25519/ref/shared/result-insns
	cat nPbatch/montgomery25519/ref/shared/result-namespace nPbatch/montgomery25519/ref/shared/result-insns > nPbatch/montgomery25519/ref/shared/result

nPbatch/montgomery25519/ref/C0/result: nPbatch/montgomery25519/ref/C0/result-namespace nPbatch/montgomery25519/ref/C0/result-insns nPbatch/montgomery25519/ref/C0/nPbatch.o
	cat nPbatch/montgomery25519/ref/C0/result-namespace nPbatch/montgomery25519/ref/C0/result-insns nPbatch/montgomery25519/ref/C0/result-compile-nPbatch > nPbatch/montgomery25519/ref/C0/result

nPbatch/montgomery25519/ref/C1/result: nPbatch/montgomery25519/ref/C1/result-namespace nPbatch/montgomery25519/ref/C1/result-insns nPbatch/montgomery25519/ref/C1/nPbatch.o
	cat nPbatch/montgomery25519/ref/C1/result-namespace nPbatch/montgomery25519/ref/C1/result-insns nPbatch/montgomery25519/ref/C1/result-compile-nPbatch > nPbatch/montgomery25519/ref/C1/result

nG/merged25519/arm64-maa4-intmul/shared/result: nG/merged25519/arm64-maa4-intmul/shared/result-namespace nG/merged25519/arm64-maa4-intmul/shared/result-insns nG/merged25519/arm64-maa4-intmul/shared/ge25519_base.o
	cat nG/merged25519/arm64-maa4-intmul/shared/result-namespace nG/merged25519/arm64-maa4-intmul/shared/result-insns nG/merged25519/arm64-maa4-intmul/shared/result-compile-ge25519_base > nG/merged25519/arm64-maa4-intmul/shared/result

unified/fe25519addS/1/shared/result: unified/fe25519addS/1/shared/result-namespace unified/fe25519addS/1/shared/result-insns unified/fe25519addS/1/shared/fe25519_add.o
	cat unified/fe25519addS/1/shared/result-namespace unified/fe25519addS/1/shared/result-insns unified/fe25519addS/1/shared/result-compile-fe25519_add > unified/fe25519addS/1/shared/result

unified/fe25519cmovS/1/shared/result: unified/fe25519cmovS/1/shared/result-namespace unified/fe25519cmovS/1/shared/result-insns unified/fe25519cmovS/1/shared/fe25519_cmov.o
	cat unified/fe25519cmovS/1/shared/result-namespace unified/fe25519cmovS/1/shared/result-insns unified/fe25519cmovS/1/shared/result-compile-fe25519_cmov > unified/fe25519cmovS/1/shared/result

unified/fe25519subS/1/shared/result: unified/fe25519subS/1/shared/result-namespace unified/fe25519subS/1/shared/result-insns unified/fe25519subS/1/shared/fe25519_sub.o
	cat unified/fe25519subS/1/shared/result-namespace unified/fe25519subS/1/shared/result-insns unified/fe25519subS/1/shared/result-compile-fe25519_sub > unified/fe25519subS/1/shared/result

unified/sharedbasedatac/1/shared/result: unified/sharedbasedatac/1/shared/result-namespace unified/sharedbasedatac/1/shared/result-insns unified/sharedbasedatac/1/shared/shared-base-data.o
	cat unified/sharedbasedatac/1/shared/result-namespace unified/sharedbasedatac/1/shared/result-insns unified/sharedbasedatac/1/shared/result-compile-shared-base-data > unified/sharedbasedatac/1/shared/result

nG/merged25519/arm64-maa4-intmul/C0/result: nG/merged25519/arm64-maa4-intmul/C0/result-namespace nG/merged25519/arm64-maa4-intmul/C0/result-insns nG/merged25519/arm64-maa4-intmul/C0/ge25519_scalarmult_base.o nG/merged25519/arm64-maa4-intmul/C0/nG.o
	cat nG/merged25519/arm64-maa4-intmul/C0/result-namespace nG/merged25519/arm64-maa4-intmul/C0/result-insns nG/merged25519/arm64-maa4-intmul/C0/result-compile-ge25519_scalarmult_base nG/merged25519/arm64-maa4-intmul/C0/result-compile-nG > nG/merged25519/arm64-maa4-intmul/C0/result

unified/fe25519getparityc/1/C0/result: unified/fe25519getparityc/1/C0/result-namespace unified/fe25519getparityc/1/C0/result-insns unified/fe25519getparityc/1/C0/fe25519_getparity.o
	cat unified/fe25519getparityc/1/C0/result-namespace unified/fe25519getparityc/1/C0/result-insns unified/fe25519getparityc/1/C0/result-compile-fe25519_getparity > unified/fe25519getparityc/1/C0/result

unified/sc25519from32bytesc/1/C0/result: unified/sc25519from32bytesc/1/C0/result-namespace unified/sc25519from32bytesc/1/C0/result-insns unified/sc25519from32bytesc/1/C0/sc25519_from32bytes.o
	cat unified/sc25519from32bytesc/1/C0/result-namespace unified/sc25519from32bytesc/1/C0/result-insns unified/sc25519from32bytesc/1/C0/result-compile-sc25519_from32bytes > unified/sc25519from32bytesc/1/C0/result

unified/sc25519window4c/1/C0/result: unified/sc25519window4c/1/C0/result-namespace unified/sc25519window4c/1/C0/result-insns unified/sc25519window4c/1/C0/sc25519_window4.o
	cat unified/sc25519window4c/1/C0/result-namespace unified/sc25519window4c/1/C0/result-insns unified/sc25519window4c/1/C0/result-compile-sc25519_window4 > unified/sc25519window4c/1/C0/result

nG/merged25519/arm64-maa4-intmul/C1/result: nG/merged25519/arm64-maa4-intmul/C1/result-namespace nG/merged25519/arm64-maa4-intmul/C1/result-insns nG/merged25519/arm64-maa4-intmul/C1/ge25519_scalarmult_base.o nG/merged25519/arm64-maa4-intmul/C1/nG.o
	cat nG/merged25519/arm64-maa4-intmul/C1/result-namespace nG/merged25519/arm64-maa4-intmul/C1/result-insns nG/merged25519/arm64-maa4-intmul/C1/result-compile-ge25519_scalarmult_base nG/merged25519/arm64-maa4-intmul/C1/result-compile-nG > nG/merged25519/arm64-maa4-intmul/C1/result

unified/fe25519getparityc/2/C1/result: unified/fe25519getparityc/2/C1/result-namespace unified/fe25519getparityc/2/C1/result-insns unified/fe25519getparityc/2/C1/fe25519_getparity.o
	cat unified/fe25519getparityc/2/C1/result-namespace unified/fe25519getparityc/2/C1/result-insns unified/fe25519getparityc/2/C1/result-compile-fe25519_getparity > unified/fe25519getparityc/2/C1/result

unified/sc25519from32bytesc/2/C1/result: unified/sc25519from32bytesc/2/C1/result-namespace unified/sc25519from32bytesc/2/C1/result-insns unified/sc25519from32bytesc/2/C1/sc25519_from32bytes.o
	cat unified/sc25519from32bytesc/2/C1/result-namespace unified/sc25519from32bytesc/2/C1/result-insns unified/sc25519from32bytesc/2/C1/result-compile-sc25519_from32bytes > unified/sc25519from32bytesc/2/C1/result

unified/sc25519window4c/2/C1/result: unified/sc25519window4c/2/C1/result-namespace unified/sc25519window4c/2/C1/result-insns unified/sc25519window4c/2/C1/sc25519_window4.o
	cat unified/sc25519window4c/2/C1/result-namespace unified/sc25519window4c/2/C1/result-insns unified/sc25519window4c/2/C1/result-compile-sc25519_window4 > unified/sc25519window4c/2/C1/result

nG/merged25519/arm64-maa4-redmul/shared/result: nG/merged25519/arm64-maa4-redmul/shared/result-namespace nG/merged25519/arm64-maa4-redmul/shared/result-insns nG/merged25519/arm64-maa4-redmul/shared/ge25519_base.o
	cat nG/merged25519/arm64-maa4-redmul/shared/result-namespace nG/merged25519/arm64-maa4-redmul/shared/result-insns nG/merged25519/arm64-maa4-redmul/shared/result-compile-ge25519_base > nG/merged25519/arm64-maa4-redmul/shared/result

nG/merged25519/arm64-maa4-redmul/C0/result: nG/merged25519/arm64-maa4-redmul/C0/result-namespace nG/merged25519/arm64-maa4-redmul/C0/result-insns nG/merged25519/arm64-maa4-redmul/C0/ge25519_scalarmult_base.o nG/merged25519/arm64-maa4-redmul/C0/nG.o
	cat nG/merged25519/arm64-maa4-redmul/C0/result-namespace nG/merged25519/arm64-maa4-redmul/C0/result-insns nG/merged25519/arm64-maa4-redmul/C0/result-compile-ge25519_scalarmult_base nG/merged25519/arm64-maa4-redmul/C0/result-compile-nG > nG/merged25519/arm64-maa4-redmul/C0/result

nG/merged25519/arm64-maa4-redmul/C1/result: nG/merged25519/arm64-maa4-redmul/C1/result-namespace nG/merged25519/arm64-maa4-redmul/C1/result-insns nG/merged25519/arm64-maa4-redmul/C1/ge25519_scalarmult_base.o nG/merged25519/arm64-maa4-redmul/C1/nG.o
	cat nG/merged25519/arm64-maa4-redmul/C1/result-namespace nG/merged25519/arm64-maa4-redmul/C1/result-insns nG/merged25519/arm64-maa4-redmul/C1/result-compile-ge25519_scalarmult_base nG/merged25519/arm64-maa4-redmul/C1/result-compile-nG > nG/merged25519/arm64-maa4-redmul/C1/result

nG/merged25519/ref10/shared/result: nG/merged25519/ref10/shared/result-namespace nG/merged25519/ref10/shared/result-insns nG/merged25519/ref10/shared/shared-base.o
	cat nG/merged25519/ref10/shared/result-namespace nG/merged25519/ref10/shared/result-insns nG/merged25519/ref10/shared/result-compile-shared-base > nG/merged25519/ref10/shared/result

nG/merged25519/ref10/C0/result: nG/merged25519/ref10/C0/result-namespace nG/merged25519/ref10/C0/result-insns nG/merged25519/ref10/C0/ge_p3_0.o nG/merged25519/ref10/C0/ge_precomp_0.o nG/merged25519/ref10/C0/ge_scalarmult_base.o nG/merged25519/ref10/C0/nG.o
	cat nG/merged25519/ref10/C0/result-namespace nG/merged25519/ref10/C0/result-insns nG/merged25519/ref10/C0/result-compile-ge_p3_0 nG/merged25519/ref10/C0/result-compile-ge_precomp_0 nG/merged25519/ref10/C0/result-compile-ge_scalarmult_base nG/merged25519/ref10/C0/result-compile-nG > nG/merged25519/ref10/C0/result

unified/feaddc/1/C0/result: unified/feaddc/1/C0/result-namespace unified/feaddc/1/C0/result-insns unified/feaddc/1/C0/fe_add.o
	cat unified/feaddc/1/C0/result-namespace unified/feaddc/1/C0/result-insns unified/feaddc/1/C0/result-compile-fe_add > unified/feaddc/1/C0/result

unified/fecopyc/1/C0/result: unified/fecopyc/1/C0/result-namespace unified/fecopyc/1/C0/result-insns unified/fecopyc/1/C0/fe_copy.o
	cat unified/fecopyc/1/C0/result-namespace unified/fecopyc/1/C0/result-insns unified/fecopyc/1/C0/result-compile-fe_copy > unified/fecopyc/1/C0/result

unified/fefrombytesc/3/C0/result: unified/fefrombytesc/3/C0/result-namespace unified/fefrombytesc/3/C0/result-insns unified/fefrombytesc/3/C0/fe_frombytes.o
	cat unified/fefrombytesc/3/C0/result-namespace unified/fefrombytesc/3/C0/result-insns unified/fefrombytesc/3/C0/result-compile-fe_frombytes > unified/fefrombytesc/3/C0/result

unified/feinvertc/1/C0/result: unified/feinvertc/1/C0/result-namespace unified/feinvertc/1/C0/result-insns unified/feinvertc/1/C0/fe_invert.o
	cat unified/feinvertc/1/C0/result-namespace unified/feinvertc/1/C0/result-insns unified/feinvertc/1/C0/result-compile-fe_invert > unified/feinvertc/1/C0/result

unified/feisnegativec/1/C0/result: unified/feisnegativec/1/C0/result-namespace unified/feisnegativec/1/C0/result-insns unified/feisnegativec/1/C0/fe_isnegative.o
	cat unified/feisnegativec/1/C0/result-namespace unified/feisnegativec/1/C0/result-insns unified/feisnegativec/1/C0/result-compile-fe_isnegative > unified/feisnegativec/1/C0/result

unified/femulc/3/C0/result: unified/femulc/3/C0/result-namespace unified/femulc/3/C0/result-insns unified/femulc/3/C0/fe_mul.o
	cat unified/femulc/3/C0/result-namespace unified/femulc/3/C0/result-insns unified/femulc/3/C0/result-compile-fe_mul > unified/femulc/3/C0/result

unified/fenegc/1/C0/result: unified/fenegc/1/C0/result-namespace unified/fenegc/1/C0/result-insns unified/fenegc/1/C0/fe_neg.o
	cat unified/fenegc/1/C0/result-namespace unified/fenegc/1/C0/result-insns unified/fenegc/1/C0/result-compile-fe_neg > unified/fenegc/1/C0/result

unified/fesqc/3/C0/result: unified/fesqc/3/C0/result-namespace unified/fesqc/3/C0/result-insns unified/fesqc/3/C0/fe_sq.o
	cat unified/fesqc/3/C0/result-namespace unified/fesqc/3/C0/result-insns unified/fesqc/3/C0/result-compile-fe_sq > unified/fesqc/3/C0/result

unified/fesq2c/1/C0/result: unified/fesq2c/1/C0/result-namespace unified/fesq2c/1/C0/result-insns unified/fesq2c/1/C0/fe_sq2.o
	cat unified/fesq2c/1/C0/result-namespace unified/fesq2c/1/C0/result-insns unified/fesq2c/1/C0/result-compile-fe_sq2 > unified/fesq2c/1/C0/result

unified/fesubc/1/C0/result: unified/fesubc/1/C0/result-namespace unified/fesubc/1/C0/result-insns unified/fesubc/1/C0/fe_sub.o
	cat unified/fesubc/1/C0/result-namespace unified/fesubc/1/C0/result-insns unified/fesubc/1/C0/result-compile-fe_sub > unified/fesubc/1/C0/result

unified/fetobytesc/3/C0/result: unified/fetobytesc/3/C0/result-namespace unified/fetobytesc/3/C0/result-insns unified/fetobytesc/3/C0/fe_tobytes.o
	cat unified/fetobytesc/3/C0/result-namespace unified/fetobytesc/3/C0/result-insns unified/fetobytesc/3/C0/result-compile-fe_tobytes > unified/fetobytesc/3/C0/result

unified/gemaddc/1/C0/result: unified/gemaddc/1/C0/result-namespace unified/gemaddc/1/C0/result-insns unified/gemaddc/1/C0/ge_madd.o
	cat unified/gemaddc/1/C0/result-namespace unified/gemaddc/1/C0/result-insns unified/gemaddc/1/C0/result-compile-ge_madd > unified/gemaddc/1/C0/result

unified/gep1p1top2c/1/C0/result: unified/gep1p1top2c/1/C0/result-namespace unified/gep1p1top2c/1/C0/result-insns unified/gep1p1top2c/1/C0/ge_p1p1_to_p2.o
	cat unified/gep1p1top2c/1/C0/result-namespace unified/gep1p1top2c/1/C0/result-insns unified/gep1p1top2c/1/C0/result-compile-ge_p1p1_to_p2 > unified/gep1p1top2c/1/C0/result

unified/gep1p1top3c/1/C0/result: unified/gep1p1top3c/1/C0/result-namespace unified/gep1p1top3c/1/C0/result-insns unified/gep1p1top3c/1/C0/ge_p1p1_to_p3.o
	cat unified/gep1p1top3c/1/C0/result-namespace unified/gep1p1top3c/1/C0/result-insns unified/gep1p1top3c/1/C0/result-compile-ge_p1p1_to_p3 > unified/gep1p1top3c/1/C0/result

unified/gep2dblc/1/C0/result: unified/gep2dblc/1/C0/result-namespace unified/gep2dblc/1/C0/result-insns unified/gep2dblc/1/C0/ge_p2_dbl.o
	cat unified/gep2dblc/1/C0/result-namespace unified/gep2dblc/1/C0/result-insns unified/gep2dblc/1/C0/result-compile-ge_p2_dbl > unified/gep2dblc/1/C0/result

unified/gep3dblc/1/C0/result: unified/gep3dblc/1/C0/result-namespace unified/gep3dblc/1/C0/result-insns unified/gep3dblc/1/C0/ge_p3_dbl.o
	cat unified/gep3dblc/1/C0/result-namespace unified/gep3dblc/1/C0/result-insns unified/gep3dblc/1/C0/result-compile-ge_p3_dbl > unified/gep3dblc/1/C0/result

unified/gep3top2c/1/C0/result: unified/gep3top2c/1/C0/result-namespace unified/gep3top2c/1/C0/result-insns unified/gep3top2c/1/C0/ge_p3_to_p2.o
	cat unified/gep3top2c/1/C0/result-namespace unified/gep3top2c/1/C0/result-insns unified/gep3top2c/1/C0/result-compile-ge_p3_to_p2 > unified/gep3top2c/1/C0/result

nG/merged25519/ref10/C1/result: nG/merged25519/ref10/C1/result-namespace nG/merged25519/ref10/C1/result-insns nG/merged25519/ref10/C1/ge_p3_0.o nG/merged25519/ref10/C1/ge_precomp_0.o nG/merged25519/ref10/C1/ge_scalarmult_base.o nG/merged25519/ref10/C1/nG.o
	cat nG/merged25519/ref10/C1/result-namespace nG/merged25519/ref10/C1/result-insns nG/merged25519/ref10/C1/result-compile-ge_p3_0 nG/merged25519/ref10/C1/result-compile-ge_precomp_0 nG/merged25519/ref10/C1/result-compile-ge_scalarmult_base nG/merged25519/ref10/C1/result-compile-nG > nG/merged25519/ref10/C1/result

unified/feaddc/2/C1/result: unified/feaddc/2/C1/result-namespace unified/feaddc/2/C1/result-insns unified/feaddc/2/C1/fe_add.o
	cat unified/feaddc/2/C1/result-namespace unified/feaddc/2/C1/result-insns unified/feaddc/2/C1/result-compile-fe_add > unified/feaddc/2/C1/result

unified/fecopyc/2/C1/result: unified/fecopyc/2/C1/result-namespace unified/fecopyc/2/C1/result-insns unified/fecopyc/2/C1/fe_copy.o
	cat unified/fecopyc/2/C1/result-namespace unified/fecopyc/2/C1/result-insns unified/fecopyc/2/C1/result-compile-fe_copy > unified/fecopyc/2/C1/result

unified/fefrombytesc/4/C1/result: unified/fefrombytesc/4/C1/result-namespace unified/fefrombytesc/4/C1/result-insns unified/fefrombytesc/4/C1/fe_frombytes.o
	cat unified/fefrombytesc/4/C1/result-namespace unified/fefrombytesc/4/C1/result-insns unified/fefrombytesc/4/C1/result-compile-fe_frombytes > unified/fefrombytesc/4/C1/result

unified/feinvertc/2/C1/result: unified/feinvertc/2/C1/result-namespace unified/feinvertc/2/C1/result-insns unified/feinvertc/2/C1/fe_invert.o
	cat unified/feinvertc/2/C1/result-namespace unified/feinvertc/2/C1/result-insns unified/feinvertc/2/C1/result-compile-fe_invert > unified/feinvertc/2/C1/result

unified/feisnegativec/2/C1/result: unified/feisnegativec/2/C1/result-namespace unified/feisnegativec/2/C1/result-insns unified/feisnegativec/2/C1/fe_isnegative.o
	cat unified/feisnegativec/2/C1/result-namespace unified/feisnegativec/2/C1/result-insns unified/feisnegativec/2/C1/result-compile-fe_isnegative > unified/feisnegativec/2/C1/result

unified/femulc/4/C1/result: unified/femulc/4/C1/result-namespace unified/femulc/4/C1/result-insns unified/femulc/4/C1/fe_mul.o
	cat unified/femulc/4/C1/result-namespace unified/femulc/4/C1/result-insns unified/femulc/4/C1/result-compile-fe_mul > unified/femulc/4/C1/result

unified/fenegc/2/C1/result: unified/fenegc/2/C1/result-namespace unified/fenegc/2/C1/result-insns unified/fenegc/2/C1/fe_neg.o
	cat unified/fenegc/2/C1/result-namespace unified/fenegc/2/C1/result-insns unified/fenegc/2/C1/result-compile-fe_neg > unified/fenegc/2/C1/result

unified/fesqc/4/C1/result: unified/fesqc/4/C1/result-namespace unified/fesqc/4/C1/result-insns unified/fesqc/4/C1/fe_sq.o
	cat unified/fesqc/4/C1/result-namespace unified/fesqc/4/C1/result-insns unified/fesqc/4/C1/result-compile-fe_sq > unified/fesqc/4/C1/result

unified/fesq2c/2/C1/result: unified/fesq2c/2/C1/result-namespace unified/fesq2c/2/C1/result-insns unified/fesq2c/2/C1/fe_sq2.o
	cat unified/fesq2c/2/C1/result-namespace unified/fesq2c/2/C1/result-insns unified/fesq2c/2/C1/result-compile-fe_sq2 > unified/fesq2c/2/C1/result

unified/fesubc/2/C1/result: unified/fesubc/2/C1/result-namespace unified/fesubc/2/C1/result-insns unified/fesubc/2/C1/fe_sub.o
	cat unified/fesubc/2/C1/result-namespace unified/fesubc/2/C1/result-insns unified/fesubc/2/C1/result-compile-fe_sub > unified/fesubc/2/C1/result

unified/fetobytesc/4/C1/result: unified/fetobytesc/4/C1/result-namespace unified/fetobytesc/4/C1/result-insns unified/fetobytesc/4/C1/fe_tobytes.o
	cat unified/fetobytesc/4/C1/result-namespace unified/fetobytesc/4/C1/result-insns unified/fetobytesc/4/C1/result-compile-fe_tobytes > unified/fetobytesc/4/C1/result

unified/gemaddc/2/C1/result: unified/gemaddc/2/C1/result-namespace unified/gemaddc/2/C1/result-insns unified/gemaddc/2/C1/ge_madd.o
	cat unified/gemaddc/2/C1/result-namespace unified/gemaddc/2/C1/result-insns unified/gemaddc/2/C1/result-compile-ge_madd > unified/gemaddc/2/C1/result

unified/gep1p1top2c/2/C1/result: unified/gep1p1top2c/2/C1/result-namespace unified/gep1p1top2c/2/C1/result-insns unified/gep1p1top2c/2/C1/ge_p1p1_to_p2.o
	cat unified/gep1p1top2c/2/C1/result-namespace unified/gep1p1top2c/2/C1/result-insns unified/gep1p1top2c/2/C1/result-compile-ge_p1p1_to_p2 > unified/gep1p1top2c/2/C1/result

unified/gep1p1top3c/2/C1/result: unified/gep1p1top3c/2/C1/result-namespace unified/gep1p1top3c/2/C1/result-insns unified/gep1p1top3c/2/C1/ge_p1p1_to_p3.o
	cat unified/gep1p1top3c/2/C1/result-namespace unified/gep1p1top3c/2/C1/result-insns unified/gep1p1top3c/2/C1/result-compile-ge_p1p1_to_p3 > unified/gep1p1top3c/2/C1/result

unified/gep2dblc/2/C1/result: unified/gep2dblc/2/C1/result-namespace unified/gep2dblc/2/C1/result-insns unified/gep2dblc/2/C1/ge_p2_dbl.o
	cat unified/gep2dblc/2/C1/result-namespace unified/gep2dblc/2/C1/result-insns unified/gep2dblc/2/C1/result-compile-ge_p2_dbl > unified/gep2dblc/2/C1/result

unified/gep3dblc/2/C1/result: unified/gep3dblc/2/C1/result-namespace unified/gep3dblc/2/C1/result-insns unified/gep3dblc/2/C1/ge_p3_dbl.o
	cat unified/gep3dblc/2/C1/result-namespace unified/gep3dblc/2/C1/result-insns unified/gep3dblc/2/C1/result-compile-ge_p3_dbl > unified/gep3dblc/2/C1/result

unified/gep3top2c/2/C1/result: unified/gep3top2c/2/C1/result-namespace unified/gep3top2c/2/C1/result-insns unified/gep3top2c/2/C1/ge_p3_to_p2.o
	cat unified/gep3top2c/2/C1/result-namespace unified/gep3top2c/2/C1/result-insns unified/gep3top2c/2/C1/result-compile-ge_p3_to_p2 > unified/gep3top2c/2/C1/result

nG/montgomery25519/ref/shared/result: nG/montgomery25519/ref/shared/result-namespace nG/montgomery25519/ref/shared/result-insns
	cat nG/montgomery25519/ref/shared/result-namespace nG/montgomery25519/ref/shared/result-insns > nG/montgomery25519/ref/shared/result

nG/montgomery25519/ref/C0/result: nG/montgomery25519/ref/C0/result-namespace nG/montgomery25519/ref/C0/result-insns nG/montgomery25519/ref/C0/base.o
	cat nG/montgomery25519/ref/C0/result-namespace nG/montgomery25519/ref/C0/result-insns nG/montgomery25519/ref/C0/result-compile-base > nG/montgomery25519/ref/C0/result

nG/montgomery25519/ref/C1/result: nG/montgomery25519/ref/C1/result-namespace nG/montgomery25519/ref/C1/result-insns nG/montgomery25519/ref/C1/base.o
	cat nG/montgomery25519/ref/C1/result-namespace nG/montgomery25519/ref/C1/result-insns nG/montgomery25519/ref/C1/result-compile-base > nG/montgomery25519/ref/C1/result

nG/montgomery25519/usemerged/shared/result: nG/montgomery25519/usemerged/shared/result-namespace nG/montgomery25519/usemerged/shared/result-insns
	cat nG/montgomery25519/usemerged/shared/result-namespace nG/montgomery25519/usemerged/shared/result-insns > nG/montgomery25519/usemerged/shared/result

nG/montgomery25519/usemerged/C0/result: nG/montgomery25519/usemerged/C0/result-namespace nG/montgomery25519/usemerged/C0/result-insns nG/montgomery25519/usemerged/C0/base.o
	cat nG/montgomery25519/usemerged/C0/result-namespace nG/montgomery25519/usemerged/C0/result-insns nG/montgomery25519/usemerged/C0/result-compile-base > nG/montgomery25519/usemerged/C0/result

nG/montgomery25519/usemerged/C1/result: nG/montgomery25519/usemerged/C1/result-namespace nG/montgomery25519/usemerged/C1/result-insns nG/montgomery25519/usemerged/C1/base.o
	cat nG/montgomery25519/usemerged/C1/result-namespace nG/montgomery25519/usemerged/C1/result-insns nG/montgomery25519/usemerged/C1/result-compile-base > nG/montgomery25519/usemerged/C1/result

mGnP/ed25519/arm64-maa4-intmul/shared/result: mGnP/ed25519/arm64-maa4-intmul/shared/result-namespace mGnP/ed25519/arm64-maa4-intmul/shared/result-insns mGnP/ed25519/arm64-maa4-intmul/shared/ge25519_double_scalarmult_process.o mGnP/ed25519/arm64-maa4-intmul/shared/shared-data.o
	cat mGnP/ed25519/arm64-maa4-intmul/shared/result-namespace mGnP/ed25519/arm64-maa4-intmul/shared/result-insns mGnP/ed25519/arm64-maa4-intmul/shared/result-compile-ge25519_double_scalarmult_process mGnP/ed25519/arm64-maa4-intmul/shared/result-compile-shared-data > mGnP/ed25519/arm64-maa4-intmul/shared/result

unified/ge25519doublescalarmultprecomputeS/1/shared/result: unified/ge25519doublescalarmultprecomputeS/1/shared/result-namespace unified/ge25519doublescalarmultprecomputeS/1/shared/result-insns unified/ge25519doublescalarmultprecomputeS/1/shared/ge25519_double_scalarmult_precompute.o
	cat unified/ge25519doublescalarmultprecomputeS/1/shared/result-namespace unified/ge25519doublescalarmultprecomputeS/1/shared/result-insns unified/ge25519doublescalarmultprecomputeS/1/shared/result-compile-ge25519_double_scalarmult_precompute > unified/ge25519doublescalarmultprecomputeS/1/shared/result

unified/sc25519barrettS/1/shared/result: unified/sc25519barrettS/1/shared/result-namespace unified/sc25519barrettS/1/shared/result-insns unified/sc25519barrettS/1/shared/sc25519_barrett.o
	cat unified/sc25519barrettS/1/shared/result-namespace unified/sc25519barrettS/1/shared/result-insns unified/sc25519barrettS/1/shared/result-compile-sc25519_barrett > unified/sc25519barrettS/1/shared/result

mGnP/ed25519/arm64-maa4-intmul/C0/result: mGnP/ed25519/arm64-maa4-intmul/C0/result-namespace mGnP/ed25519/arm64-maa4-intmul/C0/result-insns mGnP/ed25519/arm64-maa4-intmul/C0/ge25519_pack.o mGnP/ed25519/arm64-maa4-intmul/C0/ge25519_unpackneg.o mGnP/ed25519/arm64-maa4-intmul/C0/mGnP.o
	cat mGnP/ed25519/arm64-maa4-intmul/C0/result-namespace mGnP/ed25519/arm64-maa4-intmul/C0/result-insns mGnP/ed25519/arm64-maa4-intmul/C0/result-compile-ge25519_pack mGnP/ed25519/arm64-maa4-intmul/C0/result-compile-ge25519_unpackneg mGnP/ed25519/arm64-maa4-intmul/C0/result-compile-mGnP > mGnP/ed25519/arm64-maa4-intmul/C0/result

unified/fe25519iseqc/1/C0/result: unified/fe25519iseqc/1/C0/result-namespace unified/fe25519iseqc/1/C0/result-insns unified/fe25519iseqc/1/C0/fe25519_iseq.o
	cat unified/fe25519iseqc/1/C0/result-namespace unified/fe25519iseqc/1/C0/result-insns unified/fe25519iseqc/1/C0/result-compile-fe25519_iseq > unified/fe25519iseqc/1/C0/result

unified/fe25519pow2523c/1/C0/result: unified/fe25519pow2523c/1/C0/result-namespace unified/fe25519pow2523c/1/C0/result-insns unified/fe25519pow2523c/1/C0/fe25519_pow2523.o
	cat unified/fe25519pow2523c/1/C0/result-namespace unified/fe25519pow2523c/1/C0/result-insns unified/fe25519pow2523c/1/C0/result-compile-fe25519_pow2523 > unified/fe25519pow2523c/1/C0/result

unified/fe25519setintc/1/C0/result: unified/fe25519setintc/1/C0/result-namespace unified/fe25519setintc/1/C0/result-insns unified/fe25519setintc/1/C0/fe25519_setint.o
	cat unified/fe25519setintc/1/C0/result-namespace unified/fe25519setintc/1/C0/result-insns unified/fe25519setintc/1/C0/result-compile-fe25519_setint > unified/fe25519setintc/1/C0/result

unified/sc25519from64bytesc/1/C0/result: unified/sc25519from64bytesc/1/C0/result-namespace unified/sc25519from64bytesc/1/C0/result-insns unified/sc25519from64bytesc/1/C0/sc25519_from64bytes.o
	cat unified/sc25519from64bytesc/1/C0/result-namespace unified/sc25519from64bytesc/1/C0/result-insns unified/sc25519from64bytesc/1/C0/result-compile-sc25519_from64bytes > unified/sc25519from64bytesc/1/C0/result

unified/sc25519slidec/1/C0/result: unified/sc25519slidec/1/C0/result-namespace unified/sc25519slidec/1/C0/result-insns unified/sc25519slidec/1/C0/sc25519_slide.o
	cat unified/sc25519slidec/1/C0/result-namespace unified/sc25519slidec/1/C0/result-insns unified/sc25519slidec/1/C0/result-compile-sc25519_slide > unified/sc25519slidec/1/C0/result

unified/sc25519to32bytesc/1/C0/result: unified/sc25519to32bytesc/1/C0/result-namespace unified/sc25519to32bytesc/1/C0/result-insns unified/sc25519to32bytesc/1/C0/sc25519_to32bytes.o
	cat unified/sc25519to32bytesc/1/C0/result-namespace unified/sc25519to32bytesc/1/C0/result-insns unified/sc25519to32bytesc/1/C0/result-compile-sc25519_to32bytes > unified/sc25519to32bytesc/1/C0/result

mGnP/ed25519/arm64-maa4-intmul/C1/result: mGnP/ed25519/arm64-maa4-intmul/C1/result-namespace mGnP/ed25519/arm64-maa4-intmul/C1/result-insns mGnP/ed25519/arm64-maa4-intmul/C1/ge25519_pack.o mGnP/ed25519/arm64-maa4-intmul/C1/ge25519_unpackneg.o mGnP/ed25519/arm64-maa4-intmul/C1/mGnP.o
	cat mGnP/ed25519/arm64-maa4-intmul/C1/result-namespace mGnP/ed25519/arm64-maa4-intmul/C1/result-insns mGnP/ed25519/arm64-maa4-intmul/C1/result-compile-ge25519_pack mGnP/ed25519/arm64-maa4-intmul/C1/result-compile-ge25519_unpackneg mGnP/ed25519/arm64-maa4-intmul/C1/result-compile-mGnP > mGnP/ed25519/arm64-maa4-intmul/C1/result

unified/fe25519iseqc/2/C1/result: unified/fe25519iseqc/2/C1/result-namespace unified/fe25519iseqc/2/C1/result-insns unified/fe25519iseqc/2/C1/fe25519_iseq.o
	cat unified/fe25519iseqc/2/C1/result-namespace unified/fe25519iseqc/2/C1/result-insns unified/fe25519iseqc/2/C1/result-compile-fe25519_iseq > unified/fe25519iseqc/2/C1/result

unified/fe25519pow2523c/2/C1/result: unified/fe25519pow2523c/2/C1/result-namespace unified/fe25519pow2523c/2/C1/result-insns unified/fe25519pow2523c/2/C1/fe25519_pow2523.o
	cat unified/fe25519pow2523c/2/C1/result-namespace unified/fe25519pow2523c/2/C1/result-insns unified/fe25519pow2523c/2/C1/result-compile-fe25519_pow2523 > unified/fe25519pow2523c/2/C1/result

unified/fe25519setintc/2/C1/result: unified/fe25519setintc/2/C1/result-namespace unified/fe25519setintc/2/C1/result-insns unified/fe25519setintc/2/C1/fe25519_setint.o
	cat unified/fe25519setintc/2/C1/result-namespace unified/fe25519setintc/2/C1/result-insns unified/fe25519setintc/2/C1/result-compile-fe25519_setint > unified/fe25519setintc/2/C1/result

unified/sc25519from64bytesc/2/C1/result: unified/sc25519from64bytesc/2/C1/result-namespace unified/sc25519from64bytesc/2/C1/result-insns unified/sc25519from64bytesc/2/C1/sc25519_from64bytes.o
	cat unified/sc25519from64bytesc/2/C1/result-namespace unified/sc25519from64bytesc/2/C1/result-insns unified/sc25519from64bytesc/2/C1/result-compile-sc25519_from64bytes > unified/sc25519from64bytesc/2/C1/result

unified/sc25519slidec/2/C1/result: unified/sc25519slidec/2/C1/result-namespace unified/sc25519slidec/2/C1/result-insns unified/sc25519slidec/2/C1/sc25519_slide.o
	cat unified/sc25519slidec/2/C1/result-namespace unified/sc25519slidec/2/C1/result-insns unified/sc25519slidec/2/C1/result-compile-sc25519_slide > unified/sc25519slidec/2/C1/result

unified/sc25519to32bytesc/2/C1/result: unified/sc25519to32bytesc/2/C1/result-namespace unified/sc25519to32bytesc/2/C1/result-insns unified/sc25519to32bytesc/2/C1/sc25519_to32bytes.o
	cat unified/sc25519to32bytesc/2/C1/result-namespace unified/sc25519to32bytesc/2/C1/result-insns unified/sc25519to32bytesc/2/C1/result-compile-sc25519_to32bytes > unified/sc25519to32bytesc/2/C1/result

mGnP/ed25519/arm64-maa4-redmul/shared/result: mGnP/ed25519/arm64-maa4-redmul/shared/result-namespace mGnP/ed25519/arm64-maa4-redmul/shared/result-insns mGnP/ed25519/arm64-maa4-redmul/shared/ge25519_double_scalarmult_process.o mGnP/ed25519/arm64-maa4-redmul/shared/shared-data.o
	cat mGnP/ed25519/arm64-maa4-redmul/shared/result-namespace mGnP/ed25519/arm64-maa4-redmul/shared/result-insns mGnP/ed25519/arm64-maa4-redmul/shared/result-compile-ge25519_double_scalarmult_process mGnP/ed25519/arm64-maa4-redmul/shared/result-compile-shared-data > mGnP/ed25519/arm64-maa4-redmul/shared/result

unified/ge25519doublescalarmultprecomputeS/2/shared/result: unified/ge25519doublescalarmultprecomputeS/2/shared/result-namespace unified/ge25519doublescalarmultprecomputeS/2/shared/result-insns unified/ge25519doublescalarmultprecomputeS/2/shared/ge25519_double_scalarmult_precompute.o
	cat unified/ge25519doublescalarmultprecomputeS/2/shared/result-namespace unified/ge25519doublescalarmultprecomputeS/2/shared/result-insns unified/ge25519doublescalarmultprecomputeS/2/shared/result-compile-ge25519_double_scalarmult_precompute > unified/ge25519doublescalarmultprecomputeS/2/shared/result

mGnP/ed25519/arm64-maa4-redmul/C0/result: mGnP/ed25519/arm64-maa4-redmul/C0/result-namespace mGnP/ed25519/arm64-maa4-redmul/C0/result-insns mGnP/ed25519/arm64-maa4-redmul/C0/ge25519_pack.o mGnP/ed25519/arm64-maa4-redmul/C0/ge25519_unpackneg.o mGnP/ed25519/arm64-maa4-redmul/C0/mGnP.o
	cat mGnP/ed25519/arm64-maa4-redmul/C0/result-namespace mGnP/ed25519/arm64-maa4-redmul/C0/result-insns mGnP/ed25519/arm64-maa4-redmul/C0/result-compile-ge25519_pack mGnP/ed25519/arm64-maa4-redmul/C0/result-compile-ge25519_unpackneg mGnP/ed25519/arm64-maa4-redmul/C0/result-compile-mGnP > mGnP/ed25519/arm64-maa4-redmul/C0/result

unified/fe25519pow2523c/3/C0/result: unified/fe25519pow2523c/3/C0/result-namespace unified/fe25519pow2523c/3/C0/result-insns unified/fe25519pow2523c/3/C0/fe25519_pow2523.o
	cat unified/fe25519pow2523c/3/C0/result-namespace unified/fe25519pow2523c/3/C0/result-insns unified/fe25519pow2523c/3/C0/result-compile-fe25519_pow2523 > unified/fe25519pow2523c/3/C0/result

mGnP/ed25519/arm64-maa4-redmul/C1/result: mGnP/ed25519/arm64-maa4-redmul/C1/result-namespace mGnP/ed25519/arm64-maa4-redmul/C1/result-insns mGnP/ed25519/arm64-maa4-redmul/C1/ge25519_pack.o mGnP/ed25519/arm64-maa4-redmul/C1/ge25519_unpackneg.o mGnP/ed25519/arm64-maa4-redmul/C1/mGnP.o
	cat mGnP/ed25519/arm64-maa4-redmul/C1/result-namespace mGnP/ed25519/arm64-maa4-redmul/C1/result-insns mGnP/ed25519/arm64-maa4-redmul/C1/result-compile-ge25519_pack mGnP/ed25519/arm64-maa4-redmul/C1/result-compile-ge25519_unpackneg mGnP/ed25519/arm64-maa4-redmul/C1/result-compile-mGnP > mGnP/ed25519/arm64-maa4-redmul/C1/result

unified/fe25519pow2523c/4/C1/result: unified/fe25519pow2523c/4/C1/result-namespace unified/fe25519pow2523c/4/C1/result-insns unified/fe25519pow2523c/4/C1/fe25519_pow2523.o
	cat unified/fe25519pow2523c/4/C1/result-namespace unified/fe25519pow2523c/4/C1/result-insns unified/fe25519pow2523c/4/C1/result-compile-fe25519_pow2523 > unified/fe25519pow2523c/4/C1/result

mGnP/ed25519/ref10/shared/result: mGnP/ed25519/ref10/shared/result-namespace mGnP/ed25519/ref10/shared/result-insns mGnP/ed25519/ref10/shared/shared-Bi.o
	cat mGnP/ed25519/ref10/shared/result-namespace mGnP/ed25519/ref10/shared/result-insns mGnP/ed25519/ref10/shared/result-compile-shared-Bi > mGnP/ed25519/ref10/shared/result

mGnP/ed25519/ref10/C0/result: mGnP/ed25519/ref10/C0/result-namespace mGnP/ed25519/ref10/C0/result-insns mGnP/ed25519/ref10/C0/ge_double_scalarmult.o mGnP/ed25519/ref10/C0/ge_frombytes.o mGnP/ed25519/ref10/C0/ge_msub.o mGnP/ed25519/ref10/C0/ge_p2_0.o mGnP/ed25519/ref10/C0/mGnP.o
	cat mGnP/ed25519/ref10/C0/result-namespace mGnP/ed25519/ref10/C0/result-insns mGnP/ed25519/ref10/C0/result-compile-ge_double_scalarmult mGnP/ed25519/ref10/C0/result-compile-ge_frombytes mGnP/ed25519/ref10/C0/result-compile-ge_msub mGnP/ed25519/ref10/C0/result-compile-ge_p2_0 mGnP/ed25519/ref10/C0/result-compile-mGnP > mGnP/ed25519/ref10/C0/result

unified/feisnonzeroc/1/C0/result: unified/feisnonzeroc/1/C0/result-namespace unified/feisnonzeroc/1/C0/result-insns unified/feisnonzeroc/1/C0/fe_isnonzero.o
	cat unified/feisnonzeroc/1/C0/result-namespace unified/feisnonzeroc/1/C0/result-insns unified/feisnonzeroc/1/C0/result-compile-fe_isnonzero > unified/feisnonzeroc/1/C0/result

unified/fepow22523c/1/C0/result: unified/fepow22523c/1/C0/result-namespace unified/fepow22523c/1/C0/result-insns unified/fepow22523c/1/C0/fe_pow22523.o
	cat unified/fepow22523c/1/C0/result-namespace unified/fepow22523c/1/C0/result-insns unified/fepow22523c/1/C0/result-compile-fe_pow22523 > unified/fepow22523c/1/C0/result

unified/geaddc/1/C0/result: unified/geaddc/1/C0/result-namespace unified/geaddc/1/C0/result-insns unified/geaddc/1/C0/ge_add.o
	cat unified/geaddc/1/C0/result-namespace unified/geaddc/1/C0/result-insns unified/geaddc/1/C0/result-compile-ge_add > unified/geaddc/1/C0/result

unified/gep3tocachedc/1/C0/result: unified/gep3tocachedc/1/C0/result-namespace unified/gep3tocachedc/1/C0/result-insns unified/gep3tocachedc/1/C0/ge_p3_to_cached.o
	cat unified/gep3tocachedc/1/C0/result-namespace unified/gep3tocachedc/1/C0/result-insns unified/gep3tocachedc/1/C0/result-compile-ge_p3_to_cached > unified/gep3tocachedc/1/C0/result

unified/gesubc/1/C0/result: unified/gesubc/1/C0/result-namespace unified/gesubc/1/C0/result-insns unified/gesubc/1/C0/ge_sub.o
	cat unified/gesubc/1/C0/result-namespace unified/gesubc/1/C0/result-insns unified/gesubc/1/C0/result-compile-ge_sub > unified/gesubc/1/C0/result

unified/getobytesc/1/C0/result: unified/getobytesc/1/C0/result-namespace unified/getobytesc/1/C0/result-insns unified/getobytesc/1/C0/ge_tobytes.o
	cat unified/getobytesc/1/C0/result-namespace unified/getobytesc/1/C0/result-insns unified/getobytesc/1/C0/result-compile-ge_tobytes > unified/getobytesc/1/C0/result

unified/screducec/1/C0/result: unified/screducec/1/C0/result-namespace unified/screducec/1/C0/result-insns unified/screducec/1/C0/sc_reduce.o
	cat unified/screducec/1/C0/result-namespace unified/screducec/1/C0/result-insns unified/screducec/1/C0/result-compile-sc_reduce > unified/screducec/1/C0/result

mGnP/ed25519/ref10/C1/result: mGnP/ed25519/ref10/C1/result-namespace mGnP/ed25519/ref10/C1/result-insns mGnP/ed25519/ref10/C1/ge_double_scalarmult.o mGnP/ed25519/ref10/C1/ge_frombytes.o mGnP/ed25519/ref10/C1/ge_msub.o mGnP/ed25519/ref10/C1/ge_p2_0.o mGnP/ed25519/ref10/C1/mGnP.o
	cat mGnP/ed25519/ref10/C1/result-namespace mGnP/ed25519/ref10/C1/result-insns mGnP/ed25519/ref10/C1/result-compile-ge_double_scalarmult mGnP/ed25519/ref10/C1/result-compile-ge_frombytes mGnP/ed25519/ref10/C1/result-compile-ge_msub mGnP/ed25519/ref10/C1/result-compile-ge_p2_0 mGnP/ed25519/ref10/C1/result-compile-mGnP > mGnP/ed25519/ref10/C1/result

unified/feisnonzeroc/2/C1/result: unified/feisnonzeroc/2/C1/result-namespace unified/feisnonzeroc/2/C1/result-insns unified/feisnonzeroc/2/C1/fe_isnonzero.o
	cat unified/feisnonzeroc/2/C1/result-namespace unified/feisnonzeroc/2/C1/result-insns unified/feisnonzeroc/2/C1/result-compile-fe_isnonzero > unified/feisnonzeroc/2/C1/result

unified/fepow22523c/2/C1/result: unified/fepow22523c/2/C1/result-namespace unified/fepow22523c/2/C1/result-insns unified/fepow22523c/2/C1/fe_pow22523.o
	cat unified/fepow22523c/2/C1/result-namespace unified/fepow22523c/2/C1/result-insns unified/fepow22523c/2/C1/result-compile-fe_pow22523 > unified/fepow22523c/2/C1/result

unified/geaddc/2/C1/result: unified/geaddc/2/C1/result-namespace unified/geaddc/2/C1/result-insns unified/geaddc/2/C1/ge_add.o
	cat unified/geaddc/2/C1/result-namespace unified/geaddc/2/C1/result-insns unified/geaddc/2/C1/result-compile-ge_add > unified/geaddc/2/C1/result

unified/gep3tocachedc/2/C1/result: unified/gep3tocachedc/2/C1/result-namespace unified/gep3tocachedc/2/C1/result-insns unified/gep3tocachedc/2/C1/ge_p3_to_cached.o
	cat unified/gep3tocachedc/2/C1/result-namespace unified/gep3tocachedc/2/C1/result-insns unified/gep3tocachedc/2/C1/result-compile-ge_p3_to_cached > unified/gep3tocachedc/2/C1/result

unified/gesubc/2/C1/result: unified/gesubc/2/C1/result-namespace unified/gesubc/2/C1/result-insns unified/gesubc/2/C1/ge_sub.o
	cat unified/gesubc/2/C1/result-namespace unified/gesubc/2/C1/result-insns unified/gesubc/2/C1/result-compile-ge_sub > unified/gesubc/2/C1/result

unified/getobytesc/2/C1/result: unified/getobytesc/2/C1/result-namespace unified/getobytesc/2/C1/result-insns unified/getobytesc/2/C1/ge_tobytes.o
	cat unified/getobytesc/2/C1/result-namespace unified/getobytesc/2/C1/result-insns unified/getobytesc/2/C1/result-compile-ge_tobytes > unified/getobytesc/2/C1/result

unified/screducec/2/C1/result: unified/screducec/2/C1/result-namespace unified/screducec/2/C1/result-insns unified/screducec/2/C1/sc_reduce.o
	cat unified/screducec/2/C1/result-namespace unified/screducec/2/C1/result-insns unified/screducec/2/C1/result-compile-sc_reduce > unified/screducec/2/C1/result

multiscalar/ed25519/arm64-maa4-intmul/shared/result: multiscalar/ed25519/arm64-maa4-intmul/shared/result-namespace multiscalar/ed25519/arm64-maa4-intmul/shared/result-insns multiscalar/ed25519/arm64-maa4-intmul/shared/ge25519_multi_scalarmult_process.o multiscalar/ed25519/arm64-maa4-intmul/shared/ge25519_p1p1_to_p2.o
	cat multiscalar/ed25519/arm64-maa4-intmul/shared/result-namespace multiscalar/ed25519/arm64-maa4-intmul/shared/result-insns multiscalar/ed25519/arm64-maa4-intmul/shared/result-compile-ge25519_multi_scalarmult_process multiscalar/ed25519/arm64-maa4-intmul/shared/result-compile-ge25519_p1p1_to_p2 > multiscalar/ed25519/arm64-maa4-intmul/shared/result

multiscalar/ed25519/arm64-maa4-intmul/C0/result: multiscalar/ed25519/arm64-maa4-intmul/C0/result-namespace multiscalar/ed25519/arm64-maa4-intmul/C0/result-insns multiscalar/ed25519/arm64-maa4-intmul/C0/ge25519_pack.o multiscalar/ed25519/arm64-maa4-intmul/C0/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-intmul/C0/multiscalar.o
	cat multiscalar/ed25519/arm64-maa4-intmul/C0/result-namespace multiscalar/ed25519/arm64-maa4-intmul/C0/result-insns multiscalar/ed25519/arm64-maa4-intmul/C0/result-compile-ge25519_pack multiscalar/ed25519/arm64-maa4-intmul/C0/result-compile-ge25519_unpack multiscalar/ed25519/arm64-maa4-intmul/C0/result-compile-multiscalar > multiscalar/ed25519/arm64-maa4-intmul/C0/result

multiscalar/ed25519/arm64-maa4-intmul/C1/result: multiscalar/ed25519/arm64-maa4-intmul/C1/result-namespace multiscalar/ed25519/arm64-maa4-intmul/C1/result-insns multiscalar/ed25519/arm64-maa4-intmul/C1/ge25519_pack.o multiscalar/ed25519/arm64-maa4-intmul/C1/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-intmul/C1/multiscalar.o
	cat multiscalar/ed25519/arm64-maa4-intmul/C1/result-namespace multiscalar/ed25519/arm64-maa4-intmul/C1/result-insns multiscalar/ed25519/arm64-maa4-intmul/C1/result-compile-ge25519_pack multiscalar/ed25519/arm64-maa4-intmul/C1/result-compile-ge25519_unpack multiscalar/ed25519/arm64-maa4-intmul/C1/result-compile-multiscalar > multiscalar/ed25519/arm64-maa4-intmul/C1/result

multiscalar/ed25519/arm64-maa4-intmul-p3/shared/result: multiscalar/ed25519/arm64-maa4-intmul-p3/shared/result-namespace multiscalar/ed25519/arm64-maa4-intmul-p3/shared/result-insns multiscalar/ed25519/arm64-maa4-intmul-p3/shared/ge25519_multi_scalarmult_precompute.o multiscalar/ed25519/arm64-maa4-intmul-p3/shared/ge25519_multi_scalarmult_process.o
	cat multiscalar/ed25519/arm64-maa4-intmul-p3/shared/result-namespace multiscalar/ed25519/arm64-maa4-intmul-p3/shared/result-insns multiscalar/ed25519/arm64-maa4-intmul-p3/shared/result-compile-ge25519_multi_scalarmult_precompute multiscalar/ed25519/arm64-maa4-intmul-p3/shared/result-compile-ge25519_multi_scalarmult_process > multiscalar/ed25519/arm64-maa4-intmul-p3/shared/result

multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result: multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result-namespace multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result-insns multiscalar/ed25519/arm64-maa4-intmul-p3/C0/ge25519_pack.o multiscalar/ed25519/arm64-maa4-intmul-p3/C0/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-intmul-p3/C0/multiscalar.o
	cat multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result-namespace multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result-insns multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result-compile-ge25519_pack multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result-compile-ge25519_unpack multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result-compile-multiscalar > multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result

multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result: multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result-namespace multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result-insns multiscalar/ed25519/arm64-maa4-intmul-p3/C1/ge25519_pack.o multiscalar/ed25519/arm64-maa4-intmul-p3/C1/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-intmul-p3/C1/multiscalar.o
	cat multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result-namespace multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result-insns multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result-compile-ge25519_pack multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result-compile-ge25519_unpack multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result-compile-multiscalar > multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result

multiscalar/ed25519/arm64-maa4-redmul/shared/result: multiscalar/ed25519/arm64-maa4-redmul/shared/result-namespace multiscalar/ed25519/arm64-maa4-redmul/shared/result-insns multiscalar/ed25519/arm64-maa4-redmul/shared/ge25519_multi_scalarmult_process.o multiscalar/ed25519/arm64-maa4-redmul/shared/ge25519_p1p1_to_p2.o
	cat multiscalar/ed25519/arm64-maa4-redmul/shared/result-namespace multiscalar/ed25519/arm64-maa4-redmul/shared/result-insns multiscalar/ed25519/arm64-maa4-redmul/shared/result-compile-ge25519_multi_scalarmult_process multiscalar/ed25519/arm64-maa4-redmul/shared/result-compile-ge25519_p1p1_to_p2 > multiscalar/ed25519/arm64-maa4-redmul/shared/result

multiscalar/ed25519/arm64-maa4-redmul/C0/result: multiscalar/ed25519/arm64-maa4-redmul/C0/result-namespace multiscalar/ed25519/arm64-maa4-redmul/C0/result-insns multiscalar/ed25519/arm64-maa4-redmul/C0/ge25519_pack.o multiscalar/ed25519/arm64-maa4-redmul/C0/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-redmul/C0/multiscalar.o
	cat multiscalar/ed25519/arm64-maa4-redmul/C0/result-namespace multiscalar/ed25519/arm64-maa4-redmul/C0/result-insns multiscalar/ed25519/arm64-maa4-redmul/C0/result-compile-ge25519_pack multiscalar/ed25519/arm64-maa4-redmul/C0/result-compile-ge25519_unpack multiscalar/ed25519/arm64-maa4-redmul/C0/result-compile-multiscalar > multiscalar/ed25519/arm64-maa4-redmul/C0/result

multiscalar/ed25519/arm64-maa4-redmul/C1/result: multiscalar/ed25519/arm64-maa4-redmul/C1/result-namespace multiscalar/ed25519/arm64-maa4-redmul/C1/result-insns multiscalar/ed25519/arm64-maa4-redmul/C1/ge25519_pack.o multiscalar/ed25519/arm64-maa4-redmul/C1/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-redmul/C1/multiscalar.o
	cat multiscalar/ed25519/arm64-maa4-redmul/C1/result-namespace multiscalar/ed25519/arm64-maa4-redmul/C1/result-insns multiscalar/ed25519/arm64-maa4-redmul/C1/result-compile-ge25519_pack multiscalar/ed25519/arm64-maa4-redmul/C1/result-compile-ge25519_unpack multiscalar/ed25519/arm64-maa4-redmul/C1/result-compile-multiscalar > multiscalar/ed25519/arm64-maa4-redmul/C1/result

multiscalar/ed25519/arm64-maa4-redmul-p3/shared/result: multiscalar/ed25519/arm64-maa4-redmul-p3/shared/result-namespace multiscalar/ed25519/arm64-maa4-redmul-p3/shared/result-insns multiscalar/ed25519/arm64-maa4-redmul-p3/shared/ge25519_multi_scalarmult_precompute.o multiscalar/ed25519/arm64-maa4-redmul-p3/shared/ge25519_multi_scalarmult_process.o
	cat multiscalar/ed25519/arm64-maa4-redmul-p3/shared/result-namespace multiscalar/ed25519/arm64-maa4-redmul-p3/shared/result-insns multiscalar/ed25519/arm64-maa4-redmul-p3/shared/result-compile-ge25519_multi_scalarmult_precompute multiscalar/ed25519/arm64-maa4-redmul-p3/shared/result-compile-ge25519_multi_scalarmult_process > multiscalar/ed25519/arm64-maa4-redmul-p3/shared/result

multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result: multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result-namespace multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result-insns multiscalar/ed25519/arm64-maa4-redmul-p3/C0/ge25519_pack.o multiscalar/ed25519/arm64-maa4-redmul-p3/C0/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-redmul-p3/C0/multiscalar.o
	cat multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result-namespace multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result-insns multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result-compile-ge25519_pack multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result-compile-ge25519_unpack multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result-compile-multiscalar > multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result

multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result: multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result-namespace multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result-insns multiscalar/ed25519/arm64-maa4-redmul-p3/C1/ge25519_pack.o multiscalar/ed25519/arm64-maa4-redmul-p3/C1/ge25519_unpack.o multiscalar/ed25519/arm64-maa4-redmul-p3/C1/multiscalar.o
	cat multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result-namespace multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result-insns multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result-compile-ge25519_pack multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result-compile-ge25519_unpack multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result-compile-multiscalar > multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result

multiscalar/ed25519/ref10/shared/result: multiscalar/ed25519/ref10/shared/result-namespace multiscalar/ed25519/ref10/shared/result-insns
	cat multiscalar/ed25519/ref10/shared/result-namespace multiscalar/ed25519/ref10/shared/result-insns > multiscalar/ed25519/ref10/shared/result

multiscalar/ed25519/ref10/C0/result: multiscalar/ed25519/ref10/C0/result-namespace multiscalar/ed25519/ref10/C0/result-insns multiscalar/ed25519/ref10/C0/ge_frombytes.o multiscalar/ed25519/ref10/C0/ge_p1p1_0.o multiscalar/ed25519/ref10/C0/multiscalar.o multiscalar/ed25519/ref10/C0/sc_reduce.o
	cat multiscalar/ed25519/ref10/C0/result-namespace multiscalar/ed25519/ref10/C0/result-insns multiscalar/ed25519/ref10/C0/result-compile-ge_frombytes multiscalar/ed25519/ref10/C0/result-compile-ge_p1p1_0 multiscalar/ed25519/ref10/C0/result-compile-multiscalar multiscalar/ed25519/ref10/C0/result-compile-sc_reduce > multiscalar/ed25519/ref10/C0/result

multiscalar/ed25519/ref10/C1/result: multiscalar/ed25519/ref10/C1/result-namespace multiscalar/ed25519/ref10/C1/result-insns multiscalar/ed25519/ref10/C1/ge_frombytes.o multiscalar/ed25519/ref10/C1/ge_p1p1_0.o multiscalar/ed25519/ref10/C1/multiscalar.o multiscalar/ed25519/ref10/C1/sc_reduce.o
	cat multiscalar/ed25519/ref10/C1/result-namespace multiscalar/ed25519/ref10/C1/result-insns multiscalar/ed25519/ref10/C1/result-compile-ge_frombytes multiscalar/ed25519/ref10/C1/result-compile-ge_p1p1_0 multiscalar/ed25519/ref10/C1/result-compile-multiscalar multiscalar/ed25519/ref10/C1/result-compile-sc_reduce > multiscalar/ed25519/ref10/C1/result

dh/x25519/wrapper/shared/result: dh/x25519/wrapper/shared/result-namespace dh/x25519/wrapper/shared/result-insns
	cat dh/x25519/wrapper/shared/result-namespace dh/x25519/wrapper/shared/result-insns > dh/x25519/wrapper/shared/result

dh/x25519/wrapper/C0/result: dh/x25519/wrapper/C0/result-namespace dh/x25519/wrapper/C0/result-insns dh/x25519/wrapper/C0/dh.o dh/x25519/wrapper/C0/keypair.o
	cat dh/x25519/wrapper/C0/result-namespace dh/x25519/wrapper/C0/result-insns dh/x25519/wrapper/C0/result-compile-dh dh/x25519/wrapper/C0/result-compile-keypair > dh/x25519/wrapper/C0/result

dh/x25519/wrapper/C1/result: dh/x25519/wrapper/C1/result-namespace dh/x25519/wrapper/C1/result-insns dh/x25519/wrapper/C1/dh.o dh/x25519/wrapper/C1/keypair.o
	cat dh/x25519/wrapper/C1/result-namespace dh/x25519/wrapper/C1/result-insns dh/x25519/wrapper/C1/result-compile-dh dh/x25519/wrapper/C1/result-compile-keypair > dh/x25519/wrapper/C1/result

sign/ed25519/ref10/shared/result: sign/ed25519/ref10/shared/result-namespace sign/ed25519/ref10/shared/result-insns
	cat sign/ed25519/ref10/shared/result-namespace sign/ed25519/ref10/shared/result-insns > sign/ed25519/ref10/shared/result

sign/ed25519/ref10/C0/result: sign/ed25519/ref10/C0/result-namespace sign/ed25519/ref10/C0/result-insns sign/ed25519/ref10/C0/keypair.o sign/ed25519/ref10/C0/open.o sign/ed25519/ref10/C0/sc_muladd.o sign/ed25519/ref10/C0/sign.o
	cat sign/ed25519/ref10/C0/result-namespace sign/ed25519/ref10/C0/result-insns sign/ed25519/ref10/C0/result-compile-keypair sign/ed25519/ref10/C0/result-compile-open sign/ed25519/ref10/C0/result-compile-sc_muladd sign/ed25519/ref10/C0/result-compile-sign > sign/ed25519/ref10/C0/result

sign/ed25519/ref10/C1/result: sign/ed25519/ref10/C1/result-namespace sign/ed25519/ref10/C1/result-insns sign/ed25519/ref10/C1/keypair.o sign/ed25519/ref10/C1/open.o sign/ed25519/ref10/C1/sc_muladd.o sign/ed25519/ref10/C1/sign.o
	cat sign/ed25519/ref10/C1/result-namespace sign/ed25519/ref10/C1/result-insns sign/ed25519/ref10/C1/result-compile-keypair sign/ed25519/ref10/C1/result-compile-open sign/ed25519/ref10/C1/result-compile-sc_muladd sign/ed25519/ref10/C1/result-compile-sign > sign/ed25519/ref10/C1/result

verify/32/ref/shared/result-insns: verify/32/ref/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 verify/32/ref/shared

verify/32/ref/C0/result-insns: verify/32/ref/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 verify/32/ref/C0

verify/32/ref/C1/result-insns: verify/32/ref/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 verify/32/ref/C1

hashblocks/sha512/compact/shared/result-insns: hashblocks/sha512/compact/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact/shared

hashblocks/sha512/compact/C0/result-insns: hashblocks/sha512/compact/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact/C0

hashblocks/sha512/compact/C1/result-insns: hashblocks/sha512/compact/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact/C1

hashblocks/sha512/compact2/shared/result-insns: hashblocks/sha512/compact2/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact2/shared

hashblocks/sha512/compact2/C0/result-insns: hashblocks/sha512/compact2/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact2/C0

hashblocks/sha512/compact2/C1/result-insns: hashblocks/sha512/compact2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact2/C1

hashblocks/sha512/compact3/shared/result-insns: hashblocks/sha512/compact3/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact3/shared

hashblocks/sha512/compact3/C0/result-insns: hashblocks/sha512/compact3/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact3/C0

hashblocks/sha512/compact3/C1/result-insns: hashblocks/sha512/compact3/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact3/C1

hashblocks/sha512/compact4/shared/result-insns: hashblocks/sha512/compact4/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact4/shared

hashblocks/sha512/compact4/C0/result-insns: hashblocks/sha512/compact4/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact4/C0

hashblocks/sha512/compact4/C1/result-insns: hashblocks/sha512/compact4/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/compact4/C1

hashblocks/sha512/inplace/shared/result-insns: hashblocks/sha512/inplace/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/inplace/shared

hashblocks/sha512/inplace/C0/result-insns: hashblocks/sha512/inplace/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/inplace/C0

hashblocks/sha512/inplace/C1/result-insns: hashblocks/sha512/inplace/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/inplace/C1

hashblocks/sha512/ref/shared/result-insns: hashblocks/sha512/ref/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/ref/shared

hashblocks/sha512/ref/C0/result-insns: hashblocks/sha512/ref/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/ref/C0

hashblocks/sha512/ref/C1/result-insns: hashblocks/sha512/ref/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/ref/C1

hashblocks/sha512/wflip/shared/result-insns: hashblocks/sha512/wflip/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/wflip/shared

hashblocks/sha512/wflip/C0/result-insns: hashblocks/sha512/wflip/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/wflip/C0

hashblocks/sha512/wflip/C1/result-insns: hashblocks/sha512/wflip/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hashblocks/sha512/wflip/C1

hash/sha512/ref/shared/result-insns: hash/sha512/ref/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hash/sha512/ref/shared

hash/sha512/ref/C0/result-insns: hash/sha512/ref/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hash/sha512/ref/C0

hash/sha512/ref/C1/result-insns: hash/sha512/ref/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 hash/sha512/ref/C1

pow/inv25519/arm64-maa4-intmul/shared/result-insns: pow/inv25519/arm64-maa4-intmul/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/arm64-maa4-intmul/shared

pow/inv25519/arm64-maa4-intmul/C0/result-insns: pow/inv25519/arm64-maa4-intmul/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/arm64-maa4-intmul/C0

unified/fe25519unpackc/1/C0/result-insns: unified/fe25519unpackc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519unpackc/1/C0

pow/inv25519/arm64-maa4-intmul/C1/result-insns: pow/inv25519/arm64-maa4-intmul/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/arm64-maa4-intmul/C1

unified/fe25519unpackc/2/C1/result-insns: unified/fe25519unpackc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519unpackc/2/C1

pow/inv25519/arm64-maa4-redmul/shared/result-insns: pow/inv25519/arm64-maa4-redmul/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/arm64-maa4-redmul/shared

pow/inv25519/arm64-maa4-redmul/C0/result-insns: pow/inv25519/arm64-maa4-redmul/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/arm64-maa4-redmul/C0

pow/inv25519/arm64-maa4-redmul/C1/result-insns: pow/inv25519/arm64-maa4-redmul/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/arm64-maa4-redmul/C1

pow/inv25519/donna_c64/shared/result-insns: pow/inv25519/donna_c64/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/donna_c64/shared

pow/inv25519/donna_c64/C0/result-insns: pow/inv25519/donna_c64/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/donna_c64/C0

pow/inv25519/donna_c64/C1/result-insns: pow/inv25519/donna_c64/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/donna_c64/C1

pow/inv25519/ref10/shared/result-insns: pow/inv25519/ref10/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/ref10/shared

pow/inv25519/ref10/C0/result-insns: pow/inv25519/ref10/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/ref10/C0

unified/fefrombytesc/1/C0/result-insns: unified/fefrombytesc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fefrombytesc/1/C0

unified/femulc/1/C0/result-insns: unified/femulc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/femulc/1/C0

unified/fesqc/1/C0/result-insns: unified/fesqc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fesqc/1/C0

unified/fetobytesc/1/C0/result-insns: unified/fetobytesc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fetobytesc/1/C0

pow/inv25519/ref10/C1/result-insns: pow/inv25519/ref10/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 pow/inv25519/ref10/C1

unified/fefrombytesc/2/C1/result-insns: unified/fefrombytesc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fefrombytesc/2/C1

unified/femulc/2/C1/result-insns: unified/femulc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/femulc/2/C1

unified/fesqc/2/C1/result-insns: unified/fesqc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fesqc/2/C1

unified/fetobytesc/2/C1/result-insns: unified/fetobytesc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fetobytesc/2/C1

powbatch/inv25519/ref10/shared/result-insns: powbatch/inv25519/ref10/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 powbatch/inv25519/ref10/shared

powbatch/inv25519/ref10/C0/result-insns: powbatch/inv25519/ref10/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 powbatch/inv25519/ref10/C0

unified/fe0c/1/C0/result-insns: unified/fe0c/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe0c/1/C0

unified/fe1c/1/C0/result-insns: unified/fe1c/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe1c/1/C0

unified/fecmovc/1/C0/result-insns: unified/fecmovc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fecmovc/1/C0

powbatch/inv25519/ref10/C1/result-insns: powbatch/inv25519/ref10/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 powbatch/inv25519/ref10/C1

unified/fe0c/2/C1/result-insns: unified/fe0c/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe0c/2/C1

unified/fe1c/2/C1/result-insns: unified/fe1c/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe1c/2/C1

unified/fecmovc/2/C1/result-insns: unified/fecmovc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fecmovc/2/C1

powbatch/inv25519/simple/shared/result-insns: powbatch/inv25519/simple/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 powbatch/inv25519/simple/shared

powbatch/inv25519/simple/C0/result-insns: powbatch/inv25519/simple/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 powbatch/inv25519/simple/C0

powbatch/inv25519/simple/C1/result-insns: powbatch/inv25519/simple/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 powbatch/inv25519/simple/C1

nP/montgomery25519/arm64-maa4-intmul/shared/result-insns: nP/montgomery25519/arm64-maa4-intmul/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/arm64-maa4-intmul/shared

unified/fe25519freezeS/1/shared/result-insns: unified/fe25519freezeS/1/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519freezeS/1/shared

unified/fe25519mulS/1/shared/result-insns: unified/fe25519mulS/1/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519mulS/1/shared

unified/fe25519nsquareS/1/shared/result-insns: unified/fe25519nsquareS/1/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519nsquareS/1/shared

unified/fe25519squareS/1/shared/result-insns: unified/fe25519squareS/1/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519squareS/1/shared

nP/montgomery25519/arm64-maa4-intmul/C0/result-insns: nP/montgomery25519/arm64-maa4-intmul/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/arm64-maa4-intmul/C0

unified/fe25519invertc/1/C0/result-insns: unified/fe25519invertc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519invertc/1/C0

unified/fe25519packc/1/C0/result-insns: unified/fe25519packc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519packc/1/C0

unified/fe25519unpackc/3/C0/result-insns: unified/fe25519unpackc/3/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519unpackc/3/C0

nP/montgomery25519/arm64-maa4-intmul/C1/result-insns: nP/montgomery25519/arm64-maa4-intmul/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/arm64-maa4-intmul/C1

unified/fe25519invertc/2/C1/result-insns: unified/fe25519invertc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519invertc/2/C1

unified/fe25519packc/2/C1/result-insns: unified/fe25519packc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519packc/2/C1

unified/fe25519unpackc/4/C1/result-insns: unified/fe25519unpackc/4/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519unpackc/4/C1

nP/montgomery25519/arm64-maa4-redmul/shared/result-insns: nP/montgomery25519/arm64-maa4-redmul/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/arm64-maa4-redmul/shared

unified/fe25519mulS/2/shared/result-insns: unified/fe25519mulS/2/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519mulS/2/shared

unified/fe25519nsquareS/2/shared/result-insns: unified/fe25519nsquareS/2/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519nsquareS/2/shared

unified/fe25519squareS/2/shared/result-insns: unified/fe25519squareS/2/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519squareS/2/shared

nP/montgomery25519/arm64-maa4-redmul/C0/result-insns: nP/montgomery25519/arm64-maa4-redmul/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/arm64-maa4-redmul/C0

nP/montgomery25519/arm64-maa4-redmul/C1/result-insns: nP/montgomery25519/arm64-maa4-redmul/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/arm64-maa4-redmul/C1

nP/montgomery25519/donna_c64/shared/result-insns: nP/montgomery25519/donna_c64/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/donna_c64/shared

nP/montgomery25519/donna_c64/C0/result-insns: nP/montgomery25519/donna_c64/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/donna_c64/C0

nP/montgomery25519/donna_c64/C1/result-insns: nP/montgomery25519/donna_c64/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/donna_c64/C1

nP/montgomery25519/ref10/shared/result-insns: nP/montgomery25519/ref10/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/ref10/shared

nP/montgomery25519/ref10/C0/result-insns: nP/montgomery25519/ref10/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/ref10/C0

nP/montgomery25519/ref10/C1/result-insns: nP/montgomery25519/ref10/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nP/montgomery25519/ref10/C1

nPbatch/montgomery25519/ref/shared/result-insns: nPbatch/montgomery25519/ref/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nPbatch/montgomery25519/ref/shared

nPbatch/montgomery25519/ref/C0/result-insns: nPbatch/montgomery25519/ref/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nPbatch/montgomery25519/ref/C0

nPbatch/montgomery25519/ref/C1/result-insns: nPbatch/montgomery25519/ref/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nPbatch/montgomery25519/ref/C1

nG/merged25519/arm64-maa4-intmul/shared/result-insns: nG/merged25519/arm64-maa4-intmul/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/merged25519/arm64-maa4-intmul/shared

unified/fe25519addS/1/shared/result-insns: unified/fe25519addS/1/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519addS/1/shared

unified/fe25519cmovS/1/shared/result-insns: unified/fe25519cmovS/1/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519cmovS/1/shared

unified/fe25519subS/1/shared/result-insns: unified/fe25519subS/1/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519subS/1/shared

unified/sharedbasedatac/1/shared/result-insns: unified/sharedbasedatac/1/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sharedbasedatac/1/shared

nG/merged25519/arm64-maa4-intmul/C0/result-insns: nG/merged25519/arm64-maa4-intmul/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/merged25519/arm64-maa4-intmul/C0

unified/fe25519getparityc/1/C0/result-insns: unified/fe25519getparityc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519getparityc/1/C0

unified/sc25519from32bytesc/1/C0/result-insns: unified/sc25519from32bytesc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sc25519from32bytesc/1/C0

unified/sc25519window4c/1/C0/result-insns: unified/sc25519window4c/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sc25519window4c/1/C0

nG/merged25519/arm64-maa4-intmul/C1/result-insns: nG/merged25519/arm64-maa4-intmul/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/merged25519/arm64-maa4-intmul/C1

unified/fe25519getparityc/2/C1/result-insns: unified/fe25519getparityc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519getparityc/2/C1

unified/sc25519from32bytesc/2/C1/result-insns: unified/sc25519from32bytesc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sc25519from32bytesc/2/C1

unified/sc25519window4c/2/C1/result-insns: unified/sc25519window4c/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sc25519window4c/2/C1

nG/merged25519/arm64-maa4-redmul/shared/result-insns: nG/merged25519/arm64-maa4-redmul/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/merged25519/arm64-maa4-redmul/shared

nG/merged25519/arm64-maa4-redmul/C0/result-insns: nG/merged25519/arm64-maa4-redmul/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/merged25519/arm64-maa4-redmul/C0

nG/merged25519/arm64-maa4-redmul/C1/result-insns: nG/merged25519/arm64-maa4-redmul/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/merged25519/arm64-maa4-redmul/C1

nG/merged25519/ref10/shared/result-insns: nG/merged25519/ref10/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/merged25519/ref10/shared

nG/merged25519/ref10/C0/result-insns: nG/merged25519/ref10/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/merged25519/ref10/C0

unified/feaddc/1/C0/result-insns: unified/feaddc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/feaddc/1/C0

unified/fecopyc/1/C0/result-insns: unified/fecopyc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fecopyc/1/C0

unified/fefrombytesc/3/C0/result-insns: unified/fefrombytesc/3/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fefrombytesc/3/C0

unified/feinvertc/1/C0/result-insns: unified/feinvertc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/feinvertc/1/C0

unified/feisnegativec/1/C0/result-insns: unified/feisnegativec/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/feisnegativec/1/C0

unified/femulc/3/C0/result-insns: unified/femulc/3/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/femulc/3/C0

unified/fenegc/1/C0/result-insns: unified/fenegc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fenegc/1/C0

unified/fesqc/3/C0/result-insns: unified/fesqc/3/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fesqc/3/C0

unified/fesq2c/1/C0/result-insns: unified/fesq2c/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fesq2c/1/C0

unified/fesubc/1/C0/result-insns: unified/fesubc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fesubc/1/C0

unified/fetobytesc/3/C0/result-insns: unified/fetobytesc/3/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fetobytesc/3/C0

unified/gemaddc/1/C0/result-insns: unified/gemaddc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gemaddc/1/C0

unified/gep1p1top2c/1/C0/result-insns: unified/gep1p1top2c/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep1p1top2c/1/C0

unified/gep1p1top3c/1/C0/result-insns: unified/gep1p1top3c/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep1p1top3c/1/C0

unified/gep2dblc/1/C0/result-insns: unified/gep2dblc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep2dblc/1/C0

unified/gep3dblc/1/C0/result-insns: unified/gep3dblc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep3dblc/1/C0

unified/gep3top2c/1/C0/result-insns: unified/gep3top2c/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep3top2c/1/C0

nG/merged25519/ref10/C1/result-insns: nG/merged25519/ref10/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/merged25519/ref10/C1

unified/feaddc/2/C1/result-insns: unified/feaddc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/feaddc/2/C1

unified/fecopyc/2/C1/result-insns: unified/fecopyc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fecopyc/2/C1

unified/fefrombytesc/4/C1/result-insns: unified/fefrombytesc/4/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fefrombytesc/4/C1

unified/feinvertc/2/C1/result-insns: unified/feinvertc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/feinvertc/2/C1

unified/feisnegativec/2/C1/result-insns: unified/feisnegativec/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/feisnegativec/2/C1

unified/femulc/4/C1/result-insns: unified/femulc/4/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/femulc/4/C1

unified/fenegc/2/C1/result-insns: unified/fenegc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fenegc/2/C1

unified/fesqc/4/C1/result-insns: unified/fesqc/4/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fesqc/4/C1

unified/fesq2c/2/C1/result-insns: unified/fesq2c/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fesq2c/2/C1

unified/fesubc/2/C1/result-insns: unified/fesubc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fesubc/2/C1

unified/fetobytesc/4/C1/result-insns: unified/fetobytesc/4/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fetobytesc/4/C1

unified/gemaddc/2/C1/result-insns: unified/gemaddc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gemaddc/2/C1

unified/gep1p1top2c/2/C1/result-insns: unified/gep1p1top2c/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep1p1top2c/2/C1

unified/gep1p1top3c/2/C1/result-insns: unified/gep1p1top3c/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep1p1top3c/2/C1

unified/gep2dblc/2/C1/result-insns: unified/gep2dblc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep2dblc/2/C1

unified/gep3dblc/2/C1/result-insns: unified/gep3dblc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep3dblc/2/C1

unified/gep3top2c/2/C1/result-insns: unified/gep3top2c/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep3top2c/2/C1

nG/montgomery25519/ref/shared/result-insns: nG/montgomery25519/ref/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/montgomery25519/ref/shared

nG/montgomery25519/ref/C0/result-insns: nG/montgomery25519/ref/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/montgomery25519/ref/C0

nG/montgomery25519/ref/C1/result-insns: nG/montgomery25519/ref/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/montgomery25519/ref/C1

nG/montgomery25519/usemerged/shared/result-insns: nG/montgomery25519/usemerged/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/montgomery25519/usemerged/shared

nG/montgomery25519/usemerged/C0/result-insns: nG/montgomery25519/usemerged/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/montgomery25519/usemerged/C0

nG/montgomery25519/usemerged/C1/result-insns: nG/montgomery25519/usemerged/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 nG/montgomery25519/usemerged/C1

mGnP/ed25519/arm64-maa4-intmul/shared/result-insns: mGnP/ed25519/arm64-maa4-intmul/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 mGnP/ed25519/arm64-maa4-intmul/shared

unified/ge25519doublescalarmultprecomputeS/1/shared/result-insns: unified/ge25519doublescalarmultprecomputeS/1/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/ge25519doublescalarmultprecomputeS/1/shared

unified/sc25519barrettS/1/shared/result-insns: unified/sc25519barrettS/1/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sc25519barrettS/1/shared

mGnP/ed25519/arm64-maa4-intmul/C0/result-insns: mGnP/ed25519/arm64-maa4-intmul/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 mGnP/ed25519/arm64-maa4-intmul/C0

unified/fe25519iseqc/1/C0/result-insns: unified/fe25519iseqc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519iseqc/1/C0

unified/fe25519pow2523c/1/C0/result-insns: unified/fe25519pow2523c/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519pow2523c/1/C0

unified/fe25519setintc/1/C0/result-insns: unified/fe25519setintc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519setintc/1/C0

unified/sc25519from64bytesc/1/C0/result-insns: unified/sc25519from64bytesc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sc25519from64bytesc/1/C0

unified/sc25519slidec/1/C0/result-insns: unified/sc25519slidec/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sc25519slidec/1/C0

unified/sc25519to32bytesc/1/C0/result-insns: unified/sc25519to32bytesc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sc25519to32bytesc/1/C0

mGnP/ed25519/arm64-maa4-intmul/C1/result-insns: mGnP/ed25519/arm64-maa4-intmul/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 mGnP/ed25519/arm64-maa4-intmul/C1

unified/fe25519iseqc/2/C1/result-insns: unified/fe25519iseqc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519iseqc/2/C1

unified/fe25519pow2523c/2/C1/result-insns: unified/fe25519pow2523c/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519pow2523c/2/C1

unified/fe25519setintc/2/C1/result-insns: unified/fe25519setintc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519setintc/2/C1

unified/sc25519from64bytesc/2/C1/result-insns: unified/sc25519from64bytesc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sc25519from64bytesc/2/C1

unified/sc25519slidec/2/C1/result-insns: unified/sc25519slidec/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sc25519slidec/2/C1

unified/sc25519to32bytesc/2/C1/result-insns: unified/sc25519to32bytesc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/sc25519to32bytesc/2/C1

mGnP/ed25519/arm64-maa4-redmul/shared/result-insns: mGnP/ed25519/arm64-maa4-redmul/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 mGnP/ed25519/arm64-maa4-redmul/shared

unified/ge25519doublescalarmultprecomputeS/2/shared/result-insns: unified/ge25519doublescalarmultprecomputeS/2/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/ge25519doublescalarmultprecomputeS/2/shared

mGnP/ed25519/arm64-maa4-redmul/C0/result-insns: mGnP/ed25519/arm64-maa4-redmul/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 mGnP/ed25519/arm64-maa4-redmul/C0

unified/fe25519pow2523c/3/C0/result-insns: unified/fe25519pow2523c/3/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519pow2523c/3/C0

mGnP/ed25519/arm64-maa4-redmul/C1/result-insns: mGnP/ed25519/arm64-maa4-redmul/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 mGnP/ed25519/arm64-maa4-redmul/C1

unified/fe25519pow2523c/4/C1/result-insns: unified/fe25519pow2523c/4/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fe25519pow2523c/4/C1

mGnP/ed25519/ref10/shared/result-insns: mGnP/ed25519/ref10/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 mGnP/ed25519/ref10/shared

mGnP/ed25519/ref10/C0/result-insns: mGnP/ed25519/ref10/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 mGnP/ed25519/ref10/C0

unified/feisnonzeroc/1/C0/result-insns: unified/feisnonzeroc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/feisnonzeroc/1/C0

unified/fepow22523c/1/C0/result-insns: unified/fepow22523c/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fepow22523c/1/C0

unified/geaddc/1/C0/result-insns: unified/geaddc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/geaddc/1/C0

unified/gep3tocachedc/1/C0/result-insns: unified/gep3tocachedc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep3tocachedc/1/C0

unified/gesubc/1/C0/result-insns: unified/gesubc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gesubc/1/C0

unified/getobytesc/1/C0/result-insns: unified/getobytesc/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/getobytesc/1/C0

unified/screducec/1/C0/result-insns: unified/screducec/1/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/screducec/1/C0

mGnP/ed25519/ref10/C1/result-insns: mGnP/ed25519/ref10/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 mGnP/ed25519/ref10/C1

unified/feisnonzeroc/2/C1/result-insns: unified/feisnonzeroc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/feisnonzeroc/2/C1

unified/fepow22523c/2/C1/result-insns: unified/fepow22523c/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/fepow22523c/2/C1

unified/geaddc/2/C1/result-insns: unified/geaddc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/geaddc/2/C1

unified/gep3tocachedc/2/C1/result-insns: unified/gep3tocachedc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gep3tocachedc/2/C1

unified/gesubc/2/C1/result-insns: unified/gesubc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/gesubc/2/C1

unified/getobytesc/2/C1/result-insns: unified/getobytesc/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/getobytesc/2/C1

unified/screducec/2/C1/result-insns: unified/screducec/2/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 unified/screducec/2/C1

multiscalar/ed25519/arm64-maa4-intmul/shared/result-insns: multiscalar/ed25519/arm64-maa4-intmul/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-intmul/shared

multiscalar/ed25519/arm64-maa4-intmul/C0/result-insns: multiscalar/ed25519/arm64-maa4-intmul/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-intmul/C0

multiscalar/ed25519/arm64-maa4-intmul/C1/result-insns: multiscalar/ed25519/arm64-maa4-intmul/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-intmul/C1

multiscalar/ed25519/arm64-maa4-intmul-p3/shared/result-insns: multiscalar/ed25519/arm64-maa4-intmul-p3/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-intmul-p3/shared

multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result-insns: multiscalar/ed25519/arm64-maa4-intmul-p3/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-intmul-p3/C0

multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result-insns: multiscalar/ed25519/arm64-maa4-intmul-p3/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-intmul-p3/C1

multiscalar/ed25519/arm64-maa4-redmul/shared/result-insns: multiscalar/ed25519/arm64-maa4-redmul/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-redmul/shared

multiscalar/ed25519/arm64-maa4-redmul/C0/result-insns: multiscalar/ed25519/arm64-maa4-redmul/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-redmul/C0

multiscalar/ed25519/arm64-maa4-redmul/C1/result-insns: multiscalar/ed25519/arm64-maa4-redmul/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-redmul/C1

multiscalar/ed25519/arm64-maa4-redmul-p3/shared/result-insns: multiscalar/ed25519/arm64-maa4-redmul-p3/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-redmul-p3/shared

multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result-insns: multiscalar/ed25519/arm64-maa4-redmul-p3/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-redmul-p3/C0

multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result-insns: multiscalar/ed25519/arm64-maa4-redmul-p3/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/arm64-maa4-redmul-p3/C1

multiscalar/ed25519/ref10/shared/result-insns: multiscalar/ed25519/ref10/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/ref10/shared

multiscalar/ed25519/ref10/C0/result-insns: multiscalar/ed25519/ref10/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/ref10/C0

multiscalar/ed25519/ref10/C1/result-insns: multiscalar/ed25519/ref10/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 multiscalar/ed25519/ref10/C1

dh/x25519/wrapper/shared/result-insns: dh/x25519/wrapper/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 dh/x25519/wrapper/shared

dh/x25519/wrapper/C0/result-insns: dh/x25519/wrapper/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 dh/x25519/wrapper/C0

dh/x25519/wrapper/C1/result-insns: dh/x25519/wrapper/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 dh/x25519/wrapper/C1

sign/ed25519/ref10/shared/result-insns: sign/ed25519/ref10/shared/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 sign/ed25519/ref10/shared

sign/ed25519/ref10/C0/result-insns: sign/ed25519/ref10/C0/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 sign/ed25519/ref10/C0

sign/ed25519/ref10/C1/result-insns: sign/ed25519/ref10/C1/allcompiled scripts/checkinsns
	scripts/checkinsns arm64 sign/ed25519/ref10/C1

verify/32/ref/shared/result-namespace: verify/32/ref/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 verify/32/ref/shared

verify/32/ref/C0/result-namespace: verify/32/ref/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 verify/32/ref/C0

verify/32/ref/C1/result-namespace: verify/32/ref/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 verify/32/ref/C1

hashblocks/sha512/compact/shared/result-namespace: hashblocks/sha512/compact/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact/shared

hashblocks/sha512/compact/C0/result-namespace: hashblocks/sha512/compact/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact/C0

hashblocks/sha512/compact/C1/result-namespace: hashblocks/sha512/compact/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact/C1

hashblocks/sha512/compact2/shared/result-namespace: hashblocks/sha512/compact2/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact2/shared

hashblocks/sha512/compact2/C0/result-namespace: hashblocks/sha512/compact2/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact2/C0

hashblocks/sha512/compact2/C1/result-namespace: hashblocks/sha512/compact2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact2/C1

hashblocks/sha512/compact3/shared/result-namespace: hashblocks/sha512/compact3/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact3/shared

hashblocks/sha512/compact3/C0/result-namespace: hashblocks/sha512/compact3/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact3/C0

hashblocks/sha512/compact3/C1/result-namespace: hashblocks/sha512/compact3/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact3/C1

hashblocks/sha512/compact4/shared/result-namespace: hashblocks/sha512/compact4/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact4/shared

hashblocks/sha512/compact4/C0/result-namespace: hashblocks/sha512/compact4/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact4/C0

hashblocks/sha512/compact4/C1/result-namespace: hashblocks/sha512/compact4/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/compact4/C1

hashblocks/sha512/inplace/shared/result-namespace: hashblocks/sha512/inplace/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/inplace/shared

hashblocks/sha512/inplace/C0/result-namespace: hashblocks/sha512/inplace/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/inplace/C0

hashblocks/sha512/inplace/C1/result-namespace: hashblocks/sha512/inplace/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/inplace/C1

hashblocks/sha512/ref/shared/result-namespace: hashblocks/sha512/ref/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/ref/shared

hashblocks/sha512/ref/C0/result-namespace: hashblocks/sha512/ref/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/ref/C0

hashblocks/sha512/ref/C1/result-namespace: hashblocks/sha512/ref/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/ref/C1

hashblocks/sha512/wflip/shared/result-namespace: hashblocks/sha512/wflip/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/wflip/shared

hashblocks/sha512/wflip/C0/result-namespace: hashblocks/sha512/wflip/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/wflip/C0

hashblocks/sha512/wflip/C1/result-namespace: hashblocks/sha512/wflip/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hashblocks/sha512/wflip/C1

hash/sha512/ref/shared/result-namespace: hash/sha512/ref/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hash/sha512/ref/shared

hash/sha512/ref/C0/result-namespace: hash/sha512/ref/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hash/sha512/ref/C0

hash/sha512/ref/C1/result-namespace: hash/sha512/ref/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 hash/sha512/ref/C1

pow/inv25519/arm64-maa4-intmul/shared/result-namespace: pow/inv25519/arm64-maa4-intmul/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/arm64-maa4-intmul/shared

pow/inv25519/arm64-maa4-intmul/C0/result-namespace: pow/inv25519/arm64-maa4-intmul/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/arm64-maa4-intmul/C0

unified/fe25519unpackc/1/C0/result-namespace: unified/fe25519unpackc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519unpackc/1/C0

pow/inv25519/arm64-maa4-intmul/C1/result-namespace: pow/inv25519/arm64-maa4-intmul/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/arm64-maa4-intmul/C1

unified/fe25519unpackc/2/C1/result-namespace: unified/fe25519unpackc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519unpackc/2/C1

pow/inv25519/arm64-maa4-redmul/shared/result-namespace: pow/inv25519/arm64-maa4-redmul/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/arm64-maa4-redmul/shared

pow/inv25519/arm64-maa4-redmul/C0/result-namespace: pow/inv25519/arm64-maa4-redmul/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/arm64-maa4-redmul/C0

pow/inv25519/arm64-maa4-redmul/C1/result-namespace: pow/inv25519/arm64-maa4-redmul/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/arm64-maa4-redmul/C1

pow/inv25519/donna_c64/shared/result-namespace: pow/inv25519/donna_c64/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/donna_c64/shared

pow/inv25519/donna_c64/C0/result-namespace: pow/inv25519/donna_c64/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/donna_c64/C0

pow/inv25519/donna_c64/C1/result-namespace: pow/inv25519/donna_c64/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/donna_c64/C1

pow/inv25519/ref10/shared/result-namespace: pow/inv25519/ref10/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/ref10/shared

pow/inv25519/ref10/C0/result-namespace: pow/inv25519/ref10/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/ref10/C0

unified/fefrombytesc/1/C0/result-namespace: unified/fefrombytesc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fefrombytesc/1/C0

unified/femulc/1/C0/result-namespace: unified/femulc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/femulc/1/C0

unified/fesqc/1/C0/result-namespace: unified/fesqc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fesqc/1/C0

unified/fetobytesc/1/C0/result-namespace: unified/fetobytesc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fetobytesc/1/C0

pow/inv25519/ref10/C1/result-namespace: pow/inv25519/ref10/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 pow/inv25519/ref10/C1

unified/fefrombytesc/2/C1/result-namespace: unified/fefrombytesc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fefrombytesc/2/C1

unified/femulc/2/C1/result-namespace: unified/femulc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/femulc/2/C1

unified/fesqc/2/C1/result-namespace: unified/fesqc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fesqc/2/C1

unified/fetobytesc/2/C1/result-namespace: unified/fetobytesc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fetobytesc/2/C1

powbatch/inv25519/ref10/shared/result-namespace: powbatch/inv25519/ref10/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 powbatch/inv25519/ref10/shared

powbatch/inv25519/ref10/C0/result-namespace: powbatch/inv25519/ref10/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 powbatch/inv25519/ref10/C0

unified/fe0c/1/C0/result-namespace: unified/fe0c/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe0c/1/C0

unified/fe1c/1/C0/result-namespace: unified/fe1c/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe1c/1/C0

unified/fecmovc/1/C0/result-namespace: unified/fecmovc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fecmovc/1/C0

powbatch/inv25519/ref10/C1/result-namespace: powbatch/inv25519/ref10/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 powbatch/inv25519/ref10/C1

unified/fe0c/2/C1/result-namespace: unified/fe0c/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe0c/2/C1

unified/fe1c/2/C1/result-namespace: unified/fe1c/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe1c/2/C1

unified/fecmovc/2/C1/result-namespace: unified/fecmovc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fecmovc/2/C1

powbatch/inv25519/simple/shared/result-namespace: powbatch/inv25519/simple/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 powbatch/inv25519/simple/shared

powbatch/inv25519/simple/C0/result-namespace: powbatch/inv25519/simple/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 powbatch/inv25519/simple/C0

powbatch/inv25519/simple/C1/result-namespace: powbatch/inv25519/simple/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 powbatch/inv25519/simple/C1

nP/montgomery25519/arm64-maa4-intmul/shared/result-namespace: nP/montgomery25519/arm64-maa4-intmul/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/arm64-maa4-intmul/shared

unified/fe25519freezeS/1/shared/result-namespace: unified/fe25519freezeS/1/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519freezeS/1/shared

unified/fe25519mulS/1/shared/result-namespace: unified/fe25519mulS/1/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519mulS/1/shared

unified/fe25519nsquareS/1/shared/result-namespace: unified/fe25519nsquareS/1/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519nsquareS/1/shared

unified/fe25519squareS/1/shared/result-namespace: unified/fe25519squareS/1/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519squareS/1/shared

nP/montgomery25519/arm64-maa4-intmul/C0/result-namespace: nP/montgomery25519/arm64-maa4-intmul/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/arm64-maa4-intmul/C0

unified/fe25519invertc/1/C0/result-namespace: unified/fe25519invertc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519invertc/1/C0

unified/fe25519packc/1/C0/result-namespace: unified/fe25519packc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519packc/1/C0

unified/fe25519unpackc/3/C0/result-namespace: unified/fe25519unpackc/3/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519unpackc/3/C0

nP/montgomery25519/arm64-maa4-intmul/C1/result-namespace: nP/montgomery25519/arm64-maa4-intmul/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/arm64-maa4-intmul/C1

unified/fe25519invertc/2/C1/result-namespace: unified/fe25519invertc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519invertc/2/C1

unified/fe25519packc/2/C1/result-namespace: unified/fe25519packc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519packc/2/C1

unified/fe25519unpackc/4/C1/result-namespace: unified/fe25519unpackc/4/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519unpackc/4/C1

nP/montgomery25519/arm64-maa4-redmul/shared/result-namespace: nP/montgomery25519/arm64-maa4-redmul/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/arm64-maa4-redmul/shared

unified/fe25519mulS/2/shared/result-namespace: unified/fe25519mulS/2/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519mulS/2/shared

unified/fe25519nsquareS/2/shared/result-namespace: unified/fe25519nsquareS/2/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519nsquareS/2/shared

unified/fe25519squareS/2/shared/result-namespace: unified/fe25519squareS/2/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519squareS/2/shared

nP/montgomery25519/arm64-maa4-redmul/C0/result-namespace: nP/montgomery25519/arm64-maa4-redmul/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/arm64-maa4-redmul/C0

nP/montgomery25519/arm64-maa4-redmul/C1/result-namespace: nP/montgomery25519/arm64-maa4-redmul/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/arm64-maa4-redmul/C1

nP/montgomery25519/donna_c64/shared/result-namespace: nP/montgomery25519/donna_c64/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/donna_c64/shared

nP/montgomery25519/donna_c64/C0/result-namespace: nP/montgomery25519/donna_c64/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/donna_c64/C0

nP/montgomery25519/donna_c64/C1/result-namespace: nP/montgomery25519/donna_c64/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/donna_c64/C1

nP/montgomery25519/ref10/shared/result-namespace: nP/montgomery25519/ref10/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/ref10/shared

nP/montgomery25519/ref10/C0/result-namespace: nP/montgomery25519/ref10/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/ref10/C0

nP/montgomery25519/ref10/C1/result-namespace: nP/montgomery25519/ref10/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nP/montgomery25519/ref10/C1

nPbatch/montgomery25519/ref/shared/result-namespace: nPbatch/montgomery25519/ref/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nPbatch/montgomery25519/ref/shared

nPbatch/montgomery25519/ref/C0/result-namespace: nPbatch/montgomery25519/ref/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nPbatch/montgomery25519/ref/C0

nPbatch/montgomery25519/ref/C1/result-namespace: nPbatch/montgomery25519/ref/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nPbatch/montgomery25519/ref/C1

nG/merged25519/arm64-maa4-intmul/shared/result-namespace: nG/merged25519/arm64-maa4-intmul/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/merged25519/arm64-maa4-intmul/shared

unified/fe25519addS/1/shared/result-namespace: unified/fe25519addS/1/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519addS/1/shared

unified/fe25519cmovS/1/shared/result-namespace: unified/fe25519cmovS/1/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519cmovS/1/shared

unified/fe25519subS/1/shared/result-namespace: unified/fe25519subS/1/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519subS/1/shared

unified/sharedbasedatac/1/shared/result-namespace: unified/sharedbasedatac/1/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sharedbasedatac/1/shared

nG/merged25519/arm64-maa4-intmul/C0/result-namespace: nG/merged25519/arm64-maa4-intmul/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/merged25519/arm64-maa4-intmul/C0

unified/fe25519getparityc/1/C0/result-namespace: unified/fe25519getparityc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519getparityc/1/C0

unified/sc25519from32bytesc/1/C0/result-namespace: unified/sc25519from32bytesc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sc25519from32bytesc/1/C0

unified/sc25519window4c/1/C0/result-namespace: unified/sc25519window4c/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sc25519window4c/1/C0

nG/merged25519/arm64-maa4-intmul/C1/result-namespace: nG/merged25519/arm64-maa4-intmul/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/merged25519/arm64-maa4-intmul/C1

unified/fe25519getparityc/2/C1/result-namespace: unified/fe25519getparityc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519getparityc/2/C1

unified/sc25519from32bytesc/2/C1/result-namespace: unified/sc25519from32bytesc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sc25519from32bytesc/2/C1

unified/sc25519window4c/2/C1/result-namespace: unified/sc25519window4c/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sc25519window4c/2/C1

nG/merged25519/arm64-maa4-redmul/shared/result-namespace: nG/merged25519/arm64-maa4-redmul/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/merged25519/arm64-maa4-redmul/shared

nG/merged25519/arm64-maa4-redmul/C0/result-namespace: nG/merged25519/arm64-maa4-redmul/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/merged25519/arm64-maa4-redmul/C0

nG/merged25519/arm64-maa4-redmul/C1/result-namespace: nG/merged25519/arm64-maa4-redmul/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/merged25519/arm64-maa4-redmul/C1

nG/merged25519/ref10/shared/result-namespace: nG/merged25519/ref10/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/merged25519/ref10/shared

nG/merged25519/ref10/C0/result-namespace: nG/merged25519/ref10/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/merged25519/ref10/C0

unified/feaddc/1/C0/result-namespace: unified/feaddc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/feaddc/1/C0

unified/fecopyc/1/C0/result-namespace: unified/fecopyc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fecopyc/1/C0

unified/fefrombytesc/3/C0/result-namespace: unified/fefrombytesc/3/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fefrombytesc/3/C0

unified/feinvertc/1/C0/result-namespace: unified/feinvertc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/feinvertc/1/C0

unified/feisnegativec/1/C0/result-namespace: unified/feisnegativec/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/feisnegativec/1/C0

unified/femulc/3/C0/result-namespace: unified/femulc/3/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/femulc/3/C0

unified/fenegc/1/C0/result-namespace: unified/fenegc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fenegc/1/C0

unified/fesqc/3/C0/result-namespace: unified/fesqc/3/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fesqc/3/C0

unified/fesq2c/1/C0/result-namespace: unified/fesq2c/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fesq2c/1/C0

unified/fesubc/1/C0/result-namespace: unified/fesubc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fesubc/1/C0

unified/fetobytesc/3/C0/result-namespace: unified/fetobytesc/3/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fetobytesc/3/C0

unified/gemaddc/1/C0/result-namespace: unified/gemaddc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gemaddc/1/C0

unified/gep1p1top2c/1/C0/result-namespace: unified/gep1p1top2c/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep1p1top2c/1/C0

unified/gep1p1top3c/1/C0/result-namespace: unified/gep1p1top3c/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep1p1top3c/1/C0

unified/gep2dblc/1/C0/result-namespace: unified/gep2dblc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep2dblc/1/C0

unified/gep3dblc/1/C0/result-namespace: unified/gep3dblc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep3dblc/1/C0

unified/gep3top2c/1/C0/result-namespace: unified/gep3top2c/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep3top2c/1/C0

nG/merged25519/ref10/C1/result-namespace: nG/merged25519/ref10/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/merged25519/ref10/C1

unified/feaddc/2/C1/result-namespace: unified/feaddc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/feaddc/2/C1

unified/fecopyc/2/C1/result-namespace: unified/fecopyc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fecopyc/2/C1

unified/fefrombytesc/4/C1/result-namespace: unified/fefrombytesc/4/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fefrombytesc/4/C1

unified/feinvertc/2/C1/result-namespace: unified/feinvertc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/feinvertc/2/C1

unified/feisnegativec/2/C1/result-namespace: unified/feisnegativec/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/feisnegativec/2/C1

unified/femulc/4/C1/result-namespace: unified/femulc/4/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/femulc/4/C1

unified/fenegc/2/C1/result-namespace: unified/fenegc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fenegc/2/C1

unified/fesqc/4/C1/result-namespace: unified/fesqc/4/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fesqc/4/C1

unified/fesq2c/2/C1/result-namespace: unified/fesq2c/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fesq2c/2/C1

unified/fesubc/2/C1/result-namespace: unified/fesubc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fesubc/2/C1

unified/fetobytesc/4/C1/result-namespace: unified/fetobytesc/4/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fetobytesc/4/C1

unified/gemaddc/2/C1/result-namespace: unified/gemaddc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gemaddc/2/C1

unified/gep1p1top2c/2/C1/result-namespace: unified/gep1p1top2c/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep1p1top2c/2/C1

unified/gep1p1top3c/2/C1/result-namespace: unified/gep1p1top3c/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep1p1top3c/2/C1

unified/gep2dblc/2/C1/result-namespace: unified/gep2dblc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep2dblc/2/C1

unified/gep3dblc/2/C1/result-namespace: unified/gep3dblc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep3dblc/2/C1

unified/gep3top2c/2/C1/result-namespace: unified/gep3top2c/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep3top2c/2/C1

nG/montgomery25519/ref/shared/result-namespace: nG/montgomery25519/ref/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/montgomery25519/ref/shared

nG/montgomery25519/ref/C0/result-namespace: nG/montgomery25519/ref/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/montgomery25519/ref/C0

nG/montgomery25519/ref/C1/result-namespace: nG/montgomery25519/ref/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/montgomery25519/ref/C1

nG/montgomery25519/usemerged/shared/result-namespace: nG/montgomery25519/usemerged/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/montgomery25519/usemerged/shared

nG/montgomery25519/usemerged/C0/result-namespace: nG/montgomery25519/usemerged/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/montgomery25519/usemerged/C0

nG/montgomery25519/usemerged/C1/result-namespace: nG/montgomery25519/usemerged/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 nG/montgomery25519/usemerged/C1

mGnP/ed25519/arm64-maa4-intmul/shared/result-namespace: mGnP/ed25519/arm64-maa4-intmul/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 mGnP/ed25519/arm64-maa4-intmul/shared

unified/ge25519doublescalarmultprecomputeS/1/shared/result-namespace: unified/ge25519doublescalarmultprecomputeS/1/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/ge25519doublescalarmultprecomputeS/1/shared

unified/sc25519barrettS/1/shared/result-namespace: unified/sc25519barrettS/1/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sc25519barrettS/1/shared

mGnP/ed25519/arm64-maa4-intmul/C0/result-namespace: mGnP/ed25519/arm64-maa4-intmul/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 mGnP/ed25519/arm64-maa4-intmul/C0

unified/fe25519iseqc/1/C0/result-namespace: unified/fe25519iseqc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519iseqc/1/C0

unified/fe25519pow2523c/1/C0/result-namespace: unified/fe25519pow2523c/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519pow2523c/1/C0

unified/fe25519setintc/1/C0/result-namespace: unified/fe25519setintc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519setintc/1/C0

unified/sc25519from64bytesc/1/C0/result-namespace: unified/sc25519from64bytesc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sc25519from64bytesc/1/C0

unified/sc25519slidec/1/C0/result-namespace: unified/sc25519slidec/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sc25519slidec/1/C0

unified/sc25519to32bytesc/1/C0/result-namespace: unified/sc25519to32bytesc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sc25519to32bytesc/1/C0

mGnP/ed25519/arm64-maa4-intmul/C1/result-namespace: mGnP/ed25519/arm64-maa4-intmul/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 mGnP/ed25519/arm64-maa4-intmul/C1

unified/fe25519iseqc/2/C1/result-namespace: unified/fe25519iseqc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519iseqc/2/C1

unified/fe25519pow2523c/2/C1/result-namespace: unified/fe25519pow2523c/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519pow2523c/2/C1

unified/fe25519setintc/2/C1/result-namespace: unified/fe25519setintc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519setintc/2/C1

unified/sc25519from64bytesc/2/C1/result-namespace: unified/sc25519from64bytesc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sc25519from64bytesc/2/C1

unified/sc25519slidec/2/C1/result-namespace: unified/sc25519slidec/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sc25519slidec/2/C1

unified/sc25519to32bytesc/2/C1/result-namespace: unified/sc25519to32bytesc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/sc25519to32bytesc/2/C1

mGnP/ed25519/arm64-maa4-redmul/shared/result-namespace: mGnP/ed25519/arm64-maa4-redmul/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 mGnP/ed25519/arm64-maa4-redmul/shared

unified/ge25519doublescalarmultprecomputeS/2/shared/result-namespace: unified/ge25519doublescalarmultprecomputeS/2/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/ge25519doublescalarmultprecomputeS/2/shared

mGnP/ed25519/arm64-maa4-redmul/C0/result-namespace: mGnP/ed25519/arm64-maa4-redmul/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 mGnP/ed25519/arm64-maa4-redmul/C0

unified/fe25519pow2523c/3/C0/result-namespace: unified/fe25519pow2523c/3/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519pow2523c/3/C0

mGnP/ed25519/arm64-maa4-redmul/C1/result-namespace: mGnP/ed25519/arm64-maa4-redmul/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 mGnP/ed25519/arm64-maa4-redmul/C1

unified/fe25519pow2523c/4/C1/result-namespace: unified/fe25519pow2523c/4/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fe25519pow2523c/4/C1

mGnP/ed25519/ref10/shared/result-namespace: mGnP/ed25519/ref10/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 mGnP/ed25519/ref10/shared

mGnP/ed25519/ref10/C0/result-namespace: mGnP/ed25519/ref10/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 mGnP/ed25519/ref10/C0

unified/feisnonzeroc/1/C0/result-namespace: unified/feisnonzeroc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/feisnonzeroc/1/C0

unified/fepow22523c/1/C0/result-namespace: unified/fepow22523c/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fepow22523c/1/C0

unified/geaddc/1/C0/result-namespace: unified/geaddc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/geaddc/1/C0

unified/gep3tocachedc/1/C0/result-namespace: unified/gep3tocachedc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep3tocachedc/1/C0

unified/gesubc/1/C0/result-namespace: unified/gesubc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gesubc/1/C0

unified/getobytesc/1/C0/result-namespace: unified/getobytesc/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/getobytesc/1/C0

unified/screducec/1/C0/result-namespace: unified/screducec/1/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/screducec/1/C0

mGnP/ed25519/ref10/C1/result-namespace: mGnP/ed25519/ref10/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 mGnP/ed25519/ref10/C1

unified/feisnonzeroc/2/C1/result-namespace: unified/feisnonzeroc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/feisnonzeroc/2/C1

unified/fepow22523c/2/C1/result-namespace: unified/fepow22523c/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/fepow22523c/2/C1

unified/geaddc/2/C1/result-namespace: unified/geaddc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/geaddc/2/C1

unified/gep3tocachedc/2/C1/result-namespace: unified/gep3tocachedc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gep3tocachedc/2/C1

unified/gesubc/2/C1/result-namespace: unified/gesubc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/gesubc/2/C1

unified/getobytesc/2/C1/result-namespace: unified/getobytesc/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/getobytesc/2/C1

unified/screducec/2/C1/result-namespace: unified/screducec/2/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 unified/screducec/2/C1

multiscalar/ed25519/arm64-maa4-intmul/shared/result-namespace: multiscalar/ed25519/arm64-maa4-intmul/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-intmul/shared

multiscalar/ed25519/arm64-maa4-intmul/C0/result-namespace: multiscalar/ed25519/arm64-maa4-intmul/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-intmul/C0

multiscalar/ed25519/arm64-maa4-intmul/C1/result-namespace: multiscalar/ed25519/arm64-maa4-intmul/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-intmul/C1

multiscalar/ed25519/arm64-maa4-intmul-p3/shared/result-namespace: multiscalar/ed25519/arm64-maa4-intmul-p3/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-intmul-p3/shared

multiscalar/ed25519/arm64-maa4-intmul-p3/C0/result-namespace: multiscalar/ed25519/arm64-maa4-intmul-p3/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-intmul-p3/C0

multiscalar/ed25519/arm64-maa4-intmul-p3/C1/result-namespace: multiscalar/ed25519/arm64-maa4-intmul-p3/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-intmul-p3/C1

multiscalar/ed25519/arm64-maa4-redmul/shared/result-namespace: multiscalar/ed25519/arm64-maa4-redmul/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-redmul/shared

multiscalar/ed25519/arm64-maa4-redmul/C0/result-namespace: multiscalar/ed25519/arm64-maa4-redmul/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-redmul/C0

multiscalar/ed25519/arm64-maa4-redmul/C1/result-namespace: multiscalar/ed25519/arm64-maa4-redmul/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-redmul/C1

multiscalar/ed25519/arm64-maa4-redmul-p3/shared/result-namespace: multiscalar/ed25519/arm64-maa4-redmul-p3/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-redmul-p3/shared

multiscalar/ed25519/arm64-maa4-redmul-p3/C0/result-namespace: multiscalar/ed25519/arm64-maa4-redmul-p3/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-redmul-p3/C0

multiscalar/ed25519/arm64-maa4-redmul-p3/C1/result-namespace: multiscalar/ed25519/arm64-maa4-redmul-p3/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/arm64-maa4-redmul-p3/C1

multiscalar/ed25519/ref10/shared/result-namespace: multiscalar/ed25519/ref10/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/ref10/shared

multiscalar/ed25519/ref10/C0/result-namespace: multiscalar/ed25519/ref10/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/ref10/C0

multiscalar/ed25519/ref10/C1/result-namespace: multiscalar/ed25519/ref10/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 multiscalar/ed25519/ref10/C1

dh/x25519/wrapper/shared/result-namespace: dh/x25519/wrapper/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 dh/x25519/wrapper/shared

dh/x25519/wrapper/C0/result-namespace: dh/x25519/wrapper/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 dh/x25519/wrapper/C0

dh/x25519/wrapper/C1/result-namespace: dh/x25519/wrapper/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 dh/x25519/wrapper/C1

sign/ed25519/ref10/shared/result-namespace: sign/ed25519/ref10/shared/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 sign/ed25519/ref10/shared

sign/ed25519/ref10/C0/result-namespace: sign/ed25519/ref10/C0/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 sign/ed25519/ref10/C0

sign/ed25519/ref10/C1/result-namespace: sign/ed25519/ref10/C1/allcompiled scripts/checknamespace
	scripts/checknamespace lib25519 sign/ed25519/ref10/C1


dispatch/ifunc: dispatch/ifunc.do dispatch/tryifunc
	dispatch/ifunc.do

compilers-all: 
	touch compilers-all

cryptoint/int16_optblocker.o: cryptoint/int16_optblocker.c
	scripts/compiledefault cryptoint int16_optblocker c -I include-build

cryptoint/int32_optblocker.o: cryptoint/int32_optblocker.c
	scripts/compiledefault cryptoint int32_optblocker c -I include-build

cryptoint/int64_optblocker.o: cryptoint/int64_optblocker.c
	scripts/compiledefault cryptoint int64_optblocker c -I include-build

cryptoint/int8_optblocker.o: cryptoint/int8_optblocker.c
	scripts/compiledefault cryptoint int8_optblocker c -I include-build

cryptoint/uint16_optblocker.o: cryptoint/uint16_optblocker.c
	scripts/compiledefault cryptoint uint16_optblocker c -I include-build

cryptoint/uint32_optblocker.o: cryptoint/uint32_optblocker.c
	scripts/compiledefault cryptoint uint32_optblocker c -I include-build

cryptoint/uint64_optblocker.o: cryptoint/uint64_optblocker.c
	scripts/compiledefault cryptoint uint64_optblocker c -I include-build

cryptoint/uint8_optblocker.o: cryptoint/uint8_optblocker.c
	scripts/compiledefault cryptoint uint8_optblocker c -I include-build

cryptoint-all: \
cryptoint/int16_optblocker.o\
cryptoint/int32_optblocker.o\
cryptoint/int64_optblocker.o\
cryptoint/int8_optblocker.o\
cryptoint/uint16_optblocker.o\
cryptoint/uint32_optblocker.o\
cryptoint/uint64_optblocker.o\
cryptoint/uint8_optblocker.o
	touch cryptoint-all

verify/32/ref/C0/verify.o: verify/32/ref/C0/verify.c
	scripts/compile verify/32/ref/C0 verify c lib25519

verify/32/ref/C1/verify.o: verify/32/ref/C1/verify.c
	scripts/compile verify/32/ref/C1 verify c lib25519

hashblocks/sha512/compact/C0/blocks.o: hashblocks/sha512/compact/C0/blocks.c
	scripts/compile hashblocks/sha512/compact/C0 blocks c lib25519

hashblocks/sha512/compact/C1/blocks.o: hashblocks/sha512/compact/C1/blocks.c
	scripts/compile hashblocks/sha512/compact/C1 blocks c lib25519

hashblocks/sha512/compact2/C0/blocks.o: hashblocks/sha512/compact2/C0/blocks.c
	scripts/compile hashblocks/sha512/compact2/C0 blocks c lib25519

hashblocks/sha512/compact2/C1/blocks.o: hashblocks/sha512/compact2/C1/blocks.c
	scripts/compile hashblocks/sha512/compact2/C1 blocks c lib25519

hashblocks/sha512/compact3/C0/blocks.o: hashblocks/sha512/compact3/C0/blocks.c
	scripts/compile hashblocks/sha512/compact3/C0 blocks c lib25519

hashblocks/sha512/compact3/C1/blocks.o: hashblocks/sha512/compact3/C1/blocks.c
	scripts/compile hashblocks/sha512/compact3/C1 blocks c lib25519

hashblocks/sha512/compact4/C0/blocks.o: hashblocks/sha512/compact4/C0/blocks.c
	scripts/compile hashblocks/sha512/compact4/C0 blocks c lib25519

hashblocks/sha512/compact4/C1/blocks.o: hashblocks/sha512/compact4/C1/blocks.c
	scripts/compile hashblocks/sha512/compact4/C1 blocks c lib25519

hashblocks/sha512/inplace/C0/blocks.o: hashblocks/sha512/inplace/C0/blocks.c
	scripts/compile hashblocks/sha512/inplace/C0 blocks c lib25519

hashblocks/sha512/inplace/C1/blocks.o: hashblocks/sha512/inplace/C1/blocks.c
	scripts/compile hashblocks/sha512/inplace/C1 blocks c lib25519

hashblocks/sha512/ref/C0/blocks.o: hashblocks/sha512/ref/C0/blocks.c
	scripts/compile hashblocks/sha512/ref/C0 blocks c lib25519

hashblocks/sha512/ref/C1/blocks.o: hashblocks/sha512/ref/C1/blocks.c
	scripts/compile hashblocks/sha512/ref/C1 blocks c lib25519

hashblocks/sha512/wflip/C0/constants.o: hashblocks/sha512/wflip/C0/constants.c
	scripts/compile hashblocks/sha512/wflip/C0 constants c lib25519

hashblocks/sha512/wflip/C0/inner.o: hashblocks/sha512/wflip/C0/inner.c
	scripts/compile hashblocks/sha512/wflip/C0 inner c lib25519

hashblocks/sha512/wflip/C1/constants.o: hashblocks/sha512/wflip/C1/constants.c
	scripts/compile hashblocks/sha512/wflip/C1 constants c lib25519

hashblocks/sha512/wflip/C1/inner.o: hashblocks/sha512/wflip/C1/inner.c
	scripts/compile hashblocks/sha512/wflip/C1 inner c lib25519

hash/sha512/ref/C0/hash.o: hash/sha512/ref/C0/hash.c
	scripts/compile hash/sha512/ref/C0 hash c lib25519

hash/sha512/ref/C1/hash.o: hash/sha512/ref/C1/hash.c
	scripts/compile hash/sha512/ref/C1 hash c lib25519

pow/inv25519/arm64-maa4-intmul/shared/fe25519_freeze.o: pow/inv25519/arm64-maa4-intmul/shared/fe25519_freeze.S
	scripts/compile pow/inv25519/arm64-maa4-intmul/shared fe25519_freeze S lib25519

pow/inv25519/arm64-maa4-intmul/shared/fe25519_mul.o: pow/inv25519/arm64-maa4-intmul/shared/fe25519_mul.S
	scripts/compile pow/inv25519/arm64-maa4-intmul/shared fe25519_mul S lib25519

pow/inv25519/arm64-maa4-intmul/shared/fe25519_nsquare.o: pow/inv25519/arm64-maa4-intmul/shared/fe25519_nsquare.S
	scripts/compile pow/inv25519/arm64-maa4-intmul/shared fe25519_nsquare S lib25519

pow/inv25519/arm64-maa4-intmul/shared/fe25519_square.o: pow/inv25519/arm64-maa4-intmul/shared/fe25519_square.S
	scripts/compile pow/inv25519/arm64-maa4-intmul/shared fe25519_square S lib25519

pow/inv25519/arm64-maa4-intmul/C0/api.o: pow/inv25519/arm64-maa4-intmul/C0/api.c
	scripts/compile pow/inv25519/arm64-maa4-intmul/C0 api c lib25519

pow/inv25519/arm64-maa4-intmul/C0/fe25519_invert.o: pow/inv25519/arm64-maa4-intmul/C0/fe25519_invert.c
	scripts/compile pow/inv25519/arm64-maa4-intmul/C0 fe25519_invert c lib25519

pow/inv25519/arm64-maa4-intmul/C0/fe25519_pack.o: pow/inv25519/arm64-maa4-intmul/C0/fe25519_pack.c
	scripts/compile pow/inv25519/arm64-maa4-intmul/C0 fe25519_pack c lib25519

unified/fe25519unpackc/1/C0/fe25519_unpack.o: unified/fe25519unpackc/1/C0/fe25519_unpack.c
	scripts/compile unified/fe25519unpackc/1/C0 fe25519_unpack c lib25519

pow/inv25519/arm64-maa4-intmul/C1/api.o: pow/inv25519/arm64-maa4-intmul/C1/api.c
	scripts/compile pow/inv25519/arm64-maa4-intmul/C1 api c lib25519

pow/inv25519/arm64-maa4-intmul/C1/fe25519_invert.o: pow/inv25519/arm64-maa4-intmul/C1/fe25519_invert.c
	scripts/compile pow/inv25519/arm64-maa4-intmul/C1 fe25519_invert c lib25519

pow/inv25519/arm64-maa4-intmul/C1/fe25519_pack.o: pow/inv25519/arm64-maa4-intmul/C1/fe25519_pack.c
	scripts/compile pow/inv25519/arm64-maa4-intmul/C1 fe25519_pack c lib25519

unified/fe25519unpackc/2/C1/fe25519_unpack.o: unified/fe25519unpackc/2/C1/fe25519_unpack.c
	scripts/compile unified/fe25519unpackc/2/C1 fe25519_unpack c lib25519

pow/inv25519/arm64-maa4-redmul/shared/fe25519_freeze.o: pow/inv25519/arm64-maa4-redmul/shared/fe25519_freeze.S
	scripts/compile pow/inv25519/arm64-maa4-redmul/shared fe25519_freeze S lib25519

pow/inv25519/arm64-maa4-redmul/shared/fe25519_mul.o: pow/inv25519/arm64-maa4-redmul/shared/fe25519_mul.S
	scripts/compile pow/inv25519/arm64-maa4-redmul/shared fe25519_mul S lib25519

pow/inv25519/arm64-maa4-redmul/shared/fe25519_nsquare.o: pow/inv25519/arm64-maa4-redmul/shared/fe25519_nsquare.S
	scripts/compile pow/inv25519/arm64-maa4-redmul/shared fe25519_nsquare S lib25519

pow/inv25519/arm64-maa4-redmul/shared/fe25519_square.o: pow/inv25519/arm64-maa4-redmul/shared/fe25519_square.S
	scripts/compile pow/inv25519/arm64-maa4-redmul/shared fe25519_square S lib25519

pow/inv25519/arm64-maa4-redmul/C0/api.o: pow/inv25519/arm64-maa4-redmul/C0/api.c
	scripts/compile pow/inv25519/arm64-maa4-redmul/C0 api c lib25519

pow/inv25519/arm64-maa4-redmul/C0/fe25519_invert.o: pow/inv25519/arm64-maa4-redmul/C0/fe25519_invert.c
	scripts/compile pow/inv25519/arm64-maa4-redmul/C0 fe25519_invert c lib25519

pow/inv25519/arm64-maa4-redmul/C0/fe25519_pack.o: pow/inv25519/arm64-maa4-redmul/C0/fe25519_pack.c
	scripts/compile pow/inv25519/arm64-maa4-redmul/C0 fe25519_pack c lib25519

pow/inv25519/arm64-maa4-redmul/C1/api.o: pow/inv25519/arm64-maa4-redmul/C1/api.c
	scripts/compile pow/inv25519/arm64-maa4-redmul/C1 api c lib25519

pow/inv25519/arm64-maa4-redmul/C1/fe25519_invert.o: pow/inv25519/arm64-maa4-redmul/C1/fe25519_invert.c
	scripts/compile pow/inv25519/arm64-maa4-redmul/C1 fe25519_invert c lib25519

pow/inv25519/arm64-maa4-redmul/C1/fe25519_pack.o: pow/inv25519/arm64-maa4-redmul/C1/fe25519_pack.c
	scripts/compile pow/inv25519/arm64-maa4-redmul/C1 fe25519_pack c lib25519

pow/inv25519/donna_c64/C0/pow.o: pow/inv25519/donna_c64/C0/pow.c
	scripts/compile pow/inv25519/donna_c64/C0 pow c lib25519

pow/inv25519/donna_c64/C1/pow.o: pow/inv25519/donna_c64/C1/pow.c
	scripts/compile pow/inv25519/donna_c64/C1 pow c lib25519

pow/inv25519/ref10/C0/api.o: pow/inv25519/ref10/C0/api.c
	scripts/compile pow/inv25519/ref10/C0 api c lib25519

unified/fefrombytesc/1/C0/fe_frombytes.o: unified/fefrombytesc/1/C0/fe_frombytes.c
	scripts/compile unified/fefrombytesc/1/C0 fe_frombytes c lib25519

pow/inv25519/ref10/C0/fe_invert.o: pow/inv25519/ref10/C0/fe_invert.c
	scripts/compile pow/inv25519/ref10/C0 fe_invert c lib25519

unified/femulc/1/C0/fe_mul.o: unified/femulc/1/C0/fe_mul.c
	scripts/compile unified/femulc/1/C0 fe_mul c lib25519

unified/fesqc/1/C0/fe_sq.o: unified/fesqc/1/C0/fe_sq.c
	scripts/compile unified/fesqc/1/C0 fe_sq c lib25519

unified/fetobytesc/1/C0/fe_tobytes.o: unified/fetobytesc/1/C0/fe_tobytes.c
	scripts/compile unified/fetobytesc/1/C0 fe_tobytes c lib25519

pow/inv25519/ref10/C1/api.o: pow/inv25519/ref10/C1/api.c
	scripts/compile pow/inv25519/ref10/C1 api c lib25519

unified/fefrombytesc/2/C1/fe_frombytes.o: unified/fefrombytesc/2/C1/fe_frombytes.c
	scripts/compile unified/fefrombytesc/2/C1 fe_frombytes c lib25519

pow/inv25519/ref10/C1/fe_invert.o: pow/inv25519/ref10/C1/fe_invert.c
	scripts/compile pow/inv25519/ref10/C1 fe_invert c lib25519

unified/femulc/2/C1/fe_mul.o: unified/femulc/2/C1/fe_mul.c
	scripts/compile unified/femulc/2/C1 fe_mul c lib25519

unified/fesqc/2/C1/fe_sq.o: unified/fesqc/2/C1/fe_sq.c
	scripts/compile unified/fesqc/2/C1 fe_sq c lib25519

unified/fetobytesc/2/C1/fe_tobytes.o: unified/fetobytesc/2/C1/fe_tobytes.c
	scripts/compile unified/fetobytesc/2/C1 fe_tobytes c lib25519

powbatch/inv25519/ref10/C0/api.o: powbatch/inv25519/ref10/C0/api.c
	scripts/compile powbatch/inv25519/ref10/C0 api c lib25519

unified/fe0c/1/C0/fe_0.o: unified/fe0c/1/C0/fe_0.c
	scripts/compile unified/fe0c/1/C0 fe_0 c lib25519

unified/fe1c/1/C0/fe_1.o: unified/fe1c/1/C0/fe_1.c
	scripts/compile unified/fe1c/1/C0 fe_1 c lib25519

unified/fecmovc/1/C0/fe_cmov.o: unified/fecmovc/1/C0/fe_cmov.c
	scripts/compile unified/fecmovc/1/C0 fe_cmov c lib25519

powbatch/inv25519/ref10/C0/fe_frombytes.o: powbatch/inv25519/ref10/C0/fe_frombytes.c
	scripts/compile powbatch/inv25519/ref10/C0 fe_frombytes c lib25519

powbatch/inv25519/ref10/C0/fe_isnonzero.o: powbatch/inv25519/ref10/C0/fe_isnonzero.c
	scripts/compile powbatch/inv25519/ref10/C0 fe_isnonzero c lib25519

powbatch/inv25519/ref10/C0/fe_mul.o: powbatch/inv25519/ref10/C0/fe_mul.c
	scripts/compile powbatch/inv25519/ref10/C0 fe_mul c lib25519

powbatch/inv25519/ref10/C0/fe_tobytes.o: powbatch/inv25519/ref10/C0/fe_tobytes.c
	scripts/compile powbatch/inv25519/ref10/C0 fe_tobytes c lib25519

powbatch/inv25519/ref10/C1/api.o: powbatch/inv25519/ref10/C1/api.c
	scripts/compile powbatch/inv25519/ref10/C1 api c lib25519

unified/fe0c/2/C1/fe_0.o: unified/fe0c/2/C1/fe_0.c
	scripts/compile unified/fe0c/2/C1 fe_0 c lib25519

unified/fe1c/2/C1/fe_1.o: unified/fe1c/2/C1/fe_1.c
	scripts/compile unified/fe1c/2/C1 fe_1 c lib25519

unified/fecmovc/2/C1/fe_cmov.o: unified/fecmovc/2/C1/fe_cmov.c
	scripts/compile unified/fecmovc/2/C1 fe_cmov c lib25519

powbatch/inv25519/ref10/C1/fe_frombytes.o: powbatch/inv25519/ref10/C1/fe_frombytes.c
	scripts/compile powbatch/inv25519/ref10/C1 fe_frombytes c lib25519

powbatch/inv25519/ref10/C1/fe_isnonzero.o: powbatch/inv25519/ref10/C1/fe_isnonzero.c
	scripts/compile powbatch/inv25519/ref10/C1 fe_isnonzero c lib25519

powbatch/inv25519/ref10/C1/fe_mul.o: powbatch/inv25519/ref10/C1/fe_mul.c
	scripts/compile powbatch/inv25519/ref10/C1 fe_mul c lib25519

powbatch/inv25519/ref10/C1/fe_tobytes.o: powbatch/inv25519/ref10/C1/fe_tobytes.c
	scripts/compile powbatch/inv25519/ref10/C1 fe_tobytes c lib25519

powbatch/inv25519/simple/C0/powbatch.o: powbatch/inv25519/simple/C0/powbatch.c
	scripts/compile powbatch/inv25519/simple/C0 powbatch c lib25519

powbatch/inv25519/simple/C1/powbatch.o: powbatch/inv25519/simple/C1/powbatch.c
	scripts/compile powbatch/inv25519/simple/C1 powbatch c lib25519

unified/fe25519freezeS/1/shared/fe25519_freeze.o: unified/fe25519freezeS/1/shared/fe25519_freeze.S
	scripts/compile unified/fe25519freezeS/1/shared fe25519_freeze S lib25519

unified/fe25519mulS/1/shared/fe25519_mul.o: unified/fe25519mulS/1/shared/fe25519_mul.S
	scripts/compile unified/fe25519mulS/1/shared fe25519_mul S lib25519

unified/fe25519nsquareS/1/shared/fe25519_nsquare.o: unified/fe25519nsquareS/1/shared/fe25519_nsquare.S
	scripts/compile unified/fe25519nsquareS/1/shared fe25519_nsquare S lib25519

unified/fe25519squareS/1/shared/fe25519_square.o: unified/fe25519squareS/1/shared/fe25519_square.S
	scripts/compile unified/fe25519squareS/1/shared fe25519_square S lib25519

nP/montgomery25519/arm64-maa4-intmul/shared/mladder.o: nP/montgomery25519/arm64-maa4-intmul/shared/mladder.S
	scripts/compile nP/montgomery25519/arm64-maa4-intmul/shared mladder S lib25519

unified/fe25519invertc/1/C0/fe25519_invert.o: unified/fe25519invertc/1/C0/fe25519_invert.c
	scripts/compile unified/fe25519invertc/1/C0 fe25519_invert c lib25519

unified/fe25519packc/1/C0/fe25519_pack.o: unified/fe25519packc/1/C0/fe25519_pack.c
	scripts/compile unified/fe25519packc/1/C0 fe25519_pack c lib25519

unified/fe25519unpackc/3/C0/fe25519_unpack.o: unified/fe25519unpackc/3/C0/fe25519_unpack.c
	scripts/compile unified/fe25519unpackc/3/C0 fe25519_unpack c lib25519

nP/montgomery25519/arm64-maa4-intmul/C0/mont25519.o: nP/montgomery25519/arm64-maa4-intmul/C0/mont25519.c
	scripts/compile nP/montgomery25519/arm64-maa4-intmul/C0 mont25519 c lib25519

unified/fe25519invertc/2/C1/fe25519_invert.o: unified/fe25519invertc/2/C1/fe25519_invert.c
	scripts/compile unified/fe25519invertc/2/C1 fe25519_invert c lib25519

unified/fe25519packc/2/C1/fe25519_pack.o: unified/fe25519packc/2/C1/fe25519_pack.c
	scripts/compile unified/fe25519packc/2/C1 fe25519_pack c lib25519

unified/fe25519unpackc/4/C1/fe25519_unpack.o: unified/fe25519unpackc/4/C1/fe25519_unpack.c
	scripts/compile unified/fe25519unpackc/4/C1 fe25519_unpack c lib25519

nP/montgomery25519/arm64-maa4-intmul/C1/mont25519.o: nP/montgomery25519/arm64-maa4-intmul/C1/mont25519.c
	scripts/compile nP/montgomery25519/arm64-maa4-intmul/C1 mont25519 c lib25519

unified/fe25519mulS/2/shared/fe25519_mul.o: unified/fe25519mulS/2/shared/fe25519_mul.S
	scripts/compile unified/fe25519mulS/2/shared fe25519_mul S lib25519

unified/fe25519nsquareS/2/shared/fe25519_nsquare.o: unified/fe25519nsquareS/2/shared/fe25519_nsquare.S
	scripts/compile unified/fe25519nsquareS/2/shared fe25519_nsquare S lib25519

unified/fe25519squareS/2/shared/fe25519_square.o: unified/fe25519squareS/2/shared/fe25519_square.S
	scripts/compile unified/fe25519squareS/2/shared fe25519_square S lib25519

nP/montgomery25519/arm64-maa4-redmul/shared/mladder.o: nP/montgomery25519/arm64-maa4-redmul/shared/mladder.S
	scripts/compile nP/montgomery25519/arm64-maa4-redmul/shared mladder S lib25519

nP/montgomery25519/arm64-maa4-redmul/C0/mont25519.o: nP/montgomery25519/arm64-maa4-redmul/C0/mont25519.c
	scripts/compile nP/montgomery25519/arm64-maa4-redmul/C0 mont25519 c lib25519

nP/montgomery25519/arm64-maa4-redmul/C1/mont25519.o: nP/montgomery25519/arm64-maa4-redmul/C1/mont25519.c
	scripts/compile nP/montgomery25519/arm64-maa4-redmul/C1 mont25519 c lib25519

nP/montgomery25519/donna_c64/C0/smult.o: nP/montgomery25519/donna_c64/C0/smult.c
	scripts/compile nP/montgomery25519/donna_c64/C0 smult c lib25519

nP/montgomery25519/donna_c64/C1/smult.o: nP/montgomery25519/donna_c64/C1/smult.c
	scripts/compile nP/montgomery25519/donna_c64/C1 smult c lib25519

nP/montgomery25519/ref10/C0/fe_0.o: nP/montgomery25519/ref10/C0/fe_0.c
	scripts/compile nP/montgomery25519/ref10/C0 fe_0 c lib25519

nP/montgomery25519/ref10/C0/fe_1.o: nP/montgomery25519/ref10/C0/fe_1.c
	scripts/compile nP/montgomery25519/ref10/C0 fe_1 c lib25519

nP/montgomery25519/ref10/C0/fe_add.o: nP/montgomery25519/ref10/C0/fe_add.c
	scripts/compile nP/montgomery25519/ref10/C0 fe_add c lib25519

nP/montgomery25519/ref10/C0/fe_copy.o: nP/montgomery25519/ref10/C0/fe_copy.c
	scripts/compile nP/montgomery25519/ref10/C0 fe_copy c lib25519

nP/montgomery25519/ref10/C0/fe_cswap.o: nP/montgomery25519/ref10/C0/fe_cswap.c
	scripts/compile nP/montgomery25519/ref10/C0 fe_cswap c lib25519

nP/montgomery25519/ref10/C0/fe_invert.o: nP/montgomery25519/ref10/C0/fe_invert.c
	scripts/compile nP/montgomery25519/ref10/C0 fe_invert c lib25519

nP/montgomery25519/ref10/C0/fe_mul121666.o: nP/montgomery25519/ref10/C0/fe_mul121666.c
	scripts/compile nP/montgomery25519/ref10/C0 fe_mul121666 c lib25519

nP/montgomery25519/ref10/C0/fe_sub.o: nP/montgomery25519/ref10/C0/fe_sub.c
	scripts/compile nP/montgomery25519/ref10/C0 fe_sub c lib25519

nP/montgomery25519/ref10/C0/scalarmult.o: nP/montgomery25519/ref10/C0/scalarmult.c
	scripts/compile nP/montgomery25519/ref10/C0 scalarmult c lib25519

nP/montgomery25519/ref10/C1/fe_0.o: nP/montgomery25519/ref10/C1/fe_0.c
	scripts/compile nP/montgomery25519/ref10/C1 fe_0 c lib25519

nP/montgomery25519/ref10/C1/fe_1.o: nP/montgomery25519/ref10/C1/fe_1.c
	scripts/compile nP/montgomery25519/ref10/C1 fe_1 c lib25519

nP/montgomery25519/ref10/C1/fe_add.o: nP/montgomery25519/ref10/C1/fe_add.c
	scripts/compile nP/montgomery25519/ref10/C1 fe_add c lib25519

nP/montgomery25519/ref10/C1/fe_copy.o: nP/montgomery25519/ref10/C1/fe_copy.c
	scripts/compile nP/montgomery25519/ref10/C1 fe_copy c lib25519

nP/montgomery25519/ref10/C1/fe_cswap.o: nP/montgomery25519/ref10/C1/fe_cswap.c
	scripts/compile nP/montgomery25519/ref10/C1 fe_cswap c lib25519

nP/montgomery25519/ref10/C1/fe_invert.o: nP/montgomery25519/ref10/C1/fe_invert.c
	scripts/compile nP/montgomery25519/ref10/C1 fe_invert c lib25519

nP/montgomery25519/ref10/C1/fe_mul121666.o: nP/montgomery25519/ref10/C1/fe_mul121666.c
	scripts/compile nP/montgomery25519/ref10/C1 fe_mul121666 c lib25519

nP/montgomery25519/ref10/C1/fe_sub.o: nP/montgomery25519/ref10/C1/fe_sub.c
	scripts/compile nP/montgomery25519/ref10/C1 fe_sub c lib25519

nP/montgomery25519/ref10/C1/scalarmult.o: nP/montgomery25519/ref10/C1/scalarmult.c
	scripts/compile nP/montgomery25519/ref10/C1 scalarmult c lib25519

nPbatch/montgomery25519/ref/C0/nPbatch.o: nPbatch/montgomery25519/ref/C0/nPbatch.c
	scripts/compile nPbatch/montgomery25519/ref/C0 nPbatch c lib25519

nPbatch/montgomery25519/ref/C1/nPbatch.o: nPbatch/montgomery25519/ref/C1/nPbatch.c
	scripts/compile nPbatch/montgomery25519/ref/C1 nPbatch c lib25519

unified/fe25519addS/1/shared/fe25519_add.o: unified/fe25519addS/1/shared/fe25519_add.S
	scripts/compile unified/fe25519addS/1/shared fe25519_add S lib25519

unified/fe25519cmovS/1/shared/fe25519_cmov.o: unified/fe25519cmovS/1/shared/fe25519_cmov.S
	scripts/compile unified/fe25519cmovS/1/shared fe25519_cmov S lib25519

unified/fe25519subS/1/shared/fe25519_sub.o: unified/fe25519subS/1/shared/fe25519_sub.S
	scripts/compile unified/fe25519subS/1/shared fe25519_sub S lib25519

nG/merged25519/arm64-maa4-intmul/shared/ge25519_base.o: nG/merged25519/arm64-maa4-intmul/shared/ge25519_base.S
	scripts/compile nG/merged25519/arm64-maa4-intmul/shared ge25519_base S lib25519

unified/sharedbasedatac/1/shared/shared-base-data.o: unified/sharedbasedatac/1/shared/shared-base-data.c
	scripts/compile unified/sharedbasedatac/1/shared shared-base-data c lib25519

unified/fe25519getparityc/1/C0/fe25519_getparity.o: unified/fe25519getparityc/1/C0/fe25519_getparity.c
	scripts/compile unified/fe25519getparityc/1/C0 fe25519_getparity c lib25519

nG/merged25519/arm64-maa4-intmul/C0/ge25519_scalarmult_base.o: nG/merged25519/arm64-maa4-intmul/C0/ge25519_scalarmult_base.c
	scripts/compile nG/merged25519/arm64-maa4-intmul/C0 ge25519_scalarmult_base c lib25519

nG/merged25519/arm64-maa4-intmul/C0/nG.o: nG/merged25519/arm64-maa4-intmul/C0/nG.c
	scripts/compile nG/merged25519/arm64-maa4-intmul/C0 nG c lib25519

unified/sc25519from32bytesc/1/C0/sc25519_from32bytes.o: unified/sc25519from32bytesc/1/C0/sc25519_from32bytes.c
	scripts/compile unified/sc25519from32bytesc/1/C0 sc25519_from32bytes c lib25519

unified/sc25519window4c/1/C0/sc25519_window4.o: unified/sc25519window4c/1/C0/sc25519_window4.c
	scripts/compile unified/sc25519window4c/1/C0 sc25519_window4 c lib25519

unified/fe25519getparityc/2/C1/fe25519_getparity.o: unified/fe25519getparityc/2/C1/fe25519_getparity.c
	scripts/compile unified/fe25519getparityc/2/C1 fe25519_getparity c lib25519

nG/merged25519/arm64-maa4-intmul/C1/ge25519_scalarmult_base.o: nG/merged25519/arm64-maa4-intmul/C1/ge25519_scalarmult_base.c
	scripts/compile nG/merged25519/arm64-maa4-intmul/C1 ge25519_scalarmult_base c lib25519

nG/merged25519/arm64-maa4-intmul/C1/nG.o: nG/merged25519/arm64-maa4-intmul/C1/nG.c
	scripts/compile nG/merged25519/arm64-maa4-intmul/C1 nG c lib25519

unified/sc25519from32bytesc/2/C1/sc25519_from32bytes.o: unified/sc25519from32bytesc/2/C1/sc25519_from32bytes.c
	scripts/compile unified/sc25519from32bytesc/2/C1 sc25519_from32bytes c lib25519

unified/sc25519window4c/2/C1/sc25519_window4.o: unified/sc25519window4c/2/C1/sc25519_window4.c
	scripts/compile unified/sc25519window4c/2/C1 sc25519_window4 c lib25519

nG/merged25519/arm64-maa4-redmul/shared/ge25519_base.o: nG/merged25519/arm64-maa4-redmul/shared/ge25519_base.S
	scripts/compile nG/merged25519/arm64-maa4-redmul/shared ge25519_base S lib25519

nG/merged25519/arm64-maa4-redmul/C0/ge25519_scalarmult_base.o: nG/merged25519/arm64-maa4-redmul/C0/ge25519_scalarmult_base.c
	scripts/compile nG/merged25519/arm64-maa4-redmul/C0 ge25519_scalarmult_base c lib25519

nG/merged25519/arm64-maa4-redmul/C0/nG.o: nG/merged25519/arm64-maa4-redmul/C0/nG.c
	scripts/compile nG/merged25519/arm64-maa4-redmul/C0 nG c lib25519

nG/merged25519/arm64-maa4-redmul/C1/ge25519_scalarmult_base.o: nG/merged25519/arm64-maa4-redmul/C1/ge25519_scalarmult_base.c
	scripts/compile nG/merged25519/arm64-maa4-redmul/C1 ge25519_scalarmult_base c lib25519

nG/merged25519/arm64-maa4-redmul/C1/nG.o: nG/merged25519/arm64-maa4-redmul/C1/nG.c
	scripts/compile nG/merged25519/arm64-maa4-redmul/C1 nG c lib25519

nG/merged25519/ref10/shared/shared-base.o: nG/merged25519/ref10/shared/shared-base.c
	scripts/compile nG/merged25519/ref10/shared shared-base c lib25519

unified/feaddc/1/C0/fe_add.o: unified/feaddc/1/C0/fe_add.c
	scripts/compile unified/feaddc/1/C0 fe_add c lib25519

unified/fecopyc/1/C0/fe_copy.o: unified/fecopyc/1/C0/fe_copy.c
	scripts/compile unified/fecopyc/1/C0 fe_copy c lib25519

unified/fefrombytesc/3/C0/fe_frombytes.o: unified/fefrombytesc/3/C0/fe_frombytes.c
	scripts/compile unified/fefrombytesc/3/C0 fe_frombytes c lib25519

unified/feinvertc/1/C0/fe_invert.o: unified/feinvertc/1/C0/fe_invert.c
	scripts/compile unified/feinvertc/1/C0 fe_invert c lib25519

unified/feisnegativec/1/C0/fe_isnegative.o: unified/feisnegativec/1/C0/fe_isnegative.c
	scripts/compile unified/feisnegativec/1/C0 fe_isnegative c lib25519

unified/femulc/3/C0/fe_mul.o: unified/femulc/3/C0/fe_mul.c
	scripts/compile unified/femulc/3/C0 fe_mul c lib25519

unified/fenegc/1/C0/fe_neg.o: unified/fenegc/1/C0/fe_neg.c
	scripts/compile unified/fenegc/1/C0 fe_neg c lib25519

unified/fesqc/3/C0/fe_sq.o: unified/fesqc/3/C0/fe_sq.c
	scripts/compile unified/fesqc/3/C0 fe_sq c lib25519

unified/fesq2c/1/C0/fe_sq2.o: unified/fesq2c/1/C0/fe_sq2.c
	scripts/compile unified/fesq2c/1/C0 fe_sq2 c lib25519

unified/fesubc/1/C0/fe_sub.o: unified/fesubc/1/C0/fe_sub.c
	scripts/compile unified/fesubc/1/C0 fe_sub c lib25519

unified/fetobytesc/3/C0/fe_tobytes.o: unified/fetobytesc/3/C0/fe_tobytes.c
	scripts/compile unified/fetobytesc/3/C0 fe_tobytes c lib25519

unified/gemaddc/1/C0/ge_madd.o: unified/gemaddc/1/C0/ge_madd.c
	scripts/compile unified/gemaddc/1/C0 ge_madd c lib25519

unified/gep1p1top2c/1/C0/ge_p1p1_to_p2.o: unified/gep1p1top2c/1/C0/ge_p1p1_to_p2.c
	scripts/compile unified/gep1p1top2c/1/C0 ge_p1p1_to_p2 c lib25519

unified/gep1p1top3c/1/C0/ge_p1p1_to_p3.o: unified/gep1p1top3c/1/C0/ge_p1p1_to_p3.c
	scripts/compile unified/gep1p1top3c/1/C0 ge_p1p1_to_p3 c lib25519

unified/gep2dblc/1/C0/ge_p2_dbl.o: unified/gep2dblc/1/C0/ge_p2_dbl.c
	scripts/compile unified/gep2dblc/1/C0 ge_p2_dbl c lib25519

nG/merged25519/ref10/C0/ge_p3_0.o: nG/merged25519/ref10/C0/ge_p3_0.c
	scripts/compile nG/merged25519/ref10/C0 ge_p3_0 c lib25519

unified/gep3dblc/1/C0/ge_p3_dbl.o: unified/gep3dblc/1/C0/ge_p3_dbl.c
	scripts/compile unified/gep3dblc/1/C0 ge_p3_dbl c lib25519

unified/gep3top2c/1/C0/ge_p3_to_p2.o: unified/gep3top2c/1/C0/ge_p3_to_p2.c
	scripts/compile unified/gep3top2c/1/C0 ge_p3_to_p2 c lib25519

nG/merged25519/ref10/C0/ge_precomp_0.o: nG/merged25519/ref10/C0/ge_precomp_0.c
	scripts/compile nG/merged25519/ref10/C0 ge_precomp_0 c lib25519

nG/merged25519/ref10/C0/ge_scalarmult_base.o: nG/merged25519/ref10/C0/ge_scalarmult_base.c
	scripts/compile nG/merged25519/ref10/C0 ge_scalarmult_base c lib25519

nG/merged25519/ref10/C0/nG.o: nG/merged25519/ref10/C0/nG.c
	scripts/compile nG/merged25519/ref10/C0 nG c lib25519

unified/feaddc/2/C1/fe_add.o: unified/feaddc/2/C1/fe_add.c
	scripts/compile unified/feaddc/2/C1 fe_add c lib25519

unified/fecopyc/2/C1/fe_copy.o: unified/fecopyc/2/C1/fe_copy.c
	scripts/compile unified/fecopyc/2/C1 fe_copy c lib25519

unified/fefrombytesc/4/C1/fe_frombytes.o: unified/fefrombytesc/4/C1/fe_frombytes.c
	scripts/compile unified/fefrombytesc/4/C1 fe_frombytes c lib25519

unified/feinvertc/2/C1/fe_invert.o: unified/feinvertc/2/C1/fe_invert.c
	scripts/compile unified/feinvertc/2/C1 fe_invert c lib25519

unified/feisnegativec/2/C1/fe_isnegative.o: unified/feisnegativec/2/C1/fe_isnegative.c
	scripts/compile unified/feisnegativec/2/C1 fe_isnegative c lib25519

unified/femulc/4/C1/fe_mul.o: unified/femulc/4/C1/fe_mul.c
	scripts/compile unified/femulc/4/C1 fe_mul c lib25519

unified/fenegc/2/C1/fe_neg.o: unified/fenegc/2/C1/fe_neg.c
	scripts/compile unified/fenegc/2/C1 fe_neg c lib25519

unified/fesqc/4/C1/fe_sq.o: unified/fesqc/4/C1/fe_sq.c
	scripts/compile unified/fesqc/4/C1 fe_sq c lib25519

unified/fesq2c/2/C1/fe_sq2.o: unified/fesq2c/2/C1/fe_sq2.c
	scripts/compile unified/fesq2c/2/C1 fe_sq2 c lib25519

unified/fesubc/2/C1/fe_sub.o: unified/fesubc/2/C1/fe_sub.c
	scripts/compile unified/fesubc/2/C1 fe_sub c lib25519

unified/fetobytesc/4/C1/fe_tobytes.o: unified/fetobytesc/4/C1/fe_tobytes.c
	scripts/compile unified/fetobytesc/4/C1 fe_tobytes c lib25519

unified/gemaddc/2/C1/ge_madd.o: unified/gemaddc/2/C1/ge_madd.c
	scripts/compile unified/gemaddc/2/C1 ge_madd c lib25519

unified/gep1p1top2c/2/C1/ge_p1p1_to_p2.o: unified/gep1p1top2c/2/C1/ge_p1p1_to_p2.c
	scripts/compile unified/gep1p1top2c/2/C1 ge_p1p1_to_p2 c lib25519

unified/gep1p1top3c/2/C1/ge_p1p1_to_p3.o: unified/gep1p1top3c/2/C1/ge_p1p1_to_p3.c
	scripts/compile unified/gep1p1top3c/2/C1 ge_p1p1_to_p3 c lib25519

unified/gep2dblc/2/C1/ge_p2_dbl.o: unified/gep2dblc/2/C1/ge_p2_dbl.c
	scripts/compile unified/gep2dblc/2/C1 ge_p2_dbl c lib25519

nG/merged25519/ref10/C1/ge_p3_0.o: nG/merged25519/ref10/C1/ge_p3_0.c
	scripts/compile nG/merged25519/ref10/C1 ge_p3_0 c lib25519

unified/gep3dblc/2/C1/ge_p3_dbl.o: unified/gep3dblc/2/C1/ge_p3_dbl.c
	scripts/compile unified/gep3dblc/2/C1 ge_p3_dbl c lib25519

unified/gep3top2c/2/C1/ge_p3_to_p2.o: unified/gep3top2c/2/C1/ge_p3_to_p2.c
	scripts/compile unified/gep3top2c/2/C1 ge_p3_to_p2 c lib25519

nG/merged25519/ref10/C1/ge_precomp_0.o: nG/merged25519/ref10/C1/ge_precomp_0.c
	scripts/compile nG/merged25519/ref10/C1 ge_precomp_0 c lib25519

nG/merged25519/ref10/C1/ge_scalarmult_base.o: nG/merged25519/ref10/C1/ge_scalarmult_base.c
	scripts/compile nG/merged25519/ref10/C1 ge_scalarmult_base c lib25519

nG/merged25519/ref10/C1/nG.o: nG/merged25519/ref10/C1/nG.c
	scripts/compile nG/merged25519/ref10/C1 nG c lib25519

nG/montgomery25519/ref/C0/base.o: nG/montgomery25519/ref/C0/base.c
	scripts/compile nG/montgomery25519/ref/C0 base c lib25519

nG/montgomery25519/ref/C1/base.o: nG/montgomery25519/ref/C1/base.c
	scripts/compile nG/montgomery25519/ref/C1 base c lib25519

nG/montgomery25519/usemerged/C0/base.o: nG/montgomery25519/usemerged/C0/base.c
	scripts/compile nG/montgomery25519/usemerged/C0 base c lib25519

nG/montgomery25519/usemerged/C1/base.o: nG/montgomery25519/usemerged/C1/base.c
	scripts/compile nG/montgomery25519/usemerged/C1 base c lib25519

unified/ge25519doublescalarmultprecomputeS/1/shared/ge25519_double_scalarmult_precompute.o: unified/ge25519doublescalarmultprecomputeS/1/shared/ge25519_double_scalarmult_precompute.S
	scripts/compile unified/ge25519doublescalarmultprecomputeS/1/shared ge25519_double_scalarmult_precompute S lib25519

mGnP/ed25519/arm64-maa4-intmul/shared/ge25519_double_scalarmult_process.o: mGnP/ed25519/arm64-maa4-intmul/shared/ge25519_double_scalarmult_process.S
	scripts/compile mGnP/ed25519/arm64-maa4-intmul/shared ge25519_double_scalarmult_process S lib25519

unified/sc25519barrettS/1/shared/sc25519_barrett.o: unified/sc25519barrettS/1/shared/sc25519_barrett.S
	scripts/compile unified/sc25519barrettS/1/shared sc25519_barrett S lib25519

mGnP/ed25519/arm64-maa4-intmul/shared/shared-data.o: mGnP/ed25519/arm64-maa4-intmul/shared/shared-data.c
	scripts/compile mGnP/ed25519/arm64-maa4-intmul/shared shared-data c lib25519

unified/fe25519iseqc/1/C0/fe25519_iseq.o: unified/fe25519iseqc/1/C0/fe25519_iseq.c
	scripts/compile unified/fe25519iseqc/1/C0 fe25519_iseq c lib25519

unified/fe25519pow2523c/1/C0/fe25519_pow2523.o: unified/fe25519pow2523c/1/C0/fe25519_pow2523.c
	scripts/compile unified/fe25519pow2523c/1/C0 fe25519_pow2523 c lib25519

unified/fe25519setintc/1/C0/fe25519_setint.o: unified/fe25519setintc/1/C0/fe25519_setint.c
	scripts/compile unified/fe25519setintc/1/C0 fe25519_setint c lib25519

mGnP/ed25519/arm64-maa4-intmul/C0/ge25519_pack.o: mGnP/ed25519/arm64-maa4-intmul/C0/ge25519_pack.c
	scripts/compile mGnP/ed25519/arm64-maa4-intmul/C0 ge25519_pack c lib25519

mGnP/ed25519/arm64-maa4-intmul/C0/ge25519_unpackneg.o: mGnP/ed25519/arm64-maa4-intmul/C0/ge25519_unpackneg.c
	scripts/compile mGnP/ed25519/arm64-maa4-intmul/C0 ge25519_unpackneg c lib25519

mGnP/ed25519/arm64-maa4-intmul/C0/mGnP.o: mGnP/ed25519/arm64-maa4-intmul/C0/mGnP.c
	scripts/compile mGnP/ed25519/arm64-maa4-intmul/C0 mGnP c lib25519

unified/sc25519from64bytesc/1/C0/sc25519_from64bytes.o: unified/sc25519from64bytesc/1/C0/sc25519_from64bytes.c
	scripts/compile unified/sc25519from64bytesc/1/C0 sc25519_from64bytes c lib25519

unified/sc25519slidec/1/C0/sc25519_slide.o: unified/sc25519slidec/1/C0/sc25519_slide.c
	scripts/compile unified/sc25519slidec/1/C0 sc25519_slide c lib25519

unified/sc25519to32bytesc/1/C0/sc25519_to32bytes.o: unified/sc25519to32bytesc/1/C0/sc25519_to32bytes.c
	scripts/compile unified/sc25519to32bytesc/1/C0 sc25519_to32bytes c lib25519

unified/fe25519iseqc/2/C1/fe25519_iseq.o: unified/fe25519iseqc/2/C1/fe25519_iseq.c
	scripts/compile unified/fe25519iseqc/2/C1 fe25519_iseq c lib25519

unified/fe25519pow2523c/2/C1/fe25519_pow2523.o: unified/fe25519pow2523c/2/C1/fe25519_pow2523.c
	scripts/compile unified/fe25519pow2523c/2/C1 fe25519_pow2523 c lib25519

unified/fe25519setintc/2/C1/fe25519_setint.o: unified/fe25519setintc/2/C1/fe25519_setint.c
	scripts/compile unified/fe25519setintc/2/C1 fe25519_setint c lib25519

mGnP/ed25519/arm64-maa4-intmul/C1/ge25519_pack.o: mGnP/ed25519/arm64-maa4-intmul/C1/ge25519_pack.c
	scripts/compile mGnP/ed25519/arm64-maa4-intmul/C1 ge25519_pack c lib25519

mGnP/ed25519/arm64-maa4-intmul/C1/ge25519_unpackneg.o: mGnP/ed25519/arm64-maa4-intmul/C1/ge25519_unpackneg.c
	scripts/compile mGnP/ed25519/arm64-maa4-intmul/C1 ge25519_unpackneg c lib25519

mGnP/ed25519/arm64-maa4-intmul/C1/mGnP.o: mGnP/ed25519/arm64-maa4-intmul/C1/mGnP.c
	scripts/compile mGnP/ed25519/arm64-maa4-intmul/C1 mGnP c lib25519

unified/sc25519from64bytesc/2/C1/sc25519_from64bytes.o: unified/sc25519from64bytesc/2/C1/sc25519_from64bytes.c
	scripts/compile unified/sc25519from64bytesc/2/C1 sc25519_from64bytes c lib25519

unified/sc25519slidec/2/C1/sc25519_slide.o: unified/sc25519slidec/2/C1/sc25519_slide.c
	scripts/compile unified/sc25519slidec/2/C1 sc25519_slide c lib25519

unified/sc25519to32bytesc/2/C1/sc25519_to32bytes.o: unified/sc25519to32bytesc/2/C1/sc25519_to32bytes.c
	scripts/compile unified/sc25519to32bytesc/2/C1 sc25519_to32bytes c lib25519

unified/ge25519doublescalarmultprecomputeS/2/shared/ge25519_double_scalarmult_precompute.o: unified/ge25519doublescalarmultprecomputeS/2/shared/ge25519_double_scalarmult_precompute.S
	scripts/compile unified/ge25519doublescalarmultprecomputeS/2/shared ge25519_double_scalarmult_precompute S lib25519

mGnP/ed25519/arm64-maa4-redmul/shared/ge25519_double_scalarmult_process.o: mGnP/ed25519/arm64-maa4-redmul/shared/ge25519_double_scalarmult_process.S
	scripts/compile mGnP/ed25519/arm64-maa4-redmul/shared ge25519_double_scalarmult_process S lib25519

mGnP/ed25519/arm64-maa4-redmul/shared/shared-data.o: mGnP/ed25519/arm64-maa4-redmul/shared/shared-data.c
	scripts/compile mGnP/ed25519/arm64-maa4-redmul/shared shared-data c lib25519

unified/fe25519pow2523c/3/C0/fe25519_pow2523.o: unified/fe25519pow2523c/3/C0/fe25519_pow2523.c
	scripts/compile unified/fe25519pow2523c/3/C0 fe25519_pow2523 c lib25519

mGnP/ed25519/arm64-maa4-redmul/C0/ge25519_pack.o: mGnP/ed25519/arm64-maa4-redmul/C0/ge25519_pack.c
	scripts/compile mGnP/ed25519/arm64-maa4-redmul/C0 ge25519_pack c lib25519

mGnP/ed25519/arm64-maa4-redmul/C0/ge25519_unpackneg.o: mGnP/ed25519/arm64-maa4-redmul/C0/ge25519_unpackneg.c
	scripts/compile mGnP/ed25519/arm64-maa4-redmul/C0 ge25519_unpackneg c lib25519

mGnP/ed25519/arm64-maa4-redmul/C0/mGnP.o: mGnP/ed25519/arm64-maa4-redmul/C0/mGnP.c
	scripts/compile mGnP/ed25519/arm64-maa4-redmul/C0 mGnP c lib25519

unified/fe25519pow2523c/4/C1/fe25519_pow2523.o: unified/fe25519pow2523c/4/C1/fe25519_pow2523.c
	scripts/compile unified/fe25519pow2523c/4/C1 fe25519_pow2523 c lib25519

mGnP/ed25519/arm64-maa4-redmul/C1/ge25519_pack.o: mGnP/ed25519/arm64-maa4-redmul/C1/ge25519_pack.c
	scripts/compile mGnP/ed25519/arm64-maa4-redmul/C1 ge25519_pack c lib25519

mGnP/ed25519/arm64-maa4-redmul/C1/ge25519_unpackneg.o: mGnP/ed25519/arm64-maa4-redmul/C1/ge25519_unpackneg.c
	scripts/compile mGnP/ed25519/arm64-maa4-redmul/C1 ge25519_unpackneg c lib25519

mGnP/ed25519/arm64-maa4-redmul/C1/mGnP.o: mGnP/ed25519/arm64-maa4-redmul/C1/mGnP.c
	scripts/compile mGnP/ed25519/arm64-maa4-redmul/C1 mGnP c lib25519

mGnP/ed25519/ref10/shared/shared-Bi.o: mGnP/ed25519/ref10/shared/shared-Bi.c
	scripts/compile mGnP/ed25519/ref10/shared shared-Bi c lib25519

unified/feisnonzeroc/1/C0/fe_isnonzero.o: unified/feisnonzeroc/1/C0/fe_isnonzero.c
	scripts/compile unified/feisnonzeroc/1/C0 fe_isnonzero c lib25519

unified/fepow22523c/1/C0/fe_pow22523.o: unified/fepow22523c/1/C0/fe_pow22523.c
	scripts/compile unified/fepow22523c/1/C0 fe_pow22523 c lib25519

unified/geaddc/1/C0/ge_add.o: unified/geaddc/1/C0/ge_add.c
	scripts/compile unified/geaddc/1/C0 ge_add c lib25519

mGnP/ed25519/ref10/C0/ge_double_scalarmult.o: mGnP/ed25519/ref10/C0/ge_double_scalarmult.c
	scripts/compile mGnP/ed25519/ref10/C0 ge_double_scalarmult c lib25519

mGnP/ed25519/ref10/C0/ge_frombytes.o: mGnP/ed25519/ref10/C0/ge_frombytes.c
	scripts/compile mGnP/ed25519/ref10/C0 ge_frombytes c lib25519

mGnP/ed25519/ref10/C0/ge_msub.o: mGnP/ed25519/ref10/C0/ge_msub.c
	scripts/compile mGnP/ed25519/ref10/C0 ge_msub c lib25519

mGnP/ed25519/ref10/C0/ge_p2_0.o: mGnP/ed25519/ref10/C0/ge_p2_0.c
	scripts/compile mGnP/ed25519/ref10/C0 ge_p2_0 c lib25519

unified/gep3tocachedc/1/C0/ge_p3_to_cached.o: unified/gep3tocachedc/1/C0/ge_p3_to_cached.c
	scripts/compile unified/gep3tocachedc/1/C0 ge_p3_to_cached c lib25519

unified/gesubc/1/C0/ge_sub.o: unified/gesubc/1/C0/ge_sub.c
	scripts/compile unified/gesubc/1/C0 ge_sub c lib25519

unified/getobytesc/1/C0/ge_tobytes.o: unified/getobytesc/1/C0/ge_tobytes.c
	scripts/compile unified/getobytesc/1/C0 ge_tobytes c lib25519

mGnP/ed25519/ref10/C0/mGnP.o: mGnP/ed25519/ref10/C0/mGnP.c
	scripts/compile mGnP/ed25519/ref10/C0 mGnP c lib25519

unified/screducec/1/C0/sc_reduce.o: unified/screducec/1/C0/sc_reduce.c
	scripts/compile unified/screducec/1/C0 sc_reduce c lib25519

unified/feisnonzeroc/2/C1/fe_isnonzero.o: unified/feisnonzeroc/2/C1/fe_isnonzero.c
	scripts/compile unified/feisnonzeroc/2/C1 fe_isnonzero c lib25519

unified/fepow22523c/2/C1/fe_pow22523.o: unified/fepow22523c/2/C1/fe_pow22523.c
	scripts/compile unified/fepow22523c/2/C1 fe_pow22523 c lib25519

unified/geaddc/2/C1/ge_add.o: unified/geaddc/2/C1/ge_add.c
	scripts/compile unified/geaddc/2/C1 ge_add c lib25519

mGnP/ed25519/ref10/C1/ge_double_scalarmult.o: mGnP/ed25519/ref10/C1/ge_double_scalarmult.c
	scripts/compile mGnP/ed25519/ref10/C1 ge_double_scalarmult c lib25519

mGnP/ed25519/ref10/C1/ge_frombytes.o: mGnP/ed25519/ref10/C1/ge_frombytes.c
	scripts/compile mGnP/ed25519/ref10/C1 ge_frombytes c lib25519

mGnP/ed25519/ref10/C1/ge_msub.o: mGnP/ed25519/ref10/C1/ge_msub.c
	scripts/compile mGnP/ed25519/ref10/C1 ge_msub c lib25519

mGnP/ed25519/ref10/C1/ge_p2_0.o: mGnP/ed25519/ref10/C1/ge_p2_0.c
	scripts/compile mGnP/ed25519/ref10/C1 ge_p2_0 c lib25519

unified/gep3tocachedc/2/C1/ge_p3_to_cached.o: unified/gep3tocachedc/2/C1/ge_p3_to_cached.c
	scripts/compile unified/gep3tocachedc/2/C1 ge_p3_to_cached c lib25519

unified/gesubc/2/C1/ge_sub.o: unified/gesubc/2/C1/ge_sub.c
	scripts/compile unified/gesubc/2/C1 ge_sub c lib25519

unified/getobytesc/2/C1/ge_tobytes.o: unified/getobytesc/2/C1/ge_tobytes.c
	scripts/compile unified/getobytesc/2/C1 ge_tobytes c lib25519

mGnP/ed25519/ref10/C1/mGnP.o: mGnP/ed25519/ref10/C1/mGnP.c
	scripts/compile mGnP/ed25519/ref10/C1 mGnP c lib25519

unified/screducec/2/C1/sc_reduce.o: unified/screducec/2/C1/sc_reduce.c
	scripts/compile unified/screducec/2/C1 sc_reduce c lib25519

multiscalar/ed25519/arm64-maa4-intmul/shared/ge25519_multi_scalarmult_process.o: multiscalar/ed25519/arm64-maa4-intmul/shared/ge25519_multi_scalarmult_process.S
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul/shared ge25519_multi_scalarmult_process S lib25519

multiscalar/ed25519/arm64-maa4-intmul/shared/ge25519_p1p1_to_p2.o: multiscalar/ed25519/arm64-maa4-intmul/shared/ge25519_p1p1_to_p2.S
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul/shared ge25519_p1p1_to_p2 S lib25519

multiscalar/ed25519/arm64-maa4-intmul/C0/ge25519_pack.o: multiscalar/ed25519/arm64-maa4-intmul/C0/ge25519_pack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul/C0 ge25519_pack c lib25519

multiscalar/ed25519/arm64-maa4-intmul/C0/ge25519_unpack.o: multiscalar/ed25519/arm64-maa4-intmul/C0/ge25519_unpack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul/C0 ge25519_unpack c lib25519

multiscalar/ed25519/arm64-maa4-intmul/C0/multiscalar.o: multiscalar/ed25519/arm64-maa4-intmul/C0/multiscalar.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul/C0 multiscalar c lib25519

multiscalar/ed25519/arm64-maa4-intmul/C1/ge25519_pack.o: multiscalar/ed25519/arm64-maa4-intmul/C1/ge25519_pack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul/C1 ge25519_pack c lib25519

multiscalar/ed25519/arm64-maa4-intmul/C1/ge25519_unpack.o: multiscalar/ed25519/arm64-maa4-intmul/C1/ge25519_unpack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul/C1 ge25519_unpack c lib25519

multiscalar/ed25519/arm64-maa4-intmul/C1/multiscalar.o: multiscalar/ed25519/arm64-maa4-intmul/C1/multiscalar.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul/C1 multiscalar c lib25519

multiscalar/ed25519/arm64-maa4-intmul-p3/shared/ge25519_multi_scalarmult_precompute.o: multiscalar/ed25519/arm64-maa4-intmul-p3/shared/ge25519_multi_scalarmult_precompute.S
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul-p3/shared ge25519_multi_scalarmult_precompute S lib25519

multiscalar/ed25519/arm64-maa4-intmul-p3/shared/ge25519_multi_scalarmult_process.o: multiscalar/ed25519/arm64-maa4-intmul-p3/shared/ge25519_multi_scalarmult_process.S
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul-p3/shared ge25519_multi_scalarmult_process S lib25519

multiscalar/ed25519/arm64-maa4-intmul-p3/C0/ge25519_pack.o: multiscalar/ed25519/arm64-maa4-intmul-p3/C0/ge25519_pack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul-p3/C0 ge25519_pack c lib25519

multiscalar/ed25519/arm64-maa4-intmul-p3/C0/ge25519_unpack.o: multiscalar/ed25519/arm64-maa4-intmul-p3/C0/ge25519_unpack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul-p3/C0 ge25519_unpack c lib25519

multiscalar/ed25519/arm64-maa4-intmul-p3/C0/multiscalar.o: multiscalar/ed25519/arm64-maa4-intmul-p3/C0/multiscalar.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul-p3/C0 multiscalar c lib25519

multiscalar/ed25519/arm64-maa4-intmul-p3/C1/ge25519_pack.o: multiscalar/ed25519/arm64-maa4-intmul-p3/C1/ge25519_pack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul-p3/C1 ge25519_pack c lib25519

multiscalar/ed25519/arm64-maa4-intmul-p3/C1/ge25519_unpack.o: multiscalar/ed25519/arm64-maa4-intmul-p3/C1/ge25519_unpack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul-p3/C1 ge25519_unpack c lib25519

multiscalar/ed25519/arm64-maa4-intmul-p3/C1/multiscalar.o: multiscalar/ed25519/arm64-maa4-intmul-p3/C1/multiscalar.c
	scripts/compile multiscalar/ed25519/arm64-maa4-intmul-p3/C1 multiscalar c lib25519

multiscalar/ed25519/arm64-maa4-redmul/shared/ge25519_multi_scalarmult_process.o: multiscalar/ed25519/arm64-maa4-redmul/shared/ge25519_multi_scalarmult_process.S
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul/shared ge25519_multi_scalarmult_process S lib25519

multiscalar/ed25519/arm64-maa4-redmul/shared/ge25519_p1p1_to_p2.o: multiscalar/ed25519/arm64-maa4-redmul/shared/ge25519_p1p1_to_p2.S
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul/shared ge25519_p1p1_to_p2 S lib25519

multiscalar/ed25519/arm64-maa4-redmul/C0/ge25519_pack.o: multiscalar/ed25519/arm64-maa4-redmul/C0/ge25519_pack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul/C0 ge25519_pack c lib25519

multiscalar/ed25519/arm64-maa4-redmul/C0/ge25519_unpack.o: multiscalar/ed25519/arm64-maa4-redmul/C0/ge25519_unpack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul/C0 ge25519_unpack c lib25519

multiscalar/ed25519/arm64-maa4-redmul/C0/multiscalar.o: multiscalar/ed25519/arm64-maa4-redmul/C0/multiscalar.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul/C0 multiscalar c lib25519

multiscalar/ed25519/arm64-maa4-redmul/C1/ge25519_pack.o: multiscalar/ed25519/arm64-maa4-redmul/C1/ge25519_pack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul/C1 ge25519_pack c lib25519

multiscalar/ed25519/arm64-maa4-redmul/C1/ge25519_unpack.o: multiscalar/ed25519/arm64-maa4-redmul/C1/ge25519_unpack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul/C1 ge25519_unpack c lib25519

multiscalar/ed25519/arm64-maa4-redmul/C1/multiscalar.o: multiscalar/ed25519/arm64-maa4-redmul/C1/multiscalar.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul/C1 multiscalar c lib25519

multiscalar/ed25519/arm64-maa4-redmul-p3/shared/ge25519_multi_scalarmult_precompute.o: multiscalar/ed25519/arm64-maa4-redmul-p3/shared/ge25519_multi_scalarmult_precompute.S
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul-p3/shared ge25519_multi_scalarmult_precompute S lib25519

multiscalar/ed25519/arm64-maa4-redmul-p3/shared/ge25519_multi_scalarmult_process.o: multiscalar/ed25519/arm64-maa4-redmul-p3/shared/ge25519_multi_scalarmult_process.S
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul-p3/shared ge25519_multi_scalarmult_process S lib25519

multiscalar/ed25519/arm64-maa4-redmul-p3/C0/ge25519_pack.o: multiscalar/ed25519/arm64-maa4-redmul-p3/C0/ge25519_pack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul-p3/C0 ge25519_pack c lib25519

multiscalar/ed25519/arm64-maa4-redmul-p3/C0/ge25519_unpack.o: multiscalar/ed25519/arm64-maa4-redmul-p3/C0/ge25519_unpack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul-p3/C0 ge25519_unpack c lib25519

multiscalar/ed25519/arm64-maa4-redmul-p3/C0/multiscalar.o: multiscalar/ed25519/arm64-maa4-redmul-p3/C0/multiscalar.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul-p3/C0 multiscalar c lib25519

multiscalar/ed25519/arm64-maa4-redmul-p3/C1/ge25519_pack.o: multiscalar/ed25519/arm64-maa4-redmul-p3/C1/ge25519_pack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul-p3/C1 ge25519_pack c lib25519

multiscalar/ed25519/arm64-maa4-redmul-p3/C1/ge25519_unpack.o: multiscalar/ed25519/arm64-maa4-redmul-p3/C1/ge25519_unpack.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul-p3/C1 ge25519_unpack c lib25519

multiscalar/ed25519/arm64-maa4-redmul-p3/C1/multiscalar.o: multiscalar/ed25519/arm64-maa4-redmul-p3/C1/multiscalar.c
	scripts/compile multiscalar/ed25519/arm64-maa4-redmul-p3/C1 multiscalar c lib25519

multiscalar/ed25519/ref10/C0/ge_frombytes.o: multiscalar/ed25519/ref10/C0/ge_frombytes.c
	scripts/compile multiscalar/ed25519/ref10/C0 ge_frombytes c lib25519

multiscalar/ed25519/ref10/C0/ge_p1p1_0.o: multiscalar/ed25519/ref10/C0/ge_p1p1_0.c
	scripts/compile multiscalar/ed25519/ref10/C0 ge_p1p1_0 c lib25519

multiscalar/ed25519/ref10/C0/multiscalar.o: multiscalar/ed25519/ref10/C0/multiscalar.c
	scripts/compile multiscalar/ed25519/ref10/C0 multiscalar c lib25519

multiscalar/ed25519/ref10/C0/sc_reduce.o: multiscalar/ed25519/ref10/C0/sc_reduce.c
	scripts/compile multiscalar/ed25519/ref10/C0 sc_reduce c lib25519

multiscalar/ed25519/ref10/C1/ge_frombytes.o: multiscalar/ed25519/ref10/C1/ge_frombytes.c
	scripts/compile multiscalar/ed25519/ref10/C1 ge_frombytes c lib25519

multiscalar/ed25519/ref10/C1/ge_p1p1_0.o: multiscalar/ed25519/ref10/C1/ge_p1p1_0.c
	scripts/compile multiscalar/ed25519/ref10/C1 ge_p1p1_0 c lib25519

multiscalar/ed25519/ref10/C1/multiscalar.o: multiscalar/ed25519/ref10/C1/multiscalar.c
	scripts/compile multiscalar/ed25519/ref10/C1 multiscalar c lib25519

multiscalar/ed25519/ref10/C1/sc_reduce.o: multiscalar/ed25519/ref10/C1/sc_reduce.c
	scripts/compile multiscalar/ed25519/ref10/C1 sc_reduce c lib25519

dh/x25519/wrapper/C0/dh.o: dh/x25519/wrapper/C0/dh.c
	scripts/compile dh/x25519/wrapper/C0 dh c lib25519

dh/x25519/wrapper/C0/keypair.o: dh/x25519/wrapper/C0/keypair.c
	scripts/compile dh/x25519/wrapper/C0 keypair c lib25519

dh/x25519/wrapper/C1/dh.o: dh/x25519/wrapper/C1/dh.c
	scripts/compile dh/x25519/wrapper/C1 dh c lib25519

dh/x25519/wrapper/C1/keypair.o: dh/x25519/wrapper/C1/keypair.c
	scripts/compile dh/x25519/wrapper/C1 keypair c lib25519

sign/ed25519/ref10/C0/keypair.o: sign/ed25519/ref10/C0/keypair.c
	scripts/compile sign/ed25519/ref10/C0 keypair c lib25519

sign/ed25519/ref10/C0/open.o: sign/ed25519/ref10/C0/open.c
	scripts/compile sign/ed25519/ref10/C0 open c lib25519

sign/ed25519/ref10/C0/sc_muladd.o: sign/ed25519/ref10/C0/sc_muladd.c
	scripts/compile sign/ed25519/ref10/C0 sc_muladd c lib25519

sign/ed25519/ref10/C0/sign.o: sign/ed25519/ref10/C0/sign.c
	scripts/compile sign/ed25519/ref10/C0 sign c lib25519

sign/ed25519/ref10/C1/keypair.o: sign/ed25519/ref10/C1/keypair.c
	scripts/compile sign/ed25519/ref10/C1 keypair c lib25519

sign/ed25519/ref10/C1/open.o: sign/ed25519/ref10/C1/open.c
	scripts/compile sign/ed25519/ref10/C1 open c lib25519

sign/ed25519/ref10/C1/sc_muladd.o: sign/ed25519/ref10/C1/sc_muladd.c
	scripts/compile sign/ed25519/ref10/C1 sc_muladd c lib25519

sign/ed25519/ref10/C1/sign.o: sign/ed25519/ref10/C1/sign.c
	scripts/compile sign/ed25519/ref10/C1 sign c lib25519

cpuid-all: cpuid/default.o
	touch cpuid-all

cpuid/default.o: cpuid/default.c
	scripts/compiledefault cpuid default c
