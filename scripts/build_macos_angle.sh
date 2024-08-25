#!/bin/bash

start_time=$(date +%s)

SCRIPT_DIR=$(dirname "$(realpath "$0")")
ROOT_DIR=$SCRIPT_DIR/..

if [ ! -d "$ROOT_DIR/build" ]; then
    echo "Error: Build folder not found. Please run the configure script first."
    exit 1
else
    echo "Build folder found. Starting the build process..."
fi

cd "$ROOT_DIR/build"

echo "Building the project with make..."
make -j16
if [ $? -ne 0 ]; then
    echo "Error: Build failed."
    exit 1
fi

if [ "$1" == "install" ]; then
    echo "Installing the project..."
    make install
    if [ $? -ne 0 ]; then
        echo "Error: Installation failed."
        exit 1
    fi
fi

end_time=$(date +%s)
elapsed_time=$((end_time - start_time))

echo "Build and installation completed successfully."
echo "Total time taken: $elapsed_time seconds."
