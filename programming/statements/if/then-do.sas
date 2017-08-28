data _null_;

  do i = 1 to 10;

     if i = 5 then do;
         put "------------";
         put "-- i is 5 --";
         put "------------";
     end;

  end;

run;
