#!/usr/bin/perl -w

#select any site on a nucleotide sequence, given a start and end position

use strict;
use warnings;

unless($#ARGV==2){
	print "USAGE: perl slect_sites.pl <file.faa>  <start_position>  <end_position>\n";
	exit;
}

my $in = $ARGV[0];
my $start = $ARGV[1];
my $end = $ARGV[2];
open(IN, $in);
$/ = "\n>";

while(<IN>){
	s/>//g;
	my($header, @seq) = split(/\n/, $_);
	my $string_seq = join "",@seq;
	my $selected_site = substr($string_seq, $start, $end);

	print "\n";	
	print "Sequence ID: $header\n";
	print "Selected site: $selected_site\n\n";

}
