data _null_;

  dt = '28aug1970'd;

  put "year:    " dt year.   ;
  put "month:   " dt month.  ;
  put "day:     " dt day.    ;

  put "quarter: " dt qtr.    ;
  put "weekday: " dt weekday.; /* 1 = sunday */

  dt_year    = year   (dt);
  dt_month   = month  (dt);
  dt_day     = day    (dt);
  dt_qtr     = qtr    (dt);
  dt_weekday = weekday(dt);

  /* Note: +(-1) used in order to suppress whitespaces between string literals and variables: */
  put dt_day +(-1) "." dt_month +(-1) "." dt_year +(-1) " (Quarter: " dt_qtr +(-1) ", weeday: " dt_weekday +(-1) ")";
  
run;
