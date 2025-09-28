#!/bin/bash

echo "=== Text Processing Demo ==="
echo

# Create sample data
cat > sample_data.txt << 'EOF'
apple,red,sweet
banana,yellow,sweet
orange,orange,citrus
grape,purple,sweet
lemon,yellow,sour
lime,green,sour
EOF

echo "1. Sample data created:"
cat sample_data.txt
echo

echo "2. Counting lines, words, characters:"
wc sample_data.txt
echo

echo "3. Searching with grep:"
echo "Sweet fruits:"
grep "sweet" sample_data.txt
echo

echo "4. Extracting columns with cut:"
echo "Just the fruit names:"
cut -d',' -f1 sample_data.txt
echo

echo "5. Sorting data:"
echo "Sorted by color:"
sort -t',' -k2 sample_data.txt
echo

echo "6. Using pipes:"
echo "Yellow fruits only:"
grep "yellow" sample_data.txt | cut -d',' -f1
echo

echo "7. Head and tail:"
echo "First 3 lines:"
head -3 sample_data.txt
echo "Last 2 lines:"
tail -2 sample_data.txt
echo

# Cleanup
rm sample_data.txt
echo "=== Demo completed! ==="
