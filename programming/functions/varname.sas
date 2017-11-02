%macro tq84_dataSetVarNames(ds);

  %local varList;

  %let fid = %sysFunc(open(&ds));

  %if &fid %then %do;
      %do i=1 %to %sysFunc(attrn(&fid, nvars));
          %let varList = &varList %sysFunc(varName(&fid, &i));
      %end;

      %let fid = %sysFunc(close(&fid));
  %end;

  &varList;

%mend tq84_dataSetVarNames;


%put %tq84_dataSetVarNames(tq84_ds); /* foo bar baz num */
