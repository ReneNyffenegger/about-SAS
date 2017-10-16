proc sql;
  describe table dictionary.table_constraints;
quit;


/*
create table DICTIONARY.TABLE_CONSTRAINTS
  (
   table_catalog char(8) label='Libname',
   table_schema char(8) label='Table Schema',
   table_name char(32) label='Table',
   constraint_catalog char(32) label='Constraint Catalog',
   constraint_schema char(8) label='Constraint Schema',
   constraint_name char(32) label='Constraint Name',
   constraint_type char(8) label='Constraint Type',
   is_deferrable char(1) label='Is Deferred?',
   initially_deferred char(1) label='Initially Deferred?'
  );
*/
