#!/usr/bin/perl
use strict;
use warnings;

open F, "<q08_input.txt" or die;
chomp(my @strings = <F>);
close F;

my $literal = 0;
my $plus = 0;
my $hex = 0;
while (@strings) {
    my $word = shift (@strings);
    $literal += length($word);
    
    # Remove enclosing quotes
    my $simplifiedWord = ($word =~ /^\"(.*)\"$/)[0];

    # Capture all escaped
    my @escaped = ($simplifiedWord =~ /(\\)[\\"]/g);

    # Capture all hexes
    my @hexes = ($simplifiedWord =~ /(\\x[0-9a-f]{2})/g);

    # Length of the new one:
    # + 4 from quotes
    # + 2 * size of all escaped
    # + size of all hexes
    my $mem = length($word) + (4 + 2 * scalar(@escaped) + scalar(@hexes));
    $plus += $mem;
}

my $result = $plus - $literal;

print "$result\n";
