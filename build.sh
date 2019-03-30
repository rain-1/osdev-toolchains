#!/bin/bash
set -e

source ./aux/versions.sh

function build_binutils {
	mkdir -p work/build/${TARGET}
	rm -rf "work/build/${TARGET}/build-binutils"
	mkdir -p "work/build/${TARGET}/build-binutils"
	pushd "work/build/${TARGET}/build-binutils"
	../../../extract/binutils-${BINUTILS_VERSION}/configure --target=${TARGET} --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
	make
	make install
	popd
}

function build_gcc {
	mkdir -p work/build/${TARGET}
	rm -rf "work/build/${TARGET}/build-gcc"
	mkdir -p "work/build/${TARGET}/build-gcc"
	pushd "work/build/${TARGET}/build-gcc"
	../../../extract/gcc-${GCC_VERSION}/configure --target=${TARGET} --prefix="$PREFIX" --disable-nls --enable-languages=c --without-headers
	make all-gcc
	make all-target-libgcc
	make install-gcc
	make install-target-libgcc
	popd
}

export PREFIX="$(pwd)/toolchains/"
#export PATH="$PREFIX/bin:$PATH"
export MAKEFLAGS="-j $(nproc --all)"

export TARGET=i686-elf
build_binutils
build_gcc

export TARGET=x86_64-elf
build_binutils
build_gcc
