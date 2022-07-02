alias ip='ip --color=auto'
alias ipaft='ip --brief a show'
if [[ ! -x /usr/local/bin/yadm ]]; then 
  if [[ -x ${HOME}/repos/yadm/yadm ]]; then 
    alias yadm=${HOME}/repos/yadm/yadm
    echo "Consider adding copying yadm to /usr/local/bin/ ";
  fi;
elif [[ /usr/local/bin/yadm -ot "${HOME}/repos/yadm/yadm" ]]; then 
  echo "Using outdated yadm in /usr/local/bin/yadm";
  ls -laNF /usr/local/bin/yadm  ${HOME}/repos/yadm/yadm 
fi;

### if [[ ! -x /usr/local/bin/yadm ]]; then echo "using usr local bin yadm "; else echo  "home yadm yadm "; fi;
