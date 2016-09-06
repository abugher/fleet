#!/bin/bash

. ~/code/fleet/ssl/variables.sh

              server_key=${sensitive}/neuronpointer.net/key.pem
              server_csr=${public}/neuronpointer.net/csr.pem
             server_cert=${public}/neuronpointer.net/cert.pem
             server_conf=${public}/neuronpointer.net/conf
              cert_chain=${public}/neuronpointer.net/chain.pem

. ${public}/generate.sh
