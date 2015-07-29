#!/usr/bin/perl -w

use strict;
use warnings;

unless($#ARGV==1){
	print "USAGE: perl point_muaataion.pl <seq_file1.faa> <seq_file2.faa>\n";
	exit;
}

my $file1 = $ARGV[0];
my $file2 = $ARGV[1];
open(IN, $file1);
open(INN, $file2);

my $sequence1;
my $sequence2;

$/ = "\n>";
while(<IN>){
	s/>//g;
	my($header, @seq) = split(/\n/, $_);
	$sequence1 = join "", @seq;
}

while(<INN>){
	s/>//g;
	my($header2, @seq2) = split(/\n/, $_);
	$sequence2 = join "", @seq2;
}

# detecting point mutations

my $diff = $sequence1^$sequence2;
my $point_mut = $diff =~ tr/\0//c;
print $point_mut,"\n";
