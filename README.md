# Ansible roles for Debian Wheezy
This repository contains some roles for Ansible playbooks that I've developed for Debian Wheezy. So far my focus has been on using Ansible to deploy my mail server, and that role is the most developed. The other roles were developed to support the mailserver role, but were separated into their own roles because they would be useful on other servers.

These roles will work on a freshly installed Debian Wheezy host. They will only install software available in the standard Debian repositories.

My wiki has lots of notes on these roles. Some of these roles require host/group variables to be defined. Other roles accept optional variables and supporting files. The most important page to see is https://wiki.deptadapt.org/MailServer/Ansible/LocalFiles for an outline of variables and files to use with these roles. https://wiki.deptadapt.org/CategoryAnsible has links to other Ansible pages on my wiki.

## vmm_mail_server
This role installs Postfix and Dovecot along with supporting packages. The authentication backend for Postfix and Dovecot is stored in a PostgreSQL database, and managed by [vmm](http://vmm.localdomain.org/).

The role will use Debian's automatically generated self-signed SSL certificates (snakeoil) by default, but you can also specify an alternate SSL certificate to use.

OpenDKIM is also installed if certain host variables are defined. For help with the variables to use with the role, see [the notes on my wiki](https://wiki.deptadapt.org/MailServer/Ansible/LocalFiles)

## harden
This role installs the Debian *harden* package. harden installs Tripwire, which requires passphrases for the site and local keys it uses to sign it's config and database files. See my notes on the [harden role](https://wiki.deptadapt.org/MailServer/Ansible/LocalFiles#harden_role) on my wiki for how to do this.

## postgres 
This role simply installs PostgreSQL.

## mail_client
This role installs and configures Postfix as a null main client.

## common role
This role does some tasks that are common to all hosts. It configures an iptables firewall (using a Jinja2 template to determine which ports to open based on which inventory groups the host belongs to).

_It also disables password authentication for SSH,_ and installs the *harden-servers* package which conflicts with several packages for network services including NFS. 

This role is meant to be applied before the others.

## bind_name_server
This role will install BIND. By default it will configure BIND as a master. There is some support for configuring slave servers, but I recommend using all masters.

This role can also handle the updating of zone files.

## backup_client and backup_server
This role installs and configures *Duply* for managing automated, encrypted, remote backups. It requires several variables defined in host_vars or group_vars that point to required files (GPG keys, SSH keys).

## apache2_base
Installs Apache, meant to be used a role dependency.

## awstats
Installs and configures awstats. Static HTML reports are used instead of CGI. Apache is required.

## moinmoin
Installs and configures a MoinMoin wiki farm. Multiple wikis can be managed. Requires Apache.

## monit
Installs and configures Monit for host based system monitoring. This is a work in progress even more so than the others.
