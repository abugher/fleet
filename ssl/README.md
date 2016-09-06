To create the certificate authority, use execute ca/generate.sh .  To create key and cert signed by the CA, for a server, such as synapse, execute synapse/generate.sh .

<a href='https://raw.githubusercontent.com/abugher/fleet/master/conf/ssl/ca/root/cert.pem'>CA root cert</a>

This has been moved around and commented up since the last time it was
reviewed or documented.  Before generating any certificates, you should
check all the file paths, and make sure the right code portions are or are
not commented out.  Then remove this line.  :)
