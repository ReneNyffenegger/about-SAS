data tq84_ds;

  length num_name $ 10;

  num_name = "one"  ; num_val =  1; output;
  num_name = "two"  ; num_val =  2; output;
  num_name = "three"; num_val =  3; output;
  num_name = "four" ; num_val =  4; output;
  num_name = "five" ; num_val =  5; output;
  num_name = "six"  ; num_val =  6; output;
  num_name = "seven"; num_val =  7; output;
  num_name = "eight"; num_val =  8; output;
  num_name = "nine" ; num_val =  9; output;
  
run;

proc sort
     data=tq84_ds;
     by num_name;
run;

proc print
     data=tq84_ds;
run;
