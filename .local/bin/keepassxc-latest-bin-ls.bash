#!/bin/bash 
#find $(flatpak info -l org.keepassxc.KeePassXC)/files/bin/ -ls
KeePassXC_FLATPAKBIN=$(flatpak info -l org.keepassxc.KeePassXC)/files/bin/
echo $KeePassXC_FLATPAKBIN
pushd $KeePassXC_FLATPAKBIN
ls -laNF
echo $KeePassXC_FLATPAKBIN
popd
#set +x
${HOME}/.local/share/flatpak/app/org.keepassxc.KeePassXC/current/active/files/bin/
