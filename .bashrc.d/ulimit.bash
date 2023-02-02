#!/usr/bin/env -S bash
#Problems with running into the max file limit, 
#so increasing it from 1024 to 1024x16.
#Not convinced running this in a script to launch gives 
#flatpak firefox launch more files to work with.
OLDMAXOPENFILES=$(ulimit -n)
NEWMAXOPENFILES=$(( 1024 * 16))
# '20230122: ulimit -n says i had a limit of 1024 open files!'
# "Current ulimit -n open file limit is $OLDMAXOPENFILES"
if [[ $OLDMAXOPENFILES -le $NEWMAXOPENFILES ]]; then
#  echo "Increasing to $NEWMAXOPENFILES"
  ulimit -n $NEWMAXOPENFILES
fi;

#ulimit -n
