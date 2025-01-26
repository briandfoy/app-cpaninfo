package App::cpaninfo::Adapter::Distribution;
use parent qw(App::cpaninfo::Adapter::Base);

sub _map ( $class ) {
	state %methods = map { $_, 1 } qw(
		metacpan_url name
		);
	return \%methods;
	}

sub rt_url     ( $self ) { $self->object->rt->{url}     }
sub github_url ( $self ) { $self->object->github->{url} }

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
}, 'MetaCPAN::Client::Distribution' );
