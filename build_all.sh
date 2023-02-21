#!/bin/bash

# halt on error
set -e

source scripts/library_versions.sh

CUR_DIR=$(pwd)

# set directories
export SRC_DIR=$CUR_DIR'/src'
export INSTALL_DIR=$CUR_DIR'/install'
export PATCH_DIR=$CUR_DIR'/patches'

# create directories
mkdir -p $SRC_DIR
mkdir -p $INSTALL_DIR

# build tcl
mkdir -p output
#source scripts/build_tcl.sh > output/tcl.out
#source scripts/build_qt.sh > output/qt.out
#source scripts/build_hdf5.sh > output/hdf5.out
#source scripts/build_tinyxml2.sh > output/tinyxml2.out
#source scripts/build_python.sh > output/python.out
#source scripts/build_freetype.sh > output/freetype.out
#source scripts/build_swig.sh > output/swig.out
source scripts/build_mmg.sh > output/mmg.out
