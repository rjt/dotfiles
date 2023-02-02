#!/bin/bash 

echo 'HELP:  flatpak run org.mozilla.firefox --help '
echo 'ProfileManager: pass in --ProfileManager'
echo '--createprofile NewProfileName'

flatpak run org.mozilla.firefox -P FireWall $@ &

echo "For iDrac, iLo, ipKVM, in ${HOME}/.config/icedtea-web/deployment.properties, set:"
echo "deployment.browser.path=$0"
