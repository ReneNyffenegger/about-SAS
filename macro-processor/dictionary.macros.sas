%let tq84 = 'Hello world';

proc sql;
  select * from dictionary.macros
  where name = 'TQ84';
quit;
