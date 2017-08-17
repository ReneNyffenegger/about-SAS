data xyz;
  call streaminit(280870);

  do x=1 to 100;
     y=(x/10) ** 2;
     z=x * (1+rand('unif')/3);
     output;
  end;
run;


ods graphics on;
proc corr
  data  = xyz
  plots = matrix(histogram);
run;
ods graphics off;
