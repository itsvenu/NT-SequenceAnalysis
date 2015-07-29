#!/usr/bin/perl -w

use strict;
use warnings;

unless($#ARGV==0){
	print "USAGE: perl countNT.pl	<file_name.faa>\n";
	exit;
}

my $in = $ARGV[0];
open(IN, $in);
$/ = "\n>";
while(<IN>){
	s/>//g;
	my($header, @seq)=split(/\n/,$_);
	my $string_seq = join "",@seq;
	my $A = () = $string_seq =~ /A/gi;
	my $G = () = $string_seq =~ /G/gi;
	my $C = () = $string_seq =~ /C/gi;
	my $T = () = $string_seq =~ /T/gi;

	print "Sequence ID - $header","\n\n";
	print " A - $A\n G - $G\n C - $C\n T - $T\n\n";
	
}
