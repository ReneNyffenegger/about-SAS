%macro tq84_filesInDirectory(dir);

   %let filrf=tq84_dir;
   %let rc=%sysfunc(filename(filrf, &dir));

   %if &rc ne 0 %then %do;
       %put filesInDirectory: filename statement - rc=&rc;  /* 0 if successful */
       %put %sysfunc(sysmsg());
   %end;

   %local handle;
   %let   handle=%sysfunc(dopen(&filrf));

   %if &handle <= 0 %then %do;
        %put filesInDirectory location=&location, dopen returned &handle;
        %put %sysfunc(sysmsg());
        %abort;
   %end;

   %local count;
   %let count=%sysfunc(dnum(&handle));

   %local ret;
   %let   ret = %tq84_array();

   %do i=1 %to &count;
           %local fname;
           %let fname= %sysfunc(dread(&handle, &i));

           %tq84_arrayPushBack(&ret, &fname)
   %end;


   %let rc = %sysfunc(dclose(&handle));
   %if &rc ne 0 %then %do;
       %put filesInDirectory: dclose rc = &rc;
       %put %sysfunc(sysmsg());
   %end;
  

   %let rc=%sysfunc(filename(filrf)); /* Corresponds to > filename filrf clear < */
   %if &rc ne 0 %then %do;
       %put filesInDirectory, filename filrf clear rc=&rc;
       %put %sysfunc(sysmsg());
   %end;

   &ret

%mend tq84_filesInDirectory;
