%let ora_user     = rene;
%let ora_password = secretGarden;
%let ora_server   = ora12.renenyffenegger.ch;

libname tq84_ora
   oracle 
   user                     = &ora_user
   password                 = &ora_password
   schema                   = sys             /* Set 'default' schema */
   path                     = &ora_server
   sql_functions            = all
   db_length_semantics_byte = no;
   
/* Use sastrace option to see what Oralce actually sends to SAS. */
options
  sastrace    =  ',,,d'
  sastraceloc =  saslog;
  
  
proc sql;
  select
    dummy
  from
    tq84_ora.dual;
quit;
/*
ORACLE_15: Prepared: on connection 37
SELECT * FROM sys.DUAL
*/
