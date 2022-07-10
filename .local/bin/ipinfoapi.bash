#!/bin/bash
if [[ -z $1 ]]; then 
  IP=209.201.32.134; 
else 
  IP = $1;
fi;
curl ipinfo.io/${IP}?token=$(gopass show ipinfo.io.API.accessToken)
