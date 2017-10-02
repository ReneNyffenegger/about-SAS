data tq84_dat;
  length category $3 val 8.;
  input  category    val   ;
datalines;
foo 14
foo 29
baz  6
foo 81
bar 83
baz  8
bar  9
run;
