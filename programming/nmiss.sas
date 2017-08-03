data _null_;
  array tq84_array(6);

  tq84_array(1) = 10;
  tq84_array(3) = 16;
  tq84_array(5) =  7;
  tq84_array(6) = 51;

  tq84_missing_values = nmiss(of tq84_array(*));

  put "Array contains " tq84_missing_values " missing values.";
run;
