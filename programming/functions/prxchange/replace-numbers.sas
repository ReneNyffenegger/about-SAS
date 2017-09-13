data _null_;

   source = 'foo 42 bar 178 baz';
   regexp = 's/\d+/NUM/';
   times  = -1;  /* -1: replace all occurences */

   result = prxchange(regexp, times, source);

   put result=;
   /*  result=foo NUM bar NUM baz */

run;
