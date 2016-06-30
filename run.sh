#!/bin/bash

# Environmental variables
FIND="$WERCKER_FIND_ZIP_FIND"
ZIPNAME="$WERCKER_FIND_ZIP_ZIPNAME"

if [ -z "${FIND}" ]; then
    fail "You need to set 'find' find command for files to compress into the archive"
fi

if [ -z "${ZIPNAME}" ]; then
    fail "You need to set 'zipname' filename  of the archive"
fi

eval "find $FIND"  | zip $ZIPNAME -@

ls $ZIPNAME
