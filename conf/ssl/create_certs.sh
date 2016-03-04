#!/bin/bash
# Run this to create a CA and one server cert.  Use it as an example to
# create further server certs.

                  public=~/code/fleet/conf/ssl
               sensitive=~/code/sensitive/conf/ssl
             ca_root_key=${sensitive}/ca/root/key.pem
            ca_root_conf=${public}/ca/root.conf 
            ca_root_cert=${public}/ca/root/cert.pem
     ca_intermediate_key=${sensitive}/ca/intermediate/key.pem
    ca_intermediate_conf=${public}/ca/intermediate.conf
     ca_intermediate_csr=${public}/ca/intermediate/csr.pem
    ca_intermediate_cert=${public}/ca/intermediate/cert.pem
              server_key=${sensitive}/neuronpointer.net/key.pem
              server_csr=${public}/neuronpointer.net/csr.pem
             server_cert=${public}/neuronpointer.net/cert.pem
             server_conf=${public}/neuronpointer.net/conf
              cert_chain=${public}/neuronpointer.net/chain.pem

# create CA
mkdir -p {$public,$sensitive}/ca/{intermediate,root}
mkdir -p ${public}/ca/{intermediate,root}/newcerts
touch ${public}/ca/{intermediate,root}/index.txt{,.attr}
echo 1000 > ${public}/ca/intermediate/serial
echo 1000 > ${public}/ca/root/serial
echo 1000 > ${public}/ca/intermediate/crlnumber

# generate CA root key
openssl genrsa -aes256 -out $ca_root_key 4096
# generate CA root cert
openssl req -config $ca_root_conf -key $ca_root_key -new -x509 -days $(( 365 * 10 )) -sha256 -extensions v3_ca -out $ca_root_cert

# generate CA intermediate key
openssl genrsa -aes256 -out $ca_intermediate_key 4096
# generate CA intermediate CSR
openssl req -config $ca_intermediate_conf -new -sha256 -key $ca_intermediate_key -out $ca_intermediate_csr
# generate CA intermediate cert, signed by root cert
openssl ca -config $ca_root_conf -extensions v3_intermediate_ca -days $(( 365 * 10 )) -notext -md sha256 -in $ca_intermediate_csr -out $ca_intermediate_cert

# generate server key
openssl genrsa -out $server_key 4096
# generate server CSR
openssl req -config $server_conf -key $server_key -new -sha256 -out $server_csr
# generate server cert, signed by CA intermediate cert
openssl ca -config $server_conf -extensions server_cert -days $(( 365 * 10 )) -notext -md sha256 -in $server_csr -out $server_cert

# compile certificate chain
cat $server_cert $ca_intermediate_cert $ca_root_cert > $cert_chain
