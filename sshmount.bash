#!/bin/bash -x
#fusermount 
SSHFSMNTPNT=$1
if [[   -z $SSHFSMNTPNT ]]; then SSHFSMNTPNT=~/CERTAUTHMNT/; fi;
if [[ ! -d $SSHFSMNTPNT ]]; then mkdir $SSHFSMNTPNT; fi;
#sshfs rjt@freenas8.corp.eceo.us:/mnt/FreeNas8-POOL0/rjt/bin ~/FREENAS8SSH/
#sshfs rjt@certauth.network.corp.eceo.us:/home/rjt/CertTemp ~/CERTAUTHMNT fuse.sshfs (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000)
#sshfs rjt@certauth.network.corp.eceo.us:/home/rjt/CertTemp ~/CERTAUTHMNT (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000)
#sshfs rjt@certauth.network.corp.eceo.us:/home/rjt/CertTemp ~/CERTAUTHMNT -o rw,nosuid,nodev,uid=1001,gid=1001
sshfs rjt@certauth.network.corp.eceo.us:/home/rjt/CertTemp ${SSHFSMNTPNT} -o rw,nosuid,nodev,uid=1000,gid=1001
if [[ -x ${SSHFSMNTPNT} ]]; then 
 	if [[ ! -O ${SSHFSMNTPNT}/ECEO_ROOT_CA_20200426.cacert.pub.pem ]]; then 
	  echo "With NFS, different UID:GID breaks things.  ";
    echo "With fusermount SSHFS, it is generally OK even though a different effective uid."; 
	fi; 
	echo fusermount probably mounted OK; 
else 
	echo fusermount Probable Failure.; 
fi;

echo "     To unmount a fusermount, depends on the client OS:"
echo "          fusermount3 -u ${SSHFSMNTPNT} # Linux"
echo "          umount ${SSHFSMNTPNT}         # OS X, FreeBSD"
 

mount | egrep -i '(ssh|fuse)'
echo "IF FAILS TO MOUNT, try:  fusermount3 -u ${SSHFSMNTPNT}"
# fusectl on /sys/fs/fuse/connections type fusectl (rw,nosuid,nodev,noexec,relatime)
# gvfsd-fuse on /run/user/1000/gvfs type fuse.gvfsd-fuse (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000)
# portal on /run/user/1000/doc type fuse.portal (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000)
# rjt@certauth.network.corp.eceo.us:/home/rjt/CertTemp on /home/robert/CERTAUTHMNT type fuse.sshfs (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000)
