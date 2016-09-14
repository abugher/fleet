                    ERR_PREREQ=2
                     ERR_USAGE=3
                     ERR_MKDIR=4
                    ERR_GENRSA=5
                       ERR_CSR=6
                      ERR_CERT=7
                      ERR_CONF=8
                       ERR_KEY=9
                     ERR_CHAIN=10
                       ERR_ERR=99

                          host=$1
                        domain='neuronpointer.net'

              csr_cannot_exist='no'
             cert_cannot_exist='no'
       cert_chain_cannot_exist='no'
                      
                        prefix="${0}:  "

                        public=~/code/fleet/ssl
                     sensitive=~/code/sensitive/ssl

                   ca_root_dir=${public}/ca/root
              ca_root_newcerts=${ca_root_dir}/newcerts
         ca_root_sensitive_dir=${sensitive}/ca/root
                  ca_root_conf=${public}/ca_root_conf
                   ca_root_key=${ca_root_sensitive_dir}/key.pem
                  ca_root_cert=${ca_root_dir}/cert.pem
                   ca_root_crl=${ca_root_dir}/crl.pem

           ca_intermediate_dir=${public}/ca/intermediate
      ca_intermediate_newcerts=${ca_intermediate_dir}/newcerts
 ca_intermediate_sensitive_dir=${sensitive}/ca/intermediate
          ca_intermediate_conf=${public}/ca_intermediate_conf
           ca_intermediate_key=${ca_intermediate_sensitive_dir}/key.pem
           ca_intermediate_csr=${ca_intermediate_dir}/csr.pem
          ca_intermediate_cert=${ca_intermediate_dir}/cert.pem
           ca_intermediate_crl=${ca_intermediate_dir}/crl.pem

                      host_dir=${public}/hosts/${host}
            sensitive_host_dir=${sensitive}/hosts/${host}
            host_conf_template=${public}/host_conf_template
                     host_conf=${host_dir}/conf
                      host_key=${sensitive_host_dir}/key.pem
                      host_csr=${host_dir}/csr.pem
                     host_cert=${host_dir}/cert.pem
                    cert_chain=${host_dir}/chain.pem
                      host_crl=${host_dir}/crl.pem

         depend_on_ca_root_key=(
                                $ca_root_cert
                                $ca_root_crl
                                $ca_intermediate_csr
                              )
        depend_on_ca_root_cert=(
                                $cert_chain
                              )
         depend_on_ca_root_crl=(
                              )
 depend_on_ca_intermediate_key=(
                                $ca_intermediate_csr
                                $ca_intermediate_crl
                                $host_cert
                              )
 depend_on_ca_intermediate_csr=(
                                $ca_intermediate_cert
                              )
depend_on_ca_intermediate_cert=(
                                $cert_chain
                              )
 depend_on_ca_intermediate_crl=(
                              )
           depend_on_host_conf=(
                                $host_csr
                              )
            depend_on_host_key=(
                                $host_csr
                                $host_crl
                              )
            depend_on_host_csr=(
                                $host_cert
                              )
           depend_on_host_cert=(
                                $cert_chain
                              )
          depend_on_cert_chain=(
                              )
            depend_on_host_crl=(
                              )


fail() {
  echo -e "${prefix}Error:  ${2}"
  exit $1
}


inform() {
  echo -e "${prefix}Output:  ${1}"
}


debug() {
  echo -e "${prefix}Debug:  ${1}"
}


remove_stale() {
  for file in "${@}"; do
    if test -e $file; then
      rm $file \
      || fail $ERR_KEY "Failed to remove stale file:  ${file}"
      inform "Removed stale file:  ${file}"
    fi
  done
}

