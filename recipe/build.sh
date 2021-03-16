#!/bin/sh
set -ex

./acprep \
  --python \
  --prefix "${PREFIX}" \
  update
make check -j${CPU_COUNT}
make install -j${CPU_COUNT}
