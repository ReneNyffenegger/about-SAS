/*     Determine sid and serial# of an Oracle session     */

/*     Specify Oracle user, password and server: */
%let ora_user     = rene;
%let ora_password = secret_garden;
%let ora_server   = ora.test.renenyffenegger.ch;


/* Add the name of the function sys_context to the sql dictionnary. */
data work.tq84dbms;
  sasfuncname        = 'sys_context';
  sasfuncnamelen     =  length(sasfuncname);
  dbmsfuncname       = 'sys_context';
  dbmsfuncnamelen    =  length(dbmsfuncname);
  function_category  = 'SCALAR';
  func_usage_context = 'WHERE_ORDERBY';
  function_returntyp = 'INTEGER';
  function_num_args  =  2;
  convert_args       =  0;
  engineindex        =  0;
  output;
run;


libname tq84_ora oracle
  user               = &ora_user
  password           = &ora_password
  path               = &ora_server
  sql_functions      = "EXTERNAL_APPEND=work.tq84dbms"
  preserve_tab_names =  yes /* Need to preserve tab names because of the dollar in v$session.
                               Otherwise, SAS would complain:
                                     The value 'V$SESSION'n is not a valid SAS name.
                            */
;


proc sql;

    select
      sid ,
      'serial#'n as serial
    into
      :ses_sid,
      :ses_serial
    from
      tq84_ora."V$SESSION"n
    where
      sid = sys_context('userenv', 'sid')
    /*
    Apparently, the following ORDER BY is necessary to prevent

         ERROR: The original SQL statement contains a UDF that
                is not being passed down to the database.
                SQL execution is stopped.

      Well, well, well...  */
    order by
      sid
  ;
quit;

%put the session is identified by sid &ses_sid and serial &ses_serial;
