#!/bin/bash -x

echo "$VERSION CAN ONLY BE MAJOR.MINOR, nothing else."

if [[ -z "${1}" ]]; then VERSION='2.4';   # VERSION=${1://'2.4'}
else VERSION=$( echo "${1}" | cut -d'.' -f1,2 );
fi;

echo "VERSION MAJOR.MINOR ${VERSION}"; 
if   [[ 1 -eq $( echo " ( ${VERSION} <= 2.4 ) " | bc  ) ]] ; then 
  echo "less than or equal to  2.4"; 
elif [[ 1 -eq $( echo " ( ${VERSION} >= 2.6 ) "  | bc ) ]]; then 
  echo "greater or equal to 2.6"; 
fi;
