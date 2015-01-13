#!/bin/sh
#
for HOSTPORT in $1; do 
    cert_data=""
    IFS=''
    echo "" | openssl s_client -connect ${HOSTPORT} -showcerts 2>/dev/null |\
    sed -ne "/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p" | \
    while read line; do 
      case $line in
        "-----BEGIN CERTIFICATE-----")
          cert_data=$line
          ;;
        "-----END CERTIFICATE-----")
          (echo $cert_data; echo $line) | openssl x509 -noout -issuer -subject -dates -serial -issuer
          echo ""
          ;;
        *)
          cert_data=`echo -e "\n$cert_data\n$line"`
          ;;
      esac
    done
done
echo ""
