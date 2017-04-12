#!/usr/bin/env perl
use strict;

my $dist_file = $ENV{dist} || 'dist.ini';

-f $dist_file or die "Can't find $dist_file";

open my $IN, "$dist_file" or die "Can't open $dist_file because: $!"; 
my $src = do {local $/; <$IN>};
close $IN;

my $tpl = do {local $/; <DATA>};

$src =~ s/(copyright_year\s*=\s*.+?[\n|\r]).+$/$1\n\n$tpl/s;
open my $OUT, "> $dist_file" or die "Can't write to $dist_file";
print $OUT $src;
print $src;
close $OUT;

__DATA__
[@Git]

;We don't want to release these modules to CPAN
[@Filter]
bundle = @Basic
remove = UploadToCPAN

;Do a fake release instead of releasing to CPAN
[FakeRelease]

;DZ plugin that autoversions this distro using git tags
;The version number is incremented during the release stage
;You can override the version using the V environment variable
[Git::NextVersion]

[PkgVersion]

;Do not include these files in the build
[PruneFiles]
filename = dist.ini
match = ^local/*

[Prereqs]
; add your dependencies here ...


; HOWTO release your package:
; 1) Test your package: `dzil test`
; 2) Git commit and push your code: `git commit` and `git push`
; 3) Version will be automatically incremented for you by running: `dzil release`
