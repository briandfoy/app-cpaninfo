use v5.10;

package App::cpaninfo::Adapter::Base;

our $AUTOLOAD;

=encoding utf8

=head1 NAME

App::cpaninfo::Adapter::Base -

=head1 SYNOPSIS

	use App::cpaninfo;

=head1 DESCRIPTION

=over 4

=item new

=cut

sub DESTROY { 1 }

sub AUTOLOAD ( $self ) {
	my $methods = $self->_map;
	my $package  = ref $self;

say "In AUTOLOAD";

	my $method = do { no strict 'refs'; ${$package . '::AUTOLOAD'} =~ s/.*:://r };
	if( exists $methods->{$method} ) {
		die "Could not find method <$method>";
		}

	$self->{object}->$method();
	}

=back

=head1 TO DO


=head1 SEE ALSO


=head1 SOURCE AVAILABILITY

This source is in Github:

	http://github.com/briandfoy/app-cpaninfo

=head1 AUTHOR

brian d foy, C<< <briandfoy@pobox.com> >>

=head1 COPYRIGHT AND LICENSE

Copyright © 2024, brian d foy, All Rights Reserved.

You may redistribute this under the terms of the Artistic License 2.0.

=cut

1;
