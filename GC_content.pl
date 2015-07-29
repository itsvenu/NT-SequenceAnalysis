#!/usr/bin/perl -w

use strict;
use warnings;

unless($#ARGV==0){
	print "USAGE: perl GC_content.pl	<file_name.faa>\n";
	exit;
}

my $in = $ARGV[0];
open(IN, $in);
$/ = "\n>";

while(<IN>){
	s/>//g;
	my($header, @seq) = split(/\n/, $_);
	my $sequence = join "",@seq;
	my $sequence_length = length($sequence);
	my $G = () = $sequence =~ /G/g;
	my $C = () = $sequence =~ /C/g;
	my $GC = $G+$C;
	my $GC_content = sprintf "%0.3f", ($GC/$sequence_length)*100;
	print "Sequence ID - $header\n";
	print "GC-content - $GC_content%\n";
}
