/* +n moves the pointer n columns.

   The idiom +(-1) cancels the default space
   between variables.

*/

data _null_;

  a1 =   42; a2 = "hello world"; a3 =   9;
  b1 = 4711; b2 = "foo"        ; b3 = 111;

  put @1 a1 +4 a2 +(-1) a3;
  put @1 b1 +4 b2 +(-1) b3;
run;
