data eggs_why;
  do i = 1 to 1000;
     eggs = i + rand('norm') * 3;
     why  = i/100 + 4 + sin(eggs/50) + rand('norm') * 2;
     output;
  end;
run;

ods graphics on;

proc sgplot data=eggs_why;
  pbspline y=why x=eggs / lineattrs = ( color=red) ;
run;
