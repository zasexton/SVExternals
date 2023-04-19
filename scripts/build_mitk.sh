#!/bin/bash

pushd $SRC_DIR

export MITK_INSTALL_DIR=$INSTALL_DIR/mitk-$MITK_VERSION

if [[ $BUILD_MITK -eq 1 ]]
then
    # download tar 
    wget https://github.com/MITK/MITK/archive/refs/tags/v$MITK_VERSION.tar.gz

    # extract source
    tar -xf v$MITK_VERSION.tar.gz
    
    # delete tar
    rm v$MITK_VERSION.tar.gz

    # create install directory 
    mkdir -p $MITK_INSTALL_DIR

    pushd MITK-$MITK_VERSION
    rm -r build
    mkdir build
    cd build

    # removed flags
    # -DMITK_PYTHON_SITE_DIR:PATH=REPLACEME_SV_TOP_BLD_DIR_MITK/ep/lib/pythonREPLACEME_SV_PYTHON_MAJOR_VERSION.REPLACEME_SV_PYTHON_MINOR_VERSION/site-packages \
    # REPLACEME_CMAKE_C_COMPILER \
    # REPLACEME_CMAKE_CXX_COMPILER \
    # -DQt5Script_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5Script \

    cmake \
        -DMITK_USE_SUPERBUILD=1 \
        -DMITK_USE_GDCM=1 \
        -DMITK_BUILD_EXAMPLES=0 \
        -DBUILD_TESTING=0 \
        -DMITK_USE_Python3=1 \
        -DMITK_USE_SWIG=1 \
        -DMITK_USE_SimpleITK=0 \
        -DMITK_USE_VMTK=0 \
        -DMITK_USE_Numpy=1 \
        -DBUILD_SHARED_LIBS=1 \
        -DMITK_USE_SYSTEM_PYTHON=1 \
        -DMITK_ADDITIONAL_CXX_FLAGS:STRING="-fpermissive -DVCL_CAN_STATIC_CONST_INIT_FLOAT=0 -isystem /usr/local/sv/ext/2022.10/release/gl2/bin/gnu/7.5/x64/gdcm-2.6.3/include/gdcm-2.6/" \
        -DMITK_ADDITIONAL_C_FLAGS:STRING="-fpermissive -DVCL_CAN_STATIC_CONST_INIT_FLOAT=0 -isystem /usr/local/sv/ext/2022.10/release/gl2/bin/gnu/7.5/x64/gdcm-2.6.3/include/gdcm-2.6/" \
        -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
        -DGDCM_DIR:PATH=$GDCM_INSTALL_DIR/lib \
        -DEXTERNAL_ITK_DIR:PATH=$ITK_INSTALL_DIR/lib \
        -DEXTERNAL_VTK_DIR:PATH=$VTK_INSTALL_DIR/lib \
        -DSWIG_EXECUTABLE:FILEPATH=$SWIG_EXECUTABLE \
        -DSWIG_DIR:PATH=$SWIG_INSTALL_DIR \
        -DSWIG_VERSION:STRING=$SWIG_VERSION \
        -Dtinyxml2_DIR:FILEPATH=$TINYXML2_INSTALL_DIR \
        -DPYTHON_DEBUG_LIBRARY:FILEPATH="" \
        -D_Python3_EXECUTABLE:FILEPATH=$PYTHON_INSTALL_DIR/$PYTHON_EXECUTABLE \
        -D_Python3_INCLUDE_DIR:PATH=$PYTHON_INSTALL_DIR/$PYTHON_INCLUDE_DIR \
        -DPYTHON_INCLUDE_DIR2:PATH=$PYTHON_INSTALL_DIR/$PYTHON_INCLUDE_DIR \
        -DPYTHON_LIBRARIES:FILEPATH=$PYTHON_INSTALL_DIR/$PYTHON_LIBRARY \
        -DPYTHON_LIBRARY:FILEPATH=$PYTHON_INSTALL_DIR/$PYTHON_LIBRARY \
        -DPYTHON_LIBRARY_RELEASE:FILEPATH=$PYTHON_INSTALL_DIR/$PYTHON_LIBRARY \
        -DQt5_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5 \
        -DQt5Concurrent_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5Concurrent \
        -DQt5Core_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5Core \
        -DQt5Designer_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5Designer \
        -DQt5Gui_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5Gui \
        -DQt5Help_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5Help \
        -DQt5Network_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5Network \
        -DQt5OpenGL_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5OpenGL \
        -DQt5PrintSupport_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5PrintSupport \
        -DQt5Sql_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5Sql \
        -DQt5Svg_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5Svg \
        -DQt5UiTools_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5UiTools \
        -DQt5WebEngineWidgets_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5WebEngineWidgets \
        -DQt5WebEngine_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5WebEngine \
        -DQt5Widgets_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5Widgets \
        -DQt5XmlPatterns_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5XmlPatterns \
        -DQt5Xml_DIR:PATH=$QT_INSTALL_DIR/lib/cmake/Qt5Xml \
        -DQT_QMAKE_EXECUTABLE:FILEPATH=$QT_INSTALL_DIR/bin/qmake \
        -DCMAKE_INSTALL_PREFIX:PATH=$MITK_INSTALL_DIR \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_OBJECT_PATH_MAX:STRING=1000 \
        -DPython3_ROOT_DIR=$PYTHON_INSTALL_DIR \
    ..
    # make -j 4 
    # make install
    # popd
fi

popd
