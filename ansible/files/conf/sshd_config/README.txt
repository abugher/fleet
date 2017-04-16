I have one common file to provide to each host, and a small extra file
for each host, which can be concatenated to produce an sshd_config.
Since the 'assemble' module works with whole directories, I have created
one directory per host, each containing a hard link to the common file,
and the per-host file.

This is ugly.  I think I could get rid of this whole side-hierarchy and
make item-in-line-in-file statements, mostly about AllowUsers, in
appropriate host-agnostic roles.

Maybe like this:

  http://stackoverflow.com/questions/31432367/ansible-insert-a-single-word-on-an-existing-line-in-a-file
