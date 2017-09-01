#!/bin/bash

echo "START - Python dev tools install script - ROOT Part"

sudo apt-get -y install python-pip

sudo apt-get -y install virtualenv

mkdir ~/.virtualenvs

sudo pip install virtualenvwrapper

sudo apt-get install python-dev

sudo apt-get install python3-dev

echo "STOP - Python dev tools install script - ROOT Part"

exit 0
