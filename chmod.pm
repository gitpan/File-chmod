	$VAL $S $U $G $O $MODE $c
@ISA = qw( Exporter AutoLoader );
$VERSION = '0.21';

my %r = ('or' => [0,0400,0040,0004], 'full' => [0,0700,0070,0007]);
my %w = ('or' => [0,0200,0020,0002], 'full' => $r{'full'});
my %x = ('or' => [0,0100,0010,0001], 'full' => $r{'full'});

	my @files = @_;
	my @return;

	for (@files){
		my $fm = (stat)[2] & 07777;
		my $s = ($fm & 07000)>>9;
		my ($u,$g,$o) = (($fm & 0700)>>6, ($fm & 0070)>>3, $fm & 0007);
		push @return, oct($s.$u.$g.$o);
	}

	my $how = determine_mode($mode);
	my @files = @_;
	return symchmod($mode,@files) if $how == $SYM;
	return lschmod($mode,@files) if $how == $LS;
	return CORE::chmod($mode, @files);
}
	my $how = determine_mode($mode);
	my @files = @_;

	return getsymchmod($mode,@files) if $how == $SYM;
	return getlschmod($mode,@files) if $how == $LS;
	return wantarray ? (($mode) x @files) : $mode;
	my @files = @_;
	my @return;
	my $ret = 1;

	@return = getsymchmod($mode,@files);
	for (@files){ $ret &= CORE::chmod(shift(@return),$_); }
	my @files = @_;
	(determine_mode($mode) != $SYM) && do {
		carp "symchmod received non-symbolic mode: $mode";
		return 0;
	};
	for (@files){
		$VAL = getmod($_);
		for my $thismode (split /,/, $mode){
			local ($U,$G,$O,$MODE,$c);
			CHAR: for $c (split //, $thismode){
				for ($c){
					next if $MODE;
					/a/ && ($U=1,$G=2,$O=3) && next CHAR;
					/u/ && ($U=1) && next CHAR;
					/g/ && ($G=2) && next CHAR;
					/o/ && ($O=3) && next CHAR;
				for ($c){
					/[-+=]/ && do {
						unless ($U || $G || $O){ ($U=1,$G=2,$O=3); }
						$MODE = $_;
						clear() if $_ eq "=";
						next CHAR;
					}
				croak "Bad mode $thismode" if !$MODE;

				for ($c){
					if (/u/){
						u_or() if $MODE eq "+" or $MODE eq "=";
						u_not() if $MODE eq "-";
					}
					if (/g/){
						print "ENTERING /g/\n";
						g_or() if $MODE eq "+" or $MODE eq "=";
						g_not() if $MODE eq "-";
					}
					if (/o/){
						o_or() if $MODE eq "+" or $MODE eq "=";
						o_not() if $MODE eq "-";
					}
					if (/r/){
						r_or() if $MODE eq "+" or $MODE eq "=";
						r_not() if $MODE eq "-";
					}
					if (/w/){
						w_or() if $MODE eq "+" or $MODE eq "=";
						w_not() if $MODE eq "-";
					}
					if (/x/){
						x_or() if $MODE eq "+" or $MODE eq "=";
						x_not() if $MODE eq "-";
					}
					if (/s/){
						or_s() if $MODE eq "+" or $MODE eq "=";
						not_s() if $MODE eq "-";
					}
					if (/l/){
						or_l() if $MODE eq "+" or $MODE eq "=";
						not_l() if $MODE eq "-";
					}
					if (/t/){
						or_t() if $MODE eq "+" or $MODE eq "=";
						not_t() if $MODE eq "-";
					}
				}

				croak "Unknown mode: $mode";
	my @files = @_;
	local $VAL;

	$VAL = getlschmod($mode,@files);

	return CORE::chmod($VAL,@files);
}
	my @files = @_;
	((determine_mode($mode) != $LS) || length($mode) != 10) && do {
		carp "lschmod received non-ls mode: $mode";
		return 0;
	};
	local $VAL;
	my ($u,$g,$o) = ($mode =~ /^.(...)(...)(...)$/) || do {
		carp "lschmod received non-ls mode: $mode";
		return 0;
	};

	for (split //, $u){
	for (split //, $g){
	for (split //, $o){
	return wantarray ? (($VAL) x @files) : $VAL;
sub determine_mode {
	return $LS if $mode =~ /ST/;
	$U && ($VAL &= 02077);
	$G && ($VAL &= 05707);
	$O && ($VAL &= 07770);
	$G && ($VAL |= (($val & 0700)>>3 | ($val & 04000)>>1));
	$O && ($VAL |= (($val & 0700)>>6));
	next CHAR;
	$U && ($VAL &= ~(($val & 0700) | ($val & 05000)));
	$G && ($VAL &= ~(($val & 0700)>>3 | ($val & 04000)>>1));
	$O && ($VAL &= ~(($val & 0700)>>6));
	next CHAR;
	$U && ($VAL |= (($val & 070)<<3 | ($val & 02000)<<1));
	$O && ($VAL |= (($val & 070)>>3));
	next CHAR;
	$U && ($VAL &= ~(($val & 070)<<3 | ($val & 02000)<<1));
	$G && ($VAL &= ~(($val & 070) | ($val & 02000)));
	$O && ($VAL &= ~(($val & 070)>>3));
	next CHAR;
	$U && ($VAL |= (($val & 07)<<6));
	$G && ($VAL |= (($val & 07)<<3));
	next CHAR;
	$U && ($VAL &= ~(($val & 07)<<6));
	$G && ($VAL &= ~(($val & 07)<<3));
	$O && ($VAL &= ~(($val & 07)));
	next CHAR;
	$U && ($VAL |= $r{'or'}[$U]);
	$G && ($VAL |= $r{'or'}[$G]);
	$O && ($VAL |= $r{'or'}[$O]);
	next CHAR;
	$U && ($VAL &= ~$r{'or'}[$U]);
	$G && ($VAL &= ~$r{'or'}[$G]);
	$O && ($VAL &= ~$r{'or'}[$O]);
	next CHAR;
	$U && ($VAL |= $w{'or'}[$U]);
	$G && ($VAL |= $w{'or'}[$G]);
	$O && ($VAL |= $w{'or'}[$O]);
	next CHAR;
	$U && ($VAL &= ~$w{'or'}[$U]);
	$G && ($VAL &= ~$w{'or'}[$G]);
	$O && ($VAL &= ~$w{'or'}[$O]);
	next CHAR;
	($VAL & 02000) && do {
		$DEBUG && carp("cannot set execute on locked file"); 1;
	} && next;
	$U && ($VAL |= $x{'or'}[$U]);
	$G && ($VAL |= $x{'or'}[$G]);
	$O && ($VAL |= $x{'or'}[$O]);
	next CHAR;
	$U && ($VAL &= ~$x{'or'}[$U]);
	$G && ($VAL &= ~$x{'or'}[$G]);
	$O && ($VAL &= ~$x{'or'}[$O]);
	next CHAR;
sub or_s {
	($VAL & 02000) && do {
		$DEBUG && carp("cannot set-gid on locked file"); 1;
	} && next;
	($VAL & 00100) && do {
		$DEBUG && carp("execute bit must be on for set-uid"); 1;
	} && next;
	($VAL & 00010) && do {
		$DEBUG && carp("execute bit must be on for set-gid"); 1;
	} && next;
	$U && ($VAL |= 04000);
	$G && ($VAL |= 02000);
	$O && (carp "set-id has no effect for 'others'");
	next CHAR;
sub not_s {
	$U && ($VAL &= ~04000);
	$G && ($VAL &= ~02000);
	$O && (carp "set-id has no effect for 'others'");
	next CHAR;
sub or_l {
	($VAL & 00010) && do {
		$DEBUG && carp("cannot cause file locking on group executable file"); 1;
	} && next;
	($VAL & 02010) && do {
		$DEBUG && carp("cannot cause file locking on set-gid file"); 1;
	} && next;
	($U || $G || $O) && ($VAL |= 02000);
	next CHAR;
sub not_l {
	($U || $G || $O) && ($VAL &= ~02000);
	next CHAR;
sub or_t {
	$U && ($VAL |= 01000);
	$G && $DEBUG && (carp "sticky bit has no effect for 'group'");
	$O && $DEBUG && (carp "sticky bit has no effect for 'others'");
	next CHAR;
sub not_t {
	$U && ($VAL &= ~01000);
	$G && $DEBUG && (carp "sticky bit has no effect for 'group'");
	$O && $DEBUG && (carp "sticky bit has no effect for 'others'");
	next CHAR;
File::chmod - Perl extension to implement symbolic and ls chmod modes
If set to a true value, it will report carpings, similar to those
produced by chmod() on your system.  Otherwise, the functions will not
report errors.  Example: a file can not have file-locking and the
set-gid bits on at the same time.  If $File::chmod::DEBUG is true, the
function will silently report an error.  If not, you are not carped of
the conflict.  It is set to 1 as default.
=head1 BUGS
I'm still trying to come up with sure-fire ways to distinguish between an
"ls" mode and a symbolic mode.  Let me know if you have a method for
determining the mode.  I'm not sure mine is infallible.
  Jeff Pinyan
  jeffp@crusoe.net
  CPAN ID: PINYAN
  Stat::lsMode (by Mark-James Dominus)