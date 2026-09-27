#!/bin/bash
set -e

BUILD_TYPE="${1:-Release}"

echo "Building Space Invaders in ${BUILD_TYPE} mode..."

mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE="$BUILD_TYPE" ..
make -j$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null)

echo ""
echo "Build complete! Run ./bin/space_invaders to play."
