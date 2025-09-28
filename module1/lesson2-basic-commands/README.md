# Lesson 2: Basic Commands

## Learning Objectives
- Master essential Linux commands
- Understand command syntax and options
- Learn to get help for commands
- Practice with real examples

## Theory

### Command Structure
```
command [options] [arguments]
```

### Essential Commands
- `ls` - List directory contents
- `cd` - Change directory
- `pwd` - Print working directory
- `mkdir` - Create directories
- `rmdir` - Remove empty directories
- `touch` - Create empty files
- `rm` - Remove files
- `cp` - Copy files
- `mv` - Move/rename files
- `cat` - Display file contents
- `less` - View file contents page by page
- `head` - Show first lines of file
- `tail` - Show last lines of file

## Hands-On Demo

### Step 1: Run the Demo Script
```bash
./demo.sh
```

### Step 2: Practice Commands Interactively
```bash
./practice.sh
```

## Exercises

1. Create a directory called `my_practice`
2. Navigate into it
3. Create three empty files: `file1.txt`, `file2.txt`, `file3.txt`
4. List all files with detailed information
5. Copy `file1.txt` to `backup.txt`
6. Remove `file3.txt`
7. Navigate back to parent directory

## Command Reference

### Getting Help
```bash
man ls          # Manual page for ls
ls --help       # Quick help for ls
info ls         # Info page for ls
```

### Common Options
- `-l` : Long format (detailed)
- `-a` : Show hidden files
- `-h` : Human readable sizes
- `-r` : Reverse order
- `-t` : Sort by time

## Troubleshooting

**Issue**: `rm` removes files permanently
**Solution**: Use `rm -i` for interactive mode

**Issue**: Can't remove directory
**Solution**: Use `rm -r` for recursive removal (be careful!)

**Issue**: Permission denied
**Solution**: Check file permissions with `ls -l`

## Next Steps
Proceed to [Lesson 3: File System Navigation](../lesson3-filesystem/README.md)
