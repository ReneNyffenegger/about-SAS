data tq84_formatted;

/* TODO: is this REALLY the way to specify the
   ordering of attributes in the created
   dataset? */

   length r 8. dt 8. tm 8.;

   drop i;

   format dt date9.;
   format tm time.;

   do i = 1 to 10;
      r  = rand('unif') * 10000;
      dt = r;
      tm = r;

      output;
   end;
run;
