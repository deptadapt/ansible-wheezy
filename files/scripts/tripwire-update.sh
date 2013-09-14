#!/bin/bash


tripwire --check --silent

last_report=`ls -t /var/lib/tripwire/report | head -n 1`

tripwire --update --silent --accept-all --twrfile /var/lib/tripwire/report/$last_report -P $1
