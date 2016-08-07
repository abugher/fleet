# fleet

This directory, *fleet*, contains ansible playbooks and configuration material
for my fleet of computer hosts.


# structure

*ansible/* contains the ansible code and associated configuration material.  It
should be the current working directory of the process invoking ansible.

Each directory under *ansible/roles/* defines a role.  Each role defines either
a service or a host.  

Host roles are constructed of dependencies on service roles.  A host role
directory may also include host-specific material, which can be referenced by
service roles using the *inventory_hostname* variable.  

The host role should ideally not contain *tasks/main.yml*.  Keeping all
configuration actions defined in service roles should yield the ability to
reassign roles or whole sets of roles from one host to another without
difficulty.  It will still be necessary to ensure that all host-specific
configuration material exists on the new host, so the less configuration that
can be made host-specific, the better.

Service roles are constructed from tasks, defined in ansible/tasks/, and
included into the role by *ansible/roles/&lt;rolename&gt;/tasks/main.yml* .  Tasks
are reused among service roles.

Tasks are controlled by variables, defined in
*ansible/roles/rolename/vars/main.yml*, which set the parameters of the
tasks.  This is the really important configuration material, mapping files in
this repo to file locations on target hosts, and similar relationships 

*ansible/callback_plugins/profile_tasks.py* contains some magic to display
timing data for ansible tasks.  It's not my code, and I've included the MIT
license under which it was released, at *ansible/callback_plugins/LICENSE* .

Each of *ansible/playbooks/setup_\\\*.yml* is a small playbook which deploys a role to a
host of the same name.  Configuration is enacted (typically) by running a
command like:

    cd ansible
    ansible-playbook playbooks/setup_neuron.yml


# License:

This program is free software. It comes without any warranty, to the extent
permitted by applicable law. You can redistribute it and/or modify it under
the terms of the Do What The Fuck You Want To Public License, Version 2, as
published by Sam Hocevar. See WTFPL.txt or http://www.wtfpl.net/ for more
details.

