proc sql;
  select distinct memname
  from   dictionary.dictionaries;
quit;
