#!/bin/bash
# 2013-08-16
# Jeremy McNaughton
# this script should take an argument for its hostname
# it should update the hostname in /etc/hostname and /etc/hosts
# it should be called by root with the following arguments:
#
# initial_configuration.sh hostname domain
#
# domain should have a leading '.' so that if the two arguments
# were pasted together they would form a FQDN



host_regex="^[a-zA-Z0-9]([a-zA-Z0-9\-]*)[a-zA-Z0-9]$"
domain_regex="^\.[a-zA-Z0-9]([a-zA-Z09\.\-])*([a-zA-Z]{2,9})$"

host_name=$1
domain_name=$2



if [[ ! $host_name =~ $host_regex ]]
then
    echo "Host name not valid"
    exit 1
fi

if [[ ! $domain_name =~ $domain_regex ]]
then
    echo "Domain is invalid"
    exit 1
fi

# echo "Writing hostname"
echo $host_name > /etc/hostname
hostname -F /etc/hostname
# echo "Writing hostname and FQDN to 127.0.1.1 record in hosts file."
FQDN="$host_name$domain_name"
# echo $FQDN
sed -i "/127.0.1.1/c \127.0.1.1 \t$FQDN $host_name" /etc/hosts

# also update the mailname
echo $FQDN > /etc/mailname

# reboot the system
reboot
