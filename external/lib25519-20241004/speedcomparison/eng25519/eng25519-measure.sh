#!/bin/sh

# Prerequisites:
# * 64-bit CPU
# * Debian
# * packages: git wget build-essential cmake pkg-config flex byacc libexpat-dev
# * dedicated account to run this script
# * eng25519speed.c in the account's home directory

cd

export LD_LIBRARY_PATH="$HOME/lib"
export LIBRARY_PATH="$HOME/lib"
export CPATH="$HOME/include"
export PATH="$HOME/bin:$PATH"

[ -f $HOME/bin/cpucycles-info ] ||
(
  wget -m https://cpucycles.cr.yp.to/libcpucycles-latest-version.txt
  version=$(cat cpucycles.cr.yp.to/libcpucycles-latest-version.txt)
  wget -m https://cpucycles.cr.yp.to/libcpucycles-$version.tar.gz
  tar -xzf cpucycles.cr.yp.to/libcpucycles-$version.tar.gz
  cd libcpucycles-$version
  ./configure --prefix=$HOME && make -j8 install
)

[ -f $HOME/lib/libcrypto.so ] ||
(
  wget https://www.openssl.org/source/openssl-1.1.1q.tar.gz
  tar -xf openssl-1.1.1q.tar.gz
  cd openssl-1.1.1q
  ./config shared --prefix=$HOME --openssldir=$HOME
  make update
  make -j4
  make install_sw
)

[ -f $HOME/lib/eng25519.so ] ||
(
  git clone https://github.com/Ji-Peng/eng25519_artifact
  cd eng25519_artifact
  git checkout eeddcc3fa6b03849131d234b65f8f634a8d645d5
  cd ENG25519/eng25519
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -Dprovider="batch_fast_lib" -DCMAKE_PREFIX_PATH="$HOME" ..
  make && env DESTDIR=$HOME make install
  cp $HOME/$HOME/lib/engines-1.1/eng25519.so $HOME/lib/eng25519.so
)

gcc -o eng25519speed eng25519speed.c \
-O3 -I include \
-I eng25519_artifact/ENG25519/eng25519/providers/batch_fast_lib/x25519_batch_avx512ifma \
-I eng25519_artifact/ENG25519/eng25519/providers/batch_fast_lib/x25519_fast_avx512f \
-I eng25519_artifact/ENG25519/eng25519/providers/batch_fast_lib/ed25519_fast_avx512ifma \
lib/eng25519.so lib/libcrypto.so lib/libcpucycles.so

./eng25519speed > eng25519speed.out
