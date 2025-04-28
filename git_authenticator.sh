#!/bin/bash

# to install git

function install_git {
	sudo apt update
	sudo apt install git
	echo "Git installed succesfully"
}

function user_Add {
	read -p "Enter user name:-" name
	read -p "Enter email id associated with git:-" email
	git config --global user.name "${name}"
	git config --global user.email "${email}"
}

function generate_ssh_keygen {
	ssh-keygen -t ed25519 -C "${email}"
	echo "Add the below public key to your ssh key in Github"
	cat ~/.ssh/id_ed25519.pub
}
function test_your_connection {
	ssh -T git@github.com
}
install_git
user_Add
generate_ssh_keygen
test_your_connection

