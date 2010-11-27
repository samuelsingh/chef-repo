#!/bin/bash
#
# This script is to be run on a machine with MMS installed, it looks for content
# packages output by the MMS and moves them to a central directory on the shared
# storage device. It then makes hard links for each package in a series of queue
# directories specified on the command line, which another script can use to 
# load them into map display deployments.
#
# Usage: move-mms-packages.sh <md-id1 ... md-idN>
#
# Each argument is an id of a Map Display deployment, the script expects a 
# subdirectory for each of these in the load-queue directory. The current
# ids are:
#
#   app, demo, integration, oz, csc, fujitsu, mod

DEBUG=
APP=`basename $0`
PKG_SRC_DIR=/var/mms/content-out/md-packages
PKG_DST_DIR=/var/shared/content/md-packages
PKG_LOAD_DIR=/var/shared/content/load-queue

IDS="$*"

warn()
{
	echo "$APP: WARNING: $*"
}

fail()
{
	echo "$APP: FAIL: $*"
	exit 1
}

debug()
{
    [ -n "$DEBUG" ] && echo "$APP: DEBUG: $*"
}

linkpkg()
{
	SRC=$1
	DEST=$2
        debug "ln $SRC $DEST"
        ln "$SRC" "$DEST" || warn "Could not link package : ln $SRC $DEST"
}

# MD contentloader linkage
linkmd()
{
	PKG=$1
	ID=$2
	debug "Linking package $PKG to queue for load to $ID"
	linkpkg "$PKG_DST_DIR/$PKG" "$PKG_LOAD_DIR/$ID"
}

# HG contentloader linkage
linkhg()
{
	PKG=$1
	ID=$2
       
	debug "Checking for packages to load to Healthguides"
 
        # E&W package
        unzip -p "$PKG_DST_DIR/$PKG" package.xml | grep "NHS England and Wales" | grep -v empty > /dev/null \
        && debug "$PKG is an E&W package, so linking it to $PKG_LOAD_DIR/$ID/local" \
        && linkpkg "$PKG_DST_DIR/$PKG" "$PKG_LOAD_DIR/$ID/local"
	    
        # Root package
        unzip -p "$PKG_DST_DIR/$PKG" package.xml | grep "International" | grep -v empty > /dev/null \
        && debug "$PKG is an International package, so linking it to $PKG_LOAD_DIR/$ID/root" \
        && linkpkg "$PKG_DST_DIR/$PKG" "$PKG_LOAD_DIR/$ID/root"
}

remspaces()
{
    OLDFILE=$@
    NEWFILE=`echo "$OLDFILE" |  sed 's/[^A-Za-z0-9_.]/_/g'`

    if [ "$NEWFILE" != "$OLDFILE" ] ; then
        mv "$OLDFILE" "$NEWFILE"
    fi

    echo $NEWFILE
}

# Check that all of the arguments are valid ids
[ -z "$IDS" ] && fail "No arguments given"
BAD=
for i in $IDS ; do
	if [ ! -d "$PKG_LOAD_DIR/$i" ] ; then
		warn "ID $i does not look right, there is no directory $PKG_LOAD_DIR/$i"
		BAD=1	
	fi
done
[ -z "$BAD" ] || fail "Not running until the deployment ids are sorted"

	
# Iterate over all zip files in the directory the MMS leaves them in
file=`ls $PKG_SRC_DIR/*.zip 2> /dev/null`
if [ -n "$file" ] ; then

	cd $PKG_SRC_DIR
	for f in *.zip ; do

		# Make sure the zip is complete, otherwise it may still be in process

		/usr/bin/zip -qT "$f"
		if [ "$?" = "0" ] ; then

		# Remove spaces from the package name
		f=$(remspaces "$f")

			# It looks like a finished package, move it to shared storage

			if [ ! -f "$PKG_DST_DIR/$f" ] ; then
				debug "Handling package $f"
				debug "===================================================="
				debug "mv $f $PKG_DST_DIR/"
				mv "$f" $PKG_DST_DIR/ || fail "Could not move file: mv $f $PKG_DST_DIR/"

				# Link the package into each queue directory in the id list
				for d in $IDS ; do
					if [ "$d" == "healthguides" ] ; then
						linkhg "$f" "$d"
					else
						linkmd "$f" "$d"
					fi
				done
				debug "===================================================="
			else
				warn "File $PKG_DST_DIR/$f already exists, please correct"
			fi
		else
			warn "Package $f is incomplete or bad, not moving it"
		fi

	done
else
	warn "No packages in $PKG_SRC_DIR to move"
fi

NEWFILE=`echo "$OLDFILE" |  sed 's/[^A-Za-z0-9_.]/_/g'`

if [ "$NEWFILE" != "$OLDFILE" ] ; then

  if [ $FILEPATH ] ; then
    mv "$FILEPATH"/"$OLDFILE" "$FILEPATH"/"$NEWFILE"
  else
    mv "$OLDFILE" "$NEWFILE"
  fi

fi
