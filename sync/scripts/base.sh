#!/bin/bash

ln -s /etc/puppetlabs/puppet /root

yum install -q -y vim-enhanced bash-completion ccze colordiff curl git htop lftp lynx mc mutt psmisc rsync sysstat telnet wget mercurial tree avahi avahi-tools nss-mdns
yum install -q -y rpm-build yum-utils gcc-c++ make

/root/pe-install/scripts/rcfiles.sh
sudo -nu vagrant -i /root/pe-install/scripts/rcfiles.sh

service iptables stop
chkconfig iptables off
service avahi-daemon start
chkconfig avahi-daemon on


