%let ora_user     = rene;
%let ora_password = secret_garden;
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
    create table tq84_tab (
      dt_1   date       , /* abstvondat    */
      dt_2   date       , /* abstbisdat    */
      ch_6   char    (6), /* cdprsbtyp     */
      vc_6   varchar2(6), 
      rw_9   raw     (9), /* odsobjidgesch */
      rw_3   raw     (3), /*               */
      nm     number
    )
  );
quit;

options
  sastrace    =  ',,,d'
  sastraceloc =  saslog;
  
data tq84_dat_1;
  set tq84_ora.tq84_tab;
  where
             ch_6  in ('foo', 'bar')     and /* ch_6 in ('bar', 'foo') - Note the re-ordering of the words!                    */
    datepart(dt_1) ge '21nov2017'd       and /* trunc(dt_1) >= to_date('21NOV2017', 'DDMONYYYY', 'NLS_DATE_LANGUAGE=American') */
             dt_2  lt '22nov2017'd       and /*       dt_2  <  to_date('22NOV2017', 'DDMONYYYY', 'NLS_DATE_LANGUAGE=American') */
             rw_9  ne ''                 and /*                        - Note: not translated at all                           */
             vc_6  ne '*'                and /* vc_6 <> '*'                                                                    */
             rw_3  is not missing        and /* rw_3 is not null                                                               */
             nm    between 5 and 10          /* (nm between 10 and) or (nm between 5 and 10)                                   */
   ;
run;

proc sql;
  connect using tq84_ora;
  execute by tq84_ora (
    drop table tq84_tab purge
  );
quit;

libname tq84_ora clear;
