# Troubleshooting Guide

## Common Issues and Solutions

### Permission Denied Errors

**Problem**: `bash: ./script.sh: Permission denied`

**Solution**:
```bash
chmod +x script.sh
```

### Script Not Found

**Problem**: `bash: script.sh: No such file or directory`

**Solutions**:
1. Check if you're in the correct directory: `pwd`
2. List files: `ls -la`
3. Use full path: `/path/to/script.sh`

### Syntax Errors

**Problem**: `syntax error near unexpected token`

**Common Causes**:
- Missing spaces around brackets in conditions
- Incorrect quote matching
- Missing semicolons in for loops

**Example Fix**:
```bash
# Wrong
if[$var -eq 1]

# Correct
if [ $var -eq 1 ]
```

### Variable Issues

**Problem**: Variables not expanding correctly

**Solutions**:
- Use `${}` for complex variable names: `${var}_suffix`
- Quote variables with spaces: `"$var"`
- Check variable assignment (no spaces around =): `var=value`

### Amazon Linux 2023 Specific

**Problem**: Command not found

**Solution**:
```bash
# Update package manager
sudo dnf update

# Install common tools
sudo dnf install -y git vim nano
```

### File Encoding Issues

**Problem**: Script has weird characters

**Solution**:
```bash
# Check file encoding
file script.sh

# Convert if needed
dos2unix script.sh
```

## Getting Help

1. Use `man command` for command documentation
2. Use `command --help` for quick help
3. Check script with `bash -x script.sh` for debugging
