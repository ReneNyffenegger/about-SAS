options
  sastrace    = ',,,d'
  sastraceloc = file 'p:\ath\to\log.file' /* Specify file for log of sastrace */
;


libname tq84_ora
   oracle 
   user                     = &ora_user
   password                 = &ora_password
   path                     = &ora_server
   sql_functions            = all
   db_length_semantics_byte = no;


data dual;
  set tq84_ora.user_objects;
run;
