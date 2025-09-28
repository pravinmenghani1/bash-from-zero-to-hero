#!/bin/bash

echo "=== Lesson 7: Script Creation Demo ==="
echo

echo "1. Creating multiple example scripts..."
echo

# Example 1: System Info Script
cat > system_info.sh << 'EOF'
#!/bin/bash
echo "=== System Information ==="
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime)"
echo "Disk Usage:"
df -h | head -5
echo "Memory Usage:"
free -h
EOF

chmod +x system_info.sh
echo "Created: system_info.sh"

# Example 2: File Counter Script
cat > count_files.sh << 'EOF'
#!/bin/bash
echo "=== File Counter ==="
echo "Files in current directory: $(ls -1 | wc -l)"
echo "Hidden files: $(ls -1a | grep '^\\.' | wc -l)"
echo "Directories: $(ls -1 -d */ 2>/dev/null | wc -l)"
EOF

chmod +x count_files.sh
echo "Created: count_files.sh"

# Example 3: Greeting Script
cat > greeting.sh << 'EOF'
#!/bin/bash
echo "=== Welcome Script ==="
echo "Hello, $(whoami)!"
echo "Welcome to $(hostname)"
echo "Today is $(date '+%A, %B %d, %Y')"
echo "Current time: $(date '+%H:%M:%S')"
EOF

chmod +x greeting.sh
echo "Created: greeting.sh"

echo
echo "2. Running all example scripts..."
echo

echo "--- System Info ---"
./system_info.sh
echo

echo "--- File Counter ---"
./count_files.sh
echo

echo "--- Greeting ---"
./greeting.sh
echo

echo "3. Script files created in this directory:"
ls -la *.sh
echo

echo "=== Demo completed! ==="
echo "You now have several example scripts to study and modify."
