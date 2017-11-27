#!/usr/bin/perl
use warnings;
use strict;

my $red      = chr(27) . '[1;31m';
my $yellow   = chr(27) . '[1;33m';
my $ctrl_l   = chr(27) . '[38;5;240m'; # Grey
my $mprint   = chr(27) . '[38;5;236m'; # Grey
my $lineno   = chr(27) . '[38;5;94m'; 
my $cmd      = chr(27) . '[38;5;69m'; 
my $note     = chr(27) . '[38;5;40m';
my $warning  = chr(27) . '[38;5;163m';
my $error    = chr(27) . '[48;5;196m' . chr(27) . '[38;5;226m';
my $time     = chr(27) . '[38;5;34m';
my $out      = chr(27) . '[38;5;226m';
my $nocolor  = chr(27) . '[0m'; #  . chr(27) . '[48;5;16m' . chr(27) . '[38;5;16m]';



my $tm_last    = 0;
my $in_note    = 0;
my $in_warning = 0;
my $in_error   = 0;
while (my $line = <>) {

  chomp $line;

  my $tm = time;

  my $tm_str;
  if ($tm != $tm_last) {
    my @tm_loc = localtime($tm);
    $tm_str = sprintf('%02d:%02d:%02d', $tm_loc[2], $tm_loc[1], $tm_loc[0]);
    $tm_last = $tm;
  }
  else {
    $tm_str = '  :  :  ';
  }

  
  

  if    ( $line =~ s/\cL/${ctrl_l}CTRL -L$nocolor/                   ) {
    $line = <>; # Read another empty line
    print "${error}$0: Assumed that line is empty...$nocolor, but it is: $line\n" if $line =~ /\S/;
    next; # TODO: suppress SAS's stupid new page
  }
  elsif ( $line =~ s/^MPRINT.*/${mprint}$&$nocolor/                 ) {}
  elsif ( $line =~ s/^(NOTE|INFO): .*/${note}$&$nocolor/            ) {
     $in_note    = 1;
     $in_warning = 0;
     $in_error   = 0;
  }
  elsif ( $line =~ s/^WARNING.*/${warning}$&$nocolor/               ) {
     $in_note    = 0;
     $in_warning = 1;
     $in_error   = 0;
  }
  elsif ( $line =~ s/^ERROR.*/${error}$&$nocolor/                   ) {
     $in_note    = 0;
     $in_warning = 0;
     $in_error   = 1;
  }
  elsif ( $line =~ s/^(\d+)(\s+)(.*)/${lineno}$1$2${cmd}$3$nocolor/ ) {}
  else  {

     if ($in_note) {

       if ($line =~ /^(      \S.*)/) {
          $line = "${note}$line$nocolor"; 
       }
       else {
          $line =  "${out}$line$nocolor";
	  $in_note = 0;
       }
     }
     elsif ($in_warning) {
       if ($line =~ /^(         \S.*)/) {
          $line = "${warning}$line$nocolor"; 
       }
       else {
          $line =  "${out}$line$nocolor";
	  $in_warning = 0;
       }

     }
     elsif ($in_error) {
       if ($line =~ /^(       \S.*)/) {
          $line = "${error}$line$nocolor"; 
       }
       else {
          $line =  "${out}$line$nocolor";
	  $in_error = 0;
       }

     }
     else {

          $line =  "${out}$line$nocolor";
     }
  }

  print "${time} $tm_str $line$nocolor\n";
}
