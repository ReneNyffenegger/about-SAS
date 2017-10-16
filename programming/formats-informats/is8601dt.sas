data _null_;

  year   = 2016;
  month  =    8;
  day    =   22;
  hour   =   54;
  minute =   13;
  second =    7;

  num = dhms(
     mdy(month, day, year),
     hour, minute, second
  );

  put num  is8601dt.;  /* 2016-08-24T06:13:07 */

run;
