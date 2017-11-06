%let ora_user     = rene;
%let ora_password = secretGarden;
%let ora_server   = ora12.renenyffenegger.ch;
 
libname tq84_ora
   oracle 
   user                     = &ora_user
   password                 = &ora_password
   path                     = &ora_server
   sql_functions            = all
   db_length_semantics_byte = no;


%let tables = %tq84_sqlDBMSSel1Col(tq84_ora, %nrstr(select table_name from user_tables));
/*%put tables=&tables;*/

%let tablesArray = %tq84_array(&tables);
%tq84_arrayApply(&tablesArray, %nrstr(
  %put table = &this;
))


%put sysdate on Oracle is
     %tq84_sqlDBMSSel1Col(tq84_ora,
          select to_char(sysdate, 'dd.mm.yyyy hh24:mi:ss') from dual
     );
