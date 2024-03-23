use v5.20;

package App::cpaninfo::Command::module;
use parent qw(App::cpaninfo::Command);
use experimental qw(signatures);

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


1;
