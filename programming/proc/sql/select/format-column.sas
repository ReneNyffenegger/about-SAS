data tq84_data;
  do i = 1 to 20;
     dt = floor(rand('norm') * 5000 + 10000);
     output;
  end;
run;

proc sql;
  select
    i,
    dt format date9.
  from
    tq84_data;
quit;

proc sql;
  select
    min(dt) as min_dt format date9.
  from
    tq84_data;
quit;
