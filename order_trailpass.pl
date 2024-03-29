#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.30);
use experimental qw(signatures);
use autodie;

my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =
    localtime(time);

my @month = qw(
    January February March
    April May June
    July August September
    October November December
);

my $next_month = $month[($mon + 2) % 12];

open my $SENDMAIL, "|/usr/sbin/sendmail -t";

print $SENDMAIL <<"EOF";
From: order_trailpass.pl <waltman\@mawode.com>
To: Walt Mankowski <waltman>
Subject: Order new trailpass

Today is the last day to order your $next_month Trailpass.  The
deadline is 5 PM!

Hugs,
order_trailpass.pl

EOF

close $SENDMAIL;
