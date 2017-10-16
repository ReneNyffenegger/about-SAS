%let ora_user     = rene;
%let ora_password = secretGarden;
%let ora_server   = ora.renenyffenegger.ch;


libname tq84_ora
   oracle 
   user                     = &ora_user
   password                 = &ora_password
   path                     = &ora_server
   sql_functions            = all
   db_length_semantics_byte = no;


proc sql;
   connect using tq84_ora;

   execute by tq84_ora (
       create table tq84_date_insert_test (
         i     number,
         dt_d  date,
         dt_dt date
       )
   );

   disconnect from tq84_ora;
quit;


data tq84_src;
  
  d  = '23sep17'd;
  dt = '25aug17 00:00:00'dt;
  output;

run;


proc sql;
  select
     d   format 14.  ,  /*      21085 */
     dt  format 14.     /* 1819238400 */
  from
    tq84_src;
run;


proc sql;

   insert into tq84_ora.tq84_date_insert_test
   select 1,
          d,
          dt
   from   tq84_src;

   insert into tq84_ora.tq84_date_insert_test
   select 2,
          dhms(d, 0, 0, 0), /* Oracle wants datetime's not dates, so we convert the date to a dateime */
          dt
   from   tq84_src;

quit;


proc sql;
   connect using tq84_ora;

   select * from connection to tq84_ora (
      select
        i,
        to_char(dt_d , 'dd.mm.yyyy hh24:mi:ss') dt_d,
        to_char(dt_dt, 'dd.mm.yyyy hh24:mi:ss') dt_dt
      from
        tq84_date_insert_test
   /*
        I | DT_D                | DT_DT
        --+---------------------+---------------------
        1 | 01.01.1960 05:51:25 | 25.08.2017 00:00:00
        2 | 23.09.2017 00:00:00 | 25.08.2017 00:00:00
   */
   );

   disconnect from tq84_ora;
quit;


proc sql;
/* Clean up ... */
   connect using tq84_ora;
   execute by tq84_ora ( drop table tq84_date_insert_test purge );
   disconnect from tq84_ora;
quit;
