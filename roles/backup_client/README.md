# A role for backup clients

This role is meant to be used with the backup_server role.

Duply is installed and configured to use SCP/SFTP to backup to
the backup_server.

This role (and its partner) by default uses inventory groups to attempt
to automatically configure itself. Specifically this role will configure
Duply's backup target to use the first host listed in the "backup_server"
inventory group.

Please see the defaults/main.yml for more information about variables
that are available to override.
