%macro tq84_cat;
   %put in tq84_cat;

/* Note the dequote here. */
   %let result = %sysfunc(dequote(&p1)) %sysfunc(dequote(&p2));
%mend  tq84_cat;

proc fcmp outlib=work.funcs.tq84;

  function callMacroCharParams(p1$, p2$) $50;

    length result $50;
    
    rc = run_macro('tq84_cat', p1, p2, result);

    if rc = 0 then return (result);
     
    return('error');
  endsub;
run;


options cmplib=work.funcs;

%put result = &result;                         /* result = &result  */
%put %sysfunc(callMacroCharParams(foo, bar));  /* foo bar           */
%put result = &result;                         /* result = &result  */
