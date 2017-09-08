data eggs_why;
  do i = 1 to 10000;
     
     eggs = rand('norm');
     why  = rand('norm') - rand('unif') * eggs;
     output;
  end;
run;

ods graphics on;

proc sgplot data=eggs_why;
  heatmap x=eggs y=why / colormodel=(cx0077ff  cxff7700 cxff0000);
run;
