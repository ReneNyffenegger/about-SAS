%let abcEtc = %tq84_array(abc-def-g h i-jkl, delim= -);
%tq84_arrayApply(&abcEtc, %nrstr(
  %put this = &this;
))
/*
this = abc
this = def
this = g h i
this = jkl
*/
