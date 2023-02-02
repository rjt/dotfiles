#!/bin/bash -x
READONLY=' --readonly '
READONLY=''
TESTPASSPHRASE=' --test-passphrase '
TESTPASSPHRASE=' --test-passphrase '
REFRESH=' --refresh '   #MAY NOT WORK WITH BITLOCKER!  Refreshes an active device with new set of parameters.  man 8 cryptsetup-refresh
VERBOSE=' --verbose '
DEBUG=' --debug ' 
FVEK_FILE='/home/mint/sshfs/drive.txt' # FVEK=FullVolumeEncryptionKey 
KEYFILECOMMAND2dot6=' --volume-key-file '
KEYFILECOMMAND2dot4=' --master-key-file '
KEYFILECOMMAND="${KEYFILECOMMAND2dot4}"

PART_ENCRYPTED='/dev/nvme0n1p4'
PART_OPENED='nvme0n1p4'


echo "cryptsetup losetup dminfo /dev/dm-X ...."
echo "As of 2.6, --master-key-file is an obsolete alias for --volume-key-file (WELL AT LEAST IN ArchLinux.org/man/cryptsetup-open.8.en version 2.6) "
cryptsetup --version
VERSION=$(cryptsetup --version | cut -d" " -f2 | cut -d'.' -f1,2 )
if [[ $( "  2.6 <= ${VERSION}  " | bc ) ]]; then 
  echo "Found cryptsetup version 2.6 or higher";  
  KEYFILECOMMAND="${KEYFILECOMMAND2dot6}"
elif [[ $( "2.4 => ${VERSION}" | bc ) ]]; then 
  echo "Found cryptsetup version 2.4 or lower";  
  KEYFILECOMMAND="${KEYFILECOMMAND2dot4}"
else echo "SHOULD NEVER GET HERE BUT STRINGS OF FLOATS ARE NOWHERE NEAR INTEGERS!"
fi;
echo "Will use ${KEYFILECOMMAND}"

exit -1
cryptsetup $VERBOSE $DEBUG open --type=bitlk --master-key-file "${FVEK_FILE}" $READONLY $TESTPASSPHRASE $PART_ENCRYPTED $PART_OPENED 
