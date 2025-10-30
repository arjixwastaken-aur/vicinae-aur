#!/bin/bash

SQUASHFS_ROOT_DIR="/opt/vicinae"
APP_BINARY="$SQUASHFS_ROOT_DIR/usr/bin/vicinae" 

# Define library paths to search *inside* the extracted AppImage structure
LIB_DIRS=(
    "$SQUASHFS_ROOT_DIR/usr/lib"
    "$SQUASHFS_ROOT_DIR/usr/lib64"
    "$SQUASHFS_ROOT_DIR/lib"
    "$SQUASHFS_ROOT_DIR/lib64"
)

# Build the new LD_LIBRARY_PATH
NEW_LD_PATH=""
for dir in "${LIB_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        if [ -z "$NEW_LD_PATH" ]; then
            NEW_LD_PATH="$dir"
        else
            NEW_LD_PATH="$NEW_LD_PATH:$dir"
        fi
    fi
done

export LD_LIBRARY_PATH="$NEW_LD_PATH:$LD_LIBRARY_PATH"

exec "$APP_BINARY" "$@"

if [ $? -ne 0 ]; then
    echo "Error: The application failed to execute or returned an error."
    echo "Check if the APP_BINARY path in the script is correct and that the application binary is executable."
fi
