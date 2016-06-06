# fleet

This directory, "fleet", contains ansible playbooks and configuration material
for my fleet of computer hosts.


# structure

playbooks/ contains the ansible code and associated configuration material.

Each directory under playbooks/roles/ defines a role.  Each role defines either
a service or a host.  Host roles are constructed of dependencies on service
roles.  Service roles may depend on other service roles, but not recursively.  

Service roles are constructed from tasks, defined in playbooks/tasks/, and
included into the role by playbooks/roles/rolename/tasks/main.yml .  Tasks are
reused among roles.  

Tasks are controlled by variables, defined in
playbooks/roles/rolename/vars/main.yml, which set the parameters of the tasks
(file names and locations, stuff like that).

playbooks/callback_plugins/profile_tasks.py contains some magic to display
timing data for ansible tasks.  It's not my code, and I've included the MIT
license under which it was released, at playbooks/callback_plugins/LICENSE .

Each of playbooks/setup_*.yml is a small playbook which deploys a role to a
host of the same name.  This is the entry point for ansible-playbook.


# License:

This program is free software. It comes without any warranty, to the extent
permitted by applicable law. You can redistribute it and/or modify it under
the terms of the Do What The Fuck You Want To Public License, Version 2, as
published by Sam Hocevar. See WTFPL.txt or http://www.wtfpl.net/ for more
details.

