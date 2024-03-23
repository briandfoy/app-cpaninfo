use utf8;
use v5.20;

package App::cpaninfo::Command;
use experimental qw(signatures);

use Data::Dumper;
use MetaCPAN::Client;

sub new ( $class, $options = {} ) {
	my $format = do {
		if( $options->{json} ) { 'as_json' }
		elsif( $options->{text} ) { 'as_text' }
		else { 'as_text' }
		};

	my $hash = {
		client => MetaCPAN::Client->new,
		format => $format // 'as_text',
		};

	bless $hash, $class;
	}

sub client ($self) {
	$self->{'client'};
	}

# Stolen from Mojo::Util
sub dumper { shift; Data::Dumper->new([@_])->Indent(1)->Sortkeys(1)->Terse(1)->Useqq(1)->Dump }

sub default_format { 'as_text' }

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
1;
