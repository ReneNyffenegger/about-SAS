data _null_;

  fbb="foo bar baz";
  sbs=substr(fbb, 5, 3);
  put sbs;
  
* prints: bar ;

run;
