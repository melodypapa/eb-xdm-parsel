package Eb::AbstractObject;

use 5.006;
use strict;
use warnings;

use XML::LibXML;

=head1 NAME

Eb::Object - The great new Eb::Object!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Eb::Object;

    my $foo = Eb::Object->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 _new

Eb Object is one abstract class for others.

=cut

sub _new {
    my $class = shift;

    my $self = {};

    bless $self, $class;

    return $self;
}

=head2 getRootElement

get the root element of XDM xml

=cut

sub getRootElement {
    my $self = shift;
    my %args = @_;

    my $xdm_name = $args{filename};

    die "specify filename parameter." unless defined $xdm_name;

    my $dom = XML::LibXML->load_xml(location => $xdm_name);

    my $root_element = $dom->documentElement;

    die "$xdm_name is not a valid EB XDM file" unless $root_element->nodeName eq "datamodel";

    return $root_element;
}

=head2 readCtr

Read the all childrent var tag between the current ctr elment

=cut

sub readCtr {
    my $self = shift;
    my $parent = shift;

    my $child_obj = {};
    my $child_elements = $parent->childNodes;

    for my $lioop (1..$child_elements->size){
    //for my $child_element ($parent->findnodes("./d:var")){
        print "$child_element->{name} \n";

        #$child_obj{$var_element{}}
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

    perldoc Eb::Object


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

1; # End of Eb::Object
