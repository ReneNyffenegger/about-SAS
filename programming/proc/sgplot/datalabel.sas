data eggs_why;
  format spelled $20.;
  do i = 1 to 12;
     spelled = put(i, words20.);
     eggs = mod(i * 7, 13);
     why  = round(rand('unif') * 30);
     output;
  end;
run;


proc sgplot data=eggs_why;
  title 'Scatter plot';
  scatter
     y=why x=eggs /
     datalabel=spelled;
run;
