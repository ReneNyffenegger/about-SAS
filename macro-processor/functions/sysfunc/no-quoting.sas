%let var=foo bar baz;

/* &var is used in macro context: it needs not be
   quoted: */
%put length of var is %sysfunc(length(&var));

data _null_;
  /* &var is used in a data step: it must be
     must be quoted: */
  len = length("&var");
  put "length of var is " len;
run;
