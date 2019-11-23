#!/usr/local/bin/perl -w
use strict;

my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) =
    localtime(time);

my @month = qw(
    January February March
    April May June
    July August September
    October November December
);

my $next_month = $month[($mon + 2) % 12];

open QMAIL, "|/var/qmail/bin/qmail-inject"
    or die "Can't fork for qmail: $!\n";

print QMAIL <<"EOF";
From: order_trailpass.pl <waltman\@mawode.com>
To: Walt Mankowski <waltman>
Subject: Order new trailpass

Today is the last day to order your $next_month Trailpass.  The
deadline is 5 PM!

Hugs,
order_trailpass.pl

EOF

close QMAIL
    or die "sendmail didn't close nicely";
