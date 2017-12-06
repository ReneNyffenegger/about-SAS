data _null_;
  a = 42;
  if a = 42
     then put 'a=42' /* Note the missing semicolon! */
     else put 'a != 42';
run;
/*
  NOTE: Variable else is uninitialized.
  NOTE: Variable put is uninitialized.
  a=42. . a != 42
  NOTE: DATA statement used (Total process time):
        real time           0.00 seconds
        cpu time            0.00 seconds
*/
