use utf8;
use v5.20;

package App::cpaninfo::Command;
use experimental qw(signatures);

=encoding utf8

=head1 NAME

App::cpaninfo::Command -

=head1 SYNOPSIS

	use App::cpaninfo;

=head1 DESCRIPTION

=over 4

=item new

=cut

use Data::Dumper;
use MetaCPAN::Client;

use App::cpaninfo::Adapter;

sub new ( $class, $options = {} ) {
	my $format = do {
		if( $options->{json} ) { 'as_json' }
		elsif( $options->{text} ) { 'as_text' }
		else { 'as_text' }
		};

	my $hash = {
		metacpan_client => MetaCPAN::Client->new,
		format => $format // 'as_text',
		};

	bless $hash, $class;
	}

sub metacpan ($self) {
	$self->{'metacpan'};
	}

# Stolen from Mojo::Util
sub dumper { shift; Data::Dumper->new([@_])->Indent(1)->Sortkeys(1)->Terse(1)->Useqq(1)->Dump }

sub default_format { 'as_text' }

sub get_everything ($self, $distribution) {
	my $dist = $self->get_distribution( $distribution );
	my $releases = $self->get_release( $distribution );

	return {
		distribution => $dist,
		releases     => $releases,
		meta         => {},
		};
	}

sub get_distribution ($self, $distribution ) {
	$self->client->distribution( $distribution );
	}

sub get_module ($self, $module) {
	$self->client->module( $module );
	}

sub get_all_releases ($self, $distribution) {
	my $result_set = $self->{metacpan_client}->release( { distribution => $distribution } );

	my @results;
	while(1) {
		my $obj = $result_set->next;
		last unless defined $obj;
		push @results, App::cpaninfo::Adapter->new($obj);
		}

	return \@results;
	}

sub format ($self) {
	$self->{'format'} // $self->{'default_format'};
	}

sub names ($self) {
	( ref($self) =~ s/.*:://r );
	}

sub output ($self, $hash ) {
	my $method = $self->format;
	$self->$method( $hash );
	}

sub as_json ($self, $hash ) {
	state $rc = require JSON::PP;

	my $json = {
		meta => {
			command => ( (ref $self) =~ s/.*:://r ),
			run_epoch => time,
			},
		data => $hash,
		};

	say JSON::PP::encode_json $json;
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
