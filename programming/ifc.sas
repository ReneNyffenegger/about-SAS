data _null_;
  tq84_var  = 42;
  tq84_text = ifc(tq84_var > 40, "tq84_var > 40", "tq84 <= 40");

  put tq84_text;
run;
