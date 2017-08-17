data rand;
  do i = 1 to 10000;
  norm = rand('norm');
  keep norm;

  output;
  end;

run;


ods graphics on;
proc univariate
  data=rand;
  histogram;
run;
ods graphics off
