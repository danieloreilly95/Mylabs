#!/bin/bash

ROOT="/home/network" #root user 
ROOT_EXCLUDE="--exclude=/dev --exclude=/proc --exclude=/sys --exclude=/tmp --exclude=/run --exlucde=/mnt --exlcude=/media --exlude=/lost+found" #exclude these directories
DESTIN="/home/network/MyBackup" #variable with storage destination of backup file
BACKUP="backup.tgz" #name of the backup file that will be created
CREATE="/dev /proc /sys /temp /run /mnt /media " #this creates a new archive or truncates an old one if the filename already exists

if [ "$USER" != "root" ]; then
    echo "You are not the root user"
    echo "To use backup please use: sudo"
    exit
	#checks if the user is the root user and tells the user what to do if they're not
	
fi

clear

echo "**********************"
echo "*       MENU         *"
echo "*  PLEASE SELECT     *"
echo "*     1,2 OR 3       *"
echo "**********************"


OPTIONS="BACKUP RESTORE EXIT"
LIST="1)BACKUP 2)RESTORE 3)EXIT"   #menu options and list 

#menu option selection 
select option in $OPTIONS; do
if [ "$option" = "EXIT" ]; then
    echo "WELL I'M NOT USUALLY ONE FOR SPEECHES. SO, GOODBYE!"
    sleep 3
    clear
    exit
	#this options exits and ends the script

elif [ "$option" = "BACKUP" ]; then
    echo "BACKING UP FILES..."
    sleep 2
    tar cvpfz $DESTIN/backup.tgz $ROOT $ROOT_EXCLUDE_DIRS #creates the backup and sends it to the destination
    echo "BACKUP COMPLETE"                                #specified in the DESTIN variable and calls which directory to backup and which ones to exclude
    sleep 2                                                   
    echo $LIST

elif [ "$option" = "RESTORE" ]; then
    echo "RESTORING FILES..."
    sleep 2
    echo $BACKUP
    tar xvpfz $DESTIN/$BACKUP -C /  #restores the backup using the backup file created with root permission 
	sleep 2
    if [[ -e "/proc" ]]; then
            echo "$CREATE already exists! "
    else                                         #makes sure files aren't overwritten 
            mkdir $CREATE
            echo "$CREATE are created! "
    fi
    echo "RESTORE COMPLETE..."
    echo $LIST

else
    clearvi              #makes sure the user input is only 1, 2 or 3 
    echo "BAD INPUT!"
    echo "ENTER 1 , 2 or 3.."         
    echo $LIST
fi
done

#"help.ubuntu.com"
