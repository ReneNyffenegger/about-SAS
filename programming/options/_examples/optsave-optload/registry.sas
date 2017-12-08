options pagesize=99;
/* Verify current value of pagesize: */
%put %sysfunc(getoption(pagesize));


/* Store options in registry: */
proc optsave
     key='TQ84\OPTIONS_SAVE';
run;

/* View the contents of the registry under the
   key where the option values had been saved to: */
proc registry
     list
     startat='TQ84\OPTIONS_SAVE';
run;

/* Change an option temporarily: */
options pagesize=100;
/* Verify current value of pagesize: */
%put %sysfunc(getoption(pagesize));

/* Load stored options: */
proc optload
     key='TQ84\OPTIONS_SAVE';
run;

/* Check pagesize again. It should be reverted to 99: */
%put %sysfunc(getoption(pagesize));
