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
    create table tq84_permuted_column_names (
       col_a varchar2(10),
       col_b varchar2(10),
       col_c varchar2(10)
    )
  );
quit;



data work.tq84_stage;
/* Load data into stage table.
   Note the differing order of the column names. */

   length
     col_b $10
     col_c $10
     col_a $10;

   col_a = 'AAA';
   col_b = 'BBB';
   col_c = 'CCC';

run;


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
     base=tq84_ora.tq84_permuted_column_names (

       bulkload                =  yes 
       bl_recoverable          =  no 
       bl_options              = "errors=0, parallel=false" /* , ROWS=... */
       bl_datafile             = "%sysfunc(getoption(work))/tq84_append_test.dat"
       bl_control              = "%sysfunc(getoption(work))/tq84_append_test.ctl"
       bl_log                  = "%sysfunc(getoption(work))/tq84_append_test.log" 
       bl_badfile              = "%sysfunc(getoption(work))/tq84_append_test.bad" 
       bl_discardfile          = "%sysfunc(getoption(work))/tq84_append_test.dsc"

     );
run;



proc sql;
   connect using tq84_ora;

   select * from connection to tq84_ora
  (select * from tq84_permuted_column_names);

/* Indeed: col_a is filled with AAA,
           col_b with BBB and
           col_c with CCC */
   
quit;

proc sql;
  connect using tq84_ora;
  execute by tq84_ora ( drop table tq84_permuted_column_names purge  );
quit;
