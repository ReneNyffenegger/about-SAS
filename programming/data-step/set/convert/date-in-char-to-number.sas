data tq84_char;

  id = 1; dt = '06.11.2017'; output;
  id = 2; dt = '03.08.2014'; output;
  id = 3; dt = '18.02.2016'; output;

run;

data tq84_num;
 
  set tq84_char(rename=(dt = dt_temp));

  attrib dt format=eurdfdd10.;
  dt = input(dt_temp, ddmmyy10.);
  
  drop dt_temp;

run;


proc sql;
  describe table tq84_num;
quit;
/*
create table WORK.TQ84_NUM( bufsize=65536 )
  (
   id num,
   dt num format=EURDFDD10.
  );
*/

proc sql;
  select * from tq84_num;
quit;
