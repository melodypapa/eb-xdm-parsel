#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Eb::Xdm::Parser' ) || print "Bail out!\n";
}

diag( "Testing Eb::Xdm::Parser $Eb::Xdm::Parser::VERSION, Perl $], $^X" );
