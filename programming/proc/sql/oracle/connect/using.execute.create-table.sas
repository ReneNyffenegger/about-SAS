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
       create table tq84_test_connect_using (
          id        number primary key,
          col_1     varchar2(10)
       )
   );

   disconnect from tq84_ora;
quit;
