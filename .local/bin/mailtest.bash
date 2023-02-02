#!/usr/bin/env bash
set -x
mail -s "Hello from ${HOSTNAME} in ${PWD}" --return-address=robert@CORP.ECEO.us --to rob.townley@gmail.com, rjt@ECEO.us  $(cat /tmp/mailtest.txt)
