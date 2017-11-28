%let ora_user     = rene;
%let ora_password = secret_garden;
%let ora_server   = ora.renenyffenegger.ch;


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
    create table tq84_null_test (
      nm     number       not null,
      vc     varchar2(10)     null
    )
  );
  
  insert into tq84_ora.tq84_null_test values (1, 'one' );
  insert into tq84_ora.tq84_null_test values (2,  null );
  insert into tq84_ora.tq84_null_test values (3, ''    );
  insert into tq84_ora.tq84_null_test values (4, 'four');

quit;

options
  sastrace    =  ',,,d'
  sastraceloc =  saslog;

proc sql; /* Records 2 and 3 are returned: */

   select * from tq84_ora.tq84_null_test
   where vc = '';
/* Translated to
     where (
       vc = '' or
       vc is null
     ) 
*/
quit;


proc sql; /* Records 2 and 3 are returned: */

   select * from tq84_ora.tq84_null_test
   where vc is missing;
/* Translated to
     where (
       vc is null
     ) 
*/
quit;

proc sql; /* No records are returned: */

   select * from tq84_ora.tq84_null_test
   where vc ne '';
/* Translated to
     where (
       vc <> '' and
       vc is not null
     ) 
*/
quit;

proc sql; /* Records 1 and 4 are returned: */

   select * from tq84_ora.tq84_null_test
   where vc is not missing;
/* Translated to
     where (
       vc is not null
     ) 
*/
quit;

proc sql;
  connect using tq84_ora;
  execute by tq84_ora (
    drop table tq84_null_test purge
  );
quit;

libname tq84_ora clear;
