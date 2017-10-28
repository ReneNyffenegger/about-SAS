%let arrayOfArrays = %tq84_array();

%tq84_arrayPushBack(&arrayOfArrays, %tq84_array(one two three four));
%tq84_arrayPushBack(&arrayOfArrays, %tq84_array(foo bar baz));
%tq84_arrayPushBack(&arrayOfArrays, %tq84_array(what is this));
%tq84_arrayPushBack(&arrayOfArrays, %tq84_array(New York|Berlin|Zürich|Paris,delim=|));

%tq84_arrayApply(&arrayOfArrays, %nrstr(
   %put this = &this;
   %tq84_arrayApply(&this, %nrstr(
      %put %nrstr(  ) this = &this;
   ))
))

/*
this = tq84_array_33_
   this = one
   this = two
   this = three
   this = four
this = tq84_array_34_
   this = foo
   this = bar
   this = baz
this = tq84_array_35_
   this = what
   this = is
   this = this
this = tq84_array_36_
   this = New York
   this = Berlin
   this = Zürich
   this = Paris
*/
