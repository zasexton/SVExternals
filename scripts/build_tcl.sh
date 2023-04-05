#!/bin/bash

pushd $SRC_DIR


TCL_MAJOR_VERSION=${TCL_VERSION%.*}

#this is needed to link vtk to TCL
export TCL_LIB_NAME=libtcl$TCL_MAJOR_VERSION.so
export TCL_EXE_NAME=tclsh$TCL_MAJOR_VERSION
export TCL_INSTALL_DIR=$INSTALL_DIR/tcl-$TCL_VERSION

if [[ $BUILD_TCL -eq 1 ]]
then
    # download tar 
    wget  https://sourceforge.net/projects/tcl/files/Tcl/$TCL_VERSION/tcl$TCL_VERSION-src.tar.gz

    # extract source
    tar -xf tcl$TCL_VERSION-src.tar.gz

    # delete tar
    rm tcl$TCL_VERSION-src.tar.gz

    # create install directory 
    export TCL_INSTALL_DIR=$INSTALL_DIR/tcl-$TCL_VERSION
    mkdir -p $TCL_INSTALL_DIR

    # build and install
    pushd tcl$TCL_VERSION/unix
    ./configure --prefix=$TCL_INSTALL_DIR
    make -j 2 install
    popd
fi

popd