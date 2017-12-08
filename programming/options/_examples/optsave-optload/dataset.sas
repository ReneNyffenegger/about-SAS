options pagesize=99;
/* Verify current value of pagesize: */
%put %sysfunc(getoption(pagesize));

/* Store options in registry: */
proc optsave
     out=work.options_save;
run;

/*   What variables are stored in the dataset? */
proc contents
     data=work.options_save
     varnum;
run;

/*   The dataset contains two variables:
     OPTNAME and OPTVALUE. This was of course
     expected. */
proc print
     data = sashelp.vcolumn;
     var    name;
     where  libname = 'WORK' and
            memname = 'OPTIONS_SAVE';
run;

/*   Showing the stored option values whose names
     start with PAGE: */
proc print
     data = work.options_save;
     where  optname eq: 'PAGE';
run;



/* Change an option temporarily: */
options pagesize=100;
/* Verify current value of pagesize: */
%put %sysfunc(getoption(pagesize));

/* Load stored options: */
proc optload
     data = work.options_save;
run;

/* Check pagesize again. It should be reverted to 99: */
%put %sysfunc(getoption(pagesize));
