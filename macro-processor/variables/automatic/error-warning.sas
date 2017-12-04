data tq84;
  set DoesNotExist;
run;

%put &=syserr        ; /* SYSERR=1012                                                                       */
%put &=syserrortext  ; /* SYSERRORTEXT=File WORK.DOESNOTEXIST.DATA does not exist.                          */
%put &=syswarningtext; /* SYSWARNINGTEXT=Data set WORK.TQ84 was not replaced because this step was stopped. */

data _null_;
  abort;
run;

%put &=syserr        ; /* SYSERR=20000                                                                       */
%put &=syserrortext  ; /* SYSERRORTEXT=Execution terminated by an ABORT statement at line 173 column 3.      */
