data tq84_dat;
   cls = 'Foo'; val = 2; output;
   cls = 'Bar'; val = 4; output;
   cls = 'Foo'; val = 1; output;
   cls = 'Foo'; val = 3; output;
   cls = 'Baz'; val = 3; output;
   cls = 'Bar'; val = 4; output;
run;

goptions
  reset   = all
  device  = png
  gsfname = graph /* Note: fileref not yet assigned */
;

/* Assigning fileref */
filename graph '/share/home/tq84/sas/img/gchart-vbar.png';

proc gchart data = tq84_dat;
     vbar cls;
run;

/* Assigning different fileref */
filename graph '/share/home/tq84/sas/img/gchart-hbar.png';

proc gchart data = tq84_dat;
     hbar cls;
run;
