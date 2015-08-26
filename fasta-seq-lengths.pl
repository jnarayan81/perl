#!/usr/bin/perl
use strict;
use FastaReader;
use ProgramName;
$|=1;

my $name=ProgramName::get();
my $usage="$name <*.fasta>";
die "$usage\n" unless @ARGV==1;
my ($filename)=@ARGV;

my $total=0;
my $index=0;
my $reader=new FastaReader($filename);
while(1)
  {
    my ($defline,$seq)=$reader->nextSequence();
    last unless defined $defline;
    my $length=length($seq);
    $total+=$length;
    print "$index ";
    if($defline=~/^>(\S+)/) {print "$1 "}
    print "$length\n";
    ++$index;
  }
print "TOTAL\t$total\n";

