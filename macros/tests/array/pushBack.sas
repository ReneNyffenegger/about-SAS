%let fooBarBaz = %tq84_array(foo bar baz);

%tq84_arrayPushBack(&fooBarBaz, more)

%put size of fooBarBaz is %tq84_arrayLength(&fooBarBaz);
/*
   size of fooBarBaz is 4
*/

%tq84_arrayApply(&fooBarBaz, %nrstr(
   %put this = &this;
))
/*
   this = foo
   this = bar
   this = baz
   this = more
*/
