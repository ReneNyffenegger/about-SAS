data tq84_data;
   x = 'foo';
   y = 'bar';
   z = 'baz';
/* implicit output statement here */
run;

proc print data=tq84_data;
run;
