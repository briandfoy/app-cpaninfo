use utf8;
use v5.36;

package App::cpaninfo;
use experimental qw(signatures);

our $VERSION = '0.001_01';

use constant EX_USAGE => 2;

use Getopt::Long;

=encoding utf8

=head1 NAME

App::cpaninfo - A simple CLI for MetaCPAN

=head1 SYNOPSIS

	use App::cpaninfo;

=head1 DESCRIPTION

=over 4

=item new

=cut

use Data::Dumper;

sub run ($class, @args) {
	my $options = {};
	my %spec = (
		'j|json' => \ $options->{json},
		't|text' => \ $options->{text},
		);
	my $ret = Getopt::Long::GetOptionsFromArray(\@args, %spec );

	my $self = $class->new;

	my $command = shift @args;

	my $package;
	unless( $package = $self->get_package_for_command($command) ) {
		Carp::carp( "Could not find command <$command>: $@" );
		return EX_USAGE;
		}

	$package->run( $options, @args );
	}

sub new ($class, %options ) {
	my $self = bless {}, $class;

	$self->load_modules;

	return $self;
	}

sub add_command ( $self, $module, $command ) {
	$self->{commnds}{$command} = $module;
	}

sub get_package_for_command ( $self, $command ) {
	$self->{commnds}{$command};
	}

sub load_module ( $self, $module ) {
	my $file = $module =~ s|::|/|gr;
	$file .= '.pm';
	my $rc = eval { require $file };
	Carp::carp "Could not load $module: $@" unless defined $rc;
	return $rc;
	}

sub load_modules ($self) {
	foreach my $module ( $self->modules ) {
		$self->load_module($module);
		$self->register( $module );
		}
	}

sub modules ($class) {
	qw(
		App::cpaninfo::Command::distribution
		App::cpaninfo::Command::module
		App::cpaninfo::Command::try
		);

	}

sub register ( $self, $module ) {
	$self->add_command( $module, $_ ) for $module->names
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
