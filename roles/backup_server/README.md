# A role for the backup server

This role configures a host to be used as the backup target for the
hosts using the corresponding backup_client role.

This role requires an inventory group **backup_clients** that lists all of
the backup clients.

A unique system uses is created for each backup client.

This role must be used in the same playbook as the backup_client role, and
it must run after. The backup_client role registers a variable with the
SSH key used by each client, which this role needs for the authorized_key
module.
