#!/bin/bash

# Don't run this file.  Include it.
# See neuron/generate.sh for an example.

# generate server key
openssl genrsa -out $server_key 4096
# generate server CSR
openssl req -config $server_conf -key $server_key -new -sha256 -out $server_csr
# generate server cert, signed by CA intermediate cert
openssl ca -config $server_conf -extensions server_cert -days $(( 365 * 10 )) -notext -md sha256 -in $server_csr -out $server_cert

# compile certificate chain
cat $server_cert $ca_intermediate_cert $ca_root_cert > $cert_chain
