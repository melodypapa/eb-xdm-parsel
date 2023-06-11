#!/usr/bin/perl

use strict;
use warnings;

use Eb::Os;

my $os = Eb::Os->new();
$os->parse(filename => "data/Os.xdm");
$os->dump();
