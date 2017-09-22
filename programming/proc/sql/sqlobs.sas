data tq84_data;
  length num   4.
         txt  $3;

  input  num txt;

datalines;
18 foo
13 bar
5 foo
19 baz
22 baz
8 foo
5 bar
18 foo
13 bar
run;


proc sql;
  update tq84_data
  set    num = 100 * num
  where  txt eq 'foo';

  %put Then update statement affected &sqlobs rows;

quit;
