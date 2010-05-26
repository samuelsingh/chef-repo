#!/bin/bash

CONFIG=config
CLASSPATH=""

for JAR in lib/*.jar; do 
    CLASSPATH="$CLASSPATH:$JAR"
done

java -Xmx1000m -cp "$CONFIG:$CLASSPATH" com.oyster.mom.contentserver.script.CsTools $*

