%let ora_user     = rene;
%let ora_password = secret_garden;
%let ora_server   = ora.renenyffenegger.ch;
/* Or, alternatively: */
%let ora_server   =
"(DESCRIPTION=(
    ADDRESS     = (PROTOCOL = TCP                      )
                  (HOST     = ora.renenyffenegger.ch   )
                  (PORT     = 2808                     )
  )
  ( CONNECT_DATA =(SERVICE_NAME=ora.renenyffenegger.ch )
  )
)";


proc sql;
  connect to oracle (
    user     = &ora_user
    password = &ora_password
    path     = &ora_server
  );

  execute (
      create table tq84_test (
         col_1 number,
         col_2 varchar2(11)
      )
  ) by oracle;
quit;
