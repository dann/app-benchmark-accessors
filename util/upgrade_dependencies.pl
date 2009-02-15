#!/usr/bin/env perl

use warnings;
use strict;
use CPAN;

while (<DATA>) {
    chomp;
    CPAN::Shell->install($_);
}

__DATA__
Class::Accessor
Class::Accessor::Complex
Class::Accessor::Constructor
Class::Accessor::Fast
Class::Accessor::Fast::XS
Class::MethodMaker
Class::Spiffy
Mojo::Base
Moose
Mouse
Object::Tiny
Spiffy
accessors
Class::XSAccessor
Class::XSAccessor::Array
Rose::Object
Rubyish::Attribute
