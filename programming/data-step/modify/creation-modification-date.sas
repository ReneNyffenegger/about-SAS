/*   This macro determines and prints the creation and modification date
     of a data set and how many seconds these values are apart. */
%macro modificationAndCreationDate(datasetName);
  %local dsid dummy;
  %let dsid=%sysfunc(open(&datasetName));
  %let crdte=%sysfunc(attrn(&dsid,crdte));
  %let modte=%sysfunc(attrn(&dsid,modte));
  %let diffSeconds=%sysfunc(round(%sysevalf(&modte - &crdte)));
  %put Created:  %sysfunc(putn(&crdte,is8601dt.));
  %put Modified: %sysfunc(putn(&modte,is8601dt.)), &diffSeconds seconds after creation;
  %let dummy=%sysfunc(close(&dsid));
%mend  modificationAndCreationDate;

/*   Creating a data set: */
data tq84_ds;
  num = 1; output;
  num = 2; output;
  num = 3; output;
run;

/*   Not surprisingly, the creation and modification
     date are equal: */
%modificationAndCreationDate(tq84_ds)

/* Take a nap for three seconds */
%let dummy=%sysfunc(sleep(3,1));

/*   Updating the data set WITHOUT the
     modify statement: */
data tq84_ds;
     set tq84_ds;
     num = num * 5;
run;

/*   Without modify statement, SAS created
     a new dataset (albeit with the same
     name). So, there's no difference
     between creation and modification date: */
%modificationAndCreationDate(tq84_ds)

/* Taking another nam for three seconds: */
%let dummy=%sysfunc(sleep(3,1));

/*   Updating the data set again, this time WITH the
     modify statement: */
data tq84_ds;
     modify tq84_ds;
     num = num * 7;
run;

/*   The creation date did not change, yet
     the modification date was updated: */
%modificationAndCreationDate(tq84_ds)
