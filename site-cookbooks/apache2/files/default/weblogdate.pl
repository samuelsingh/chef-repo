#!/usr/bin/perl -w
#
# This script takes a line from an http log on standard input, and prints a string 
# with the data in the format "YYYYMMDDHHMM".
#
# The line on the input is expected to look like:
#
#    <vhost> <client> - - [dd/MMM/YYYY:HH:MM:SS +0000] ....

use strict;
my $VERBOSE = 0;

my %MON2NUM = (
    'Jan', 1,
    'Feb', 2,
    'Mar', 3,
    'Apr', 4,
    'May', 5,
    'Jun', 6,
    'Jul', 7,
    'Aug', 8,
    'Sep', 9,
    'Oct', 10,
    'Nov', 11,
    'Dec', 12
);

while (<STDIN>) {
    # 213.130.46.235 - - [29/Oct/2006:04:05:13 +0000] 
    if ( m|^\S+ \s+ \S+ \s+ \S+ \s+ \[ (\d+) / ([^/]+) / (\d+) : (\d+) : (\d+)|x) {
        my ($day, $mon, $year, $hour, $min) = ($1, $2, $3, $4, $5);
        printf("%4d%02d%02d%02d%02d\n", $year, $MON2NUM{$mon}, $day, $hour, $min);
    } 
    # app.mapofmedicine.com 213.130.46.235 - - [29/Oct/2006:04:05:13 +0000] 
    elsif (m|^\S+ \s+ \S+ \s+ \S+ \s+ \S+ \s+ \[ (\d+) / ([^/]+) / (\d+) : (\d+) : (\d+)|x) {
        my ($day, $mon, $year, $hour, $min) = ($1, $2, $3, $4, $5);
        printf("%4d%02d%02d%02d%02d\n", $year, $MON2NUM{$mon}, $day, $hour, $min);
    } else {
        warn "Failed to parse a date from log entry: $_";
    }
}



