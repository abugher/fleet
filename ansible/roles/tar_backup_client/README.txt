pictures et al > tar | xz | gpg > server
server > gpg | xz | tar > pictures et al

Two tarballs should be kept.  Never have less than one preserved.
Delete one and replace it.  Log success or failure, and only proceed
with deletion if the other tarball is verified good.

Use the escrow pass phrase, same as used for disk encryption.

Monitor with nagios.

First step is to get ansible to initialize gpg, generate a key, and
apply the escrow pass phrase.
