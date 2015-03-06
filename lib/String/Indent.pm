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

    my $ibl = $opts->{indent_blank_lines} // 1;
    my $fli = $opts->{first_line_indent} // $indent;
    my $sli = $opts->{subsequent_lines_indent} // $indent;
    #say "D:ibl=<$ibl>, fli=<$fli>, sli=<$sli>";

    my $i = 0;
    $str =~ s/^([^\r\n]?)/$i++; !$ibl && !$1 ? "$1" : $i==1 ? "$fli$1" : "$sli$1"/egm;
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

=item * indent_blank_lines => bool (default: 1)

If set to false, does not indent blank lines (i.e., lines containing only zero
or more whitespaces).

=item * first_line_indent => str

If set, then the first line will be set to this instead of the normal indent.

=item * subsequent_lines_indent => str

If set, then all lines but the first line will be set to this instead of the
normal indent.

=back


=head1 SEE ALSO

L<Indent::String>, L<String::Nudge>

=cut
