data tq84_one;

  infile datalines;

  length col_1 $10;
  length col_2 $10;
  length col_3 $10;

  input
    col_1
    col_2
    col_3
  ;

datalines;
x y z
one two three
foo bar baz
strawberry blackberry blueberry
;


data tq84_two;
  set tq84_one;

  drop col_2;   /* Exclude variable col_2 from output */
  col_4 = _N_;  /* Add new variable to output */

run;

proc print data=tq84_two;
run;
