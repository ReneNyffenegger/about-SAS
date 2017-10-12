proc sql;

/* Why oh why is such a simple query soooo slooooow? */

   select
     libname,
     objname  as macro_name,
     objdesc,
     created,
     modified
/*   alias  ,
     level   */
   from
     dictionary.catalogs;
   where
/*   libname = 'WORK'     and     */
     memname = 'SASMAC1'  and  /* */
     memtype = 'CATALOG'  and
     objtype = 'MACRO';

quit;
