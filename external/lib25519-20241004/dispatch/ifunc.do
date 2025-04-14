#!/bin/sh

echo 0 > dispatch/ifunc

grep 1 dispatch/tryifunc >/dev/null || exit 0
scripts/cdcompile dispatch -c ifunc-test.c || exit 0

scripts/cdcompile dispatch -print-prog-name=readelf > dispatch/readelf1 || exit 0
( echo '#!/bin/sh'
  tr -d '\012' < dispatch/readelf1
  echo ' "$@"'
) > dispatch/readelf
chmod 755 dispatch/readelf

scripts/cdcompile dispatch -c ifunc-test.c || exit 0

dispatch/readelf -s dispatch/ifunc-test.o > dispatch/ifunc-test.o.symbols || exit 0
grep 'IFUNC.*xyzzy_wrapper' dispatch/ifunc-test.o.symbols >/dev/null || exit 0

echo 1 > dispatch/ifunc
