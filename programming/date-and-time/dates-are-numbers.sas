data dates;

  format d       8.
         d_as_dt date9.
         d_as_ts datetime20.
         d_as_tm time9.;

  do d = 0 to 5;
     d_as_dt = d;  /* d counts Days since January 1st, 1960                               */
     d_as_ts = d;  /* d counts Seconds since January 1s, 1960, Midnight                   */
     d_as_tm = d;  /* d counts Seconds since Midnight, without specifying a specific date */
     output;
  end;

run;


proc sql;
/*   Describing the data set "dates" verifies that
     the dates are internally stored as num's */
  describe table dates;
/*

  create table WORK.DATES( bufsize=65536 )
  (
   d num format=8.,
   d_as_dt num format=DATE9.,
   d_as_ts num format=DATETIME20.,
   d_as_tm num format=TIME9.
  );

*/
quit;
