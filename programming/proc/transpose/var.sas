data tq84_data;

  array num{*} $20 num_1-num_10;
  input num_1-num_10;

datalines;
one two three four five six seven eight nine ten
;


proc transpose
     data = tq84_data
     out  = tq84_transposed;
     var num_1-num_10;
run;

proc sql;
  select * from tq84_transposed;
quit;
/*
  NAME OF
  FORMER
  VARIABLE  COL1
  ------------------------------
  num_1     one
  num_2     two
  num_3     three
  num_4     four
  num_5     five
  num_6     six
  num_7     seven
  num_8     eight
  num_9     nine
  num_10    ten
*/
