%macro tq84_dequote(param);

  %put param = &param;
  %put dequote(param) = %sysfunc(dequote(&param));

%mend tq84_dequote;

%tq84_dequote(foo) /*
param = foo
dequote(param) = foo */

%tq84_dequote(foo''bar) /*
param = foo''bar
dequote(param) = foo''bar */

%tq84_dequote("hello world") /*
param = "hello world"
dequote(param) = hello world */
