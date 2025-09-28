# Lesson 9: Conditional Statements

## Learning Objectives
- Master if-then-else statements
- Learn comparison operators
- Understand test conditions
- Practice with case statements

## Theory

### Basic If Statement
```bash
if [ condition ]; then
    commands
fi
```

### If-Else Statement
```bash
if [ condition ]; then
    commands
else
    other_commands
fi
```

### Comparison Operators
- `-eq` - Equal to
- `-ne` - Not equal to
- `-gt` - Greater than
- `-lt` - Less than
- `-ge` - Greater than or equal
- `-le` - Less than or equal

### String Comparisons
- `=` - String equal
- `!=` - String not equal
- `-z` - String is empty
- `-n` - String is not empty

### File Tests
- `-f` - File exists and is regular file
- `-d` - Directory exists
- `-r` - File is readable
- `-w` - File is writable
- `-x` - File is executable

## Hands-On Demo

### Step 1: Basic Conditionals
```bash
./conditionals_demo.sh
```

### Step 2: Advanced Conditions
```bash
./advanced_conditionals.sh
```

## Exercises

1. Create a script that checks if a file exists
2. Write a number comparison script
3. Create a menu system with case statement
4. Build a file permission checker

## Next Steps
Proceed to [Lesson 10: Loops](../../module4/lesson10-loops/README.md)
