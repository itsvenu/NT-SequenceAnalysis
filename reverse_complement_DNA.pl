#!/usr/bin/perl -w

use strict;
use warnings;

unless($#ARGV==0){
	print "USAGE: perl reverse_complement_DNA.pl <filename.faa>\n";
	exit;
}

my $filename = $ARGV[0];
open(IN, $filename);
$/ = "\n>";

while(<IN>){
	s/>//g;
	my($header, @seq) = split(/\n/, $_);
	my $sequence = join "", @seq;
	print "\nSequence header: $header\n\n";
	print "Original sequence: \n\n";
	print $sequence,"\n\n";
	$sequence =~ tr/ACTGactg\-./TGACtgac\-./;
	print "Complement of the origiinal: \n\n";
	print $sequence,"\n\n";
	print "Reverse complement: \n\n";
	print scalar reverse($sequence),"\n\n";
}
