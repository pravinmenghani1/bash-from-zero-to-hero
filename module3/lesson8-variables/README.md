# Lesson 8: Variables and Input

## Learning Objectives
- Understand bash variables and their types
- Learn variable assignment and expansion
- Handle user input with read command
- Work with command line arguments
- Use environment variables

## Theory

### Variable Types
- **Local Variables**: Available only in current script
- **Environment Variables**: Available to child processes
- **Special Variables**: Built-in variables ($0, $1, $?, etc.)

### Variable Assignment
```bash
name="John"           # No spaces around =
age=25               # Numbers don't need quotes
path="/home/user"    # Paths should be quoted
```

### Variable Expansion
```bash
echo $name           # Basic expansion
echo ${name}         # Explicit expansion
echo "${name}_file"  # Concatenation
```

### User Input
```bash
read variable        # Read into variable
read -p "Prompt: " var  # With prompt
read -s password     # Silent input
```

### Command Line Arguments
- `$0` - Script name
- `$1, $2, ...` - Arguments
- `$#` - Number of arguments
- `$@` - All arguments
- `$*` - All arguments as single string

## Hands-On Demo

### Step 1: Variable Basics
```bash
./variables_demo.sh
```

### Step 2: User Input Practice
```bash
./input_demo.sh
```

### Step 3: Command Line Arguments
```bash
./args_demo.sh arg1 arg2 arg3
```

## Exercises

1. Create a script that asks for your name and age, then displays a greeting
2. Create a calculator script that takes two numbers as arguments
3. Create a script that uses environment variables
4. Create a backup script that takes a filename as argument

## Variable Best Practices

### Naming Conventions
```bash
# Good
user_name="john"
FILE_PATH="/tmp/data"
readonly CONFIG_FILE="/etc/app.conf"

# Avoid
userName="john"    # camelCase not common in bash
file-path="/tmp"   # hyphens not allowed
2file="test"       # can't start with number
```

### Quoting
```bash
# Always quote variables with spaces
file_name="my file.txt"
echo "$file_name"

# Use arrays for multiple values
files=("file1.txt" "file2.txt" "file3.txt")
```

## Troubleshooting

**Issue**: Variable not expanding
**Solution**: Check for spaces around `=` in assignment

**Issue**: Command not found when using variables
**Solution**: Quote the variable: `"$variable"`

**Issue**: Arguments not working
**Solution**: Check if script is called with arguments

## Next Steps
Proceed to [Lesson 9: Conditional Statements](../lesson9-conditionals/README.md)
