# fleet

This directory, "fleet", contains ansible playbooks and configuration material
for my fleet of computer hosts.


# structure

Each directory under roles/ defines a role, as is conventional.  Each role
defines either a service or a host.  Host roles are constructed of dependencies
on service roles.  Service roles may depend on other service roles, but not
recursively.  

Service roles are constructed from tasks, defined in tasks/, and included into
the role by roles/rolename/tasks/main.yml .  Tasks are reused among roles.  

Tasks are controlled by variables, defined in roles/rolename/vars/main.yml,
which set the parameters of the tasks (file names and locations, stuff like
that).


# License:

This program is free software. It comes without any warranty, to the extent
permitted by applicable law. You can redistribute it and/or modify it under
the terms of the Do What The Fuck You Want To Public License, Version 2, as
published by Sam Hocevar. See WTFPL.txt or http://www.wtfpl.net/ for more
details.

