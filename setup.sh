#!/bin/bash

echo "=== Bash From Zero to Hero - Course Setup ==="
echo

# Check if running on Amazon Linux
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ $ID == "amzn" ]]; then
        echo "✓ Detected Amazon Linux"
    else
        echo "⚠ Warning: This course is designed for Amazon Linux 2023"
    fi
fi

echo
echo "Setting up the course environment..."

# Make all scripts executable
echo "Making all scripts executable..."
find . -name "*.sh" -exec chmod +x {} \;
echo "✓ All scripts are now executable"

# Create a practice directory
echo "Creating practice directory..."
mkdir -p ~/bash-practice
echo "✓ Practice directory created at ~/bash-practice"

# Check required tools
echo
echo "Checking required tools..."

tools=("git" "vim" "nano")
for tool in "${tools[@]}"; do
    if command -v $tool &> /dev/null; then
        echo "✓ $tool is available"
    else
        echo "⚠ $tool is not installed"
        echo "  Install with: sudo dnf install -y $tool"
    fi
done

echo
echo "Course structure:"
find . -name "README.md" | sort

echo
echo "=== Setup Complete! ==="
echo
echo "To start the course:"
echo "1. cd module1/lesson1-intro"
echo "2. cat README.md"
echo "3. ./demo.sh"
echo
echo "Happy learning!"
