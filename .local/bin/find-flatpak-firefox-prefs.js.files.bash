#!/bin/bash
flatpak run --command=/bin/bash org.mozilla.firefox
echo "Attempts to find systemwide wide preference files"
echo "in flatpak firefox containers."

pushd /app/lib/firefox/
for D in $(find . -type d); do 
  echo $D; 
  find "${D}" -iname '*.js*' | grep -E -v '(.*langpack-*)' ; 
  echo ""; 
done; 
echo "Default flatpak firefox preferences files.js such"
echo "as prefs.js and others"
echo "${PWD}"; 
