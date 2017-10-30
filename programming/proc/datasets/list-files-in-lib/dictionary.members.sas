proc sql;
  select 
     memname,
     memtype
  from
     dictionary.members
  where
     libname = 'LIB_ONE';
quit;
