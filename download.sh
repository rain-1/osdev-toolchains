#!/bin/bash
set -e

source ./aux/versions.sh

mkdir -p ./work/download/
pushd ./work/download/
wget -nc https://ftp.gnu.org/gnu/binutils/binutils-${BINUTILS_VERSION}.tar.xz
wget -nc https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.xz
popd

# sha256sum release/* > ./aux/sha256sums.txt
sha256sum -c ./aux/sha256sums.txt
