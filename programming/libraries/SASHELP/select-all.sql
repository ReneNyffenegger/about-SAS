proc sql;

  select
    memname,
    memtype /* CATALOG, DATA, ITEMSTOR, MDDB, VIEW */
  from
    dictionary.members
  where
    libname = 'SASHELP'
  order by
    memtype,
    memname;

quit;
