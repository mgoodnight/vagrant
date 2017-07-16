#!/bin/bash

echo "START - Perl dev tools install script - ROOT Part"

#\curl -L https://install.perlbrew.pl | bash

cpan install App::perlbrew

echo "STOP - Perl dev tools install script - ROOT Part"

exit 0
