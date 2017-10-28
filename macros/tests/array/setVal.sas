%let oneThroughFive = %tq84_array(one two three four five);

%tq84_arraySetVal(&oneThroughFive, 1, ONE in UPPERCASE)
%tq84_arraySetVal(&oneThroughFive, 4, IV)

%tq84_arrayApply(&oneThroughFive, %nrstr(
   %put this = &this;
))
/*
this = ONE in UPPERCASE
this = two
this = three
this = IV
this = five
*/
