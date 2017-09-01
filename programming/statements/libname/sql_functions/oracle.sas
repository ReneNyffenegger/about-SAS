%let ora_user     = rene;
%let ora_password = secret_garden;
%let ora_server   = ora.test.renenyffenegger.ch;

options
  sastrace    = ',,,d'
  sastraceloc =  saslog;

%macro select_stmt;
   proc sql feedback /* _method */;
     select 
        upcase  (obj.object_name  ) as obj_name_up,
        lowcase (obj.object_name  ) as obj_name_lo,
                 obj.last_ddl_time  as obj_ddl_tm ,
        datepart(obj.last_ddl_time) as obj_ddl_day
      from
        tq84_ora.all_objects obj
      where
        datepart(obj.last_ddl_time) = today() or
        lower   (obj.owner        ) ="tq84";
   quit;
%mend select_stmt;

%macro lib_tq84_ora(additional);
libname            tq84_ora
   oracle
   path          = &ora_server
   user          = &ora_user
   password      = &ora_password
  &additional
;
%mend lib_tq84_ora;

%lib_tq84_ora();
%select_stmt;
/*

Without the SQL_FUNCTIONS options, the where condition
is ignored when the SQL statement is passed to Oracle:

SELECT
  "OBJECT_NAME",
  "LAST_DDL_TIME",
  "OWNER"
FROM
  ALL_OBJECTS
*/


%lib_tq84_ora(%bquote(sql_functions = all));
%select_stmt;
/*

With the SQL_FUNCTIONS options, SAS is abl0e to translate
SAS' DATEPART to Oracle's TRUNC and to recognize Oracle's LOWER()
function:

SELECT
  "OBJECT_NAME",
  "LAST_DDL_TIME",
  "OWNER"
FROM
  ALL_OBJECTS
WHERE (
  ( TRUNC("LAST_DDL_TIME") =TO_DATE('01SEP2017','DDMONYYYY','NLS_DATE_LANGUAGE=American') ) OR
  ( LOWER("OWNER") = 'tq84' )  
)
*/
