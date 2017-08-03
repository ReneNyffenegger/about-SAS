/* symput assigns a value to a macro variable. */

data _null_;
  call symput("tq84_macro_var", """hello world""");
run;

data _null_;
  put &tq84_macro_var;
run;
