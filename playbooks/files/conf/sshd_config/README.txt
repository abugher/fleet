I have one common file to provide to each host, and a small extra file
for each host, which can be concatenated to produce an sshd_config.
Since the 'assemble' module works with whole directories, I have created
one directory per host, each containing a hard link to the common file,
and the per-host file.
