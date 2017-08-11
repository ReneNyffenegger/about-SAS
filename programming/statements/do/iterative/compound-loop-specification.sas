data _null_;

  do i = 10 to 12,
         19, 20, 21,
          5 to 25 by 6;

     put i=;
  end;

run;
