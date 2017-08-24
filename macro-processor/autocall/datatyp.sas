/* %datatyp returs either NUMERIC or CHAR */

data _null_;

  %let fourty_two = 42;
  %let foo        ="bar";

  put "fourty_two is %datatyp(&fourty_two)";
  put "foo is %datatyp(&foo)";

run;
