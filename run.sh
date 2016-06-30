#!/bin/bash

# Environmental variables
FIND_PATH="${WERCKER_FIND_ZIP_PATH}"
FIND="${WERCKER_FIND_ZIP_FIND}"
ZIPNAME="${WERCKER_FIND_ZIP_ZIPNAME}"

if [ ! -d "${FIND_PATH}" ]; then
    fail "You need to set 'path' to a valid source path"
fi

if [ -z "${FIND}" ]; then
    fail "You need to set 'find' find command for files to compress into the archive"
fi

if [ -z "${ZIPNAME}" ]; then
    fail "You need to set 'zipname' filename  of the archive"
fi

dirname ${ZIPNAME} | xargs mkdir -p
pushd ${FIND_PATH}
eval "find ${FIND}"  | zip ${ZIPNAME} -@
ls ${ZIPNAME}
popd

