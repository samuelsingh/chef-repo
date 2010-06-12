#!/bin/bash

DIR=`dirname $0`
CONFIG="$DIR/config"
HLP="$DIR/help"
CLASSPATH=""
USER="sysadmin"

for JAR in $DIR/lib/*.jar; do
    CLASSPATH="$CLASSPATH:$JAR"
done

COMMAND="java -Xms512M -Xmx512M -cp \"$CONFIG:$HLP:$CLASSPATH\" com.oyster.mom.contentserver.batch.BatchTools $@"

if [ $(id -u) = "0" ]; then
    su $USER -c "$COMMAND"
else
    echo "This command needs to be executed as root, trying sudo..."
    sudo su $USER -c "$COMMAND"
fi