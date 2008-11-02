use inc::Module::Install;
include 'Module::AutoInstall';

name 'App-Benchmark-Accessors';
all_from 'lib/App/Benchmark/Accessors.pm';
perl_version '5.006';

requires 'App::Benchmark';
requires 'UNIVERSAL::require';

requires 'Class::Accessor';
requires 'Class::Accessor::Complex';
requires 'Class::Accessor::Constructor';
requires 'Class::Accessor::Fast';
requires 'Class::Accessor::Fast::XS';
requires 'Class::MethodMaker';
requires 'Class::Spiffy';
requires 'Mojo::Base';
requires 'Moose';
requires 'Mouse';
requires 'Object::Tiny';
requires 'Spiffy';
requires 'accessors';

recommends 'Test::Pod';
recommends 'Test::Pod::Coverage';

test_requires 'Test::More' => '0.70';
test_requires 'Test::Compile';

auto_install;
auto_include;
WriteAll;
