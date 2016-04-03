# fleet

This directory, "fleet", contains code to be distributed to my little fleet
via ansible, as well as accompanying ansible playbooks.

This tree is published on github.  Sensitive information is kept in a
different location, and not (intentionally) published.  Playbooks published
here make reference to unpublished files.


# License:

For the purposes of the license notice below, I note that many files in this
tree are not programs, but I consider the master ansible playbook and all
files used in its execution to constitute a program.  All the parts of that
program found in this directory are to be considered "this program".

This program is free software. It comes without any warranty, to the extent
permitted by applicable law. You can redistribute it and/or modify it under
the terms of the Do What The Fuck You Want To Public License, Version 2, as
published by Sam Hocevar. See WTFPL.txt or http://www.wtfpl.net/ for more
details.


# playbooks

Formerly, I had a master playbook named setup_fleet.yml, which called
setup_accounts.yml, etc, which called configure_users_on_neuron.yml, etc.

Currently, the master playbook is setup.yml.  setup_fleet.yml invokes the
fleet role for the fleet group.  setup_identity_clients.yml invokes the
identity_clients role for the identity_clients group.  These two playbooks are
called by setup.yml.  I intend to press the entire collection of playbooks
into this pattern.  At the moment, a lot of the old mess remains, and
setup.yml includes it.
