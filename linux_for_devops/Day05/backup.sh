#!/bin/bash

<< readme
This is the script for backup using 5 days backup rotation
Usage:-
./backup.sh << path to your source >> <<path to backup folder>>
readme

function usage_display {
	echo "Usage:- ./backup.sh << path to your source >> <<path to backup folder>>"
}

if [ $# -eq 0 ]; then
	usage_display
fi

source_Dir=$1
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
backup_Dir=$2
function create_backup {
	zip -r "${backup_Dir}/backup_${timestamp}.zip" "${source_Dir}" >/dev/null
	if [ $? -eq 0 ]; then
		echo "Backups ${timestamp} generated successfully"
	else 
		echo "Backups did not generated check your source and backup dir"
	fi
}

function perform_rotation {
	backups=($( ls -t  "${backup_Dir}/backup_"*.zip 2>/dev/null))
	
	if [ "${#backups[@]}" -ge 5 ]; then
		echo "Performing rotation"
		backups_to_remove=("${backups[@]:5}")
		echo "${backups_to_remove[@]}"
		for backup in "${backups_to_remove[@]}";
		do
			rm -f ${backup[@]}
		done
		
	fi
}

create_backup
perform_rotation
