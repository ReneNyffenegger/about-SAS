%let ora_user     = sasdba;
%let ora_password = secret_garden;
%let ora_server   = ora.test.renenyffenegger.ch;

options
  sastrace    = ',,,d'   /* show SQL statements sent to data source */
  sastraceloc = saslog   /* required on PC platforms                */
  nostsuffix             /* nostsuffix: make log more readable      */
;


libname tq84_ora
   oracle 
   user                     = &ora_user
   password                 = &ora_password
   path                     = &ora_server
   sql_functions            = all
   db_length_semantics_byte = no
;


data dual;
  set tq84_ora.dual (schema=sys);
run;
/*
ORACLE_4: Prepared: on connection 37
SELECT * FROM sys.DUAL
*/
