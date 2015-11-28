# fleet

This directory, "fleet", contains code to be distributed to my little fleet
via ansible, as well as accompanying ansible playbooks.

Full directory hierarchy is not preserved, here.  The playbooks install things
from bin/ into /usr/local/bin/ .  Things in cron.d will generally go into
/etc/cron.d/ .

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

