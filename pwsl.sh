#!/bin/sh
# This script will create symlinks to the "passwords directory" defined
# in the first argument in the places required by this playbook.

# start by catching problems

if [ -z $1 ]
then
    echo "This script must be called with the absolute path of the passwords directory."
    exit 1
fi

if [ ! -d $1 ]
then
    echo "The passwords directory you are trying to link to does not exist!"
    exit 1
fi


# start by removing the symlinks if they exist

if [ -h ./passwords ]
then 
    rm ./passwords
elif [ -e ./passwords ]
then 
    echo "The ./passwords directory is not a symlink, aborting!"
    exit 1
fi

if [ -h ./roles/harden/files/passwords ]
then
    rm ./roles/harden/files/passwords
elif [ -e ./passwords ]
then
    echo "The ./roles/harden/files/passwords directory is not a symlink, aborting!"
    exit 1
fi

# make the links

ln -s $1 ./passwords
ln -s $1 ./roles/harden/files/passwords

exit 0
