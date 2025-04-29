#!/bin/bash
#Declaring Arithmatic functions

read -p "Enter first number :- " num1
read -p "Enter second number :- " num2

#Addition Funcion
function Add() { 
	sum=$(( $num1 + $num2 ))
	echo "Sum of $num1 + $num2 = $sum "
}
#Multiplication Funcion
function Mul() {
        mul=$(( $num1 * $num2 ))
        echo "Product of $num1 X $num2 = $mul "
}
#Division Funcion
function Div() { 
        div=$(( $num1 / $num2 ))
        echo "Division of $num1 / $num2 = $div "
}
#Substration Funcion
function Sub() { 
        sub=$(( $num1 - $num2 ))
        echo "Substraction of $num1 - $num2 = $sub "
}

Add
Mul
Div
Sub
