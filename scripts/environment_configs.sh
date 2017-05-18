#!/bin/bash
echo "START - Set various environment vars"

# Configurations

git clone https://github.com/mgoodnight/dots-and-configs.git

cd dots-and-configs

cp .vimrc ../
cp .bash_profile ../
cp .bashrc ../

cd ../

rm -fr dots-and-configs

source .bash_profile

echo "STOP - Set various environment vars"
