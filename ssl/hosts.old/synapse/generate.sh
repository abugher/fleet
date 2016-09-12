#!/bin/bash

. ~/code/fleet/ssl/variables.sh

              server_key=${sensitive}/synapse/key.pem
              server_csr=${public}/synapse/csr.pem
             server_cert=${public}/synapse/cert.pem
             server_conf=${public}/synapse/conf
              cert_chain=${public}/synapse/chain.pem

. ${public}/generate.sh
