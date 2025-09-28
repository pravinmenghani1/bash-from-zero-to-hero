#!/bin/bash

echo "=== Command Line Arguments Demo ==="
echo

echo "Script Information:"
echo "Script name: $0"
echo "Number of arguments: $#"
echo

if [ $# -eq 0 ]; then
    echo "No arguments provided!"
    echo "Usage: $0 <arg1> <arg2> <arg3> ..."
    echo "Example: $0 hello world 123"
    exit 1
fi

echo "Arguments provided:"
echo "First argument (\$1): $1"

if [ $# -ge 2 ]; then
    echo "Second argument (\$2): $2"
fi

if [ $# -ge 3 ]; then
    echo "Third argument (\$3): $3"
fi

echo
echo "All arguments using \$@:"
for arg in "$@"; do
    echo "  - $arg"
done

echo
echo "All arguments using \$*:"
echo "Arguments as single string: $*"

echo
echo "Processing arguments:"
counter=1
for arg in "$@"; do
    echo "Argument $counter: $arg (length: ${#arg})"
    ((counter++))
done

echo
echo "Last argument: ${!#}"
echo

# Demonstrate shift
echo "Using shift to process arguments:"
while [ $# -gt 0 ]; do
    echo "Processing: $1"
    shift
done

echo
echo "=== Arguments demo completed! ==="
