use v5.36;

package App::cpaninfo::Adapter::Distribution;
use parent qw(App::cpaninfo::Adapter::Base);
use experimental qw(signatures);

=encoding utf8

=head1 NAME

App::cpaninfo::Adapter::Distribution -

=head1 SYNOPSIS

	use App::cpaninfo;

=head1 DESCRIPTION

=over 4

=item new

=cut

sub _map ( $class ) {
	state %methods = map { $_, 1 } qw(
		metacpan_url name
		);
	return \%methods;
	}

sub rt_url     ( $self ) { $self->object->rt->{url}     }
sub github_url ( $self ) { $self->object->github->{url} }

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

__END__
$VAR1 = bless( {
 'data' => {
	 'name' => 'Business-ISBN',
	 'river' => {
				  'total' => 15,
				  'immediate' => 11,
				  'bus_factor' => 1,
				  'bucket' => 2
				},
	 'bugs' => {
				 'rt' => {
						   'patched' => 0,
						   'open' => 0,
						   'new' => 0,
						   'resolved' => 27,
						   'rejected' => 2,
						   'source' => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Business-ISBN',
						   'closed' => '29',
						   'stalled' => 0,
						   'active' => '0'
						 },
				 'github' => {
							   'source' => 'https://github.com/briandfoy/business-isbn',
							   'closed' => 23,
							   'open' => 0,
							   'active' => 0
							 }
			   }
   },
}, 'MetaCPAN::Client::Distribution' );
