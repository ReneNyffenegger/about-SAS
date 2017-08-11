data tq84_data;
  
  do number = 1 to 10;
     if number > 5 then stop;

     output;
  end;

run;

proc print data=tq84_data;
run;
