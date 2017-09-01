/*    Determine an Oracle session's sid and serial#.  */

/*     Specify Oracle user, password and server: */
%let ora_user     = rene;
%let ora_password = secret_garden;
%let ora_server   = ora.test.renenyffenegger.ch;

/*     Determine current set of known Oracle functions.
       They are written into the dataset orafuncs in
       the work library.                                */
libname tq84_x oracle 
  path               = &ora_server
  user               = &ora_user
  password           = &ora_password
  sql_functions      = all
  sql_functions_copy = work.orafuncs;
  
/*     tq84x  is not being used anymore: */
libname tq84_x clear;


/*    Add a new known function to the set of
      Oracle functions in work.orafuncs:       */
proc sql;
  insert into work.orafuncs values (
     'SYS_CONTEXT'  ,/* sasfuncname                                              */
      11            ,/* sasfuncnamelen                                           */
     'SYS_CONTEXT'  ,/* dbmsfuncname                                             */
      11            ,/* dbmsfuncnamelen                                          */
     ''             ,/* function_category                                        */
     'WHERE_ORDERBY',/* func_usage_context                                       */
      0             ,/* convert_args       (must be 0 for newly added functions) */
      0             ,/* engineindex        (must be 0 for newly added functions) */
     'INTEGER'      ,/* function_returntyp                                       */
      2              /* function_num_args                                        */
  );
quit;


/*   Create a libref again, this time with the new
     oracle function sys_context stored in work.orafuncs: */
libname     tq84_ora oracle
   path          = &ora_server
   user          = &ora_user
   password      = &ora_password
   sql_functions ="EXTERNAL_APPEND=work.orafuncs"
   preserve_tab_names=yes
;


/*   sys_context is now known to be an Oracle function, so
     it can be used to query the current session's sid
     and serial#: */
proc sql;

  connect to oracle as tq84_ora (
    user     = &ora_user
    password = &ora_password
    path     = &ora_server
  );

  select *
  into
    :ora_ses_sid,
    :ora_ses_serial
  from connection to tq84_ora (
    select
      sid,
      serial#
    from
      v$session
    where
      sid = sys_context('userenv', 'sid')
   );

quit;


/*   put sid and serial# into the log: */
%put sid: &ora_ses_sid, serial: &ora_ses_serial;
