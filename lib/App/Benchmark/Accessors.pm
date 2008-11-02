package App::Benchmark::Accessors;

use strict;
use warnings;


our $VERSION = '0.02';


package    # hide from PAUSE
  WithMoose;
use Moose;
has myattr => ( is => 'rw' );


package    # hide from PAUSE
  WithMooseImmutable;
use Moose;
has myattr => ( is => 'rw' );
__PACKAGE__->meta->make_immutable;


package    # hide from PAUSE
  WithMouse;
use Mouse;
has myattr => ( is => 'rw' );


package    # hide from PAUSE
  WithClassAccessor;
use base qw(Class::Accessor);
__PACKAGE__->mk_accessors(qw/myattr/);


package    # hide from PAUSE
  WithClassAccessorFast;
use base qw(Class::Accessor::Fast);
__PACKAGE__->mk_accessors(qw/myattr/);


package    # hide from PAUSE
  WithClassAccessorFastXS;
use base qw(Class::Accessor::Fast::XS);
__PACKAGE__->mk_accessors(qw/myattr/);


package    # hide from PAUSE
  WithClassAccessorComplex;
use base qw(Class::Accessor::Complex);
__PACKAGE__->mk_new->mk_scalar_accessors(qw/myattr/);


package    # hide from PAUSE
  WithClassAccessorConstructor;
use base qw(Class::Accessor::Constructor Class::Accessor::Complex);
__PACKAGE__->mk_constructor->mk_scalar_accessors(qw/myattr/);


package    # hide from PAUSE
  WithMojo;
use base qw(Mojo::Base);
__PACKAGE__->attr('myattr');


package    # hide from PAUSE
  WithClassMethodMaker;
use Class::MethodMaker
    [ scalar => [ qw/myattr/ ],
      new    => [ qw/-hash new/ ],
    ];


package    # hide from PAUSE
  WithObjectTiny;
use Object::Tiny qw/myattr/;


package    # hide from PAUSE
  WithSpiffy;
use Spiffy -base;
field 'myattr';


package    # hide from PAUSE
  WithClassSpiffy;
use Class::Spiffy -base;
field 'myattr';


package    # hide from PAUSE
  WithAccessors;
use accessors qw(myattr);
sub new { bless {}, shift }


1;


__END__

=head1 NAME

App::Benchmark::Accessors - benchmark accessor generators

=head1 SYNOPSIS

None - just run the test suite

=head1 DESCRIPTION

This distribution runs benchmarks on various accessor generators. The
following generators are being benchmarked:

=over 4

=item Moose

=item Mouse

=item Class::Accessor

=item Class::Accessor::Fast

=item Class::Accessor::Fast::XS

=item Class::Accessor::Complex

=item Class::Accessor::Constructor

=item Mojo::Base

=item Class::MethodMaker

=item Object::Tiny

=item Spiffy

=item Class::Spiffy

=item accessors

=back

The benchmarks are being run as part of the test suite; see L<App::Benchmark>.
This way you can look at this distribution's CPAN testers page to see the
benchmark results on many different platforms and for many different perl
versions.

The C<t/versions.t> reports the version numbers of these modules.

The C<t/construction.t> file benchmarks object creation, C<t/get.t> benchmarks
getter methods and C<t/set.t> benchmarks setter methods.

Not every benchmark is run on every module; for example, L<Object::Tiny>
doesn't create setter methods, and L<accessors> doesn't generate constructors.

Each benchmark test file takes an optional numeric parameter that is used as
the number of iterations.

It's probably a good idea not to read too much into these benchmarks; they
could be seen as micro-optimization. However, if you have a complex object
hierarchy and create lots of objects and run many many getters/setters on
them, they could help to save some time. But be sure to use L<Devel::NYTProf>
first to see where your real bottlenecks are.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHORS

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2008 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

