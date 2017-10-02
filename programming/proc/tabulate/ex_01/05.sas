proc tabulate data=tq84_dat;
  class category;
  var   val;
  table category = '' *mean = '',
        val      = 'Avg.';
run;
