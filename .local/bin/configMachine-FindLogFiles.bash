for F in $(find /mnt/dsNas8/pcTechsOneDrive -iname '*20221213*'); do
  echo ' ';
  file $F;
  cat $F;
  echo ' ';
done;
