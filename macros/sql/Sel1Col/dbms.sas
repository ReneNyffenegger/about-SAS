%macro tq84_sqlDBMSSel1Col_M;

   %let   dbmsLib=%sysfunc(dequote(&dbmsLib));
   %let   stmt   =%sysfunc(dequote(&stmt   ));

   %local sep;
   %let   sep = %nrstr(' ');
 
   proc sql noprint;

      connect using &dbmsLib;

      select *
      into  :tq84_sqlDBMSSel1Col_VAR
      separated by &sep
      from connection to &dbmsLib (
        &stmt
      );

   quit;

%mend  tq84_sqlDBMSSel1Col_M;


proc fcmp outlib=work.funcs.tq84;
  function tq84_sqlDBMSSel1Col_F(dbmsLib$, stmt$) $ 32767;

    length tq84_sqlDBMSSel1Col_VAR $32767;
   
        rc = run_macro('tq84_sqlDBMSSel1Col_M', dbmsLib, stmt, tq84_sqlDBMSSel1Col_VAR);

        if rc = 0 then return (tq84_sqlDBMSSel1Col_VAR);
        return(cat(' rc = ', rc));

  endsub;
run;

options cmplib=work.funcs;

%macro tq84_sqlDBMSSel1Col(dbmsLib, stmt);
   %sysfunc(tq84_sqlDBMSSel1Col_F(&dbmsLib, &stmt))
%mend  tq84_sqlDBMSSel1Col;
