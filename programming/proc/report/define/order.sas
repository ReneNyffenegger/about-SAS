data tq84_report;
  length txt $3 val 4.;
  input  txt    val   ;
datalines;
foo 42
bar 61
foo 18
baz 332
bar .
foo 219
foo .
bar 153
bar 22
quit;


proc report data=tq84_report;
     column txt val;

     define txt / order;    /* Order by txt */
     define val / display;
run;
