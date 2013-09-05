#!/bin/sh
# Ansible managed: /home/jeremy/src/ansible/roles/mailserver/templates/vmm/vmm-postgres.sh.j2 modified on 2013-09-05 03:05:53 by jeremy on parsons
#
# This script does the PostgreSQL database preparation for vmm
# http://vmm.localdomain.org/installation/postgresql_configuration.html
# 
# It is meant to be executed by the 'postgres' system user.

su -l -c "psql -f /tmp/vmm/create_roles.pgsql template1" postgres

PGPASSWORD="m2h4fzrb6ZR1ZxMIrIbzj6JqJwWSP8Xn0qixY_RxOKk6-OSQD3pQBuKiwrbyge0WiBAKH64BJ6d-z-0zH2ta2TL61yn-ihqfCIi" psql mailsys vmm -w -h localhost -f /tmp/vmm/create_tables-dovecot-1.2.x.pgsql

python /tmp/vmm/set-permissions.py -H 127.0.0.1 -U vmm -p m2h4fzrb6ZR1ZxMIrIbzj6JqJwWSP8Xn0qixY_RxOKk6-OSQD3pQBuKiwrbyge0WiBAKH64BJ6d-z-0zH2ta2TL61yn-ihqfCIi

touch /etc/postgresql/9.1/vmm-installed
exit 0
