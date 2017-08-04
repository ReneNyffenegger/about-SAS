data _null_;
  tq84_foo = 10;
  tq84_bar = 14;
  tq84_baz = 18;

  tq84_avg = mean(tq84_foo, tq84_bar, tq84_baz);

  put tq84_avg=;
run;
