#!/bin/bash

# For loops and While loops

for  (( i=0;i<5;i++))
do
	echo $i
done

j=0
while [ $j -lt 5 ]
do
	echo "Hello$j"
	j=$((j +1))
done

#print odd and even number
read -p "Enter any two-digit number: " num

echo "Even numbers:"
for (( k=0; k<$num; k++ ))
do
    if (( k % 2 == 0 )); then
        echo $k
    fi
done

echo "Odd numbers:"
for (( k=0; k<$num; k++ ))
do
    if (( k % 2 != 0 )); then
        echo $k
    fi
done

