%macro tq84_sqlDataSetSel1Col_M;

   %let   stmt = %sysfunc(dequote(&stmt  ));
   %local sep;
   %let   sep = %nrstr(' ');
 
   proc sql noprint;

      select *
      into  :tq84_sqlDataSetSel1Col_VAR separated by &sep
      from  ( &stmt )
      ;

   quit;

%mend  tq84_sqlDataSetSel1Col_M;


proc fcmp outlib=tq84_lib.funcs.tq84;
  function tq84_sqlDataSetSel1Col_F(stmt$) $ 32767;

    length tq84_sqlDataSetSel1Col_VAR $32767;
   
        rc = run_macro('tq84_sqlDataSetSel1Col_M', stmt, tq84_sqlDataSetSel1Col_VAR);

        if rc = 0 then return (tq84_sqlDataSetSel1Col_VAR);
        return(cat(' rc = ', rc));

  endsub;
run;

options cmplib=tq84_lib.funcs;

%macro tq84_sqlDataSetSel1Col(stmt);
   %sysfunc(tq84_sqlDataSetSel1Col_F(&stmt))
%mend  tq84_sqlDataSetSel1Col;
