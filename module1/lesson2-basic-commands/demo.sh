#!/bin/bash

echo "=== Lesson 2: Basic Commands Demo ==="
echo

# Create a temporary directory for demo
echo "Creating demo directory..."
mkdir -p demo_workspace
cd demo_workspace

echo "1. Current directory:"
pwd
echo

echo "2. Creating some files..."
touch file1.txt file2.txt file3.txt
echo "Files created: file1.txt, file2.txt, file3.txt"
echo

echo "3. Listing files (simple):"
ls
echo

echo "4. Listing files (detailed):"
ls -l
echo

echo "5. Creating a directory:"
mkdir my_folder
echo "Directory 'my_folder' created"
echo

echo "6. Listing everything:"
ls -la
echo

echo "7. Adding content to a file:"
echo "Hello, World!" > file1.txt
echo "Content added to file1.txt"
echo

echo "8. Displaying file content:"
cat file1.txt
echo

echo "9. Copying a file:"
cp file1.txt backup.txt
echo "file1.txt copied to backup.txt"
echo

echo "10. Moving a file:"
mv file2.txt my_folder/
echo "file2.txt moved to my_folder/"
echo

echo "11. Final directory listing:"
ls -la
echo "Contents of my_folder:"
ls -la my_folder/
echo

echo "12. Cleaning up..."
cd ..
rm -rf demo_workspace
echo "Demo workspace cleaned up"
echo

echo "=== Demo completed! ==="
