package String::Indent;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       indent
               );

sub indent {
    my ($indent, $str, $opts) = @_;
    $opts //= {};

    if ($opts->{indent_blank_lines} // 1) {
        $str =~ s/^/$indent/mg;
    } else {
        $str =~ s/^([^\r\n]*\S[^\r\n]*)/$indent$1/mg;
    }
    $str;
}

1;
# ABSTRACT: String indenting routines

=head1 FUNCTIONS

=head2 indent($indent, $str, \%opts) => STR

Indent every line in $str with $indent. Example:

 indent('  ', "one\ntwo\nthree") # "  one\n  two\n  three"

%opts is optional. Known options:

=over 4

=item * indent_blank_lines => BOOL (default 1)

If set to false, does not indent blank lines (i.e., lines containing only zero
or more whitespaces).

=back


=head1 SEE ALSO

L<Indent::String>, L<String::Nudge>

=cut
