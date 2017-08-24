data _null_;
  if libref("tq84_l") ne 0 then
     put "tq84_l is not assigned";
  else
     put "tq84_l is assigned";
run;

libname tq84_l "s:\Atrans\SASCC\tq84";

data _null_;
  if libref("tq84_l") ne 0 then
     put "tq84_l is not assigned";
  else
     put "tq84_l is assigned";
run;

libname tq84_l clear;
