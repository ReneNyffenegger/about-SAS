data _null_;

  dt_foo = '28aug1970'd;
  dt_bar = '18aug2017'd;

  diff_days = dt_bar - dt_foo;

  put "There are " diff_days "days between " dt_foo DDMMYYD10. " and " dt_bar DDMMYYD10.;
  *    There are 17157 days between 28-08-1970 and 18-08-2017 ;
run;
