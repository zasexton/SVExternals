#!/bin/bash

pushd $SRC_DIR

# download tar 
wget  https://sourceforge.net/projects/tcl/files/Tcl/$TCL_VERSION/tcl$TCL_VERSION-src.tar.gz

# extract source
tar -xvf tcl$TCL_VERSION-src.tar.gz

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

popd