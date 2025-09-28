# Lesson 7: Your First Script

## Learning Objectives
- Create your first bash script
- Understand script structure and shebang
- Learn to make scripts executable
- Practice script execution methods

## Theory

### What is a Bash Script?
A bash script is a file containing a series of commands that the shell can execute. Scripts allow you to automate tasks and create reusable programs.

### Script Structure
```bash
#!/bin/bash
# This is a comment
echo "Hello, World!"
```

### The Shebang (#!)
The first line `#!/bin/bash` tells the system which interpreter to use.

### Making Scripts Executable
```bash
chmod +x script.sh
```

### Running Scripts
```bash
./script.sh          # Execute directly
bash script.sh       # Run with bash
sh script.sh         # Run with sh
```

## Hands-On Demo

### Step 1: Create Your First Script
```bash
./create_first_script.sh
```

### Step 2: Run the Demo
```bash
./demo.sh
```

### Step 3: Practice with Examples
```bash
./examples.sh
```

## Exercises

1. Create a script that displays your name and current date
2. Create a script that shows system information
3. Create a script that creates a backup directory
4. Make all scripts executable and run them

## Script Templates

### Basic Template
```bash
#!/bin/bash
# Script: script_name.sh
# Purpose: Brief description
# Author: Your name
# Date: Current date

echo "Script starting..."
# Your commands here
echo "Script completed!"
```

### With Error Handling
```bash
#!/bin/bash
set -e  # Exit on any error

echo "Starting script..."
# Commands here
echo "Script finished successfully!"
```

## Troubleshooting

**Issue**: `bash: ./script.sh: Permission denied`
**Solution**: Run `chmod +x script.sh`

**Issue**: `bad interpreter: No such file or directory`
**Solution**: Check shebang line, ensure it's `#!/bin/bash`

**Issue**: Script runs but commands not found
**Solution**: Check PATH or use full paths to commands

## Next Steps
Proceed to [Lesson 8: Variables and Input](../lesson8-variables/README.md)
