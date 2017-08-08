options
  sastrace    = ',,,d'   /* show SQL statements sent to data source */
  sastraceloc = saslog   /* required on PC platforms                */
  nostsuffix             /* nostsuffix: make                        */
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
  set tq84_ora.dual;
run;
