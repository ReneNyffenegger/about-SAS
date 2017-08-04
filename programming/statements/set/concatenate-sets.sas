data tq84_ds_one;

  length x $ 3;
  x = "foo"; y =  1; output;
  x = "bar"; y =  2; output;
  x = "baz"; y =  3; output;
   
run;

data tq84_ds_two;

  length x $ 11;
  x = "eleven"     ; y = 11; output;
  x = "seven"      ; y =  7; output;
  x = "forty-two"  ; y = 42; output;
  x = "ninety-nine"; y = 99; output;
 
run;

data tq84_ds_one_two;

  /* Setting the length of x is important.
     If it's not set, this step would use the length
     of the tq84_ds_one, which is '$ 3'. */

     length x $ 11;
     
     set tq84_ds_one
         tq84_ds_two;
run;

proc print
     data=tq84_ds_one;
run;
