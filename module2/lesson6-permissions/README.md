# Lesson 6: Permissions and Ownership

## Learning Objectives
- Understand Linux file permissions
- Learn to modify permissions with chmod
- Work with file ownership
- Understand security implications

## Theory

### Permission Types
- **r** (read) - View file contents
- **w** (write) - Modify file
- **x** (execute) - Run file as program

### Permission Groups
- **Owner** - File creator
- **Group** - Users in same group
- **Others** - Everyone else

### Permission Notation
```
-rwxr-xr--
 |||||||└── Others permissions
 ||||└────── Group permissions  
 |└───────── Owner permissions
 └────────── File type
```

### Numeric Permissions
- 4 = read (r)
- 2 = write (w)  
- 1 = execute (x)
- 755 = rwxr-xr-x
- 644 = rw-r--r--

## Hands-On Demo

### Step 1: Understanding Permissions
```bash
./permissions_demo.sh
```

### Step 2: Modifying Permissions
```bash
./chmod_demo.sh
```

## Exercises

1. Create files with different permissions
2. Make a script executable
3. Change file ownership
4. Practice with numeric permissions

## Next Steps
Proceed to [Lesson 7: Your First Script](../../module3/lesson7-first-script/README.md)
