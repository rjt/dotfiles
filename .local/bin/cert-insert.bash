#!/bin/bash -x

echo https://askubuntu.com/questions/244582/add-certificate-authorities-system-wide-on-firefox
certificateFile="MyCa.cert.pem"
certificateName="MyCA Name" 
for certDB in $(find  ~/.mozilla* ~/.thunderbird -name "cert8.db")
do
  certDir=$(dirname ${certDB});
  logger --rfc5424 --tag $0 "${HOSTNAME}: mozilla certificate install of \"${certificateName}\" in \"${certDir}\""
  certutil -A -n "${certificateName}" -t "TCu,Cuw,Tuw" -i ${certificateFile} -d ${certDir}
done

echo "ToDo: automatically download from http://certauth.corp.eceo.us/ca/"
#logger --rfc5424 --tag $0     "logger $HOSTNAME rfc5425 testing"
