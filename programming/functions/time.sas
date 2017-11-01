data _null_;

  t_0 = time();
  call sleep (5, 1);
  t_1 = time();
  t_diff = t_1 - t_0;

  put "There are " t_diff " seconds between " t_0 is8601dt. " and " t_1 is8601dt. ".";

run;
