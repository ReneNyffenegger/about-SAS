proc sql;
  select 
    objname,
    objtype,
    objdesc
  from
     dictionary.catalogs
  where
    libname = 'SASHELP' and
    memtype = 'CATALOG' and
    memname = 'DEVICES';
quit;
