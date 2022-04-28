#!/bin/sh
set -ex

cmake ${CMAKE_ARGS} \
  -DUSE_PYTHON=ON \
  -DPython_ROOT_DIR=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_INSTALL_LIBDIR=lib \
  .

make -j${CPU_COUNT} VERBOSE=1
ctest --output-on-failure -j${CPU_COUNT}
make install -j${CPU_COUNT}
