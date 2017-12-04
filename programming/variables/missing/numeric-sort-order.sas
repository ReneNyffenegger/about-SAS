%macro add_record(representation);
  col_num = &representation ;
  col_val ="&representation";
  output;
%mend  add_record;

data tq84_num_missing;
  %add_record(42)
  %add_record( .)
  %add_record( 0)
  %add_record(.q)
  %add_record(.a)
  %add_record(-3)
  %add_record(._)
run;

/* Sorting the data set.

   The lowest order has ._ followed by the
   ordinary missing value (.) followed by
   the special missing values .a through .z:
*/
proc sort
     data=tq84_num_missing;
     by   col_num;
run;

proc print
     data=tq84_num_missing;
run;
/*
Obs    col_num    col_val

 1         _        ._
 2         .        .
 3         A        .a
 4         Q        .q
 5        -3        -3
 6         0        0
 7        42        42
*/
