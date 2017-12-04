data tq84;
  set DoesNotExist;
run;

%put &=syserr        ; /* SYSERR=1012                                                                       */
%put &=syserrortext  ; /* SYSERRORTEXT=File WORK.DOESNOTEXIST.DATA does not exist.                          */
%put &=syswarningtext; /* SYSWARNINGTEXT=Data set WORK.TQ84 was not replaced because this step was stopped. */
