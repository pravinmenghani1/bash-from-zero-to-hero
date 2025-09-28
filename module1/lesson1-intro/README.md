# Lesson 1: Introduction to Bash

## Learning Objectives
- Understand what bash is and why it's important
- Learn about the shell environment
- Execute your first bash commands
- Understand the command prompt

## Theory

### What is Bash?
Bash (Bourne Again Shell) is a command-line interpreter that allows you to interact with your operating system. It's the default shell on most Linux distributions, including Amazon Linux 2023.

### Why Learn Bash?
- Automate repetitive tasks
- System administration
- DevOps and CI/CD pipelines
- File processing and data manipulation
- Server management

### The Shell Environment
When you log into a Linux system, you're presented with a shell prompt. This is your interface to the operating system.

## Hands-On Demo

### Step 1: Check Your Shell
```bash
echo $SHELL
```
Expected output: `/bin/bash`

### Step 2: Check Bash Version
```bash
bash --version
```

### Step 3: Understanding the Prompt
Your prompt typically shows:
- Username
- Hostname
- Current directory
- Privilege level ($ for user, # for root)

### Step 4: Run the Demo Script
```bash
./demo.sh
```

## Exercises

1. Run `whoami` to see your current user
2. Run `hostname` to see your system name
3. Run `pwd` to see your current directory
4. Run `date` to see current date and time

## Troubleshooting

**Issue**: Permission denied when running demo.sh
**Solution**: Run `chmod +x demo.sh` first

**Issue**: Command not found
**Solution**: Make sure you're in the correct directory with `pwd`

## Next Steps
Proceed to [Lesson 2: Basic Commands](../lesson2-basic-commands/README.md)
