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

# 
BUILD_TCL=0
BUILD_QT=1
BUILD_HDF5=0
BUILD_TINYXML2=0
BUILD_PYTHON=0
BUILD_FREETYPE=0
BUILD_SWIG=0
BUILD_MMG=0
BUILD_GDCM=0
BUILD_VTK=0
BUILD_ITK=0
BUILD_OPENCASCADE=0
BUILD_MITK=1

# build libraries. Even if the bool above are 0, we enter the scripts
# as they set relevant env variables
mkdir -p output
source scripts/build_tcl.sh > output/tcl.out
source scripts/build_qt.sh # > output/qt.out
source scripts/build_hdf5.sh > output/hdf5.out
source scripts/build_tinyxml2.sh > output/tinyxml2.out
source scripts/build_python.sh > output/python.out
source scripts/build_freetype.sh > output/freetype.out
source scripts/build_swig.sh > output/swig.out
source scripts/build_mmg.sh > output/mmg.out
source scripts/build_gdcm.sh > output/gdcm.out
source scripts/build_vtk.sh > output/vtk.out
source scripts/build_itk.sh > output/itk.out
source scripts/build_opencascade.sh > output/opencascade.out
source scripts/build_mitk.sh # > output/mitk.out