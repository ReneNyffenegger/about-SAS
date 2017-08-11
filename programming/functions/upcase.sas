data _null_;

  var    = 'Foo, bar, baz';
  var_up =  upcase(var);    /* Translate var to uppercase */

  put var=   ;
  put var_up=;

run;
