#!/bin/bash

ROOT="/home/network/" #root user 
ROOT_EXCLUDE="--exclude=/dev --exclude=/proc --exclude=/sys --exclude=/temp --exclude=/run --exlucde=/mnt --exlcude=/media --exclude=/lost+found" #exclude these directories
DESTIN="/home/network/MyBackup/" #destination folder backup will be sent to
BACKUP="backup.`%d%m%y_%k:%M`.tgz" #name of backup+version(date&time) that will be created

if [ "$USER" != "root" ]; then
    echo "You are not the root user"
    echo "To use backup please use: sudo backup"
    exit
	#checks if root user
fi

    tar cvpfz $DESTIN/backup.`date +%d%m%y_%k:%M`.tgz $ROOT $ROOT_EXCLUDE_DIRS #creates backup 
    echo "BACKUP COMPLETE"
    sleep 2
    exit
#"help.ubuntu.com" 
