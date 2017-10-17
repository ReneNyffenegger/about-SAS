/*     Specify Oracle user, password and server: */
%let ora_user     = tq84;
%let ora_password = secret_garden;
%let ora_server   = ora.test.renenyffenegger.ch;


libname tq84_ora oracle 
  path               = &ora_server
  user               = &ora_user
  password           = &ora_password
;

proc sql;
/* Create date destintation table in Oracle; */

  connect using tq84_ora;

  execute by tq84_ora (
    create table tq84_append_test (
      id     number       not null primary key,
      col_1  varchar2(20) not null,
      dt_1   date         not null check (dt_1 = trunc(dt_1)),
      dt_2   date         not null
    )
  );
quit;


/* Load data into stage table */ ;
data work.tq84_stage;
  length
    id     8.
    col_1  $20.
    dt_1   8.
    dt_2   8.;

  informat dt_1 date9.;
  format   dt_1 date9.;

  informat dt_2 e8601dt.;
  format   dt_2 datetime20.;

  infile datalines dlm=',' dsd;

  input id
        col_1
        dt_1
        dt_2;

datalines;
1,one,01sep17,2001-01-01T01:01:01
2,two,02sep17,2002-02-02T02:22:02
3,three,03sep17,2003-03-03T03:03:03
11,eleven,11sep17,2011-11-11T11:11:11
12,twelve,12sep17,2012-12-12T12:12:12
13,thirteen,13sep17,2013-11-13T13:13:13
;


proc sql;
/* Check stage data: */
  select * from work.tq84_stage;
quit;

proc sql;
  describe table work.tq84_stage;
quit;

/* Transfer data from stage table to Oracle table */
proc append 
     data=work.tq84_stage
     base=tq84_ora.tq84_append_test(
     /* use SASDATEFMT to prevent
           Variable dt_1 has format 'DATETIME20.'n on the
           BASE data set and format 'DATE9.'n on the DATA data set.
     */
        sasdatefmt=(
          dt_1='date9.'
       /* dt_2= ...    dt_2 is already a datetime, it needs not be converted ! */
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
        to_char(dt_2, 'dd.mm.yyyy hh24:mi:ss') dt_2
      from
        tq84_append_test
   );
   
quit;

proc sql;
  connect using tq84_ora;
  execute by tq84_ora ( drop table tq84_append_test purge  );
quit;
