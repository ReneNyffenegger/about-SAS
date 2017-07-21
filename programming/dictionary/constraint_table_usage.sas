proc sql;
  describe table dictionary.constraint_table_usage;
quit;

/*


create table DICTIONARY.CONSTRAINT_TABLE_USAGE
  (
   table_catalog char(8) label='Libname',
   table_schema char(8) label='Table Schema',
   table_name char(32) label='Table',
   constraint_catalog char(32) label='Constraint Catalog',
   constraint_schema char(8) label='Constraint Schema',
   constraint_name char(32) label='Constraint Name'
  );
  
*/
