#!/bin/sh
# This script will create symlinks to the "passwords directory" defined
# in the first argument in the places required by this playbook.

# Updated 2013-09-11 to create password symlinks for every role that has
# a files directory

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

for role in ./roles/* ; do
    if [ -h $role/files/passwords ]
        then
            rm $role/files/passwords
    elif [ -e $role/files/passwords ]
        then
            echo "The $role/files/passwords directory is not a symlink, aborting!"
            exit 1
    fi
done

# make the links

echo "creating symlink ./passwords"
ln -s $1 ./passwords

for role in ./roles/* ; do
    if [ -d $role/files ]
        then
            echo "creating symlink $role/files/passwords"
            ln -s $1 $role/files/passwords
        fi
done

# make some more links
# commented out by Jeremy 2013-09-29.
# only want to symlink passwords for now.
# all the other files should be managed by cloning this git repo directly into
# a prepare directory.
# for each in ./ansible.cfg ./group_vars ./hosts ./host_vars ./log ./site.yml ./testing-hosts ; do
#     if [ -h $each ]
#     then
#         rm $each
#     elif [ -e $each ]
#     then
#         echo "$each already exists and isn't a symlink. aborting."
#         exit 1
#     fi
# done

# ln -s $1/ansible/* .


exit 0
