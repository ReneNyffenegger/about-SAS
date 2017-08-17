data tq84_data;

  array num{*} $20 num_1-num_10;
  input num_1-num_10;

datalines;
one two three four five six seven eight nine ten
run;


proc transpose
     data = tq84_data
     out  = tq84_transposed;

     var num_1-num_10;
run;


proc sql;
  select * from tq84_transposed;
quit;
