proc sql;
  describe table dictionary.catalogs;
quit;

/*
create table DICTIONARY.CATALOGS
  (
   libname char(8) label='Library Name',
   memname char(32) label='Member Name',
   memtype char(8) label='Member Type',
   objname char(32) label='Object Name',
   objtype char(8) label='Object Type',
   objdesc char(256) label='Object Description',
   created num format=DATETIME informat=DATETIME label='Date Created',
   modified num format=DATETIME informat=DATETIME label='Date Modified',
   alias char(32) label='Object Alias',
   level num label='Library Concatenation Level'
  );
  */
