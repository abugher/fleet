#!/bin/bash

. ~/code/fleet/conf/ssl/variables.sh

                  public=~/code/fleet/conf/ssl
               sensitive=~/code/sensitive/conf/ssl
              server_key=${sensitive}/neuronpointer.net/key.pem
              server_csr=${public}/neuronpointer.net/csr.pem
             server_cert=${public}/neuronpointer.net/cert.pem
             server_conf=${public}/neuronpointer.net/conf
              cert_chain=${public}/neuronpointer.net/chain.pem

. ${public}/generate.sh
