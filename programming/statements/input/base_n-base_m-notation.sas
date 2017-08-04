data tq84_ts; 

  input
    @1  (spelled1-spelled3 val1-val3)
        (3*$10. 3*2.0);

datalines;
thirteen  twenty-oneone       1321 1
seven     four      eight      7 4 8
forty-two sixty     ten       426010
twelve    nine      twenty    12 920
;

proc print data=tq84_ts;
run;
