#!/usr/bin/env bash
echo "https://github.com/TheLocehiliosan/yadm/blob/master/yadm.md#examples"
echo "ToDo: Use the file command to find all private keys under $HOME/.ssh/ "
echo "      Add the ~/.ssh/config file"
echo "      gopass "
echo " /home/robert/.ssh/id_rsa:     OpenSSH private key"
echo " /home/robert/.ssh/id_rsa.pub: OpenSSH RSA public key"
echo "Searches for ssh private keys and adds their file pattern"
EncryptListFile="${HOME}/.config/yadm/encrypt"
echo " to ${EncryptListFile}"

alreadyAddedToList(){
  #Objective:  See if the file is already in the list
  #grep or sed or Regular Expression the existence of the 
  # file in $EncryptListFile
  echo "I DO NOTHING!"
}

addPrivateSSHkeys(){
for F in $(ls ~/.ssh/*); do 
  if [[ 'OpenSSH private key' == $(file $F | sed 's/^.*: //' ) ]]; then 
    echo $F >> ${HOME}/.config/yadm/encrypt;   
  fi;
done;
}


echo ${HOME}/.ssh/config >> ${HOME}/.config/yadm/encrypt

echo "yadm encrypt creates ~/.local/share/yadm/archive"
yadm encrypt;
echo " ~/.local/share/yadm/archive "
yadm add ${HOME}/.local/share/yadm/archive;
yadm commit;
