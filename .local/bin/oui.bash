#!/bin/bash
echo https://www.linux.com/blog/handy-2-line-script-lookup-network-card-manufacturer-mac-address
OUI=$(echo ${1//[:.- ]/} | tr "[a-f]" "[A-F]" | egrep -o "^[0-9A-F]{6}")
echo $OUI
grep $OUI $(lynx -dump http://standards.ieee.org/regauth/oui/oui.txt)

