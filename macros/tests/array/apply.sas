%let oneThroughFive = %tq84_array(one two three four five);
%tq84_arrayApply(&oneThroughFive, %nrstr(
  %put this = &this;
))
/*
this = one
this = two
this = three
this = four
this = five
*/
