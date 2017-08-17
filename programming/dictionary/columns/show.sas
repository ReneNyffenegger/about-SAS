proc sql;
  select
    name,      /* Column name */
    type,      /* Column type */
    length,
    npos,
    varnum,    /* Column number in table */
    label
  from
    dictionary.columns
  where
    libname = 'TQ84_LIB' and
    memname = 'TQ84_MEMBER'
  order by
    varnum;
quit;
