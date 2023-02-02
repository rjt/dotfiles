#!/usr/bin/env -S bash --norc --noprofile --verbose -x 

SSHFS_PKG_INSTALLED=$(dpkg-query --show sshfs | gawk '{ print $1}' )
echo "SSHFS INSTALLED: \"${SSHFS_PKG_INSTALLED}\""
[[ -n "${SSHFS_PKG_INSTALLED}" && 'sshfs' !=  "${SSHFS_PKG_INSTALLED}" ]]; echo -e "apt update; apt install sshfs\n exiting\n"; exit -1;

UAO='user_allow_other'
RV=$(cat /etc/fuse.conf | egrep -v '^#|^$' | egrep 'user_allow_other' )
[[ -n "${RV}" && 'user_allow_other' = "${RV}" ]]; echo "GOOD.  sshfs is enabled for root access of a users sshfs mount.  user_allow_other in /etc/fuse.conf on client executing sshfs."
[[ -z "${RV}" || 'user_allow_other' != "${RV}" ]]; echo "uncomment \"user_allow_other\" in /etc/fuse.conf on client executing sshfs."

set +x

