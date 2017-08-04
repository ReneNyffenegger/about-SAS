data _null_;

  a = 7;
  b = 6;

  answer = a*b;

* Named output: display variable's name AND value ;
  put answer=;

run;
