#!/usr/bin/env perl

use warnings;
use strict;
use App::Benchmark ':all';
use App::Benchmark::Accessors;

my $iterations = shift;
$iterations ||= 200_000;

benchmark_diag($iterations, {
    moose =>
        sub { WithMoose->new(myattr => 27) },
    moose_immutable =>
        sub { WithMooseImmutable->new(myattr => 27) },
    mouse =>
        sub { WithMouse->new(myattr => 27) },
    class_accessor =>
        sub { WithClassAccessor->new({ myattr => 27 }) },
    class_accessor_fast =>
        sub { WithClassAccessorFast->new({ myattr => 27 }) },
    class_accessor_fast_xs =>
        sub { WithClassAccessorFastXS->new({ myattr => 27 }) },
    class_accessor_complex =>
        sub { WithClassAccessorComplex->new(myattr => 27) },
    class_accessor_constructor =>
        sub { WithClassAccessorConstructor->new(myattr => 27) },
    mojo =>
        sub { WithMojo->new(myattr => 27) },
    class_methodmaker =>
        sub { WithClassMethodMaker->new(myattr => 27) },
    object_tiny =>
        sub { WithObjectTiny->new(myattr => 27) },
    spiffy =>
        sub { WithSpiffy->new(myattr => 27) },
    class_spiffy =>
        sub { WithClassSpiffy->new(myattr => 27) },
});

