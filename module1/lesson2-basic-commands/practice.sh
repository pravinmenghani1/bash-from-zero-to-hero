#!/bin/bash

echo "=== Interactive Practice Session ==="
echo "Follow the prompts to practice basic commands"
echo

read -p "Press Enter to start..."

echo "1. Let's see where you are:"
echo "Command: pwd"
pwd
echo

read -p "Press Enter to continue..."

echo "2. List current directory contents:"
echo "Command: ls -la"
ls -la
echo

read -p "Press Enter to continue..."

echo "3. Create a practice directory:"
echo "Command: mkdir practice_session"
mkdir practice_session
echo "Directory created!"
echo

echo "4. Navigate to the new directory:"
echo "Command: cd practice_session"
cd practice_session
pwd
echo

read -p "Press Enter to continue..."

echo "5. Create some files:"
echo "Command: touch test1.txt test2.txt"
touch test1.txt test2.txt
ls -la
echo

echo "6. Add content to a file:"
echo "Command: echo 'Practice content' > test1.txt"
echo 'Practice content' > test1.txt
echo "Content added!"
echo

echo "7. View the content:"
echo "Command: cat test1.txt"
cat test1.txt
echo

read -p "Press Enter to continue..."

echo "8. Copy the file:"
echo "Command: cp test1.txt test1_backup.txt"
cp test1.txt test1_backup.txt
ls -la
echo

echo "9. Remove a file:"
echo "Command: rm test2.txt"
rm test2.txt
echo "File removed!"
ls -la
echo

echo "10. Go back to parent directory:"
echo "Command: cd .."
cd ..
pwd
echo

echo "=== Practice session completed! ==="
echo "You can explore the practice_session directory later"
echo "To clean up: rm -rf practice_session"
