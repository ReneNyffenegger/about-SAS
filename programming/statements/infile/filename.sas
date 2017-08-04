data tq84_ts; 

 infile 'c:\path\to\file.dat';

 input
   num
   en  $
   ge  $
 ;

;

proc print data=tq84_ts;
run;
