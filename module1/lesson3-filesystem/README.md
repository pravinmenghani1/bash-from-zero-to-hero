# Lesson 3: File System Navigation

## Learning Objectives
- Understand Linux file system structure
- Master directory navigation commands
- Learn about absolute and relative paths
- Work with file system hierarchy

## Theory

### Linux File System Structure
```
/                    # Root directory
├── bin/            # Essential binaries
├── etc/            # Configuration files
├── home/           # User home directories
├── tmp/            # Temporary files
├── usr/            # User programs
└── var/            # Variable data
```

### Path Types
- **Absolute Path**: Starts from root (`/home/user/file.txt`)
- **Relative Path**: Relative to current directory (`../file.txt`)

### Navigation Commands
- `pwd` - Print working directory
- `cd` - Change directory
- `ls` - List contents
- `tree` - Show directory tree

## Hands-On Demo

### Step 1: File System Exploration
```bash
./filesystem_demo.sh
```

### Step 2: Navigation Practice
```bash
./navigation_practice.sh
```

## Exercises

1. Navigate to your home directory
2. Create a nested directory structure: `projects/bash/scripts`
3. Navigate using both absolute and relative paths
4. Explore the `/etc` directory (read-only)

## Navigation Shortcuts
- `cd` or `cd ~` - Go to home directory
- `cd -` - Go to previous directory
- `cd ..` - Go to parent directory
- `cd ../..` - Go up two levels

## Troubleshooting

**Issue**: Permission denied accessing directory
**Solution**: Check permissions with `ls -ld directory`

**Issue**: No such file or directory
**Solution**: Use `pwd` to check current location

## Next Steps
Proceed to [Lesson 4: File Operations](../../module2/lesson4-file-operations/README.md)
