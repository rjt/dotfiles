#!/bin/bash
#sshfs rjt@freenas8.corp.eceo.us:/mnt/FreeNas8-POOL0/rjt/bin ~/FREENAS8SSH/
sshfs rjt@certauth.network.corp.eceo.us:/home/rjt/CertTemp ~/CERTAUTHMNT/ 
if [[ -x ~/CERTAUTHMNT/ ]]; then 
 	if [[ ! -O ~/CERTAUTHMNT/ECEO_ROOT_CA_20200426.cacert.pub.pem ]]; then 
	  echo "Good, probably a diff uid."; 
	fi; 
	echo probably mounted OK; 
else 
	echo Probable Failure.; 
fi;

echo "     To unmount, depends on the client OS:"
echo "          fusermount3 -u mountpoint   # Linux"
echo "          umount mountpoint           # OS X, FreeBSD"
 

