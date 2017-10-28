%let abc_def_ghi  = %tq84_array(abc def ghi);
%let abc_def_ghi_ = %tq84_arrayMap(&abc_def_ghi, %nrstr(>&this<));

%tq84_arrayApply(&abc_def_ghi_, %nrstr(
  %put this = &this;
))
/*
this = >abc<
this = >def<
this = >ghi<
*/
