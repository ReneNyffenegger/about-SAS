proc sql;
  select *
  from   dictionary.libnames
  where  libname = 'TQ84_LIB';
quit;
