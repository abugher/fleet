# usage

The directory containing this document should be the current working directory.

  ./deploy_role &lt;role_name&gt;

The role named *role_name* will be applied to the host group named *role_name*.

# structure

Each directory under *roles/* defines a role.  Each role defines either a
service or a host.  

hosts.ini holds the inventory, and host\_vars/ holds host-specific and
host-defining information such as IP address, MAC address, platform, etc.

I want to factor out any explicit references to hostnames, in favor of
templating.  dhcpd, dns\_internal, and nagios already get hosts and groups from
inventory, and contain no redundant inventory information.  If you define a
host in the inventory, and set *mac\_address*, *ip\_address*, *monitor*, and
*notify* in the host variables, and deploy the dhcpd, dns\_internal, and nagios
roles, the new host will receive a fixed address by DHCP, a DNS hostname, and
basic monitoring.  

Extended monitoring is driven by group membership.  I am in the process of
reconciling the groups controlling deployment with the groups controlling
monitoring, so that, for example, a raspberry pi will get configuration updates
when I deploy the raspberry-pi role, and nagios will check on its pi-specific
updates, just because it is a member of group raspberry-pi.

## host roles

The host role should ideally not contain *tasks/main.yml*.  Everything
distinguishing about the host should be defined by dependency on service roles.
In concept, this means that a host can be redeployed to a system with a stock
OS in one shot.  In practice, full redeployment doesn't get tested very often,
and is likely to require some tweaking to work.

The host role directory may also include host-specific information, which can
be referenced by service roles.  This is a last resort, if the information
cannot be conveyed by host variables or inventory group membership.  Ideally
there should be little or no material, here.

## service roles

Service role task lists mostly consist of include lines.  The variables file
defines the parameters of those tasks.  The role may also include some service
specific files, such as configuration or scripts.

## tasks

Task lists are defined in *tasks/&lt;task_name&gt;.yml*.

Role variables are used as task parameters.  To use a task list defined here,
include it in the main task list of a role, and also set the required
variables.

## metrics

*callback_plugins/profile_tasks.py* contains some magic to display timing
data for ansible tasks.  It's not my code, and I've included the MIT license
under which it was released, at *callback_plugins/LICENSE* .
