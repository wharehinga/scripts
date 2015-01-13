#!/bin/sh
#
for CERT in $1
  do
      echo "" | openssl s_client -connect ${CERT} 2>/dev/null |\
          sed -ne "/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p" |\
	      openssl x509 -noout -issuer -subject -dates -serial -issuer
	        done
		echo "=========================="
