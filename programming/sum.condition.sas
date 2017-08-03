data _null_;
  array tq84_array(9);

  tq84_array(1) =  1;
  tq84_array(2) =  4;
  tq84_array(3) =  2;
  tq84_array(4) =  5;
  tq84_array(5) =  4;
  tq84_array(6) =  3;
  tq84_array(7) =  4;
  tq84_array(8) = 10;
  tq84_array(9) =  2;
  
  tq84_nof_elements_eq_4 = sum(
    tq84_array1 = 4,
    tq84_array2 = 4,
    tq84_array3 = 4,
    tq84_array4 = 4,
    tq84_array5 = 4,
    tq84_array6 = 4,
    tq84_array7 = 4,
    tq84_array8 = 4,
    tq84_array9 = 4
);

  put "Array contains " tq84_nof_elements_eq_4 " elements whose value is 4.";
run;
