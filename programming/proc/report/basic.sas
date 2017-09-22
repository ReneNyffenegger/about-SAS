data tq84_report;
  length txt $3 val 4.;
  input  txt    val   ;
datalines;
foo 42
bar .
foo 18
baz 332
bar 7
foo 219
foo .
bar 153
bar 22
quit;

proc report data=tq84_report;
     where val > 20;
     
     column txt val val_sq;

     define txt / display;
     define val / display;
     
     compute val_sq;
       val_sq = val ** 2;
     endcomp;
run;
