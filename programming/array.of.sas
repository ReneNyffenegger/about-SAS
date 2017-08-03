data _null_;
  array tq84_array(6);

  tq84_array(1) = 10;
  tq84_array(2) = 12;
  tq84_array(3) = 13;
  tq84_array(4) = 19;
  tq84_array(5) = 20;
  tq84_array(6) = 1000;

* Note the keyword 'of' ;
  tq84_avg = mean(of tq84_array1 - tq84_array5);

  put "Mean of first 5 elements in array is " tq84_avg;

  tq84_avg = mean(of tq84_array(*));
  put "Mean of all elements in array is " tq84_avg;
run;
