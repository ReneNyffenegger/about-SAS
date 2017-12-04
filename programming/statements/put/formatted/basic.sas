data _null_;
   val=4242;

   put val;             /* 4242            */
   put val deudfdd10.;  /* 13.08.1917      */
   put val time10.;     /*    1:10:42      */

/* Combining named and formatted put:      */
   put val=;            /* val=4242        */
   put val= deudfdd10.; /* val=13.08.1971  */
   put val= time10.;    /* val=1:10:42     */
run;
