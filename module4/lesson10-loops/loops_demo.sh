#!/bin/bash

echo "=== Loops Demo ==="
echo

echo "1. For loop with list:"
for fruit in apple banana orange; do
    echo "Fruit: $fruit"
done
echo

echo "2. For loop with range:"
for i in {1..5}; do
    echo "Number: $i"
done
echo

echo "3. While loop:"
counter=1
while [ $counter -le 3 ]; do
    echo "Counter: $counter"
    ((counter++))
done
echo

echo "=== Demo completed! ==="
