data _null_;

  a =  7;
  b =  6;
  c = 42;

  if a*b = 42 then
     put a " * " b " = " c;
  else
     put a " * " b " != " c;

run;

/* See also: ifc.sas */
