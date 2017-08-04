data tq84_ts; 

 /* 

    missover: skip over the missing german translation of six:

    otherwise ge would be assigned 3

 */
 infile datalines missover;

 input
   num
   en  $ 
   ge  $
 ;
datalines;
2 two zwei
6 six
3 three drei
1 one eins
;

proc print data=tq84_ts;
run;
