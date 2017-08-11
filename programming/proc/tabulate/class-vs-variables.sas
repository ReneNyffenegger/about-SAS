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

proc tabulate data=tq84_data;
     class  category;
     var    val_1 val_2;
     table (val_1 val_2) * (n mean="Average" std min max sum),  all;
run;
