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

  /* Compare with subsetting if */
  where col_2 gt 's';
  
run;

proc print data=tq84_two;
run;
