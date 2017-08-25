data tq84_data;
  drop i;
  do i = 1 to 20;
     r = rand('norm') * 100 + 1000;
     f = floor(r);
     
     output;
  end;
run;


proc sql;
  select
    *
  from
    tq84_data;
quit;
