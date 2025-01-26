use v5.10;

package App::cpaninfo::Adapter::Base;

our $AUTOLOAD;

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

1;
