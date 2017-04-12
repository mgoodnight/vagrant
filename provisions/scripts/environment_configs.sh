#!/bin/bash
echo "START - Set various environment vars"

# Configurations

[ -f /home/vagrant/.vimrc ] || cp /vagrant/provisions/templates/vimrc /home/vagrant/.vimrc

[ -d /home/vagrant/.dzil ] || mkdir /home/vagrant/.dzil

cp /vagrant/provisions/templates/dzil_add_to_dist.pl /home/vagrant/.dzil/add_to_dist.pl && chmod +x /home/vagrant/.dzil/add_to_dist.pl && echo "added /home/vagrant/.dzil"

[ -f /home/vagrant/.bash_profile ] || cp /vagrant/provisions/templates/bash_profile /home/vagrant/.bash_profile

[ -f /home/vagrant/.bashrc ] || cp /vagrant/provisions/templates/bashrc /home/vagrant/.bashrc

echo "STOP - Set various environment vars"
