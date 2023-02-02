#!/usr/bin/env -S bash -x
pwd
LAUNCHFOLDER=~/tmp/$(basename $0)
if [[ ! -d $LAUNCHFOLDER ]]; then mkdir -p "$LAUNCHFOLDER"; fi;
pwd
pushd "${LAUNCHFOLDER}"
pwd
echo "Are we still in \"${LAUNCHFOLDER}\"? "
pwd
