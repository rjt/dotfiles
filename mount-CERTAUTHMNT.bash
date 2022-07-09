#!/bin/bash
#fusermount 
#sshfs rjt@certauth.network.corp.eceo.us:/home/rjt/CertTemp /home/robert/CERTAUTHMNT fuse.sshfs (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000)
#sshfs rjt@certauth.network.corp.eceo.us:/home/rjt/CertTemp /home/robert/CERTAUTHMNT (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000)
sshfs rjt@certauth.network.corp.eceo.us:/home/rjt/CertTemp /home/robert/CERTAUTHMNT -o rw,nosuid,nodev,uid=1001,gid=1001
#echo 'mount | egrep -i ssh >> ~/mount-CERTAUTHMNT.bash'
