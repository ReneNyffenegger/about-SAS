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
  create table tq84_available_tables as
  select *
  from   dictionary.tables
  where  libname = 'TQ84_ORA';
quit;

proc show data=tq84_available_tables;
run;
