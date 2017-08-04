%let ora_user     = rene;
%let ora_password = secret_garden;
%let ora_server   = ora.test.renenyffenegger.ch;

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

  connect to oracle as tq84_ora (
    user     = &ora_user
    password = &ora_password
    path     = &ora_server
  );

  create table
    tq84_ora.a_table_name_3
  as
    select * from tq84_stage;
quit;
