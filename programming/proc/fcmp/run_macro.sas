%macro tq84_add;
  %put in tq84_macro;
  %let result = %eval(&p1 + &p2);
%mend  tq84_add;

proc fcmp outlib=work.funcs.tq84;
  function callMacro(p1, p2);
    rc = run_macro('tq84_add', p1, p2, result);

    if rc = 0 then return (result);
     
    return(.);
  endsub;
run;

options cmplib=work.funcs;

%put result = &result;                               /* result = &result      */
%put callMacro returned %sysfunc(callMacro(39, 3));  /* callMacro returned 42 */
%put result = &result;    
