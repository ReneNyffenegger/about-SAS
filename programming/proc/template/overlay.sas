ods graphics on;

data eggs_why;
  do i = 1 to 1000;
     eggs = i + rand('norm') * 3;
     why  = i/100 + 4 + sin(eggs/50) + rand('norm') * 2;
     output;
  end;
run;

proc template;
  define statgraph tq84_overlay;
  begingraph;
  layout overlay;
    scatterplot    x=eggs y=why;
    loessplot      x=eggs y=why / lineattrs = (color=blue);
 /* pbsplineplot   x=eggs y=why / lineattrs = (color=red ); */
    regressionplot x=eggs y=why / lineattrs = (color=red ) degree=6; 
  endlayout;
  endgraph;
  end;
run;

proc sgrender
      data     = eggs_why
      template = tq84_overlay;
run;
