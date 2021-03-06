#!/usr/bin/perl
use strict;
use warnings;

my $area = 0;
open F, "<q02_input.txt" or die;
while (<F>) {
    chomp;
    my @k = split /x/;
    my @t = ($k[0] + $k[1], $k[1] + $k[2], $k[0] + $k[2]);
    my $min = $t[0];
    $min = $t[1] if $min > $t[1];
    $min = $t[2] if $min > $t[2];
    $area += (2 * $min + $k[0] * $k[1] * $k[2]);
}
close F;

print "$area\n";
