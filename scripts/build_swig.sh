#!/bin/bash

pushd $SRC_DIR

export SWIG_INSTALL_DIR=$INSTALL_DIR/swig-$SWIG_VERSION
export SWIG_EXECUTABLE=$SWIG_INSTALL_DIR/bin/swig

if [[ $BUILD_SWIG -eq 1 ]]
then
    # download tar 
    wget https://github.com/swig/swig/archive/refs/tags/v$SWIG_VERSION.tar.gz

    # extract source
    tar -xf v$SWIG_VERSION.tar.gz

    # delete tar
    rm v$SWIG_VERSION.tar.gz

    # create install directory 
    mkdir -p $SWIG_INSTALL_DIR
    echo $SWIG_INSTALL_DIR
    # build and install
    pushd swig-$SWIG_VERSION
    source autogen.sh # need automake for Mac (brew install automake)
    cd ..
    ./configure --prefix=$SWIG_INSTALL_DIR
    make -j 4
    make install
    popd
fi

popd
