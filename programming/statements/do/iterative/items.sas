data _null_;

  /* Without declaring the lenght of day,
     day names would be cut after the sixth
     character because 'Monday' would initialize
     the length to 6. Or so... */
  length day $ 9;

  do day='Monday','Tuesday','Wednesday', 'Thursday', 'Friday';
     put day;
  end;
  
run;
