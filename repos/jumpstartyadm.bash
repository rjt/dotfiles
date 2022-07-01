#!/bin/bash

#Once yadm and j2cli are installed, then .gitconfig is made dynamically.
#But until then, we need an egg to make a chicken.
if [[ -z $(git config --global --get user.name) ]]; then 
  git config --global --add user.name "Rob Townley";
fi;
if [[ -z $(git config --global --get user.email) ]]; then
  git config --global --add user.email rob.townley+${HOSTNAME}@gmail.com;
fi;
if [[ -z "$(git config --global --get init.defaultBranch)" ]]; then
  git config --global --add init.defaultBranch main;
fi;
if [[ "main" -ne "$(git config --global --get init.defaultBranch)" ]]; then
	echo "GitHub uses a default branch name of \"main\", the system default here";
	echo "on ${HOSTNAME} is \"$(git config --system --get init.defaultBranch)\"";
fi;

if [[ ! -e ${HOME}/repos ]]; then mkdir ${HOME}/repos; fi;
pushd ${HOME}/repos
if [[ ! -x ${HOME}/repos/yadm/yadm ]]; then
	git clone https://github.com/TheLocehiliosan/yadm;
fi;
sudo cp ${HOME}/repos/yadm/yadm      /usr/local/bin/
#sudo cp ${HOME}/repos/yadm/bootstrap /usr/local/bin/
if [[ ! -e /opt/man/ ]]; then sudo mkdir -p /opt/man/; fi;
if [[ ! -e /usr/local/man/man1/ ]]; then 
	echo '/usr/local/man/man1 does not exist, creating.';
	sudo mkdir -p /usr/local/man/man1;
fi;
sudo cp ${HOME}/repos/yadm/yadm.1    /usr/local/man/man1
#sudo cp ${HOME}/repos/yadm/yadm.1    /opt/man/man1  #DID NOT WORK.
sudo mandb   #update man pages in manpath --global
sudo cp ${HOME}/repos/yadm/completion/bash/yadm  /etc/bash_completion.d/
#source ${HOME}/repos/yadm/completion/bash/yadm
source /etc/bash_completion.d/yadm

if [[ -n $(command -v rpm) ]]; then 
  echo "detected rpm, so will sudo pip install j2cli"
  sudo pip install j2cli;   #j2
elif [[ -n $(command -v apt) ]]; then
  echo "detected apt, so assuming in repos    sudo apt install -y j2cli"
  sudo apt install -y j2cli;
fi;

# robert@itwooddesk:~$ yadm init
# hint: Using 'master' as the name for the initial branch. This default branch name
# hint: is subject to change. To configure the initial branch name to use in all
# hint: of your new repositories, which will suppress this warning, call:
# hint: 
# hint: 	git config --global init.defaultBranch <name>
# hint: 
# hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
# hint: 'development'. The just-created branch can be renamed via this command:
# hint: 
# hint: 	git branch -m <name>
# Initialized empty shared Git repository in /home/robert/.local/share/yadm/repo.git/

