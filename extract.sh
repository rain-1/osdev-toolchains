#!/bin/bash
set -e

source ./aux/versions.sh

mkdir -p ./work/extract/
pushd ./work/extract/
tar -xvf "../download/binutils-${BINUTILS_VERSION}.tar.xz"
tar -xvf "../download/gcc-${GCC_VERSION}.tar.xz"
popd
