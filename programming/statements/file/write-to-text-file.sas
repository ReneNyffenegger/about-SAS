data _null_;

  file 's:\tq84\some-file.txt';
  put "foo" "bar" "baz";
  put "one" "two" "three";
  put "x" "y" "z";

run;
