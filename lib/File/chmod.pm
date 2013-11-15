our $VERSION = '0.40'; # VERSION
  ENULSBU => "sticky bit has no effect for 'user'",
sub chmod (@) { ## no critic ( Subroutines::ProhibitBuiltinHomonyms Subroutines::ProhibitSubroutinePrototypes )
  $W & 1 and $DEBUG and carp $ERROR{ENULSBU};
  $W & 4 and $VAL |= 01000;
  $W & 1 and $DEBUG and carp $ERROR{ENULSBU};
  $W & 4 and $VAL &= ~01000;
version 0.40
  $File::chmod::UMASK = 0; # you may want this, it ignores the systems umask setting
as a mask against the new mode. This mode is on by default, and changes the
=head1 FUNCTIONS - EXPORT
=head2 chmod(MODE,FILES)
=head2 getchmod(MODE,FILES)
=head1 FUNCTIONS - EXPORT_OK
=head2 symchmod(MODE,FILES)
=head2 lschmod(MODE,FILES)
=head2 getsymchmod(MODE,FILES)
=head2 getlschmod(MODE,FILES)
=head2 getmod(FILES)
=head1 VARIABLES
=head2 $File::chmod::DEBUG
=head2 $File::chmod::MASK
=head2 $File::chmod::UMASK
=head1 CONTRIBUTORS

=over 4

=item *
=item *

Slaven Rezic <slaven@rezic.de>

=item *

Steve Throckmorton <arrestee@gmail.com>

=item *

Tim <oylenshpeegul@gmail.com>

=back
