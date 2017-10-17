%let ora_user     = tq84;
%let ora_password = secret_garden;
%let ora_server   = ora.test.renenyffenegger.ch;


libname tq84_ora
   oracle 
   user                     = &ora_user
   password                 = &ora_password
   path                     = &ora_server
   sql_functions            = all
   db_length_semantics_byte = no;


proc sql;
/* Create the Oracle table into which the data is loaded: */

  connect using tq84_ora;

  execute by tq84_ora (
    create table tq84_append_bulkload (
      id     number primary key,
      col_1  varchar2(20),
      dt_1   date check (dt_1 = trunc(dt_1)),
      dt_2   date,
      flt    number(16,3),
      bin    raw(5)
    )
  );
quit;


data work.tq84_stage; /* Load data into stage table */ ;
  length
    id     8.
    col_1  $20.
    dt_1   8.
    dt_2   8.
    flt    8.;

  informat dt_1 date9.;
  format   dt_1 date9.;

  informat dt_2 e8601dt.;
  format   dt_2 datetime20.;

  length   bin  $5;
  informat bin  $hex10.;
/*  format   bin  $hex10.;*/

  infile datalines dlm=',' dsd;

  input id
        col_1
        dt_1
        dt_2
        flt
        bin
  ;
datalines;
1,one,01sep17,2001-01-01T01:01:01,0.000001,0123456789
2,two,02sep17,2002-02-02T02:22:02,20202.020202,4142434445
3,three,03sep17,2003-03-03T03:03:03,1234567.890123,616264
11,eleven,11sep17,2011-11-11T11:11:11,-28.28,000D0A0102
12,twelve,12sep17,2012-12-12T12:12:12,0,0A0D0A0D0A
13,thirteen,13sep17,2013-11-13T13:13:13,42,0D0A0D0A0D
;


proc sql;
/* Check stage data: */
  select * from work.tq84_stage;
quit;


proc sql;
  describe table work.tq84_stage;
quit;


proc append 
/*   Transfer data from stage table to Oracle table */
     data=work.tq84_stage
     base=tq84_ora.tq84_append_bulkload (

       bulkload                =  yes 
       bl_recoverable          =  no 
       bl_options              = "ERRORS=0, PARALLEL=FALSE" /* , ROWS=... */
       bl_delete_only_datafile =  no /* Overrides the BL_DELETE_DATAFILE option */
       bl_delete_datafile      =  no /* Oracle - YES: all files (DAT, CTL, and LOG) are deleted. */
       bl_delete_files         =  no
       bl_datafile             = "%sysfunc(getoption(work))/tq84_append_test.dat"
       bl_control              = "%sysfunc(getoption(work))/tq84_append_test.ctl"
       bl_log                  = "%sysfunc(getoption(work))/tq84_append_test.log" 
       bl_badfile              = "%sysfunc(getoption(work))/tq84_append_test.bad" 
       bl_discardfile          = "%sysfunc(getoption(work))/tq84_append_test.dsc"
       
     /* use SASDATEFMT to prevent
           Variable dt_1 has format 'DATETIME20.'n on the
           BASE data set and format 'DATE9.'n on the DATA data set.
     */
        sasdatefmt=(
          dt_1='date.'
       /* dt_2='datetime.' dt_2 is already a datetime, it needs not be converted ! */
        )
     ) force
;
run;



proc sql;
   connect using tq84_ora;

   select * from connection to tq84_ora (
      select
        id,
        col_1,
        to_char(dt_1, 'dd.mm.yyyy hh24:mi:ss') dt_1,
        to_char(dt_2, 'dd.mm.yyyy hh24:mi:ss') dt_2,
        flt,
        rawtohex(bin)                          bin
      from
        tq84_append_bulkload

/*
        ID COL_1                DT_1                DT_2                       FLT BIN
---------- -------------------- ------------------- ------------------- ---------- ----------
         1 one                  01.09.2017 00:00:00 01.01.2001 01:01:01          0 0123456789
         2 two                  02.09.2017 00:00:00 02.02.2002 02:22:02   20202.02 4142434445
         3 three                03.09.2017 00:00:00 03.03.2003 03:03:03 1234567.89 6162642020    -- Note how column bin was padded with 2020 
        11 eleven               11.09.2017 00:00:00 11.11.2011 11:11:11     -28.28 000D0A0102
        12 twelve               12.09.2017 00:00:00 12.12.2012 12:12:12          0 0A0D0A0D0A
        13 thirteen             13.09.2017 00:00:00 13.11.2013 13:13:13         42 0D0A0D0A0D
*/
   );
   
quit;

proc sql;
  connect using tq84_ora;
  execute by tq84_ora ( drop table tq84_append_bulkload purge  );
quit;
