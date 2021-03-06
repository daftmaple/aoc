#!/usr/bin/perl
use strict;
use warnings;

my $all = 0;
my $d = 0;
my $len;
open F, "<q03_input.txt" or die;
while (<F>) {
    chomp;
    $len = length($_) if !defined $len;
    my $id = $d % $len;
    if (substr($_, $id, 1) eq "#") {
        $all++;
    }
    $d += 3;
}
close F;

print "$all\n";
