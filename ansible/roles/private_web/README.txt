Previously, there was a "pictures" role, applied to neuron.  This set up
location, ownership, permissions, and authentication for rsync backup
from phones.  That functionality has been moved to the "storage_server"
role, which is currently applied to the host named "files".

There was also a symlink directive, to make a location
from the storage hierarchy (containing the pictures) available on the
web, and an htpasswd file to restrict access.  That made sense when
neuron, a web server, was hosting files.  Now files is hosting files,
and files doesn't serve web.  neuron is has "/storage" mounted, but
without the right credentials to access the pictures.  symlink won't
work for that. 

The solution is probably an additional sshfs mount, connecting as
aaron-phone (or another user with at least read access to the pictures)
to files, mounted at the place where we had a symlink before, in the web
directory.
