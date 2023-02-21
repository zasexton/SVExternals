#!/bin/bash

pushd $SRC_DIR

# download tar 
wget https://github.com/malaterre/GDCM/archive/refs/tags/v$GDCM_VERSION.tar.gz

# extract source
tar -xf v$GDCM_VERSION.tar.gz

# delete tar
rm v$GDCM_VERSION.tar.gz

# create install directory 
export GDCM_INSTALL_DIR=$INSTALL_DIR/gdcm-$GDCM_VERSION
mkdir -p $GDCM_INSTALL_DIR
echo $GDCM_INSTALL_DIR
# build and install
pushd gdcm-$GDCM_VERSION
patch -p1 < $PATCH_DIR/gdcm-$GDCM_VERSION-clang.patch
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=$GDCM_INSTALL_DIR ..
make -j 4 && make install
popd

popd
