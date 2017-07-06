#!/bin/bash

echo "START - dashboard Perl dev tools install script - USER Part"

PERL_VERSION="perl-5.24.0"

export PERLBREW_ROOT="/home/ubuntu/perl5/perlbrew"

perlbrew init
perlbrew install-patchperl
perlbrew install-cpanm
perlbrew list | grep $PERL_VERSION | perlbrew install $PERL_VERSION

##.. Cause Perl to default to the newly installed perlbrew  version 
source $PERLBREW_ROOT/etc/bashrc
perlbrew switch $PERL_VERSION

#... Perl development tools installed into this perlbrew environment
cpanm Module::Util Perl::Critic Perl::Metrics::Simple Perl::Tidy Module::Install

#... failed to install nicely so force it
cpanm IO::Prompt --notest --force
cpanm Pinto

cpanm Dist::Zilla Dist::Zilla::Plugin::FakeRelease Dist::Zilla::Plugin::Git::NextVersion Dist::Zilla::Plugin::PkgVersion Dist::Zilla::Plugin::Prereqs Dist::Zilla::Plugin::PruneFiles Dist::Zilla::PluginBundle::Filter Dist::Zilla::PluginBundle::Git

cpanm local::lib Starman

echo "STOP - dashboard Perl dev tools install script - USER Part"
