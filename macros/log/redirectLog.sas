%macro tq84_redirectLog(logDir);
   options linesize=256
           nocenter    /* Setting nocenter so that output of proc sql is put to left side */
   ;

   %local logFile;
   %let   logFile="&logDir/%sysfunc(putn(%sysfunc(date()), yymmddd10.))_%tq84_reReplace(%sysfunc(putn(%sysfunc(time()), tod8.)), :, -)_&sysjobid";

/* The order of the proc printo is important
  (https://stackoverflow.com/a/47515843/180275) */
   proc printto log   = &logFile; run;
   proc printto print = &logFile; run;

%mend  tq84_redirectLog;
