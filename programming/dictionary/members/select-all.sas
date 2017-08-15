libname tq84_lib 'p:\ath\to\dir';

proc sql;
  select
    memname,
    memtype,
    index,
    engine
 /* path */
  from
    dictionary.members
  where
    libname = 'TQ84_LIB';
quit;
