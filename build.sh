#!/bin/bash
set -xuevo pipefail
SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
INSTALL_DIR="${INSTALL_DIR:-${SCRIPT_DIR}/install}"
pushd "$SCRIPT_DIR"
make -f ../Makefile.static -C cpython.git/ -j 4 PREFIX=${INSTALL_DIR} $*
export PKG_CONFIG_PATH="${INSTALL_DIR}/lib/pkgconfig"
gcc test.c -o test.exe $(pkg-config --cflags python-3.8) $(pkg-config --libs --static python-3.8)
./test.exe
popd
