#!/bin/sh
#
# Make steaming hot dumps for each svn repository found under /var/svn.
#
# Leaves one dump for each repository, so it overwrites any previous dumps. This assumes
# that some other process is backing up these dumps, e.g. via snapshotting the volume.

SVN_BASE=/var/svn
DUMP_FOLDER="$SVN_BASE/BACKUPS"

fail()
{
  echo "FAIL: $*"
  exit 1
}

[ -d "$SVN_BASE" ] || fail "Missing '$SVN_BASE'"


[ -d "$DUMP_FOLDER" ] || mkdir -p "$DUMP_FOLDER"
[ -d "$DUMP_FOLDER" ] || fail "Can't create '$DUMP_FOLDER'"

cd "$SVN_BASE" || fail "Can't cd to '$SVN_BASE'"
for d in * ; do
  if [ -d "$SVN_BASE/$d/hooks" ] ; then
    BAK0="$DUMP_FOLDER/$d.0"
    BAK1="$DUMP_FOLDER/$d.1"
    echo "Backing up svn repository $d"
    if [ -d "$BAK1" ] ; then
      rm -rf "$BAK1" || fail "Can't remove $BAK1"
    fi
    if [ -d "$BAK0" ] ; then
      mv "$BAK0" "$BAK1" || fail "Can't rename $BAK0 to $BAK1"
    fi
    echo "Backing up $SVN_BASE/$d to $BAK0"
    svnadmin hotcopy "$SVN_BASE/$d" "$BAK0" || fail "Backup of svn repository $d failed"
    rm -rf "$BAK1"
  fi
done

