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
		abstract archive authorized changes date distribution download_url
		first maturity main_module meta mtime name version
		);
	return \%methods;
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
