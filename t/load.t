my @classes = qw(
	App::cpaninfo
	);

push @classes, map { 'App::cpaninfo::' . $_ } (
	qw(Command Adapter),
	map( { 'Command::' . $_ } qw(try distribution module) ),
	map( { 'Adapter::' . $_ } qw(Release Distribution Module Base) ),
	);

use Test::More;

foreach my $class ( @classes ) {
	BAIL_OUT( "$class did not compile\n" ) unless use_ok( $class );
	}

done_testing();
