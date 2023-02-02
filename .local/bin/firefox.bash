#!/usr/bin/env -S bash -x
LAUNCHFOLDER="${HOME}/tmp/robert/LAUNCH-firefox-flatpak-dir/"
if [[ ! -d "${LAUNCHFOLDER}" ]]; then 
  mkdir -p "${LAUNCHFOLDER}"; 
  sync; 
  sync --filesystem "${LAUNCHFOLDER}"; 
fi;
RV=pushd "${LAUNCHFOLDER}" 
if [[ 0 -eq $RV ]]; then echo "pushd returned zero RV $RV"; 
elif [[ 0 -lt $RV ]]; then echo "pushd returned > zero RV $RV";
elif [[ 0 -gt $RV ]]; then echo "pushd returned < zero RV $RV";
else echo "SHOULD NEVER EVER EVER GET HERE!"
fi;

function assertPushd {
  if [[ "${PWD}" -ne "${LAUNCHFOLDER}" ]]; then 
    echo "IS FLATPAK POPPING US OUT? NOT CHANGE!"; 
    echo "Currently in \"${PWD}\", but should be \"${LAUNCHFOLDER}\" ";
  fi;
}
assertPushd

OLDMAXOPENFILES=$(ulimit -n)
NEWMAXOPENFILES=$(( 1024 * 16))
echo '20230122: ulimit -n says i had a limit of 1024 open files!'
echo "Current ulimit -n open file limit is $OLDMAXOPENFILES"
if [[ $OLDMAXOPENFILES -lt $NEWMAXOPENFILES ]]; then 
  echo "Increasing to $NEWMAXOPENFILES"
  ulimit -n $NEWMAXOPENFILES
fi;
echo 'HELP:  flatpak run org.mozilla.firefox --help '
echo 'ProfileManager: pass in --ProfileManager'
echo 'To create a new ff profile, pass in   --createprofile'
MAN_FLATPAK_INFO=$(cat << EOF
echo "man --pager=cat flatpak-info | egrep -A9 '(-l|--show-location)' "
       -l, --show-location
           Show the on-disk location of the app or runtime. See the examples below.

       -v, --verbose
           Print debug information during command processing.

       --ostree-verbose
           Print OSTree debug information during command processing.

EXAMPLES
--
       $ tree `flatpak info -l org.gnome.Builder//master`/files
       $ find $(flatpak info --show-location org.keepassxc.KeePassXC)/files/bin/ -ls

SEE ALSO
       flatpak(1), flatpak-install(1), flatpak-update(1)

flatpak                  FLATPAK INFO(1)

#if [[ $(flatpak info -l org.mozilla.firefox)/files/bin/firefox ]]; then 
EOF
)

if [[ $(flatpak info --show-location org.mozilla.firefox)/files/bin/firefox ]]; then 
  echo "flatpak firefox found"; 
else 
  echo "No org.mozilla.firefox flatpak / files/bin/firefox found"; 
  echo "May be a different kind of container such as a snap or ..."
  echo "Or is it an old fashioned apt / rpm install?"
  echo "exiting ..."
  exit  -1 ;
fi;

if [[ -z ${1} ]]; then  
  profilename="default-release";
  echo "No parameters passed-in, so launching default profile $profilename"
  flatpak run org.mozilla.firefox -P $profilename &
elif [[ -n ${1} ]]; then 
  echo "Launching with $@"
  flatpak run --verbose org.mozilla.firefox $@ &
else 
  echo "How did we get here?"
  echo "Parameters are =  $@"
fi;

assertPushd
echo "Using \"${LAUNCHFOLDER}\" and StarShip to identify the launching terminal instance."
#pushd "${LAUNCHFOLDER}"
MAXOPENFILESTEST=$(ulimit -n)
echo "ulimit -n is now  from a subshell: $MAXOPENFILESTEST " 
