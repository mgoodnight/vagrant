#!/bin/bash

sudo su
export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get upgrade
apt-get -q -y install build-essential vim htop ntp mytop wget nmap whois
apt-get -q -y install libxml2 libxml2-dev curl libmysqlclient-dev libexpat1-dev
apt-get -q -y install libssl-dev libnet-ssleay-perl git-core

#... Install "runas". A special replacment for "su" to be used in vagrant provisioning scripts
apt-get -q -y install titantools

#... For redis tests and MySQL install script
apt-get -q -y install tcl expect

apt-get -q -y autoclean
