#!/bin/bash

echo "START - dashboard Perl dev tools install script - USER Part"

export PERLBREW_ROOT="/home/vagrant/perl5/perlbrew"
export PERLBREW_HOME="/home/vagrant/.perlbrew"
PERL_VERSION="perl-5.24.0"

PERL_BUILD_NOTEST="--notest"

perlbrew init
perlbrew install-patchperl
perlbrew install-cpanm
perlbrew list | grep $PERL_VERSION || perlbrew install $PERL_BUILD_NOTEST $PERL_VERSION

#... Perl development tools installed into this perlbrew environment
perlbrew exec --with $PERL_VERSION cpanm Module::Util Perl::Critic Perl::Metrics::Simple Perl::Tidy

#... failed to install nicely so force it
perlbrew exec --with $PERL_VERSION cpanm IO::Prompt --notest --force
perlbrew exec --with $PERL_VERSION cpanm Pinto

perlbrew exec --with $PERL_VERSION cpanm Dist::Zilla Dist::Zilla::Plugin::FakeRelease Dist::Zilla::Plugin::Git::NextVersion Dist::Zilla::Plugin::PkgVersion Dist::Zilla::Plugin::Prereqs Dist::Zilla::Plugin::PruneFiles Dist::Zilla::PluginBundle::Filter Dist::Zilla::PluginBundle::Git

perlbrew exec --with $PERL_VERSION cpanm local::lib Starman

##.. Cause Perl to default to the newly installed perlbrew  version 
source $PERLBREW_ROOT/etc/bashrc
perlbrew switch $PERL_VERSION

echo "STOP - dashboard Perl dev tools install script - USER Part"

