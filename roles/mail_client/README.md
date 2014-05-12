# A role for configuring Postfix as a null mail client

This role is meant for hosts that need to send mail, but don't need to be
a mail server.

Postfix is installed (replacing the Debian default MTA exim4) and configured
as a null mail client. Similar to the set up described here:
http://www.postfix.org/STANDARD_CONFIGURATION_README.html#null_client

See the defaults/main.yml for variables that can be used.

If you have an inventory group named "mail_server" this role will attempt
to automatically configure to use the first host listed in "mail_server"
group as the relay host. Otherwise you will need to set the 
"mail_client_relayhost" variable.
