/* Don't write statements to the log file: */
options nosource;

data _null_;
  put "foo";
run;

/* Write statements to the log file: */
options source;

data _null_;
  put "bar";
run;
