/*  A subsetting if is an "if" without corresponding "then". */

data tq84_one;

  infile datalines;

  length col_2 $10;
  input
    col_1
    col_2
  ;

datalines;
1 one
2 two
3 three
4 four
5 five
6 six
7 seven
8 eight
9 nine
;


data tq84_two;
  set tq84_one;

  /*
     While the drop and keep statements control which variables
     make it into the output, the subsetting if determines which
     obserrvations go there.
  */
  if col_2 gt 's';
  
run;

proc print data=tq84_two;
run;
