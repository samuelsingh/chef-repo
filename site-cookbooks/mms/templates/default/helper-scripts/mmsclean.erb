#!/usr/bin/perl -w
#
# Clean out unneeded files from mms systems

use Time::Local;
use File::Path;
use strict;

my $KEEP_DAYS = 5;
my $VERBOSE = 1;
my $DEBUG = 0;
my $TOMCAT_BASE = '/var/tomcat';
my $ATTACHMENTS_DIR = 'webapps/mom/attachments';

my @attachdirs = ();

opendir(DIR, $TOMCAT_BASE) or die "Can't open $TOMCAT_BASE: $!\n";
while (defined(my $tdir = readdir(DIR))) {
	my $adir = "$TOMCAT_BASE/$tdir/$ATTACHMENTS_DIR";
	warn "Tomcat directory: $tdir\n" if ($VERBOSE > 3);
	if (-d $adir){
		push(@attachdirs, $adir) ;
		warn "Attachments directory: $adir\n" if ($VERBOSE > 1);
	}
}
closedir(DIR);

my @previewdirs = ();

foreach my $dir (@attachdirs) {
	opendir(DIR, $dir) or die "Can't open dir '$dir': $!\n";
	my @pdirs = grep {/^preview/ && -d "$dir/$_" } readdir(DIR);
	closedir(DIR);
	warn "Found " . $#pdirs . " preview dirs in $dir\n" if $VERBOSE;
	push (@previewdirs, map { "$dir/$_" } @pdirs);
}

if (@previewdirs == 0) {
	die "Did not find any preview directories in '" . join (", ", @attachdirs) . "'\n";
}

my $cutoff_time = time() - ($KEEP_DAYS * 3600 * 24);

my @dead_dirs = ();

foreach (@previewdirs) {
	warn "Preview dir: $_\n" if $VERBOSE > 1;
	if (m|/preview[\D\-]*(\d\d)(\d\d)(\d\d)\.[^/]+|) {
		my ($y, $m, $d) = ($1, $2, $3);
		$m--;
		$y += 100; # for timelocal, year needs to = year - 1900, so 07 is 107
		my $ptime = timelocal(0, 0, 0, $d, $m, $y);

		#warn "KSM: This dir = $ptime, cutoff = $cutoff_time\n";
		#my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($ptime);
		#warn "KSM: This directory preview is for $mday/$mon/$year\n";
		#($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($cutoff_time);
		#warn "KSM: Cutoff date is $mday/$mon/$year\n";
		
		if ($ptime < $cutoff_time) {
			warn "Prune: $_ \n" if $VERBOSE;
			push (@dead_dirs, $_);
		} elsif ($VERBOSE > 1) {
			warn "Keep: $_\n";
		}
	} else {
		warn "Directory in attachments doesn't look like a preview dir\n";
	}
}

warn "Found " . ($#dead_dirs + 1) . " preview directories older than $KEEP_DAYS days\n" if ($VERBOSE);
if (@dead_dirs && !$DEBUG) { 
	rmtree (\@dead_dirs,$VERBOSE > 1,1); 
} elsif (@dead_dirs) {
	print "Directories to delete:\n";
	print join("\n", sort(@dead_dirs)) . "\n";
}


