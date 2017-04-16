Previously, there was a "pictures" role, applied to neuron.  This
set up location, ownership, permissions, and authentication for rsync
backup from phones.  That functionality has been moved to the
"storage_server" role.

What remains is pretty much just a symlink directive, to make a location
from the storage hierarchy (containing the pictures) available on the
web, and an htpasswd file to restrict access.  That made sense when
neuron, a web server, was hosting files.  Now files is hosting files,
and files doesn't serve web.  neuron could still host the files to web,
but it needs to become a client of storage, first.

So, write a storage_client role, make it a dependency of this role, and
apply this role to neuron to get pictures on the web.  Maybe make this
role part of private_web.
