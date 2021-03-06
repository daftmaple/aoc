#!/usr/bin/perl
use strict;
use warnings;

my @array = ();
open F, "q05_input.txt" or die;
while (<F>) {
    chomp;
    s/[FL]/0/g;
    s/[BR]/1/g;
    my $res = $_;
    my $row = substr $res, 0, 7;
    my $col = substr $res, 7, 10;
    my $sID = oct("0b$row") * 8 + oct("0b$col");

    push @array, $sID;
}
close F;

my @sorted = sort @array;

for (my $i = 0; $i < scalar(@sorted) - 1; $i++) {
    if ($sorted[$i] + 2 == $sorted[$i + 1]) {
        my $result = $sorted[$i] + 1;
        print "$result\n";
        exit;
    }
}
