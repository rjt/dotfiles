#!/usr/bin/env bash

# Below variables are Copied from keepassxc-wrapper
# Chromium, Google Chrome, Vivaldi & Brave
readonly arg1='chrome-extension://oboonakemofpalcgghocfoadofidjkkk'
# Firefox & Tor Browser
readonly arg2='keepassxc-browser@keepassxc.org'
ARGS="${arg2} $@"
#flatpak run --command=flat 
echo "ARGS are ${ARGS}"
exec /usr/bin/flatpak --verbose run --branch=stable --arch=x86_64 --command=keepassxc-proxy org.keepassxc.KeePassXC "${ARGS}"
