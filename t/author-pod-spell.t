
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::PodSpelling 2.006001
use Test::Spelling 0.12;
use Pod::Wordlist;


add_stopwords(<DATA>);
all_pod_files_spelling_ok( qw( bin lib  ) );
__DATA__
chmods
chmodding
Jeff
Pinyan
japhy
Caleb
Cushing
xenoterracide
and
David
Steinbrunner
dsteinbrunner
Slaven
Rezic
slaven
Tim
oylenshpeegul
lib
File
chmod