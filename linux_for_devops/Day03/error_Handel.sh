#!/bin/bash

bring_error(){
	echo "Type a command"
	read command
	eval "$command"
}
if ! bring_error; then 
	echo "Commands error "
	exit 1
fi
echo "Command run successfolly!!!"
