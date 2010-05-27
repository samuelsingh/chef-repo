#!/bin/bash

CONFIG=config
CLASSPATH=""
USER="tomcat"
DIR=`dirname $0`

for JAR in $DIR/lib/*.jar; do
    CLASSPATH="$CLASSPATH:$JAR"
done

COMMAND="java -Xmx1000m -cp \"$CONFIG:$CLASSPATH\" com.oyster.mom.contentserver.script.CsTools $*"

if [ $(id -u) = "0" ]; then
    su $USER -c "$COMMAND"
else
    echo "This command needs to be executed as root, trying sudo..."
    sudo su $USER -c "$COMMAND"
fi