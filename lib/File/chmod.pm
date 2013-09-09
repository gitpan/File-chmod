our $VERSION = '0.35'; # VERSION
  ENULSBO => "sticky bit has no effect for 'others'",
  $W & 1 and $VAL |= 01000;
  $W & 4 and $DEBUG and carp $ERROR{ENULSBO};
  $W & 1 and $VAL &= ~01000;
  $W & 4 and $DEBUG and carp $ERROR{ENULSBO};
version 0.35
=head2 Functions
Exported by default:

=over 4

=item chmod(MODE,FILES)
=item getchmod(MODE,FILES)
=back

Exported by request:
=over 4

=item symchmod(MODE,FILES)
=item lschmod(MODE,FILES)
=item getsymchmod(MODE,FILES)
=item getlschmod(MODE,FILES)
=item getmod(FILES)
=back

=head2 Variables

=over 4
=item $File::chmod::DEBUG
=item $File::chmod::MASK
=item $File::chmod::UMASK
=back

=head1 CONTRIBUTOR