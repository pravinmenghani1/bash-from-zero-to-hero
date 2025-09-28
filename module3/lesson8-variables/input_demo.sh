#!/bin/bash

echo "=== User Input Demo ==="
echo

echo "1. Basic Input:"
read -p "Enter your name: " user_name
echo "Hello, $user_name!"
echo

echo "2. Multiple Inputs:"
read -p "Enter your first name: " first_name
read -p "Enter your last name: " last_name
echo "Full name: $first_name $last_name"
echo

echo "3. Silent Input (password):"
read -s -p "Enter a password: " password
echo
echo "Password length: ${#password} characters"
echo

echo "4. Input with Default Value:"
read -p "Enter your city [Seattle]: " city
city=${city:-Seattle}
echo "Your city: $city"
echo

echo "5. Reading Multiple Values:"
echo "Enter three numbers separated by spaces:"
read num1 num2 num3
echo "Numbers: $num1, $num2, $num3"
echo "Sum: $((num1 + num2 + num3))"
echo

echo "6. Timeout Input:"
echo "Quick! You have 5 seconds to enter something:"
if read -t 5 -p "Enter text: " quick_input; then
    echo "You entered: $quick_input"
else
    echo "Too slow! Time's up."
fi
echo

echo "=== Input demo completed! ==="
