data tq84_numbers;

  input
    val     1- 2
    nam  $  4- 9
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

proc sort
     data = tq84_numbers
     out  = tq84_numbers_sorted;
  by nam;
run;

proc print
     data = tq84_numbers_sorted;
run;
