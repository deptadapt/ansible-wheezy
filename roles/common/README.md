# Deptadapt's common role for Debian Wheezy
## Overview
This role collects a bunch of tasks that need to be done on all servers into
one place.

### Firewall
Firewall is configured for IPv4 and IPv6. Currently a fairly complex
template is used that attempts to determine which ports to open based
on the host's membership in various Ansible inventory groups. With the
release of Ansible 1.6 including the new *ufw* module this template
set up will soon be replaced with a better solution. More details
about the firewall below.

### OpenSSH server
This role makes sure that password authentication is disabled in the
OpenSSH server. *common/files/sshd_config* is what is copied to the
server if you'd like to review.

### harden-servers package
The *harden-servers* Debian package is installed. This is a virtual
package that conflicts with the packages for unsafe network services. The 
intent is to remove NFS and other network services that are present in
a fresh Debian install. This task might be optional in the future using a 
default variable.

### NTP
The *ntp* package is installed to keep the system clock current.

## How the firewall works
### Variables
The firewall template uses a dictionary variable *firewall_unblock*. Each
key in this dictionary must have a boolean value. For each key in 
*firewall_unblock* that is true, the template looks for a file with the same
name as the key in common/templates/firewall/rules. This file should contain
a snippet suitable for use with iptables-restore(8).

For example, if *firewall_unblock.web_server* is **true**, the firewall
template will include the file *common/templates/firewall/rules/web_server.j2*.
Currently this role only includes snippets that open the following ports
(TCP only unless noted):

- *web_server*: 80, 443 
- *name_server*: 53 (TCP and UDP)
- *monit*: 2812
- *mail_server*: 25, 143, 587, 993, 4190

The firewall template is written using Jinja2 template inheritance to
generate */etc/iptables.rules* and */etc/ip6tables.rules* from a single
base template.

### Defaults based on inventory groups
This role and several others it was developed with make use of groups in the
Ansible inventory to make some decisions. This role uses a default variable
to attempt to determine which ports to open based on the host's membership
in certain groups.

Each of the keys in the *firewall_unblock* dictionary described above can
also be used a group name in the Ansible inventory. For example if a host
is a member of the *web_servers* group in your inventory, the default
value of *firewall_unblock.web_server* will be **true**. See 
*common/defaults/main.yml* for more information details on how this works.
