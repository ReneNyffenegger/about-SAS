%macro library_info(lib);

  proc print data=sashelp.vlibnam noobs;
    var sysname sysvalue;
    where libname="&lib";
  run;

   proc transpose data=sashelp.vlibnam(obs=1)
     out=work.libinfo (drop=_name_);
    var engine path fileformat readonly temp;
    where libname="&lib";
  run;

  proc print
     data=work.libinfo
     noobs;
  run;

%mend  library_info;
