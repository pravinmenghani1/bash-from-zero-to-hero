#!/bin/bash

echo "=== File Operations Demo ==="
echo

# Create demo workspace
mkdir -p demo_files
cd demo_files

echo "1. Creating files:"
touch file1.txt file2.log file3.txt data.csv
echo "Created: file1.txt file2.log file3.txt data.csv"
ls -la
echo

echo "2. Adding content:"
echo "Hello World" > file1.txt
echo "Log entry 1" > file2.log
echo "Text content" > file3.txt
echo "name,age" > data.csv
echo "Content added to files"
echo

echo "3. Copying files:"
cp file1.txt file1_backup.txt
echo "Copied file1.txt to file1_backup.txt"
ls -la *.txt
echo

echo "4. Creating directory and copying:"
mkdir backups
cp *.txt backups/
echo "Copied all .txt files to backups/"
ls -la backups/
echo

echo "5. Moving files:"
mv file2.log backups/
echo "Moved file2.log to backups/"
ls -la
echo

echo "6. Wildcards demonstration:"
echo "All .txt files:"
ls *.txt
echo "Files starting with 'file':"
ls file*
echo

echo "7. File information:"
echo "File sizes:"
ls -lh
echo

# Cleanup
cd ..
rm -rf demo_files
echo "Demo workspace cleaned up"
echo

echo "=== Demo completed! ==="
