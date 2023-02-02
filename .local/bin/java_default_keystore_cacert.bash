#!/bin/bash 
echo '"changeit" is the worldwide default java keystore cacert password.'
echo '"\$JAVA_HOME" is \$JAVA_HOME/bin/java '
echo 'So if $JAVA_HOME is undefined, it can be found by:'
set +x
JAVA_HOME=$(readlink -f $(readlink -f $(which java) | sed "s:/bin/java::"))
echo "JAVA_HOME is now $JAVA_HOME"
echo changeit | keytool -list -keystore $(readlink -f $(readlink -f $(which java) | sed "s:/bin/java::")/lib/security/cacerts)
echo ""

set +x
echo "Undocumented by 'keytool -help', but 'keytool -list -cacarts' works as well."

echo << EOROB
"Amir Boroumand: The Java Developer's Guide to SSL Certificates"
"https://medium.com/@codebyamir/the-java-developers-guide-to-ssl-certificates-b78142b3a0fc"
Add a certificate to the truststore

Adding a certificate to the truststore is necessary if we want to trust a certificate issued from a CA not present in the bundled truststore.

keytool -import -trustcacerts -file [certificate] -alias [alias] -keystore $JAVA_HOME/lib/security/cacerts
EOROB

set +x

if [ "Java KeyStore" = "$(file $(readlink -f ${JAVA_HOME}/lib/security/cacerts) | cut -d':' -f 2 | sed 's/^ //' )" ]; then 
  echo "Found an actual \"Java KeyStore\" file at \"${JAVA_HOME}/lib/security/cacerts\" !"; 

  MYCERTFILE="$1"
  MYCERTALIAS="$2"
  if [ -n "${MYCERTFILE}" -a -n "${MYCERTALIAS}" ]; then 
    echo "Will now add ${MYCERTFILE} and its alias ${MYCERTALIAS} to the "
    echo "JAVA CERT STORE at:  ${JAVA_HOME}/lib/security/cacerts"
    echo changeit | keytool -import -trustcacerts -file "${MYCERTFILE}"  -alias "${MYCERTALIAS}" -keystore $JAVA_HOME/lib/security/cacerts
  else echo "No file and alias passed in, skipping adding to keystore"
  fi;

  else echo 'COULD NOT FIND "Java KeyStore" mime-type'; 
fi;
