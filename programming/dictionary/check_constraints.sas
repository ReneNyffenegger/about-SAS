proc sql;
  describe table dictionary.check_constraints;
quit;

/*

create table DICTIONARY.CHECK_CONSTRAINTS
  (
   constraint_catalog char(32) label='Constraint Catalog',
   constraint_schema char(8) label='Constraint Schema',
   constraint_name char(32) label='Constraint Name',
   check_clause char(256) label='Check Clause'
  );

*/
