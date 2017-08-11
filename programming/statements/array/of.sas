data _null_;

  foo = 10;
  bar =  7;
  baz =  3;

  array ary{*} foo bar baz;

  sum_ = sum(of ary{*});

  put sum_=;

run;
