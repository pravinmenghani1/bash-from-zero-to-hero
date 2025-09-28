#!/bin/bash

echo "=== File System Navigation Demo ==="
echo

echo "1. Current location:"
pwd
echo

echo "2. Root directory structure:"
ls -la / | head -10
echo

echo "3. Your home directory:"
echo "Home: $HOME"
ls -la ~ | head -5
echo

echo "4. Important directories:"
echo "/etc (configuration files):"
ls /etc | head -5
echo "..."
echo

echo "/usr/bin (user binaries):"
ls /usr/bin | head -5
echo "..."
echo

echo "5. Navigation demonstration:"
echo "Starting at: $(pwd)"
cd /tmp
echo "Changed to: $(pwd)"
cd -
echo "Back to: $(pwd)"
echo

echo "6. Path examples:"
echo "Absolute path to home: $HOME"
echo "Relative path to parent: .."
echo "Current directory: ."
echo

echo "=== Demo completed! ==="
