#!perl

use 5.010;
use strict;
use warnings;

use Test::More 0.98;

use String::Indent qw(
                         indent
                          );

is(indent('xx', "1\n2 \n3 3\n\n"), "xx1\nxx2 \nxx3 3\nxx\n", "indent 1");
is(indent('xx', "1\n\n2", {indent_blank_lines=>0}), "xx1\n\nxx2", "indent 2");

DONE_TESTING:
done_testing();
