data tq84_data;
  
  length rom $5;

  do num = 1 to 5;

     select (num); /* Note the semicolon ! */
       when (  1) rom = 'I'  ;
       when (  2) rom = 'II' ;
       when (  3) rom = 'III';
       when (  4) rom = 'IV' ;
       when (  5) rom = 'V'  ;
     end;
     output;
     
  end;

run;

proc print data=tq84_data;
run;
