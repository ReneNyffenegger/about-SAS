data tq84_dat;
  do i=1 to 10;
     output;
  end;
run;

proc sql;
  alter table tq84_dat
  add num_txt char(20);
quit;

proc sql;
  update tq84_dat
    set num_txt = put(i, words20.);
quit;

proc sql;
  select * from tq84_dat;
quit;
