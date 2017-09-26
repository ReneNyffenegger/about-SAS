%let ora_user     = rene;
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
   connect using tq84_ora;

   select * from connection to tq84_ora (
      select   *
      from     all_objects
      where    owner not in ('SYS', 'SYSTEM', 'XDB', 'OUTLN', 'APEX_050000', 'PUBLIC')
      order by owner, object_type, object_name
   );

   disconnect from tq84_ora;
quit;

libname tq84_ora clear;
