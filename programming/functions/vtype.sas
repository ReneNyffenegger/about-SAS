data _null_;

   num = 42;
   str = 'fourty-two';

   num_type = vtype(num); /* num_type=N */
   str_type = vtype(str); /* str_type=C */

   put num_type=;
   put str_type=;

run;
