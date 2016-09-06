#!/bin/bash

                  public=~/code/fleet/ssl
               sensitive=~/code/sensitive/ssl
             ca_root_key=${sensitive}/ca/root/key.pem
            ca_root_conf=${public}/ca/root.conf 
            ca_root_cert=${public}/ca/root/cert.pem
     ca_intermediate_key=${sensitive}/ca/intermediate/key.pem
    ca_intermediate_conf=${public}/ca/intermediate.conf
     ca_intermediate_csr=${public}/ca/intermediate/csr.pem
    ca_intermediate_cert=${public}/ca/intermediate/cert.pem
