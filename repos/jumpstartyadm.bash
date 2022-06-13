#!/bin/bash

#Once yadm and j2cli are installed, then .gitconfig is made dynamically.
#But until then, we need an egg to make a chicken.
git config --global --add user.name "Rob Townley"
git config --global --add user.email rob.townley+${HOSTNAME}@gmail.com 

if [[ ! -e ${HOME}/repos ]]; then mkdir ${HOME}/repos; fi;
pushd ${HOME}/repos
git clone https://github.com/TheLocehiliosan/yadm
sudo cp /${HOME}/repos/yadm/yadm      /usr/local/bin/
sudo cp /${HOME}/repos/yadm/bootstrap /usr/local/bin/
sudo cp /${HOME}/repos/yadm/yadm.1    /usr/local/man/man1
sudo cp /${HOME}/repos/yadm/completion/bash/yadm  /etc/bash_completion.d/
#source ${HOME}/repos/yadm/completion/bash/yadm
source /etc/bash_completion.d/yadm


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

