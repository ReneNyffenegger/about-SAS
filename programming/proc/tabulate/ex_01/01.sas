proc tabulate data=tq84_dat;
  class category;
  var   val;
  table val = 'Avg. Value',
        category*mean;
run;
