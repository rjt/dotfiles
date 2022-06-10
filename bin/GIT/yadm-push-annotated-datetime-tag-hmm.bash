#!/bin/bash
DRYRUN=0  #Put 0 here to actually run, anything else does nothing except print variables.
MYHOST=`hostname -s`;
echo Make an annotated tag out of the current date and time and $MYHOST $USER.
echo Must do yadm add . before running this.

GIT_COMMITTER_DATE=`date +%Y%m%d%H%M%S`
strTag="${GIT_COMMITTER_DATE}-${MYHOST}-${USER}"
echo about to yadm tag -a "${strTag}"
if [[ 0 -eq $DRYRUN ]]; then 
  yadm tag -a "${strTag}"; 
  yadm commit;
  echo yadm push --follow-tags only pushes annotated tags.  Requires yadm 1.8.3;
  yadm push --follow-tags;
else echo DRYRUN, nothing tagged nor commmited nor pushed.
fi;

