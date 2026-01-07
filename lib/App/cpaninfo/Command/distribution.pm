use v5.36;

use Data::Dumper;

package App::cpaninfo::Command::distribution;
use parent qw(App::cpaninfo::Command);
use experimental qw(signatures);

=encoding utf8

=head1 NAME

App::cpaninfo::Command::distribution -

=head1 SYNOPSIS

	use App::cpaninfo;

=head1 DESCRIPTION

=over 4

=item new

=cut

sub names { qw(distribution dist d) }

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

	my $r = $self->client->distribution( $arg );
say Data::Dumper::Dumper($r);

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
                 'client' => bless( {
                                      'request' => bless( {
                                                            '_is_agg' => 0,
                                                            'ua_args' => [
                                                                           'agent',
                                                                           'MetaCPAN::Client/2.031000',
                                                                           'verify_SSL',
                                                                           1
                                                                         ],
                                                            'base_url' => 'https://fastapi.metacpan.org',
                                                            'ua' => bless( {
                                                                             'max_redirect' => 5,
                                                                             'verify_SSL' => 1,
                                                                             'no_proxy' => [],
                                                                             'timeout' => 60,
                                                                             'keep_alive' => 1,
                                                                             'agent' => 'MetaCPAN::Client/2.031000',
                                                                             'default_headers' => undef,
                                                                             '_has_proxy' => {},
                                                                             'handle' => bless( {
                                                                                                  'keep_alive' => 1,
                                                                                                  'pid' => 50593,
                                                                                                  'max_header_lines' => 64,
                                                                                                  'port' => 443,
                                                                                                  'fh' => bless( \*Symbol::GEN0, 'IO::Socket::SSL' ),
                                                                                                  'rbuf' => '',
                                                                                                  'scheme' => 'https',
                                                                                                  'verify_SSL' => 1,
                                                                                                  'host' => 'fastapi.metacpan.org',
                                                                                                  'peer' => 'fastapi.metacpan.org',
                                                                                                  'max_line_size' => 16384,
                                                                                                  'timeout' => 60,
                                                                                                  'local_address' => undef,
                                                                                                  'SSL_options' => {},
                                                                                                  'tid' => 0
                                                                                                }, 'HTTP::Tiny::Handle' )
                                                                           }, 'HTTP::Tiny' ),
                                                            '_clientinfo' => {
                                                                               'production' => {
                                                                                                 'domain' => 'https://fastapi.metacpan.org',
                                                                                                 'url' => 'https://fastapi.metacpan.org'
                                                                                               }
                                                                             },
                                                            'debug' => 0,
                                                            'domain' => 'https://fastapi.metacpan.org'
                                                          }, 'MetaCPAN::Client::Request' )
                                    }, 'MetaCPAN::Client' )
               }, 'MetaCPAN::Client::Distribution' );
