package App::cpaninfo::Adapter::Release;
use parent qw(App::cpaninfo::Adapter::Base);

=encoding utf8

=head1 NAME

App::cpaninfo::Adapter::Release -

=head1 SYNOPSIS

	use App::cpaninfo;

=head1 DESCRIPTION

=over 4

=item new

=cut

sub AUTOLOAD ($self) { shift->SUPER::AUTOLOAD }

sub _map ( $class ) {
	state %methods = map { $_, 1 } qw(
		abstract archive authorized changes date distribution download_url
		first maturity main_module meta mtime name version
		);
	say "in _map";
	return \%methods;
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
'data' => {
		   'name' => 'Business-ISBN-3.004',
		   'date' => '2017-04-24T20:05:07',
		   'abstract' => 'work with International Standard Book Numbers',
		   'license' => [
						  'artistic_2'
						],
		   'maturity' => 'released',
		   'checksum_md5' => '60b36c0a92cf51e9027ec3d9f38e7224',
		   'checksum_sha256' => '31754acd57bf0c3d4762003d784bce4a0af6832a725336e219fb2988b6fb831e',
		   'first' => !!0,
		   'authorized' => !!1,
		   'tests' => {
						'na' => 4,
						'fail' => 0,
						'unknown' => 0,
						'pass' => 3439
					  },
		   'resources' => {
							'homepage' => 'https://github.com/briandfoy/business-isbn',
							'bugtracker' => {
											  'web' => 'https://github.com/briandfoy/business-isbn/issues'
											},
							'repository' => {
											  'url' => 'https://github.com/briandfoy/business-isbn.git',
											  'type' => 'git',
											  'web' => 'https://github.com/briandfoy/business-isbn'
											}
						  },
		   'author' => 'BDFOY',
		   'archive' => 'Business-ISBN-3.004.tar.gz',
		   'dependency' => [
							 {
							   'relationship' => 'requires',
							   'module' => 'Business::ISBN::Data',
							   'phase' => 'runtime',
							   'version' => '20140910.002'
							 },
							 {
							   'version' => '5.008',
							   'phase' => 'runtime',
							   'relationship' => 'requires',
							   'module' => 'perl'
							 },
							 {
							   'relationship' => 'requires',
							   'module' => 'File::Spec::Functions',
							   'version' => '0',
							   'phase' => 'configure'
							 },
							 {
							   'version' => '6.64',
							   'phase' => 'configure',
							   'module' => 'ExtUtils::MakeMaker',
							   'relationship' => 'requires'
							 },
							 {
							   'phase' => 'test',
							   'version' => '0.95',
							   'module' => 'Test::More',
							   'relationship' => 'requires'
							 }
						   ],
		   'version_numified' => '3.004',
		   'status' => 'backpan',
		   'download_url' => 'https://cpan.metacpan.org/authors/id/B/BD/BDFOY/Business-ISBN-3.004.tar.gz',
		   'deprecated' => !!0,
		   'version' => '3.004',
		   'main_module' => 'Business::ISBN',
		   'metadata' => {
			   'resources' => {
								'homepage' => 'https://github.com/briandfoy/business-isbn',
								'bugtracker' => {
												  'web' => 'https://github.com/briandfoy/business-isbn/issues'
												},
								'repository' => {
												  'type' => 'git',
												  'url' => 'https://github.com/briandfoy/business-isbn.git',
												  'web' => 'https://github.com/briandfoy/business-isbn'
												}
							  },
			   'author' => [
							 'brian d foy <bdfoy@cpan.org>'
						   ],
			   'meta-spec' => {
								'url' => 'http://search.cpan.org/perldoc?CPAN::Meta::Spec',
								'version' => '2'
							  },
			   'version' => '3.004',
			   'abstract' => 'work with International Standard Book Numbers',
			   'generated_by' => 'ExtUtils::MakeMaker version 7.04, CPAN::Meta::Converter version 2.140640, CPAN::Meta::Converter version 2.150005',
			   'name' => 'Business-ISBN',
			   'license' => [
							  'artistic_2'
							],
			   'release_status' => 'stable',
			   'prereqs' => {
							  'test' => {
										  'requires' => {
														  'Test::More' => '0.95'
														}
										},
							  'build' => {
										   'requires' => {}
										 },
							  'runtime' => {
											 'requires' => {
															 'Business::ISBN::Data' => '20140910.002',
															 'perl' => '5.008'
														   }
										   },
							  'configure' => {
											   'requires' => {
															   'ExtUtils::MakeMaker' => '6.64',
															   'File::Spec::Functions' => '0'
															 }
											 }
							},
			   'dynamic_config' => 1,
			   'no_index' => {
							   'directory' => [
												't',
												'inc',
												't',
												'xt',
												'inc',
												'local',
												'perl5',
												'fatlib',
												'example',
												'blib',
												'examples',
												'eg'
											  ]
							 }
			 },
		   'stat' => {
					   'size' => 363331,
					   'mode' => 33188,
					   'mtime' => 1493064307
					 },
		   'distribution' => 'Business-ISBN',
		   'provides' => [
						   'Business::ISBN',
						   'Business::ISBN10',
						   'Business::ISBN13'
						 ],
		   'id' => 'VtHpH8W_9zqWzG9nYHDSrSR1Xyo'
		 }
}, 'MetaCPAN::Client::Release' )
];
