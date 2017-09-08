#!/bin/bash

sudo su
export DEBIAN_FRONTEND="noninteractive"

# We want latest LTS
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get -q -y install nodejs

# Get the latest and greatest of NPM
npm install npm@latest -g

# Angular-cli to make life that much easier...
#npm install -g @angular/cli@latest
