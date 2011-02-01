if [ "$MOM_CONTENTLOADER_HOME" = "" ]; then
	# figure out the contentloader home
	MOM_CONTENTLOADER_HOME=.
	if [ ! -e $MOM_CONTENTLOADER_HOME/bin/contentloader.sh ]; then
		MOM_CONTENTLOADER_HOME=..
		if [ ! -e $MOM_CONTENTLOADER_HOME/bin/contentloader.sh ]; then
			echo The MOM_CONTENTLOADER_HOME environment variable is not defined correctly
			echo This environment variable is needed to run this program
			exit
		fi
	fi
fi

CLASSPATH="$MOM_CONTENTLOADER_HOME/config:$MOM_CONTENTLOADER_HOME/xml"

for x in `ls $MOM_CONTENTLOADER_HOME/lib/*.jar`; 
do
	CLASSPATH="$CLASSPATH:$x"
done

while [ ! "$1" = "" ]; do
	CMD_LINE_ARGS="$CMD_LINE_ARGS $1"
	shift
done

$JAVA_HOME/bin/java -cp $CLASSPATH -Xmx1024M com.oyster.mom.contentloader.ContentLoader $CMD_LINE_ARGS
