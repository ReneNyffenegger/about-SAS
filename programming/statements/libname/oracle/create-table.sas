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


data tq84_stage;

  length spelled $20;

  input
    val
    spelled $
  ;

datalines;
1 one
2 two
3 three
4 four
5 five
42 forty-two
;


proc sql;
  create table
    tq84_ora.a_table_name
  as
    select * from tq84_stage;
quit;
