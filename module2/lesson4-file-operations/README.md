# Lesson 4: File Operations

## Learning Objectives
- Master file creation, copying, and moving
- Understand file types and attributes
- Learn advanced file operations
- Practice with wildcards and patterns

## Theory

### File Operations
- `touch` - Create empty files
- `cp` - Copy files and directories
- `mv` - Move/rename files
- `rm` - Remove files
- `mkdir` - Create directories
- `rmdir` - Remove empty directories

### File Types
- Regular files (-)
- Directories (d)
- Links (l)
- Special files (c, b, p, s)

### Wildcards
- `*` - Match any characters
- `?` - Match single character
- `[abc]` - Match any of a, b, c
- `{txt,log}` - Match txt or log

## Hands-On Demo

### Step 1: Basic Operations
```bash
./file_operations_demo.sh
```

### Step 2: Advanced Operations
```bash
./advanced_operations.sh
```

## Exercises

1. Create 5 files with different extensions
2. Copy all .txt files to a backup directory
3. Rename files using mv
4. Remove files safely

## Safety Tips
- Use `rm -i` for interactive removal
- Always backup important files
- Test commands with `echo` first

## Next Steps
Proceed to [Lesson 5: Text Processing](../lesson5-text-processing/README.md)
