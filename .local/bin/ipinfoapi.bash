#!/bin/bash

IP=${1:-209.201.32.134}
#regex=“^([A-Za-z0-9-]{1, 63}(?<!-)\\.)+[A-Za-z]{2, 6}$” 
#validate="(?=^.{5,254}$)(^(?:(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)"
validate="^([a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9]\.)+[a-zA-Z]{2,}$"


# Is it a domainname
if [[ $IP =~ $validate ]]; then 
   IP=$(nslookup -type=A $IP | grep -i address | awk '{print $2}')
fi


for ip in $IP
do
   if [[ $ip =~ [#]53 ]]; then
      continue
   fi

   echo
   echo "Checking: ${ip}"
   curl https://ipinfo.io/${ip}?token=$(gopass show ipinfo.io.API.accessToken)
done

#curl https://ipinfo.io/40.70.229.150/json?token=$(gopass show ipinfo.io.API.accessToken)
