data _null_;

   dt = datetime();
   put "It's currently " dt " seconds past January 1st, 1960";

/* Sleeping for one and a half seconds: */
   call sleep(1.5, 1);
         
   dt_1 = datetime();
   sec_sleep = dt_1 - dt;

   put "I slept for " sec_sleep " seconds.";

run;
