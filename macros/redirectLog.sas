%macro tq84_redirectLog(logDir);
   options linesize=256;
   proc printto
        log   = "&logDir/%sysfunc(putn(%sysfunc(date()), yymmddd10.))_%tq84_reReplace(%sysfunc(putn(%sysfunc(time()), tod8.)), :, -)_&sysjobid"
        new
  /*    new   new: force creation of new file rather than appending to existing one */
        ;
   run;

%mend  tq84_redirectLog;
