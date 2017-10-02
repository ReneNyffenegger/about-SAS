proc tabulate data=tq84_dat;
  class category;
  var   val;
  table val      = 'Value',
        category = '' * mean = ''
      / box      = 'Avg.';
run;
