data tq84_dat;
  do n = 1 to 10;
     m = n*2;
     output;
  end;
run;

data tq84_dat;
   set tq84_dat; /* In place editing */
   n = n*3;
run;

proc sql;
  select * from tq84_dat;
quit;
