proc sql;
  describe table dictionary.referential_constraints;
quit;


/*
create table DICTIONARY.REFERENTIAL_CONSTRAINTS
  (
   libname char(8) label='Library Name',
   memname char(32) label='Member Name',
   constraint_catalog char(32) label='Constraint Catalog',
   constraint_schema char(8) label='Constraint Schema',
   constraint_name char(32) label='Constraint Name',
   unique_constraint_catalog char(32) label='Unique Constraint Catalog',
   unique_constraint_schema char(8) label='Unique Constraint Schema',
   unique_libname char(8) label='Unique Library Name',
   unique_memname char(32) label='Unique Member Name',
   unique_constraint_name char(32) label='Unique Constraint Name',
   match_option char(8) label='Match Option',
   update_rule char(12) label='Update Rule',
   delete_rule char(12) label='Delete Rule'
  );
*/
