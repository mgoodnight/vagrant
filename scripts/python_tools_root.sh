#!/bin/bash

echo "START - Python dev tools install script - ROOT Part"

sudo apt-get -y install python pip
sudo apt-get -y install virutalenv

mkdir ~/.virtualenvs

sudo pip install virtualenvwrapper

echo "STOP - Python dev tools install script - ROOT Part"

exit 0

