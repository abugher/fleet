# fleet

This directory, "fleet", contains code to be distributed to my little fleet
via ansible, as well as accompanying ansible playbooks.

This tree is published on github.  Sensitive information is kept in a
different location, and not (intentionally) published.  Playbooks published
here make reference to unpublished files.


# License:

This program is free software. It comes without any warranty, to the extent
permitted by applicable law. You can redistribute it and/or modify it under
the terms of the Do What The Fuck You Want To Public License, Version 2, as
published by Sam Hocevar. See WTFPL.txt or http://www.wtfpl.net/ for more
details.


# playbooks

Playbooks are being refactored.  Old style was one playbook per service per
host, approximately; eg configure_ssh_on_synapse.yml.  New style is one role
per service; one role per host; host roles include service roles; service roles
use shared task definitions.
