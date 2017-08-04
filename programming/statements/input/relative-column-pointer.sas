data tq84_ts; 

  input
    @1  (spelled1-spelled3) ($10. +  2)  /* Start at column  1, read 10 (char) columns, then skip 2 */
    @11 (val1    -val3    ) (2.0  + 10); /* Start at column 11, read 2 (num) columns, then skip 10 */

datalines;
thirteen  13twenty-one21one        1
seven      7four       4eight      8
forty-two 42sixty     60ten       10
twelve    12nine       9twenty    20
;

proc print data=tq84_ts;
run;
