/* @n moves the pointer to the absolute column n */

data _null_;

  a1 =   42; a2 = "hello world"; a3 =   9;
  b1 = 4711; b2 = "foo"        ; b3 = 111;

  put @1 a1 @6 a2 @20 a3;
  put @1 b1 @6 b2 @20 b3;
run;
