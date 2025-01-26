package App::cpaninfo::Adapter::Distribution;
use parent qw(App::cpaninfo::Adapter::Base);

sub _map ( $class ) {
	state %methods = map { $_, 1 } qw(
		abstract archive authorized changes date distribution download_url
		first maturity main_module meta mtime name version
		);
	return \%methods;
	}

1;
