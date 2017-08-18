data _null_;

  dt = mdy(8,28,1970);

  put "year:    " dt year.   ;
  put "month:   " dt month.  ;
  put "day:     " dt day.    ;
  
run;
