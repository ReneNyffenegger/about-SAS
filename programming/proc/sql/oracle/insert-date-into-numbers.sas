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
   
proc sql;
  connect using tq84_ora;
  execute by tq84_ora (
    create table tq84_sas_date_as_number (
       id  number, 
       num number
    )
  );
quit;   

proc sql;
   insert into tq84_ora.tq84_sas_date_as_number values (1, '07jan1960'd);
   insert into tq84_ora.tq84_sas_date_as_number values (2, '01jan1960 00:00:15'dt);
quit;

proc sql;
   select id, num from tq84_ora.tq84_sas_date_as_number;
quit;

proc sql;
  connect using tq84_ora;
  execute by tq84_ora (
    drop table tq84_sas_date_as_number
  );
quit;
