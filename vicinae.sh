#!/bin/bash

ROOT_DIR="/opt/vicinae"
APP_BINARY="$ROOT_DIR/usr/bin/vicinae" 

export LD_LIBRARY_PATH="$ROOT_DIR/usr/lib:$LD_LIBRARY_PATH"
export PATH="$ROOT_DIR/usr/bin:$PATH"

exec "$APP_BINARY" "$@"

if [ $? -ne 0 ]; then
    echo "Error: The application failed to execute or returned an error."
    echo "Check if the APP_BINARY path in the script is correct and that the application binary is executable."
fi
