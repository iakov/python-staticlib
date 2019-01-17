#!/bin/bash
set -xuevo pipefail
SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})
pushd $SCRIPT_DIR
make -f ../Makefile.static -C cpython.git/ -j 4 
popd
