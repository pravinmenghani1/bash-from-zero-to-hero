#!/bin/bash

echo "=== Permissions and Ownership Demo ==="
echo

echo "1. Creating test files:"
touch test_file.txt
echo "#!/bin/bash" > test_script.sh
echo "echo 'Hello from script'" >> test_script.sh
echo "Files created"
echo

echo "2. Current permissions:"
ls -la test_*
echo

echo "3. Understanding permission format:"
echo "-rw-r--r-- breakdown:"
echo "  - = regular file"
echo "  rw- = owner can read/write"
echo "  r-- = group can read only"
echo "  r-- = others can read only"
echo

echo "4. Making script executable:"
chmod +x test_script.sh
echo "Added execute permission"
ls -la test_script.sh
echo

echo "5. Running the script:"
./test_script.sh
echo

echo "6. Different permission examples:"
chmod 755 test_script.sh
echo "755 (rwxr-xr-x):"
ls -la test_script.sh

chmod 644 test_file.txt  
echo "644 (rw-r--r--):"
ls -la test_file.txt
echo

echo "7. Ownership information:"
echo "Current user: $(whoami)"
echo "File owner:"
ls -la test_file.txt | awk '{print $3, $4}'
echo

# Cleanup
rm test_file.txt test_script.sh
echo "Test files cleaned up"
echo

echo "=== Demo completed! ==="
