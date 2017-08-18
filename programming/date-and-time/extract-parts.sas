data _null_;
  dt = '28aug1970'd;

  put "year:    " dt year.   ;
  put "month:   " dt month.  ;
  put "day:     " dt day.    ;

  put "quarter: " dt qtr.    ;
  put "weekday: " dt weekday.; /* 1 = sunday */
  
run;
