data eggs_why;
  do i = 1 to 100;
     eggs = rand('norm');
     why  = eggs**2 + rand('unif')*3;
     output;
  end;
run;

proc sgplot data=eggs_why;
  title 'Scatter plot';
  scatter
     y=why x=eggs /
     markerattrs=(symbol = circlefilled
                  color  = orange
                  size   = 10px);
run;
