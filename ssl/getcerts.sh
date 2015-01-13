#!/bin/sh
#
for CERT in $1
  do
      echo "" | openssl s_client -connect ${CERT} -showcerts 2>/dev/null |\
          sed -ne "/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p"
	    done
	    echo "=========================="
