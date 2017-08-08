
%let ora_user     = rene;
%let ora_password = secret_garden;
%let ora_server   = ora.test.renenyffenegger.ch;

proc sql;

  connect to oracle as tq84_ora (
    user     = &ora_user
    password = &ora_password
    path     = &ora_server
  );

  /*
      SQL pass through:
         execute (stmt) by 
      stmt is passed to the DBMS/Oracle exactly as stated.
      It should be used for any dynamic non DML statement.
  
  */
  execute (
    create table tq84_execute (
      id     number        primary key,
      col_1  varchar2 (10) not null   ,
      col_2  timestamp( 5)            ,
      col_3  number   ( 4) not null   ,
      col_4  clob
    )
  ) by tq84_ora;

quit;
