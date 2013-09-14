#!/bin/bash

if [ $1 ];
then
    tripwire --check > $1 2>&1
else
    tripwire --check
fi
exit 0
