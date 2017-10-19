%let t0     = %sysfunc(datetime());
           /* Take a nap for a little more than three seconds: */
%let rc     = %sysfunc(sleep(3.14156, 1));
%put rc     = &rc;
%let t1     = %sysfunc(datetime());

%let t_diff = %sysevalf(&t1 - &t0);

%put Slept %sysfunc(putn(&t_diff, time7.5)); /* Slept 0:00:03 */
