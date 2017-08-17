proc sql;
  describe table dictionary.libnames;
quit;

/*
create table DICTIONARY.LIBNAMES
  (
   libname char(8) label='Library Name',
   engine char(8) label='Engine Name',
   path char(1024) label='Pathname',
   level num label='Library Concatenation Level',
   fileformat char(8) label='Default File Format',
   readonly char(3) label='Read-only?',
   sequential char(3) label='Sequential?',
   sysdesc char(1024) label='System Information Description',
   sysname char(1024) label='System Information Name',
   sysvalue char(1024) label='System Information Value',
   temp char(3) label='Temp Access?'
  );
*/
