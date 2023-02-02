export GPG_SHORT_PRIVATE_KEY=$(gpg2 --list-secret-keys --keyid-format=short robert@ECEO.us | egrep -i "(sec[ \t]*rsa4096/)" | cut -d'/' -f 2 | cut -d ' ' -f1 )
export GPG_SHORT_PRIVATE_KEY_CMD_TO_EVAL='gpg2 --list-secret-keys --keyid-format=short robert@ECEO.us | egrep -i "(sec[ \t]*rsa4096/)" | cut -d"/" -f 2 | cut -d " " -f1 '
#alias myshortPrivateGPGkey='gpg2 --verbose --fingerprint --keyid-format short  robert@ECEO.us | egrep -i "(pub[ \t]*rsa4096/)" | cut -d "/" -f 2 | cut -d " " -f1  '
alias myshortPrivateGPGkey='gpg2 --verbose --list-secret-keys --keyid-format=short  $EMAIL | egrep -i "(pub[ \t]*rsa4096/)" | cut -d "/" -f 2 | cut -d " " -f1  '
