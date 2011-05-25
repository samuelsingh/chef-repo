#!/bin/bash

DIR=`dirname $0`
CONFIG="$DIR/config"
HLP="$DIR/help"
CLASSPATH=""
USER="root"

# The above parameters can be overriden by a custom configuration file, if it exists
[ -f "$CONFIG/cs-bt.conf" ] && source "$CONFIG/cs-bt.conf"

for JAR in $DIR/lib/*.jar; do
    CLASSPATH="$CONFIG:$HLP:$CLASSPATH:$JAR"
done

# Fix to make the -h / --help switch behave correctly.
# Currently, help is only triggered when no parameters are given
# Logged as IST-7142

if [ "$1" = "--help" ] || [ "$1" = "-h" ] ; then
    COMMAND="java -Xms512M -Xmx512M -cp $CLASSPATH com.oyster.mom.contentserver.batch.BatchTools"
else
    COMMAND="java -Xms512M -Xmx512M -cp $CLASSPATH com.oyster.mom.contentserver.batch.BatchTools $@"
fi


if [ $(id -u) = "0" ] ; then
    su $USER -c "$COMMAND"
elif [ $(id -un) = $USER ] ; then
    exec $COMMAND
else
    echo "This command needs to be executed as root, trying sudo..."
    sudo su $USER -c "$COMMAND"
fi