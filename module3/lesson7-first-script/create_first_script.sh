#!/bin/bash

echo "=== Creating Your First Bash Script ==="
echo

echo "Let's create a simple 'Hello World' script together!"
echo

# Create the script
cat > my_first_script.sh << 'EOF'
#!/bin/bash

# My First Bash Script
# This script demonstrates basic bash scripting

echo "=== My First Bash Script ==="
echo "Hello, World!"
echo "Today is: $(date)"
echo "Current user: $(whoami)"
echo "Current directory: $(pwd)"
echo "=== Script completed! ==="
EOF

echo "Script created: my_first_script.sh"
echo

echo "Making it executable..."
chmod +x my_first_script.sh
echo "Done!"
echo

echo "Script contents:"
echo "=================="
cat my_first_script.sh
echo "=================="
echo

echo "Now run your script with: ./my_first_script.sh"
echo

read -p "Would you like to run it now? (y/n): " answer
if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    echo
    echo "Running your first script..."
    echo
    ./my_first_script.sh
fi

echo
echo "Congratulations! You've created and run your first bash script!"
