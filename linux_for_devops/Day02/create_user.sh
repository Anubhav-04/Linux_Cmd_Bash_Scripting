#!/bin/bash

echo "Adding a user to the system."
read -p "Enter username : " username
sudo useradd $username
sudo passwd $username
echo "Hi $username you are added as new user."
tail -n 1 /etc/passwd
