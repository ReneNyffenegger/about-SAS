data tq84_one;

  infile datalines;

  length col_1 $10;
  length col_2 $10;
  length col_3 $10;
  length col_4 $10;
  length col_5 $10;

  input
    col_1
    col_2
    col_3
    col_4
    col_5
  ;

datalines;
a b c d e
one two three four five
foo bar baz qux quux
morning noon afternoon evening night
;


data tq84_two;
  set tq84_one;

  keep col_2 col_4;   /* Drop all variables except col_2 and col_4 */
  
run;

proc print data=tq84_two;
run;
