#!/bin/bash

# halt on error
set -e

source scripts/library_versions.sh

CUR_DIR=$(pwd)

# set directories
export SRC_DIR=$CUR_DIR'/src'
export INSTALL_DIR=$CUR_DIR'/install'

# create directories
mkdir -p $SRC_DIR
mkdir -p $INSTALL_DIR

# build tcl
mkdir -p output
source scripts/build_tcl.sh > output/tcl.out