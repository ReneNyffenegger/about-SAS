proc sql;
  select
    indxname,
    name    ,  /* column name */
    unique  ,
    idxusage,  /* SIMPLE, COMPOSITE */
    indxpos    /* position of column in concatenated key */
  from
    dictionary.indexes
  where
    libname = 'TQ84_LIB' and
    memname = 'TQ84_MEMBER'
  order by
    indxname,
    indxpos;
quit;
