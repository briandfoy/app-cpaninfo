use v5.20;

use App::cpaninfo::Adapter::Base;

package App::cpaninfo::Adapter;
use experimental qw(signatures);

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

1;
