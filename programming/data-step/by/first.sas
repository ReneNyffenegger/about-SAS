data tq84_in;
  input
    txt $3.
    num 8.;

datalines;
foo 17
bar 9
bar 22
foo 86
baz 55
foo 6
bar 84
baz 21
bar 64
run;

proc sort data=tq84_in;
     by   txt;
run;

data tq84_out;
     set tq84_in;
     by  txt;

  /* Create a variable, named group_nr,
     that increases for each new group of txt */
     if first.txt then group_nr + 1;
run;

proc print data = tq84_out;
run;
