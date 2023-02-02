#!/usr/bin/env -S bash
KEEPASSXC_PROXY=$(find /home/robert/.local/ -iname '*keepassxc*proxy*')
echo "KEEPASS_PROXY has a dot in SNAPS.   UNDERLINE IN flatpak? "
echo "${KEEPASSXC_PROXY}"
