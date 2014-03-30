#!/bin/sh


echo "Running pg_dumpall..."
su - -c "pg_dumpall > /var/local/pgsql_dumps/pg_dumpall.{{ ansible_fqdn }}.psql" postgres


exit 0
