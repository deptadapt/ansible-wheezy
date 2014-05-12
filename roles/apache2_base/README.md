# A basic role to install Apache on Debian Wheezy
## Overview
This role simply installs Apache. It's here to be used as a dependency for
other roles that need Apache to be installed.

## Variables
### apache2_mpm
Which Apache 2.2 MPM to install. The default is 'worker'. Acceptable values:
- worker
- event
- itk
- prefork

This variable is simply appended *apache2-mpm-* to result in the package
name to install.

## To do
- allow user to disable default Apache VirtualHost
- allow user to list default Apache modules to disable or enable
- allow user to specify additional modules to install
