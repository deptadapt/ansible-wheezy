# A role for Debian harden package

This role installs the Debian harden package.

Notably the harden package depends on Tripwire. This role will configure
Tripwire with a site and local key. There is a little more information
about this in defaults/main.yml.

There is also a tripwire.yml helper playbook in the root directory of this
repository to assist with fetching plain-text Tripwire reports for all
hosts and updating the Tripwire database (for example after upgrades).
