# A role for installing MoinMoin

This role installs MoinMoin. It assumes that Apache has already been
installed.

MoinMoin is set up with wiki farm configuration. This role will configure
multiple wikis in the farm.

The role uses a variable *moinmoin_wikis*. This is a list of dictionaries.
Please see defaults/main.yml for details.

Each wiki is executed as a unique system user.
