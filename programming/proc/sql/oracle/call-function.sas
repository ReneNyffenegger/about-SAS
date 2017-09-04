/*     Calling an Oracle function from SAS     */

/*     Specify Oracle user, password and server: */
%let ora_user     = sasdba;
%let ora_password = secret_garden;
%let ora_server   = ora.test.renenyffenegger.ch;

/*  Create an Oracle PL/SQL function which we will
    call later on:    */
proc sql;

  connect to oracle (
    user     = &ora_user
    password = &ora_password
    path     = &ora_server
  );

  execute (
    create or replace function tq84_func (
      p_foo  varchar2,
      p_bar  number
    )
    return varchar2
    is begin
       return 'tq84_func: p_foo = ' || p_foo || ', p_bar = ' || p_bar;
    end tq84_func;
  )
  by oracle;

quit;


/* Add the name of the function to the sql dictionnary. */
data work.tq84dbms;
  sasfuncname        = 'tq84_func';
  sasfuncnamelen     =  length(sasfuncname);
  dbmsfuncname       = 'tq84_func';
  dbmsfuncnamelen    =  length(dbmsfuncname);
  function_category  = 'SCALAR';
  func_usage_context = 'SELECT_LIST';
  function_returntyp = 'CHAR';
  function_num_args  =  0;
  convert_args       =  0;
  engineindex        =  0;
  output;
run;


/*  Connect to Oracle using the sql_functions option which
    makes the function name known to SAS              */
libname tq84_ora oracle
  user               = &ora_user
  password           = &ora_password
  path               = &ora_server
  sql_functions      = "EXTERNAL_APPEND=work.tq84dbms"
;

/*  Enable sql tracing so that we can see
    what SQL statement SAS passes to Oracle: */
options
  sastrace =',,,d'
  sastraceloc=saslog
  nostsuffix
;


/*  Create an Oracle table and fill it with some test data so that
    we can select from it later on.

    Note: the datatype of foo is char(40)!
*/
data tq84_ora.tq84_func_test;
  length foo $10.
         bar  4.
  ;
  input  foo
         bar
  ;
datalines;
one 1
two 2
three 3
four 4
five 5
run;


/*    Create a data set from the Oracle table and by
      calling the Oracle function: */
proc sql;
  create table ds_func_test as
    select
      foo,
      bar,
      tq84_func(foo, bar) as tq84_f
    from
      tq84_ora.tq84_func_test
   /* Apparently, the following ORDER BY is necessary to prevent

         ERROR: The original SQL statement contains a UDF that
                is not being passed down to the database.
                SQL execution is stopped.

      Well, well, well...
   */
    order by
      bar
  ;
quit;


/* Cleanup */
proc sql;
  drop table tq84_ora.tq84_func_test;
quit;

proc sql;
  connect to oracle (
    user     = &ora_user
    password = &ora_password
    path     = &ora_server
  );

  execute (drop function tq84_func) by oracle;
quit;
