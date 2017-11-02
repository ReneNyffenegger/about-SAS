%let macroVar = 1;
%let time_0  = %sysfunc(time());

%macro incr_macroVar;
  %let macroVar=%eval(&macroVar+1);
  %local t_now  t_diff;
  %let   t_now  = %sysfunc(time()); 
  %let   t_diff = %sysevalf(&t_now - &time_0);

  %put macroVar = &macroVar, seconds past start: %sysfunc(putn(&t_diff, 3.1));
%mend;


data _null_;

  call sleep(1.3, 1);

  macroVar = symget('macroVar');   
  put 'macroVar as per symget: ' macroVar; /* macroVar as per symget: 1             */
  put 'going to execute %incr_macroVar';   /* going to execute %incr_macroVar       */
  call execute('%incr_macroVar');          /* macroVar = 2, seconds past start: 1.3 */
                                           /*                                       */
  call sleep(1.3, 1);                      /*                                       */
  put ' ';                                 /*                                       */
                                           /*                                       */
  macroVar = symget('macroVar');           /*                                       */ 
  put 'macroVar as per symget: ' macroVar; /* macroVar as per symget: 2             */
  call symput('macroVar', macroVar +5);
  put 'going to execute %incr_macroVar';   /* going to execute %incr_macroVar       */
  call execute('%incr_macroVar');          /* macroVar = 8, seconds past start: 2.6 */

run;
