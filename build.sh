#!/bin/bash
set -xuevo pipefail
SCRIPT_DIR="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
INSTALL_DIR="${INSTALL_DIR:-${SCRIPT_DIR}/install}"
pushd "$SCRIPT_DIR"
make -f ../Makefile.static -C cpython.git/ -j 4 PREFIX=${INSTALL_DIR} $*
./test.exe
popd
