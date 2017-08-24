/*
   symput assigns a value to a macro variable.

   Note: the assigned value cannot be used in the same data step, because
   the macroprosses must be invoked again to resolve it.
*/

%let tq84_macro_var = hello world;

data _null_;
  call symput("tq84_macro_var", """good bye""");
  put &tq84_macro_var;
  /* Prints: hello world */
run;

data _null_;
  put &tq84_macro_var;
  /* Prints: good bye */
run;
