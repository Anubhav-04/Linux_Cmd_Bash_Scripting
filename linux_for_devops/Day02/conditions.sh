#!/bin/bash

<< Comment
This is the script to check the conditional statement
using if else
Comment
read -p "Enter your name : - " name
read -p "Enter your subject :- " subject
read -p "Enter your marks :- " marks
if [ $marks -gt  33 ];
then 
	echo "$name scored $marks in $subject and is passed"
elif [ $marks == 33 ];
then
	echo "$name scored $marks in $subject and is marginally passed"
else
	echo "$name scored $marks in $subject and is failed"
fi

