#!/bin/sh

# Script to take a snapshot of a given ebs volume, keeping a specified number
# of historical snapshots archived.

# AWS variables
export EC2_PRIVATE_KEY=/root/.ec2/pk-OTTZ2OZ3UKDVMK7335FOBQ6W2VAVBOI5.pem
export EC2_CERT=/root/.ec2/cert-OTTZ2OZ3UKDVMK7335FOBQ6W2VAVBOI5.pem
export EC2_URL=https://ec2.eu-west-1.amazonaws.com

LOG_FILE=/var/log/ebs_snapshot.log

USAGE="$0 <ebs_volume_id> <number_to_retain>"

if [ -z "$2" ]; then 
  echo "Missing arguments. Usage: $USAGE"
  exit
fi

VOL="$1"
RETAIN="$2"

echo "$(date +'%Y-%m-%d %H:%M:%S') Taking snapshot of volume $VOL" >> $LOG_FILE
ec2-create-snapshot "$VOL" >> $LOG_FILE 2>&1
echo "Removing old snapshots of volume $VOL" >> $LOG_FILE
php /usr/local/bin/remove_old_snapshots.php -v "$VOL" -n "$RETAIN" >> $LOG_FILE 2>&1
echo "$(date +'%Y-%m-%d %H:%M:%S') Snapshot of volume $VOL complete" >> $LOG_FILE

