#!/bin/bash

echo "=== Variables Demo ==="
echo

echo "1. Basic Variable Assignment:"
name="Alice"
age=30
city="Seattle"

echo "Name: $name"
echo "Age: $age"
echo "City: $city"
echo

echo "2. Variable Expansion:"
echo "Hello, $name!"
echo "Hello, ${name}!"
echo "File: ${name}_data.txt"
echo

echo "3. Numbers and Calculations:"
num1=10
num2=5
sum=$((num1 + num2))
echo "$num1 + $num2 = $sum"
echo

echo "4. Environment Variables:"
echo "Your home directory: $HOME"
echo "Your username: $USER"
echo "Your shell: $SHELL"
echo "Current path: $PWD"
echo

echo "5. Command Substitution:"
current_date=$(date)
file_count=$(ls | wc -l)
echo "Current date: $current_date"
echo "Files in directory: $file_count"
echo

echo "6. String Operations:"
text="Hello World"
echo "Original: $text"
echo "Length: ${#text}"
echo "Uppercase: ${text^^}"
echo "Lowercase: ${text,,}"
echo "Substring: ${text:0:5}"
echo

echo "=== Demo completed! ==="
