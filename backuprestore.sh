#!/bin/bash

ROOT="/home/network"
ROOT_EXCLUDE="--exclude=/dev --exclude=/proc --exclude=/sys --exclude=/tmp --exclude=/run --exlucde=/mnt --exlcude=/media --exlude=/lost+found"
DESTIN="/home/network/Mylabs"
BACKUP="backup.tgz"
CREATE="/dev /proc /sys /temp /run /mnt /media "

if [ "$USER" != "root" ]; then
    echo "You are not the root user"
    echo "To use backup please use: sudo backup"
    exit
fi

clear

echo "************************************************"
echo "********* Backup Menu **************************"
echo "************************************************"

OPTIONS="BACKUP RESTORE EXIT"
LIST="1)BACKUP 2)RESTORE 3)EXIT"

select opt in $OPTIONS; do
if [ "$opt" = "EXIT" ]; then
    echo "GOODBYE!"
    sleep 3
    clear
    exit

elif [ "$opt" = "BACKUP" ]; then
    echo "BACKING UP FILES..."
    sleep 2
    tar cvpfz $DESTIN/backup.tgz $ROOT $ROOT_EXCLUDE_DIRS
    echo "BACKUP COMPLETE"
    sleep 2
    echo $LIST

elif [ "$opt" = "RESTORE" ]; then
    echo "RESTORING FILES..."
    sleep 2
    echo $BACKUP
    tar xvpfz $DESTIN/$BACKUP -C /
    sleep 2
    if [[ -e "/proc" ]]; then
            echo "$CREATE already exists! "
    else
            mkdir $CREATE
            echo "$CREATE are created! "
    fi
    echo "RESTORE COMPLETE..."
    echo $LIST

else
    clearvi 
    echo "BAD INPUT!"
    echo "ENTER 1 , 2 or 3.."
    echo $LIST
fi
done
