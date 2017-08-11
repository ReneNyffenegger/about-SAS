data _null_;

  foo   = 10;
  bar   =  2;
  baz   =  7;

  array ary{*} foo bar baz;
  
  do i = 1 to 10;
     if i in ary then put  i ' is in ary';
  end;

run;
