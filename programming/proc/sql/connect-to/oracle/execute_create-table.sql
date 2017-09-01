proc sql;

  connect to oracle as tq84_ora (
    user     = &ora_user
    password = &ora_password
    path     = &ora_server
  );

  execute (
    create table tq84_sql_one (
      id    number primary key,
      col_1 varchar2(10) not null,
      dt    date
    )
  )
  by tq84_ora;

  %put &sqlxrc &sqlxmsg;

quit;
