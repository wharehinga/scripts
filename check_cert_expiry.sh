#!/bin/bash

tempfile=

print_results () {

}


evaluate_cert_details () {

}

get_cert () {
echo "" | openssl s_client -connect $1:$2 -showcerts 2>/dev/null |\
    sed -ne "/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p"
    }
