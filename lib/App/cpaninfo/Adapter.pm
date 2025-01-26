use v5.20;

use App::cpaninfo::Adapter::Base;

package App::cpaninfo::Adapter;
use experimental qw(signatures);

=encoding utf8

=head1 NAME

App::cpaninfo::Adapter::Base -

=head1 SYNOPSIS

	use App::cpaninfo;

=head1 DESCRIPTION

=over 4

=item new

=cut

sub new ( $class, $object ) {
	my $self = bless {}, $class;

	my $adapter = $self->adapter_from_object( $object );
	unless( defined $adapter ) {
		warn "Could not load <$adapter>";
		return;
		}

	bless { object => $object }, $adapter;
	}

sub adapter_from_object ( $self, $object ) {
	my $ref = ref $object;
	my( $last_part ) = $ref =~ s/.*:://r;

	my $adapter = join '::', __PACKAGE__, $last_part;
	}

sub load_adapter ( $self, $adapter ) {
	my $file = $adapter =~ s|::|/|gr . '.pm';
	next if exists $INC{$file};

	my $status = eval { require $file };
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
