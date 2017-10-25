
data tq84_data;
   col_id  =  1;
   col_d   = '28aug17'd;
   col_dt  = '17nov17 17:17:17'dt;
   col_t   = '1:23't;
   col_num =  42.18;
   col_txt = 'foo bar baz';
run;

proc sql;
   describe table tq84_data;
quit;
/*
create table WORK.TQ84_DATA( bufsize=65536 )
  (
   col_id num,
   col_d num,
   col_dt num,
   col_t num,
   col_num num,
   col_txt char(11)
  );
*/

proc sql;
  select * from tq84_data;
quit;

proc sql;
  alter table tq84_data
  modify col_d    format=ddmmyyp10. ,
         col_dt   format=datetime17.,
         col_t    format=tod.       ,
         col_num  format=8.3        ,
         col_txt  format=$30.
         ;
quit;

proc sql;
   describe table tq84_data;
quit;
/*
create table WORK.TQ84_DATA( bufsize=65536 )
  (
   col_id num,
   col_d num format=DDMMYYP10.,
   col_dt num format=DATETIME17.,
   col_t num format=TOD.,
   col_num num format=8.3,
   col_txt char(11) format=$30.
  );
*/

proc sql;
   select * from tq84_data;
quit;
