#!/bin/bash

DIR=`dirname $0`
CONFIG=$DIR/config
CLASSPATH=""
USER="tomcat"

for JAR in $DIR/lib/*.jar; do
    CLASSPATH="$CONFIG:$CLASSPATH:$JAR"
done

COMMAND="java -Xmx1000m -cp $CLASSPATH com.oyster.mom.contentserver.script.CsTools $*"

if [ $(id -u) = "0" ]; then
    su $USER -c "$COMMAND"
elif [ $(id -un) = $USER ] ; then
    exec $COMMAND
else
    echo "This command needs to be executed as root, trying sudo..."
    sudo su $USER -c "$COMMAND"
fi