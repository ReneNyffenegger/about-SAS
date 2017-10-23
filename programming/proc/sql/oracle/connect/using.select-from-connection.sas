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

   select * from connection to tq84_ora (
       select * from tq84_test_connect_using
   );

   disconnect from tq84_ora;
quit;
