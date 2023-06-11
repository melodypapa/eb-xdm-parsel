package Eb::Os;

use 5.006;
use strict;
use warnings;

use Eb::AbstractObject;

our @ISA = qw(Eb::AbstractObject);

=head1 NAME

Eb::Models::Os - The Os Objects!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Eb::Models::Os;

    my $foo = Eb::Models::Os->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 new

Create the EB Os Object

=cut

sub new {
    my $class = shift;

    my $self = $class->SUPER::_new(@_);

    $self->{os_tasks} = ();

    return $self;
}

=head2 dump

Dump the EB Os Object

=cut

sub dump {
    my $self = shift;

    for my $os_task (@{$self->{os_tasks}}){
        print "$os_task \n";
    }

    print "Hello Os \n";
}

=head2 parse

Import the EB Os Object from Os.xdm

=cut

sub parse {
    my $self = shift;

    my $root_element = $self->getRootElement(@_);

    $self->_parseOsTasks($root_element);
}

sub _parseOsTasks{
    my $self = shift;
    my $root_element = shift;

    for my $node ($root_element->findnodes('//d:lst[@name="OsTask"]/d:ctr')){
        print "Reading OsTask <$node->{name} ...>\n";
        my $os_task = $self->readCtr($node);
    }

}

=head1 AUTHOR

Melodypapa, C<< <melodypapa at outlook.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-. at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=.>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Eb::Models::Os


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=.>

=item * CPAN Ratings

L<https://cpanratings.perl.org/d/.>

=item * Search CPAN

L<https://metacpan.org/release/.>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2023 by Melodypapa.

This is free software, licensed under:

  The MIT (X11) License


=cut

1;    # End of Eb::Models::Os
