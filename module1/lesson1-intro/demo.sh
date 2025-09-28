#!/bin/bash

# Lesson 1 Demo: Introduction to Bash
echo "=== Welcome to Bash From Zero to Hero ==="
echo

echo "1. Your current shell:"
echo $SHELL
echo

echo "2. Bash version:"
bash --version | head -1
echo

echo "3. Current user:"
whoami
echo

echo "4. System hostname:"
hostname
echo

echo "5. Current date and time:"
date
echo

echo "6. Current working directory:"
pwd
echo

echo "7. Your environment variables (first 10):"
env | head -10
echo

echo "=== Demo completed successfully! ==="
echo "You're ready to continue with the course."
