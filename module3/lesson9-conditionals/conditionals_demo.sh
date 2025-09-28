#!/bin/bash

echo "=== Conditional Statements Demo ==="
echo

echo "1. Basic if statement:"
age=25
if [ $age -ge 18 ]; then
    echo "Age $age: You are an adult"
fi
echo

echo "2. If-else statement:"
score=85
if [ $score -ge 90 ]; then
    echo "Grade: A"
else
    echo "Grade: B or below"
fi
echo

echo "3. Multiple conditions:"
temperature=75
if [ $temperature -gt 80 ]; then
    echo "It's hot!"
elif [ $temperature -gt 60 ]; then
    echo "It's warm"
else
    echo "It's cold"
fi
echo

echo "4. String comparisons:"
name="Alice"
if [ "$name" = "Alice" ]; then
    echo "Hello Alice!"
else
    echo "Hello stranger!"
fi
echo

echo "5. File tests:"
touch test_file.txt
if [ -f "test_file.txt" ]; then
    echo "test_file.txt exists"
else
    echo "test_file.txt does not exist"
fi
echo

echo "6. Case statement:"
day="Monday"
case $day in
    "Monday")
        echo "Start of work week"
        ;;
    "Friday")
        echo "TGIF!"
        ;;
    "Saturday"|"Sunday")
        echo "Weekend!"
        ;;
    *)
        echo "Regular day"
        ;;
esac
echo

# Cleanup
rm -f test_file.txt
echo "=== Demo completed! ==="
