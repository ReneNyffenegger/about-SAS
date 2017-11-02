data _null_;

  foo   = 10;
  bar   =  2;
  baz   =  7;

  array ary{*} foo bar baz;
  
  do i = 1 to dim(ary);
     var_name=vname(ary{i});
     put "var_name i = " var_name;
  end;

run;
/*
var_name i = foo
var_name i = bar
var_name i = baz
*/
