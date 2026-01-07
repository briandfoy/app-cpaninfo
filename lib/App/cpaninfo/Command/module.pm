use v5.36;

package App::cpaninfo::Command::module;
use parent qw(App::cpaninfo::Command);
use experimental qw(signatures);

=encoding utf8

=head1 NAME

App::cpaninfo::Command::module -

=head1 SYNOPSIS

	use App::cpaninfo;

=head1 DESCRIPTION

=over 4

=item new

=cut

sub names { qw(module mod m) }

sub run ( $class, @args ) {
	state $map = [
		[ qw(distribution distribution)],
		[ qw(latest_release release)],
		[ qw(description description)],
		[ qw(path path)],
		[ qw(latest_version version)],
		[ qw(author author)],
		[ qw(upload_date date)],
		[ qw(url download_url)],
		];

	my $options = ref $args[0] ? shift @args : {};

	my( $arg ) = $args[0];

	my $self = $class->new( $options );

	my $r = $self->client->module( $arg );
	# my $dist_results = $self->client->module( $module_results->distribution );
	# my $release_results = $self->client->release( $module_results->distribution );

	my %hash = map { my $m = $_->[1]; $_->[0] => $r->$m() } $map->@*;
	$hash{'args'} = [ @args ];
	$hash{'upload_epoch'} = $r->stat->{mtime};
	$self->output( \%hash );
	}

sub as_text ($self, $hash) {
	say <<~"HERE";
		Search term:    $hash->{args}[0]

		Distribution:   $hash->{distribution}
		Latest release: $hash->{latest_release}
		Latest version: $hash->{latest_version}
		Release URL:    $hash->{url}
		Uploaded:       $hash->{upload_date} ($hash->{'upload_epoch'})
		Author:         $hash->{author}
		Author URL:     https://metacpan.org/author/$hash->{author}
	HERE
	}

sub _text_template ($self, $hash) {

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
