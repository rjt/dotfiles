sudo cp *mount /etc/systemd/system/
systemctl status home-user-repos.automount
systemctl status home-user-repos.mount
systemctl enable home-user-repos.automount
systemctl enable home-user-repos.mount
systemctl start home-user-repos.automount

for m in *mount; do 
  echo $m;
  systemctl status ${m};
  systemctl enable ${m};
  #? systemctl start ${m}; ?
done;

pushd ~/bin8/
findmnt

? systemctl start ${m}; ?
