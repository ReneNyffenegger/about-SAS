data tq84_data;
  bar  = 100;
  do i = 1 to 5;

     foo = i * 3;
     bar = bar - foo;
     baz = mean(foo, bar);

     output;
  end;
run;

proc print data=tq84_data;
run;
