# usage

The directory containing this document should be the current working directory.

  ./deploy_role &lt;role_name&gt;

The role named *role_name* will be applied to the host group named *role_name*.

# structure

Each directory under *roles/* defines a role.  Each role defines either a
service or a host.  

## host roles

The host role should ideally not contain *tasks/main.yml*.  Everything
distinguishing about the host should be defined by dependency on service roles.
In concept, this means that a host can be redeployed to a system with a stock
OS in one shot.  In practice, full redeployment doesn't get tested very often,
and is likely to require some tweaking to work.

The host role directory may also include host-specific material, which can be
referenced by service roles using the *inventory_hostname* variable.

Public (not private) keys are a good candidate.  This assumes you want keys
to be associated with users and hosts, not with services.  Given that
multiple services may make use of the same key, tracking keys with services
might not be feasible.

A counter-example is the system-wide *known_hosts* file.  The file is easy to
capture from an already deployed host, and tempting to use as a
"system-specific" file, but new entries must be managed in parallel with
changes to service roles.

Instead, each host role includes a *known_host* (singular) file, indicating how
that host is known.  Individual *known_host* entries are defined in service
roles, and refer to *known_host* file of the host to be known.

## service roles

Service roles mostly consist of tasks included into the role by
*roles/&lt;role_name&gt;/tasks/main.yml*, and service-specific files, such as
configuration files.

## tasks

Tasks are defined in *tasks/&lt;task_name&gt;.yml*.

Task parameters are controlled by variables, defined in
*roles/&lt;role_name&gt;/vars/main.yml*.  Variables map relationships, such as
files in this repo to file locations on target hosts.

## metrics

*callback_plugins/profile_tasks.py* contains some magic to display timing
data for ansible tasks.  It's not my code, and I've included the MIT license
under which it was released, at *callback_plugins/LICENSE* .
