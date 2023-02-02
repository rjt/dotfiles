#!/usr/bin/env bash
T=$1
ORIG=$PS1
TITLE="\e]2;$T\a"
PS1="${ORIG}\[${TITLE}\]"
echo "Terminal tab title changed to $T"
echo "This script must be sourced, not executed."
