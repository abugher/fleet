#!/bin/bash
. ~/code/fleet/ssl/variables.sh

# create CA
mkdir -p {$public,$sensitive}/ca/{intermediate,root}
mkdir -p ${public}/ca/{intermediate,root}/newcerts
rm ${public}/ca/{intermediate,root}/index.txt{,.attr}
touch ${public}/ca/{intermediate,root}/index.txt{,.attr}
echo 1000 > ${public}/ca/intermediate/serial
rm ${public}/ca/intermediate/serial.old
echo 1000 > ${public}/ca/root/serial
rm ${public}/ca/root/serial.old
echo 1000 > ${public}/ca/intermediate/crlnumber

# generate CA root key
#openssl genrsa -aes256 -out $ca_root_key 4096
# generate CA root cert
openssl req -config $ca_root_conf -key $ca_root_key -new -x509 -days $(( 365 * 10 )) -sha256 -extensions v3_ca -out $ca_root_cert

# generate CA intermediate key
#openssl genrsa -aes256 -out $ca_intermediate_key 4096
# generate CA intermediate CSR
openssl req -config $ca_intermediate_conf -new -sha256 -key $ca_intermediate_key -out $ca_intermediate_csr
# generate CA intermediate cert, signed by root cert
openssl ca -config $ca_root_conf -extensions v3_intermediate_ca -days $(( 365 * 10 )) -notext -md sha256 -in $ca_intermediate_csr -out $ca_intermediate_cert
