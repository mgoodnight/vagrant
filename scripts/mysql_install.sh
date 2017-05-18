#!/bin/bash

MYSQL_VERSION="5.6"

cd /home/vagrant

echo "Start - Install MySQL  script"

#... These commands allow the apt-get install to automatically answer some user prompts
export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password vagrant"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password vagrant"

#... Assumes that this install is run as part of initial install so "apt-get update" will have been run. 
apt-get -q -y install mysql-server mysql-client

#... Enable interactive shell again
unset DEBIAN_FRONTEND

#... Do chmod here so it will be one less special thing that may be overlooked
chmod +x /vagrant/provisions/scripts/mysql_secure_installation.expect 
#... Run mysql_secure_installation script with expect answering user prompts
/vagrant/provisions/scripts/mysql_secure_installation.expect 

echo "Done - Install MySQL  script"
