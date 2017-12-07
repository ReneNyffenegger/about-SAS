/* New session. Checking the existence of the
   catalog work.gseg: */
%put %sysfunc(cexist(work.gseg));
/* cexist returns 0 which indicates that work.gseg
   does not exsit. */

data ds; x=1; y=1; output; run;


proc gplot data=ds; plot y * x; run;
/*  NOTE: 3920 bytes written to /home/tq84/sasuser.v94/sasgraph.png. */

/*  We're again checking for the existence of the catalog
    work.gseg: */
%put %sysfunc(cexist(work.gseg));
/*  This time, cexist returns 1, indicating that the
    catalog has been created. */

/*  Changing the device type to gif: */
goptions device=gif;
proc gplot data=ds; plot y * x; run;
quit;
/*  NOTE: 2501 bytes written to /home/tq84/sasuser.v94/sasgraph.gif. */

/*  Create the file in a different path with a non default name: */
filename tq84Graf '/share/home/tq84/sas/graphs/tq84.gif';
goptions reset   = all
         gsfname = tq84Graf
         gsfmode = replace
         device  = gif;

proc gplot data=ds; plot y * x; run;
quit;
/*   NOTE: 2580 bytes written to /share/home/tq84/sas/graphs/tq84.gif. */
