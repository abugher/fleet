The xserver package currently requires libpng12-0 (at least) from
Jessie.  Making this role depend on apt pinning sounds complicated,
largely because I'll be compelled to find a satisfying way to make
ansible do apt pinning.

I just did it by hand, but I thought I would at least note what needs to
be done to finish the role.

The role seems to work once Jessie repos are available.
