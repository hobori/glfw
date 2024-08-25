#!/bin/bash

start_time=$(date +%s)

SCRIPT_DIR=$(dirname "$(realpath "$0")")
ROOT_DIR=$SCRIPT_DIR/..

ANGLE_PATH=$1

if [ -z "$ANGLE_PATH" ]; then
    echo "Error: No ANGLE_PATH provided. Usage: $0 <angle_path>"
    exit 1
fi

if [ ! -d "$ROOT_DIR/build" ]; then
    echo "Build folder not found. Creating build directory..."
    mkdir "$ROOT_DIR/build"
else
    echo "Build folder already exists."
fi

cd "$ROOT_DIR/build"

echo "Configuring the project with CMake..."
cmake $ROOT_DIR \
      -DANGLE_PATH=$ANGLE_PATH \
      -DUSE_ANGLE=ON \
      -DCMAKE_INSTALL_PREFIX=$ROOT_DIR/out \
      -DCMAKE_BUILD_TYPE=Debug

end_time=$(date +%s)
elapsed_time=$((end_time - start_time))

echo "Configuration completed successfully."
echo "Total time taken: $elapsed_time seconds."
