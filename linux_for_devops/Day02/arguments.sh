#!/bin/bash
echo "$1 and $2 both are learning shell scripting"
echo "Creating $1 and $2 both as user in linux machine."
echo "Hi $1 enter your password"
sudo useradd $1
sudo passwd $1
echo "$1 user added"
echo "Hi $2 enter your password"
sudo useradd $2
sudo passwd $2
echo "$2 user added"
tail -n 5 /etc/passwd
echo "$1 and $2 both are Added as user, Thankyou..."
