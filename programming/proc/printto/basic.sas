%let printto_path=p:\ath\to\some\directory;

options pagesize=max;
options nonotes;

/* Only write source lines with errors to the log: */
   options nosource;


proc printto
  /* Redirect output to print.txt and log.txt */
     print = "&printto_path\print.txt"
     log   = "&printto_path\log.txt"
     new;   /* new: force creation of new file rather than appending to existing one */
run;


%put Put something into log.txt;
%put ;
%put The automatic macro variable sysprinttolog contains;
%put the destination path for the log file set by;
%put the printto procedure; 
%put    sysprinttolog = &sysprinttolog;


%macro tq84_check_pagesize;
/* This macro writes 500 lines to demonstrate
   the effect of the pagesize option */
   %do i = 1 %to 500;
       %put checking pagesize (i = &i);
   %end;
%mend;
%tq84_check_pagesize;


proc printto;
/*   Restore redirection */
run;
