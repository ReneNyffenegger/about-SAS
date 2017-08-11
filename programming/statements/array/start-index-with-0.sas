data _null_;

  foo =  42;
  bar = 999;
  baz =  17;

  /* Usually, the first index is 1. In the following
     statement, it's changed to 0 */
  array ary{0: 2} foo bar baz;

  do i = 0 to dim(ary)-1; /* Note the dim() - 1 */
     put i ': ' ary{i};
  end;

run;
