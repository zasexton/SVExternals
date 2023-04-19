#!/bin/bash

pushd $SRC_DIR

VTK_MAJOR_VERSION=${VTK_VERSION%.*}
export VTK_INSTALL_DIR=$INSTALL_DIR/vtk-$VTK_VERSION
export VTK_CMAKE_DIR=$VTK_INSTALL_DIR/lib/cmake/vtk-$VTK_MAJOR_VERSION
if [[ $BUILD_VTK -eq 1 ]]
then
    # download tar 
    wget https://www.vtk.org/files/release/$VTK_MAJOR_VERSION/VTK-$VTK_VERSION.tar.gz

    # extract source
    tar -xf VTK-$VTK_VERSION.tar.gz

    # delete tar
    rm VTK-$VTK_VERSION.tar.gz

    # create install directory 
    mkdir -p $VTK_INSTALL_DIR

    pushd VTK-$VTK_VERSION
    mkdir build
    cd build

    cmake \
        -DCMAKE_INSTALL_PREFIX=$VTK_INSTALL_DIR \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=0 \
        -DBUILD_SHARED_LIBS=1 \
        -DVTK_WRAP_PYTHON=1 \
        -DVTK_QT_VERSION=5 \
        -DTCL_INCLUDE_PATH=$TCL_INSTALL_DIR/include \
        -DTCL_LIBRARY=$TCL_INSTALL_DIR/lib/$TCL_LIB_NAME \
        -DTCL_TCLSH=$TCL_INSTALL_DIR/bin/$TCL_EXE_NAME \
        -DPython3_EXECUTABLE:FILEPATH=$PYTHON_INSTALL_DIR/$PYTHON_EXECUTABLE \
        -DPython3_INCLUDE_DIR:FILEPATH=$PYTHON_INSTALL_DIR/$PYTHON_INCLUDE_DIR \
        -DPython3_LIBRARY:FILEPATH=$PYTHON_INSTALL_DIR/$PYTHON_LIBRARY \
        -DQt5Core_DIR=$QT_INSTALL_DIR/lib/cmake/Qt5Core \
        -DQt5Gui_DIR=$QT_INSTALL_DIR/lib/cmake/Qt5Gui \
        -DQt5OpenGL_DIR=$QT_INSTALL_DIR/lib/cmake/Qt5OpenGL \
        -DQt5Widgets_DIR=$QT_INSTALL_DIR/lib/cmake/Qt5Widgets \
        -DQt5_DIR=$QT_INSTALL_DIR/lib/cmake/Qt5 \
        -DVTK_MODULE_ENABLE_VTK_GUISupportQt=YES \
        -DVTK_MODULE_ENABLE_VTK_ViewsQt=YES \
        -DVTK_MODULE_ENABLE_VTK_RenderingQt=YES \
        -DVTK_MODULE_ENABLE_VTK_RenderingTk=YES \
        -DVTK_USE_TK=YES \
        ..

    make -j 4 
    make install
    popd
fi

popd
