#!/bin/bash 
#export G_MESSAGES_DEBUG=all
echo 'HELP:  flatpak run org.remmina.Remmina --help '

flatpak run org.remmina.Remmina $@ &

echo "Config folder is NOT under ~/.config/ BUT "
echo "~/.var/app/org.remmina.Remmina/config/"
echo "~/.var/app/org.remmina.Remmina/data/ contain rdp.remmina files"
