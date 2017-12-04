data tq84_ts; 

 infile 'c:\path\to\file.dat';

 input
   num
   en  $
   ge  $
 ;

run;

proc print data=tq84_ts;
run;
