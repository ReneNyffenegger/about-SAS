data _null_;

   source = 'world, Hello!';
   regexp = 's/(\w+), *(\w+)/$2, $1/';
   times  = 1;  /* 1: One replacement suffices */

   result = prxchange(regexp, times, source);

   put result=;
   /*  result=Hello, world! */

run;
