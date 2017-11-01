data tq84_mod;

  do i = 1 to 20;
     m = mod(i, 7);
     output;
  end;

run;
