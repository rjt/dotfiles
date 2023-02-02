#!/usr/bin/env bash
CSRFILE=${1:-~/CERTAUTHMNT/IO/WORKS/8141erpoe5.csr}
if [[ -e "${CSRFILE}" ]]; then  
  openssl req -in "${CSRFILE}" -noout -text
else
  echo "\"${CSRFILE}\" does not exist?"
fi;
