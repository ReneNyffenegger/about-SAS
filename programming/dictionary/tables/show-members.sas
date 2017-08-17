proc sql;
  select
    memname                   ,   /* Member Name                                      */
    memtype                   ,   /* Member type                                      */
    typemem                   ,   /* Data set type                                    */
    nobs                      ,   /* Row count    (Number of physical observations)   */
    nvar                      ,   /* Column count (Number of variables)               */
    filesize /1024 /1024 as mb    /* Filesize (MB)                                    */
  from
    dictionary.tables
  where
    libname = 'TQ84_LIB';
quit;
