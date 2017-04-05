To create a single backup please use the backuprestore.sh script.
A menu will be provided with the choice of Backup, Restore, Exit.
 
The Back up will be a single back up, the backup will be overwritten 
each time the script is used and replaced with the new version.
Select 1 to Back Up.

To restore from the backup created select 2 for the restore option.
To exit the script slect 3 for exit.

To manually backup and create a new backup each time with version control, run
the backup.sh script 

To manually restore from a paticular backup enter the following command:

sudo tar xvpfz "path to backup" "backup name"

eg. sudo tar xvpfz /home/network/backup.050417.tgz 


 
