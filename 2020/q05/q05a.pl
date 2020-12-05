#!/usr/bin/perl -w

$highest = 0;
open F, "q05_input.txt" or die;
while (<F>) {
    chomp $_;
    s/[FL]/0/g;
    s/[BR]/1/g;
    my $res = $_;
    my $row = substr $res, 0, 7;
    my $col = substr $res, 7, 10;
    my $sID = oct("0b$row") * 8 + oct("0b$col");

    $highest = $sID if $sID > $highest;
}
close F;

print "$highest\n";
