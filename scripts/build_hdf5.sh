#!/bin/bash

pushd $SRC_DIR

export HDF5_INSTALL_DIR=$INSTALL_DIR/hdf5-$HDF5_VERSION

if [[ $BUILD_HDF5 -eq 1 ]]
then
# download tar 
    HDF5_VERSION_="${HDF5_VERSION//./_}"
    echo $HDF5_VERSION_
    wget https://github.com/HDFGroup/hdf5/archive/refs/tags/hdf5-$HDF5_VERSION_.tar.gz

    # extract source
    tar -xf hdf5-$HDF5_VERSION_.tar.gz

    # delete tar
    rm hdf5-$HDF5_VERSION_.tar.gz
    mv hdf5-hdf5-$HDF5_VERSION_ hdf5-$HDF5_VERSION

    # create install directory 
    mkdir -p $HDF5_INSTALL_DIR

    # build and install
    pushd hdf5-$HDF5_VERSION
    ./configure --prefix=$HDF5_INSTALL_DIR
    make -j 4
    make install
    popd
fi

popd
