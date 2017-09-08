data eggs_why;
 /* drop i; */

  do i = 1 to 50;
     eggs = rand('unif')*5;
     why = (eggs-2)**3 + 0*(eggs+1)**2 - eggs*4 * 3 + rand('norm')*4; 
     output;
  end;

run;

ods graphics on;

proc sgplot data = eggs_why;
  reg y=why x=eggs / degree = 3 ;
run;
