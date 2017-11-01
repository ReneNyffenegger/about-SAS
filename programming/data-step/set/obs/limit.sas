data orig;
  do i = 1 to 10;
     j = i*i;
     output;
  end;
run;

data only_4;
  set orig(obs=4);
run;

proc sql;
  select * from only_4;
quit;
