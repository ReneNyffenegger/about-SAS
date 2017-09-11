data dat;

  length txt $10;

  do i = 1 to 100;

     if      rand('unif') > 0.85 then txt = 'DEFG';
     else if rand('unif') > 0.75 then txt = 'ABC';
     else if rand('unif') > 0.80 then txt = 'KLMNOP';
     else                             txt = 'HIJ';

     output;
  end;

run;

ods graphics on;

proc sgplot data = dat;
/* Bars are ordered alphabetically by default: */
   vbar txt;
run;

proc sgplot data = dat;
   vbar txt /
        /* respdesc: Order the response values
                     in descending order. */ 
        categoryorder=respdesc ;
run;
