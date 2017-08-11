data tq84_data;
   input category$ val_1 val_2;
datalines;
foo  1   4
foo  2   3
bar  4   2
foo  3   1
bar 10   2
baz 19   3
baz 21   4
;

proc means data=tq84_data;
/*
     Report
       Number of observations (N)
       Mean
       Std Dev
       Min
       Max
*/
     var   val_1 val_2;
run;
