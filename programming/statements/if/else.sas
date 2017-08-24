data _null_;
  do i = 1 to 9;

     if i > 5 then put i " >  5"; /* Note the semicolon! */
              else put i " <= 5";

  end;
run;
