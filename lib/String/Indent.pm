package String::Indent;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

use Exporter qw(import);
our @EXPORT_OK = qw(
                       indent
               );

sub indent {
    my ($indent, $str, $opts) = @_;
    $opts //= {};

    my $ibl   = $opts->{indent_blank_lines} // 1;
    my $fli   = $opts->{first_line_indent} // $indent;
    my $sli   = $opts->{subsequent_lines_indent} // $indent;
    my $flopi = $opts->{first_line_of_para_indent} // $sli // $indent;
    #say "D:ibl=<$ibl>, fli=<$fli>, flopi=<$flopi>, sli=<$sli>";

    my $i = 0;
    my $prev_blank;
    $str =~ s/^([^\r\n]?)/$i++; my $blank = !$1; my $start_para = $i==1 || $prev_blank; $prev_blank = $blank; !$ibl && $blank ? "$1" : $i==1 ? "$fli$1" : $start_para ? "$flopi$1" : "$sli$1"/egm;
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

=item * first_line_of_para_indent => str

If set, then the first line of each paragraph will be set to this instead of the
normal indent.

=item * subsequent_lines_indent => str

If set, then all lines but the first line will be set to this instead of the
normal indent.

=back


=head1 SEE ALSO

L<Indent::String>, L<String::Nudge>, L<Text::Indent>

=cut
