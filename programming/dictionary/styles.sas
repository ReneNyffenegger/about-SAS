proc sql;
  describe table dictionary.styles;
quit;


/*
create table DICTIONARY.STYLES
  (
   libname char(8) label='Library Name',
   memname char(32) label='Member Name',
   style char(32) label='Style Name',
   crdate num format=DATETIME informat=DATETIME label='Date Created'
  );
*/
