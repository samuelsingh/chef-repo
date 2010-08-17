#!/bin/bash
#set variables 
export EC2_PRIVATE_KEY=/root/.ec2/pk-OTTZ2OZ3UKDVMK7335FOBQ6W2VAVBOI5.pem
export EC2_CERT=/root/.ec2/cert-OTTZ2OZ3UKDVMK7335FOBQ6W2VAVBOI5.pem
export EC2_URL=https://ec2.eu-west-1.amazonaws.com
LOG_FILE=/var/log/mddb01_backup.log

if [ -z "$1" ]; then 
echo "usage: ./mddb01_ebs.sh <VOLUME ID> <No of Snapshots to retain>"

exit

fi

echo "Backing up volume $1" >> $LOG_FILE
echo "********** Starting backup for volume $1..." >> $LOG_FILE
ec2-create-snapshot $1 >> $LOG_FILE
php /usr/local/bin/remove_old_snapshots.php -v $1 -n $2 >> $LOG_FILE
# Log to file
echo "********** Ran Snapshot: $(date +'%Y-%m-%d %H:%M:%S')" >> $LOG_FILE
echo "Completed" >> $LOG_FILE

