package PERLANCAR::Permute::Named;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT = qw(
                    permute_named
            );

sub permute_named {
    # generate a code that uses n level of nested loops
}

1;
# ABSTRACT: Permute multiple-valued key-value pairs

=head1 SYNOPSIS

 use PERLANCAR::Permute::Named;

 my @p = permute_named(bool => [ 0, 1 ], x => [qw(foo bar baz)]);
 for (@p) {
     some_setup() if $_->{bool};
     other_setup($_->{x});
     # ... now maybe do some tests ...
 }


=head1 DESCRIPTION

This module is like L<Permute::Named>, except that it uses a different algorithm
(faster, does not do cloning).


=head1 FUNCTIONS

=head2 permute_named

Takes a list of key-specification pairs where the specifications can be
references to arrays of possible actual values. It then permutes all
key-specification combinations and returns the resulting list of permutations.

The function expects the pairs as an array, an array reference or a hash
reference. The benefit of passing it as an array or array reference is that you
can specify the order in which the permutations will take place - the final
specification will be processed first, then the next-to-last specification and
so on. Any other type of reference causes it to die. An uneven-sized list of
elements - indicating that one key won't have a specification - also causes it
to die. The resulting permutation list is return as an array in list context or
as a reference to an array in scalar context.

Each specification can be a scalar or a reference to an array of possible
values.

Example 1:

 permute_named(bool => [ 0, 1 ], x => [qw(foo bar baz)])

returns:

 [ { bool => 0, x => 'foo' },
   { bool => 0, x => 'bar' },
   { bool => 0, x => 'baz' },
   { bool => 1, x => 'foo' },
   { bool => 1, x => 'bar' },
   { bool => 1, x => 'baz' }, ]

Example 2:

 permute_named(bool => 1, x => 'foo')

just returns the one permutation:

 {bool => 1, x => 'foo'}


=head1 SEE ALSO

L<Permute::Named>

=cut
