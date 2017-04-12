#!/bin/bash

echo "START - dashboard Perl dev tools install script - ROOT Part"

export PERLBREW_ROOT="/home/vagrant/perl5/perlbrew"
export PERLBREW_HOME="/home/vagrant/.perlbrew"
PERL_VERSION="perl-5.24.0"

#.. Using cpan to install perlbrew also has the side effect of installing many useful CPAN modules 
#.. into the system provided Perl. 
cpan install App::perlbrew

echo "STOP - dashboard Perl dev tools install script - ROOT Part"

