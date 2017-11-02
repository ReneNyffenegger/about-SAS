data _null_;

  foo   = 10;
  bar   =  2;
  baz   =  7;

  array ary{*} foo bar baz;
  
  do i = 1 to dim(ary);
     var_name=vname(ary{i});
     put "Variable name " i "= " var_name;
  end;

run;
/*
Variable name 1 = foo
Variable name 2 = bar
Variable name 3 = baz
*/
