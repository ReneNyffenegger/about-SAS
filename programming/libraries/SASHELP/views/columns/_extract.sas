%macro sashelp_view_columns(viewname);
  %local viewname_lc;
  %let   viewname_lc = %sysfunc(lowcase(&viewname));
  filename out "/share/home/tq84/sas/sashelp_views/&viewname_lc";
  data _null_;
    set   sashelp.vcolumn(where=(libname="SASHELP" and memname="&viewname"));
    file  out;
    put   varnum    2. @+2
          name    $15.
          type     $6.
          length    4. @+2
          label   $40.
          format  $20.;
  run;
  filename out clear;
%mend  sashelp_view_columns;

proc sql;
  create table work.sashelp_views as
  select memname
  from   dictionary.members
  where  libname = 'SASHELP' and
         memtype = 'VIEW';
quit;

data _null_;
     set work.sashelp_views;
     call execute(cat('%sashelp_view_columns(', memname, ')'));
run;

systask command "sed -i 's/ *$//' /share/home/tq84/sas/sashelp_views/*" shell="sh";
